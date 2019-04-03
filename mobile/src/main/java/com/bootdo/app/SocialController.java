package com.bootdo.app;

import cn.hutool.core.collection.CollectionUtil;
import com.alibaba.fastjson.JSON;
import com.bootdo.app.domain.*;
import com.bootdo.app.service.*;
import com.bootdo.common.utils.*;
import com.bootdo.system.BaseController;
import lombok.extern.slf4j.Slf4j;
import org.jasypt.encryption.StringEncryptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Slf4j
@RestController
@RequestMapping("/social")
public class SocialController extends BaseController {

    @Resource
    MobileUserService mobileUserService;
    @Resource
    VideoService videoService;
    @Resource
    HistoryVideoService historyVideoService;
    @Resource
    FilesService filesService;
    @Resource
    AlbumService albumService;
    @Resource
    StatisticalService statisticalService;
    @Resource
    BlcakListService blcakListService;
    @Value("${bootdo.imgHttp}")
    private String imgHttp;
    @Resource
    CareMeService careMeService;

    /**
     * 传入经纬度，以及limit，探测附近用户
     *
     * @param lat
     * @param lon
     * @param limit
     * @return
     */
    @PostMapping("/nearByMe/{lat}/{lon}/{limit}")
    public ResponseResult nearByMe(@PathVariable String lat,
                                   @PathVariable String lon,
                                   @PathVariable String limit) {
        log.info("查询附近的人" + MobileShiroUtils.getUser().getUserName());

        MobileUserDO mobileUser = mobileUserService.get(MobileShiroUtils.getUserId());
        mobileUser.setLat(lat);
        mobileUser.setLon(lon);
        mobileUserService.update(mobileUser);

        List<MobileUserDO> mobileUserDOS = mobileUserService.nearByMe(lat, lon, limit, mobileUser.getId());
        if (CollectionUtil.isNotEmpty(mobileUserDOS)) {
            mobileUserDOS.forEach(this::dealUserPicInfo);
            mobileUserDOS.forEach(mobileUserDO -> dealUserDistance(Double.valueOf(lon), Double.valueOf(lat), mobileUserDO));
            return RestResultGenerator.genResult(HttpStatus.OK, mobileUserDOS);
        }
        return RestResultGenerator.genResult(HttpStatus.OK, "无");
    }

    /**
     * app上的视频推荐列表
     * 先查询出状态为已推荐的视频，
     * 然后是已发布的视频，
     * 再去除看过的视频，
     * 再去除自己发布的私密视频
     *
     * @return
     */
    @PostMapping("/mainVideoList/{page}")
    public ResponseResult mainVideoList(@PathVariable int page) {
        log.info("视频推荐列表" + MobileShiroUtils.getUser().getUserName());

        List<Long> historyVideoIds = new ArrayList<>();
        List<Long> permissionsVideoIds = new ArrayList<>();
        map.clear();

        map.put("userId", MobileShiroUtils.getUserId());


        List<HistoryVideoDO> historyVideo = historyVideoService.list(map);
        if (CollectionUtil.isNotEmpty(historyVideo)) {
            for (HistoryVideoDO historyVideoDO : historyVideo) {
                historyVideoIds.add(historyVideoDO.getId());
            }
        }
        map.put("permissions", "1");
        List<VideoDO> list = videoService.list(map);
        if (CollectionUtil.isNotEmpty(list)) {
            for (VideoDO videoDO : list) {
                permissionsVideoIds.add(videoDO.getId());
            }
        }
        map.clear();
        map.put("historyVideoIds", historyVideo);
        map.put("permissionsVideoIds", permissionsVideoIds);
        map.put("offset", (page - 1) * 10 + "");
        map.put("limit", "10");
        Query query = new Query(map);
        List<VideoDO> finalVideoList = videoService.videoList(query);
        finalVideoList.forEach(this::accept);
        finalVideoList.forEach(this::checkPariseFlag);
        return RestResultGenerator.genResult(HttpStatus.OK, finalVideoList);
    }

    /**
     * 当前用户，其他用户详情，名片界面
     *
     * @param userId
     * @return
     */
    @PostMapping("/userDetailsBusynessCard/{userId}")
    public ResponseResult userDetails_busynessCard(@PathVariable(required = false) Long userId) {

        MobileUserDO mobileUserDO = mobileUserService.get(userId);

        dealUserPicInfo(mobileUserDO);
//        查看别人
        if (!MobileShiroUtils.getUserId().equals(userId)) {
            map.clear();
            map.put("userId", MobileShiroUtils.getUserId());
            map.put("blackUserId", userId);
            if (blcakListService.list(map).size() > 0) {
                mobileUserDO.setBlackFlag(1);
            }
        }
        return RestResultGenerator.genResult(HttpStatus.OK, mobileUserDO);
    }

