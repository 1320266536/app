package com.bootdo.app;

import cn.hutool.core.collection.CollectionUtil;
import com.bootdo.app.domain.*;
import com.bootdo.app.service.*;
import com.bootdo.common.utils.MobileShiroUtils;
import com.bootdo.common.utils.ResponseResult;
import com.bootdo.common.utils.RestResultGenerator;
import com.bootdo.common.utils.StringUtils;
import com.bootdo.system.BaseController;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.*;


@Slf4j
@RestController
@RequestMapping("/statistaics")
public class StatisticsController extends BaseController {


    @Resource
    MobileUserService mobileUserService;
    @Resource
    BlcakListService blcakListService;
    @Resource
    CareMeService careMeService;
    @Resource
    FeedBackService feedBackService;
    @Resource
    HistoryVideoService historyVideoService;

    private Long[] ids;

    /**
     * 查询当前登录者，拉黑的所有用户，
     *
     * @param userName 非必填，填入则表示模糊搜索
     * @return
     */
    @PostMapping("/blackList")
    public ResponseResult blackList(@RequestParam(value = "userName", required = false) String userName) {
        log.info("查看黑名单" + MobileShiroUtils.getUser().getUserName());

        map.clear();
        map.put("userId", MobileShiroUtils.getUserId());
        if (StringUtils.isNotBlank(userName)) {
            map.put("userName", "%" + userName + "%");
        }
        List<BlcakListDO> list = blcakListService.list(map);
        if (CollectionUtil.isNotEmpty(list)) {
            ids = new Long[list.size()];
            for (int i = 0; i < list.size(); i++) {
                ids[i] = list.get(i).getBlackUserId();
            }
            return RestResultGenerator.genResult(HttpStatus.OK, getMobileUserDOS(ids, 3));
        }
        return RestResultGenerator.genResult(HttpStatus.OK, "没有黑名单用户");
    }


    /**
     * 拉黑某一用户 blackUserId即可
     *
     * @param blackUserId
     * @return
     */
    @PostMapping("/addNewBlackLink/{blackUserId}")
    public ResponseResult addNewBlackLink(@PathVariable Long blackUserId) {
        log.info("拉黑用户" + blackUserId);
        BlcakListDO blcakListDO = new BlcakListDO();
        blcakListDO.setBlackUserId(blackUserId);
        blcakListDO.setUserId(MobileShiroUtils.getUserId());
        blcakListDO.setCreateDate(new Date());
        if (blcakListService.save(blcakListDO) > 0) {
            return RestResultGenerator.genResult(HttpStatus.OK, blcakListDO);
        }
        return RestResultGenerator.genResult(HttpStatus.INTERNAL_SERVER_ERROR, "请求失败");
    }

    /**
     * 取消拉黑
     *
     * @param userId 对方的id
     * @return
     */
    @PostMapping("/delBlackLink/{userId}")
    public ResponseResult delBlackLink(@PathVariable Long userId) {
        map.clear();
        map.put("userId", MobileShiroUtils.getUserId());
        map.put("blackUserId", userId);
        if (blcakListService.delLink(map) > 0) {
            return RestResultGenerator.genResult(HttpStatus.OK, "请求成功");
        }
        return RestResultGenerator.genResult(HttpStatus.INTERNAL_SERVER_ERROR, "请求失败");
    }

    /**
     * 我的粉丝列表：
     * 那就应该是
     * 被关注的是当前登陆者的id
     * careUserId=当前id
     *
     * @param userName 非必填，填入则表示模糊搜索
     * @return
     */
    @PostMapping("/careMeList")
    public ResponseResult careMeList(@RequestParam(value = "userName", required = false) String userName) {
        map.clear();
        map.put("careUserId", MobileShiroUtils.getUserId());
        if (StringUtils.isNotBlank(userName)) {
            map.put("fansUserName", "%" + userName + "%");
        }

        return dealUserId(map, 1);

    }

    /**
     * 我关注的用户列表
     * userId=当前id
     *
     * @param userName 非必填，填入则表示模糊搜索
     * @return
     */
    @PostMapping("/iCareList")
    public ResponseResult iCareList(@RequestParam(value = "userName", required = false) String userName) {
        map.clear();
        map.put("userId", MobileShiroUtils.getUserId());
        if (StringUtils.isNotBlank(userName)) {
            map.put("iCareUserName", "%" + userName + "%");
        }
        return dealUserId(map, 0);
    }

