package com.bootdo.app.controller;

import com.bootdo.app.domain.VideoDO;
import com.bootdo.app.service.FilesService;
import com.bootdo.app.service.VideoService;
import com.bootdo.common.utils.PageUtils;
import com.bootdo.common.utils.Query;
import com.bootdo.common.utils.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * 视频作品表
 *
 * @author Lambda
 * @email 18744422377@163.com
 * @date 2019-02-26 15:17:36
 */

@Controller
@RequestMapping("/app/video")
public class VideoController {
    @Autowired
    private VideoService videoService;
    @Resource
    private FilesService filesService;

    @Value("${bootdo.imgHttp}")
    private String imgHttp;

    @GetMapping()
        //@RequiresPermissions("app:video:video")
    String Video() {
        return "app/video/video";
    }

    @ResponseBody
    @GetMapping("/list")
    //@RequiresPermissions("app:video:video")
    public PageUtils list(@RequestParam Map<String, Object> params) {
        //查询列表数据
        Query query = new Query(params);
        List<VideoDO> videoList = videoService.list(query);
        int total = videoService.count(query);
        PageUtils pageUtils = new PageUtils(videoList, total);
        return pageUtils;
    }

    //	下架视频
    @GetMapping("/shelvesVideos/{id}")
    String shelvesVideos(@PathVariable("id") Long id, Model model) {
        model.addAttribute("id", id);
        return "app/video/shelvesVideos";

    }


    @GetMapping("/videoPlayer/{id}")
    String videoPlayer(@PathVariable("id") Long id, Model model) {
        VideoDO video = videoService.get(id);
        model.addAttribute("videoPath", imgHttp + filesService.get(video.getFileid()).getFilePath());
        return "app/video/videoPlayer";
    }

    /**
     * 修改
     */
    @ResponseBody
    @RequestMapping("/update")
    //@RequiresPermissions("app:video:edit")
    public R update(VideoDO video){
        videoService.update(video);
        return R.ok();
    }

}