    /**
     * 当前用户，其他用户详情，图集+作品+点赞 信息
     *
     * @param userId
     * @return
     */
    @PostMapping("/userDetails/{meId}/{userId}")
    public ResponseResult userDetails(HttpServletRequest request, @PathVariable Long userId,@PathVariable long meId) {
        MobileUserDO mobileUserDO = mobileUserService.get(userId);
        dealUserPicInfo(mobileUserDO);
        //查询图集
        map.clear();
        map.put("userId", userId);
        map.put("sort", "sort");
        map.put("order", "asc");
        List<AlbumDO> albumList = albumService.list(map);
        if (CollectionUtil.isNotEmpty(albumList)) {
            albumList.forEach(albumDO -> mobileUserDO.getAlbumList().add(imgHttp + filesService.get(albumDO.getPicId()).getFilePath()));
        }
        //查询作品
        map.clear();
        map.put("userId",userId);
        if (!MobileShiroUtils.getUserId().equals(userId)) {
            map.put("selfFlag", "0");
        }
        List<VideoDO> videoList = videoService.list(map);
        videoList.forEach(videoDO -> videoDO.setFileid(imgHttp + filesService.get(videoDO.getFileid()).getFilePath()));
        mobileUserDO.setWorks(videoList);

//        查看点赞的视频
        map.put("action", "0");
        List<StatisticalDO> statisticalList = statisticalService.list(map);
        List<VideoDO> tempList = new ArrayList<>();
        for (StatisticalDO statisticalDO : statisticalList) {
            Long id = Long.valueOf(statisticalDO.getObject());
            VideoDO videoDO = videoService.get(id);
            videoDO.setFileid(imgHttp + filesService.get(videoDO.getFileid()).getFilePath());
            tempList.add(videoDO);
        }
        mobileUserDO.setPraises(tempList);
        map.clear();
        map.put("userId", meId);
        map.put("careUserId", userId);
        mobileUserDO.setCare(careMeService.isCare(map));
        return RestResultGenerator.genResult(HttpStatus.OK, mobileUserDO);
    }

    /**
     * 举报视频
     *
     * @param videoDO
     * @return
     */
    @PostMapping("/reportVideo")
    public ResponseResult reportVideo(VideoDO videoDO) {
        log.info("举报视频" + videoDO.getId() + "用户" + MobileShiroUtils.getUser().getUserName());
        videoDO.setStatus(4);
        if (StringUtils.isNotBlank(videoDO.getRemarks())) {
            if (videoService.update(videoDO) > 0) {
                return RestResultGenerator.genResult(HttpStatus.OK);
            }
            return RestResultGenerator.genResult(HttpStatus.INTERNAL_SERVER_ERROR, "举报失败");

        }
        return RestResultGenerator.genResult(HttpStatus.INTERNAL_SERVER_ERROR, "请填写举报原因");

    }

    /**
     * 发布新视频
     *
     * @param videoDO
     * @return
     */
    @PostMapping("/publishNewVideo")
    public ResponseResult publishNewVideo(VideoDO videoDO) {
        videoDO.setReleaseTime(new Date());
        videoDO.setStatus(0);
        if (videoService.save(videoDO) > 0) {
            return RestResultGenerator.genResult(HttpStatus.OK, videoDO);
        }
        return RestResultGenerator.genResult(HttpStatus.INTERNAL_SERVER_ERROR, "保存失败");

    }

    /**
     * 删除视频
     *
     * @param videoId
     * @return
     */
    @PostMapping("/delMyVideo/{videoId}")
    public ResponseResult delMyVideo(@PathVariable Long videoId) {
        if (videoService.get(videoId).getUserId().equals(MobileShiroUtils.getUserId())) {
            videoService.remove(videoId);
            return RestResultGenerator.genResult(HttpStatus.OK);
        }
        return RestResultGenerator.genResult(HttpStatus.INTERNAL_SERVER_ERROR, "只能删除自己视频");
    }


    private void accept(VideoDO videoDO) {
        videoDO.setFileid(imgHttp + filesService.get(videoDO.getFileid()).getFilePath());
        MobileUserDO mobileUserDO = mobileUserService.get(videoDO.getUserId());
        dealUserPicInfo(mobileUserDO);
        videoDO.setMobileUserDO(mobileUserDO);
    }
    private void checkPariseFlag(VideoDO videoDO) {
        map.clear();
        map.put("userId", MobileShiroUtils.getUserId());
        map.put("action", "0");
        map.put("object", videoDO.getId());
        if (statisticalService.list(map).size()>0){
            videoDO.setPraiseFlag(1);
        }
    }

}