    /**
     * 新增我的关注
     * careUserId即可
     *
     * @param careUserId
     * @return
     */
    @PostMapping("/addNewCare/{careUserId}")
    public ResponseResult addNewCare(@PathVariable Long careUserId) {
        CareMeDO careMeDO = new CareMeDO();
        careMeDO.setCareUserId(careUserId);
        careMeDO.setUserId(MobileShiroUtils.getUserId());
        careMeDO.setCreateDate(new Date());
        if (careMeService.save(careMeDO) > 0) {
            return RestResultGenerator.genResult(HttpStatus.OK, "请求成功");
        }
        return RestResultGenerator.genResult(HttpStatus.INTERNAL_SERVER_ERROR, "请求失败");
    }

    /**
     * 取消关注，传入对方id
     *
     * @param userId
     * @return
     */
    @PostMapping("/delCareLink/{userId}")
    public ResponseResult delCareLink(@PathVariable Long userId) {
        map.clear();
        map.put("userId", MobileShiroUtils.getUserId());
        map.put("careUserId", userId);
        if (careMeService.delLink(map) > 0) {
            return RestResultGenerator.genResult(HttpStatus.OK, "请求成功");
        }
        return RestResultGenerator.genResult(HttpStatus.INTERNAL_SERVER_ERROR, "请求失败");
    }

    /**
     * 意见反馈
     *
     * @param feedBackDO
     * @return
     */
    @PostMapping("/feedBack")
    public ResponseResult feedBack(FeedBackDO feedBackDO) {
        feedBackDO.setUserId(MobileShiroUtils.getUserId());
        if (feedBackService.save(feedBackDO) > 0) {
            return RestResultGenerator.genResult(HttpStatus.OK, "请求成功");
        }
        return RestResultGenerator.genResult(HttpStatus.INTERNAL_SERVER_ERROR, "请求失败");
    }

    /**
     * 记录观看历史
     *
     * @param videoId
     * @return
     */
    @PostMapping("/videoHistory/{videoId}")
    public ResponseResult videoHistory(@PathVariable Long videoId) {
        HistoryVideoDO historyVideoDO = new HistoryVideoDO();
        historyVideoDO.setCreateDate(new Date());
        historyVideoDO.setUserId(MobileShiroUtils.getUserId());
        historyVideoDO.setVideoId(videoId);
        if (historyVideoService.save(historyVideoDO) > 0) {
            return RestResultGenerator.genResult(HttpStatus.OK, "请求成功");
        }
        return RestResultGenerator.genResult(HttpStatus.INTERNAL_SERVER_ERROR, "请求失败");
    }

    private ResponseResult dealUserId(Map<String, Object> map, int type) {
        List<CareMeDO> list = careMeService.list(map);
        if (CollectionUtil.isNotEmpty(list)) {
            ids = new Long[list.size()];
            for (int i = 0; i < list.size(); i++) {
                if (type == 0) {
                    ids[i] = list.get(i).getCareUserId();
                } else {
                    ids[i] = list.get(i).getUserId();
                }
            }

            return RestResultGenerator.genResult(HttpStatus.OK, getMobileUserDOS(ids, type));
        }
        return RestResultGenerator.genResult(HttpStatus.OK, "暂无");
    }


    private List<MobileUserDO> getMobileUserDOS(Long[] ids, int type) {
        List<MobileUserDO> mobileUserDOS = mobileUserService.userListByIdInArray(ids);
        mobileUserDOS.forEach(this::dealUserPicInfo);
        Long userId = MobileShiroUtils.getUserId();
        Map<Long, Long> cares = new HashMap<>(16);
        map.clear();
        if (type == 0) {
            map.put("careUserId", userId);
            careMeService.list(map).forEach(careMeDO -> cares.put(careMeDO.getUserId(), userId));
            mobileUserDOS.forEach(mobileUserDO -> mobileUserDO.setCare(cares.containsKey(mobileUserDO.getId())?2:1));
        } else if (type == 1) {
            map.put("userId", userId);
            careMeService.list(map).forEach(careMeDO -> cares.put(careMeDO.getCareUserId(),userId));
            mobileUserDOS.forEach(mobileUserDO -> mobileUserDO.setCare(cares.containsKey(mobileUserDO.getId())?2:0));
        }

        return mobileUserDOS;
    }
}