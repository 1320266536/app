package com.bootdo.app;

import com.bootdo.app.domain.StatisticalDO;
import com.bootdo.app.service.StatisticalService;
import com.bootdo.app.service.VideoService;
import com.bootdo.common.utils.MobileShiroUtils;
import com.bootdo.common.utils.ResponseResult;
import com.bootdo.common.utils.RestResultGenerator;
import com.bootdo.system.BaseController;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.Date;

@Slf4j
@RestController
@RequestMapping("/video")
public class VideoController extends BaseController {

    private static final int ACTION_PRAISES = 0;
    private static final int ACTION_COMMENTS = 1;
    private static final int ACTION_SHARE = 2;

    private static final String PRAISES_COLUMN = "praises";
    private static final String COMMENTS_COLUMN = "comments";
    private static final String SHARE_COLUMN = "share";

    @Resource
    VideoService videoService;

    @Resource
    StatisticalService statisticalService;

    /**
     * 点赞视频
     *
     * @param videoId
     * @return
     */
    @PostMapping("/praisesVideo/{videoId}")
    public ResponseResult praisesVideo(@PathVariable Long videoId) {
        return dealVideoInfo(videoId, PRAISES_COLUMN, ACTION_PRAISES);
    }

    /**
     * 评论视频
     *
     * @param videoId
     * @return
     */
    @PostMapping("/commentsVideo/{videoId}")
    public ResponseResult commentsVideo(@PathVariable Long videoId) {
        return dealVideoInfo(videoId, COMMENTS_COLUMN, ACTION_COMMENTS);
    }

    /**
     * 转发视频
     *
     * @param videoId
     * @return
     */
    @PostMapping("/shareVideo/{videoId}")
    public ResponseResult shareVideo(@PathVariable Long videoId) {
        return dealVideoInfo(videoId, SHARE_COLUMN, ACTION_SHARE);
    }

    /**
     * 统计
     * @param statisticalDO
     * 3	打招呼
     * 4	聊过天
     * 5	被打招呼
     * @return
     */
    @PostMapping("/statistics")
    public ResponseResult statistics(StatisticalDO statisticalDO) {
        statisticalDO.setUserId(MobileShiroUtils.getUserId());
        statisticalDO.setCreateDate(new Date());
        if (statisticalService.save(statisticalDO)>0){
            return RestResultGenerator.genResult(HttpStatus.OK);
        }
        return RestResultGenerator.genResult(HttpStatus.INTERNAL_SERVER_ERROR);
    }


        private ResponseResult dealVideoInfo(Long videoId, String column, int action) {
        map.clear();
        map.put("id", videoId);
        map.put("column", column);
        videoService.updateCount(map);
        StatisticalDO statisticalDO = new StatisticalDO();
        statisticalDO.setUserId(MobileShiroUtils.getUserId());
        statisticalDO.setAction(action);
        statisticalDO.setObject(videoId.toString());
        if (statisticalService.save(statisticalDO) > 0) {
            return RestResultGenerator.genResult(HttpStatus.OK);
        }
        return RestResultGenerator.genResult(HttpStatus.INTERNAL_SERVER_ERROR);

    }

}
