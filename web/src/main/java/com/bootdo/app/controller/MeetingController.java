package com.bootdo.app.controller;

import com.alibaba.fastjson.JSONObject;
import com.bootdo.app.domain.FilesDO;
import com.bootdo.app.domain.JoinMeetingDO;
import com.bootdo.app.domain.MeetingDO;
import com.bootdo.app.service.FilesService;
import com.bootdo.app.service.JoinMeetingService;
import com.bootdo.app.service.MeetingService;
import com.bootdo.common.utils.*;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;
import redis.clients.jedis.Jedis;

import javax.annotation.Resource;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 会议管理
 *
 * @author Lambda
 * @email 18744422377@163.com
 * @date 2019-02-26 15:17:36
 */

@Controller
@RequestMapping("/app/meeting")
public class MeetingController {
    @Resource
    private MeetingService meetingService;
    @Resource
    private FilesService filesService;
    @Resource
    private JoinMeetingService joinMeetingService;

    @Value("${wx.miniprogram.appid}")
    private String appid;

    @Value("${wx.miniprogram.appsecret}")
    private String appsecret;
    //redis密码
    @Value("${spring.redis.password}")
    private String password;

    @Value("${bootdo.uploadPath}")
    private String uploadPath;

    @Value("${bootdo.imgHttp}")
    private String imgHttp;

    @GetMapping()
        //@RequiresPermissions("app:meeting:meeting")
    String Meeting() {
        return "app/meeting/meeting";
    }

    @ResponseBody
    @GetMapping("/list")
    //@RequiresPermissions("app:meeting:meeting")
    public PageUtils list(@RequestParam Map<String, Object> params) {
        //查询列表数据
        Query query = new Query(params);
        List<MeetingDO> meetingList = meetingService.list(query);
        int total = meetingService.count(query);
        PageUtils pageUtils = new PageUtils(meetingList, total);
        return pageUtils;
    }

    @GetMapping("/add")
        //@RequiresPermissions("app:meeting:add")
    String add() {
        return "app/meeting/add";
    }

    @GetMapping("/edit/{id}")
        //@RequiresPermissions("app:meeting:edit")
    String edit(@PathVariable("id") Long id, Model model) {
        MeetingDO meeting = meetingService.get(id);
        meeting.setQrCode(imgHttp + filesService.get(meeting.getQrCode()).getFilePath());
        Map<String, Object> map = new HashMap<>();
        map.put("mtId", id);
        List<JoinMeetingDO> list = joinMeetingService.list(map);
        list.forEach(joinMeetingDO -> joinMeetingDO.setPic(imgHttp + filesService.get(joinMeetingDO.getPic()).getFilePath()));
        model.addAttribute("meeting", meeting);
        model.addAttribute("userPic", list);
        return "app/meeting/edit";
    }

    /**
     * 保存
     */
    @ResponseBody
    @PostMapping("/save")
    //@RequiresPermissions("app:meeting:add")
    public R save(MeetingDO meeting) throws IOException {
        if (meetingService.save(meeting) > 0) {
            Map<String, String> map = getQrCode(meeting.getId().toString());
            meeting.setQrCode(map.get("id"));
            if (meetingService.update(meeting) > 0) {
                return R.ok(imgHttp + map.get("url"));
            }
        }
        return R.error();
    }

    /**
     * 修改
     */
    @ResponseBody
    @RequestMapping("/update")
    //@RequiresPermissions("app:meeting:edit")
    public R update(MeetingDO meeting) {
        meetingService.update(meeting);
        return R.ok();
    }

    /**
     * 删除
     */
    @PostMapping("/remove")
    @ResponseBody
    //@RequiresPermissions("app:meeting:remove")
    public R remove(Long id) {
        if (meetingService.remove(id) > 0) {
            return R.ok();
        }
        return R.error();
    }

    /**
     * 删除
     */
    @PostMapping("/batchRemove")
    @ResponseBody
    //@RequiresPermissions("app:meeting:batchRemove")
    public R remove(@RequestParam("ids[]") Long[] ids) {
        meetingService.batchRemove(ids);
        return R.ok();
    }


    private String getAccessToken() throws IOException {
        Jedis jedis = new Jedis();
        jedis.auth(password);
        if (StringUtils.isNotBlank(jedis.get("access_token"))) {
            return jedis.get("access_token");
        }

        HttpGet httpGet = new HttpGet(
                "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=" + appid + "&secret=" + appsecret);
        HttpClient httpClient = HttpClients.createDefault();
        HttpResponse res = httpClient.execute(httpGet);
        HttpEntity entity = res.getEntity();
        String result = EntityUtils.toString(entity, "UTF-8");
        String access_token = JSONObject.parseObject(result).getString("access_token");
        jedis.set("access_token", access_token, "NX", "EX", 7200);
        return access_token;
    }


    private synchronized Map<String, String> getQrCode(String meetingId) throws IOException {
        RestTemplate rest = new RestTemplate();
        InputStream inputStream;
        OutputStream outputStream;
        String access_token = getAccessToken();

        String url = "https://api.weixin.qq.com/wxa/getwxacodeunlimit?access_token=" + access_token;
        Map<String, Object> param = new HashMap<>();
        param.put("scene", meetingId);
        param.put("page", "pages/myhy/main");
        param.put("width", 430);
        param.put("auto_color", true);
        Map<String, Object> line_color = new HashMap<>();
        line_color.put("r", 0);
        line_color.put("g", 0);
        line_color.put("b", 0);
        param.put("line_color", line_color);
        MultiValueMap<String, String> headers = new LinkedMultiValueMap<>();
        org.springframework.http.HttpEntity requestEntity = new org.springframework.http.HttpEntity(param, headers);
        ResponseEntity<byte[]> entity = rest.exchange(url, HttpMethod.POST, requestEntity, byte[].class, new Object[0]);
        byte[] result = entity.getBody();
        inputStream = new ByteArrayInputStream(result);
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("/yyyy/MM/dd/HH/");
        String format = simpleDateFormat.format(new Date());
        String fileName = UUID.randomUUID().toString().replace("-", "").toLowerCase() + ".png";
        String filePathName = format + fileName;
        File dir = new File(uploadPath + format);
        if (!dir.exists()) {
            dir.mkdirs();
        }
        File file = new File(uploadPath + filePathName);
        if (!file.exists()) {
            file.createNewFile();
        }
        outputStream = new FileOutputStream(file);
        int len = 0;
        byte[] buf = new byte[1024];
        while ((len = inputStream.read(buf, 0, 1024)) != -1) {
            outputStream.write(buf, 0, len);
        }
        FilesDO filesDO = new FilesDO();
        filesDO.setFileName(fileName);
        filesDO.setFilePath(format);
        filesDO.setUploadBy(ShiroUtils.getUser().getUsername());
        filesDO.setUploadDate(new Date());
        filesService.save(filesDO);
        outputStream.flush();
        Map<String, String> map = new HashMap<>();
        map.put("id", filesDO.getId().toString());
        map.put("url", filePathName);
        return map;
    }


}
