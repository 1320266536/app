package com.bootdo.app;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.util.ObjectUtil;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.bootdo.app.domain.*;
import com.bootdo.app.service.*;
import com.bootdo.common.utils.*;
import com.bootdo.system.BaseController;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.FilenameUtils;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import redis.clients.jedis.Jedis;


import javax.annotation.Resource;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.*;

@Slf4j
@RestController
@RequestMapping("/miniProgram")
public class WxController extends BaseController {

    @Resource
    MobileUserService mobileUserService;
    @Resource
    VcardFloderService vcardFloderService;
    @Resource
    FilesService filesService;
    @Resource
    MeetingService meetingService;
    @Resource
    JoinMeetingService joinMeetingService;

    @Value("${bootdo.imgHttp}")
    String imgHttp;
    @Value("${bootdo.uploadPath}")
    String uploadPath;
    @Value("${wx.appid}")
    private String appid;
    @Value("${wx.secret}")
    private String secret;


    @Value("${wx.miniprogram.appid}")
    private String miniprogramappid;

    @Value("${wx.miniprogram.appsecret}")
    private String miniprogramsecret;

    /**
     * 查看用户的信息
     *
     * @return
     */
    @PostMapping("/userInfo/{userId}")
    ResponseResult userInfo(@PathVariable Long userId) {
        MobileUserDO mobileUserDO = mobileUserService.get(userId);
        dealUserPicInfo(mobileUserDO);
        return RestResultGenerator.genResult(HttpStatus.OK, mobileUserDO);
    }


    /**
     * 修改用户的信息
     *
     * @return
     */
    @PostMapping("/modfiyUserInfo")
    ResponseResult modfiyUserInfo(MobileUserDO mobileUserDO) {
        if (mobileUserService.update(mobileUserDO) > 0) {
            return RestResultGenerator.genResult(HttpStatus.OK, "修改成功");
        }
        return RestResultGenerator.genResult(HttpStatus.INTERNAL_SERVER_ERROR, "修改失败");
    }

    /**
     * 获取当前用户收到的名片夹，
     *
     * @param searchName 可模糊搜索昵称与公司名称
     * @return
     */
    @PostMapping("/vCardFolder/{userId}")
    ResponseResult vCardFolder(@PathVariable Long userId,@RequestParam(value = "searchName", required = false) String searchName) {
        map.clear();
        map.put("receovedUserId", userId);
        if (StringUtils.isNotBlank(searchName)) {
            map.put("searchName", "%" + searchName + "%");
        }
        List<VcardFloderDO> list = vcardFloderService.list(map);
        if (CollectionUtil.isNotEmpty(list)) {
            List<String> cardList = new ArrayList<>();
            list.forEach(vcardFloderDO -> {
                cardList.add(imgHttp + filesService.get(mobileUserService.get(vcardFloderDO.getUserId()).getBusinessCard()).getFilePath());
            });
            return RestResultGenerator.genResult(HttpStatus.OK, cardList);
        }
        return RestResultGenerator.genResult(HttpStatus.OK, new String[1]);
    }

    /**
     * 添加新的名片
     *
     * @param senderId
     * @param receovedId
     * @return
     */
    @PostMapping("/addNewCard/{senderId}/{receovedId}")
    ResponseResult addNewCard(@PathVariable Long senderId,@PathVariable Long receovedId) {
        VcardFloderDO vcardFloderDO = new VcardFloderDO();
        vcardFloderDO.setUserId(senderId);
        vcardFloderDO.setReceovedUserId(receovedId);
        vcardFloderDO.setCreateTime(new Date());
        if (vcardFloderService.save(vcardFloderDO) > 0) {
            return RestResultGenerator.genResult(HttpStatus.OK, "请求失败");
        }
        return RestResultGenerator.genResult(HttpStatus.INTERNAL_SERVER_ERROR, "请求失败");
    }

    /**
     * 根据二维码中的id查询会议详情，以及参与会议的人员
     *
     * @param meetId
     * @param userId
     * @return
     */
    @PostMapping("/meeting/{meetId}/{userId}")
    ResponseResult meeting(@PathVariable Long meetId,@PathVariable Long userId) {
        MeetingDO meetingDO = meetingService.get(meetId);
        map.clear();
        map.put("mtId", meetId);
        List<JoinMeetingDO> list = joinMeetingService.list(map);
        if (CollectionUtil.isNotEmpty(list)) {
            list.forEach(joinMeetingDO -> joinMeetingDO.setPic(imgHttp + filesService.get(joinMeetingDO.getPic()).getFilePath()));
            meetingDO.setList(list);
        }
        map.clear();
        map.put("userId",userId);
        if (joinMeetingService.list(map).size() > 0) {
            meetingDO.setJoinFlag(1);
        }
        return RestResultGenerator.genResult(HttpStatus.OK, meetingDO);
    }

    /**
     * 当前用户参加会议
     *
     * @param joinMeetingDO
     * @return
     */
    @PostMapping("/joinMeeting")
    ResponseResult joinMeeting(JoinMeetingDO joinMeetingDO) {
        joinMeetingDO.setOpenId(mobileUserService.get(joinMeetingDO.getUserId()).getOpenId());
        if (joinMeetingService.save(joinMeetingDO) > 0) {
            return RestResultGenerator.genResult(HttpStatus.OK, "请求成功");
        }
        return RestResultGenerator.genResult(HttpStatus.INTERNAL_SERVER_ERROR, "请求失败");

    }

    /**
     * 查询当前用户参加过得会议
     *
     * @return
     */
    @PostMapping("/myMeeting/{userId}")
    ResponseResult myMeeting(@PathVariable String userId) {
        List<MeetingDO> meetingDOS = meetingService.myMeetList(userId);
        if (CollectionUtil.isNotEmpty(meetingDOS)) {
            return RestResultGenerator.genResult(HttpStatus.OK, meetingDOS);
        }
        return RestResultGenerator.genResult(HttpStatus.OK, "暂无");

    }


    /**
     *
     * 下载图片到本地
     *
     * @param urlLink
     * @return
     * @throws Exception
     */
    @PostMapping("/downLoadPic")
    public ResponseResult downLoadPic(@RequestParam(required = false) String urlLink) throws Exception {
        URL url = new URL(urlLink);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setConnectTimeout(1000);//超时提示1秒=1000毫秒
        InputStream inStream = conn.getInputStream();//获取输出流
        byte[] data = readInputStream(inStream);
        String datePathDir = new SimpleDateFormat("yyyy/MM/dd/HH/").format(new Date());
        File temf = new File(uploadPath + "/" + datePathDir);
        if (!temf.exists()) {
            temf.mkdirs();
        }
        String fileName = UUID.randomUUID().toString().replace("-", "") + ".jpg";
        String saveFilePath = uploadPath + datePathDir + fileName;
//        String imgUrl=imgHttp+datePathDir+fileName;
        File file = new File(saveFilePath);
        FileOutputStream outStream = new FileOutputStream(file);
        outStream.write(data);
        outStream.close();
        FilesDO filesDO = new FilesDO();
        try {
            filesDO.setUploadBy(MobileShiroUtils.getUserId().toString());
        } catch (Exception e) {
            filesDO.setUploadBy("系统上传");

        }
        filesDO.setUploadDate(new Date());
        filesDO.setFilePath(datePathDir);
        filesDO.setFileName(fileName);
        filesService.save(filesDO);
        return RestResultGenerator.genResult(HttpStatus.OK, filesDO.getId());
    }




    /**
     * 微信登陆
     *
     * @param mobileUserDO
     * @return
     * @throws Exception
     */
    @PostMapping("/wxLogin")
    public ResponseResult wxLogin(MobileUserDO mobileUserDO) throws Exception {
        if (ObjectUtil.isNull(mobileUserDO)) {
            return RestResultGenerator.genResult(HttpStatus.INTERNAL_SERVER_ERROR, mobileUserDO);
        }
//        创建请求工具类
        HttpClientUtils httpClientUtils = new HttpClientUtils();

        String json = httpClientUtils.get("https://api.weixin.qq.com/sns/jscode2session?appid=" + appid + "&secret=" + secret + "&js_code=" + mobileUserDO.getCode() + "&grant_type=authorization_code");
//        获取token
        WxWebTokenModel wxWebTokenModel = JSON.parseObject(json, WxWebTokenModel.class);
        if (StringUtils.isNotBlank(wxWebTokenModel.getErrmsg())) {
            return RestResultGenerator.genResult(HttpStatus.INTERNAL_SERVER_ERROR, wxWebTokenModel);
        }
//        下载头像
        ResponseResult responseResult = downLoadPic(mobileUserDO.getHeadImg());
        String filesId = responseResult.getData().toString();
//      查询是否登录过
        MobileUserDO mobileUser = mobileUserService.getByOpenId(wxWebTokenModel.getOpenid());
        if (ObjectUtil.isNotNull(mobileUser)) {
            //            每次都更新信息
            mobileUserDO.setId(mobileUser.getId());
            mobileUserDO.setHeadImg(filesId);
            mobileUserService.update(mobileUserDO);
            return login(mobileUser);
        }
//        设置密码
        mobileUserDO.setPassword(MD5Utils.encrypt(wxWebTokenModel.getOpenid()));
//        openId
        mobileUserDO.setOpenId(wxWebTokenModel.getOpenid());
//        头像id
        mobileUserDO.setHeadImg(filesId);
        mobileUserDO.setRealFlag(0);
        mobileUserDO.setStatus(1);
        mobileUserDO.setCreateDate(new Date());
        mobileUserDO.setUserFrom("miniprogram");
        mobileUserService.save(mobileUserDO);
        return login(mobileUserDO);
    }

    @PostMapping("/uploadFile")
    public ResponseResult uploadFile(MultipartFile[] files) throws IOException {
        log.info(getSdf("yyyy-MM-dd HH:mm:SS").format(new Date()) + ":上传" + files.length + "个文件");
        List<Map<String, Object>> urls = new ArrayList<>();
        if (files.length > 0) {
            for (MultipartFile pic : files) {
                if (!pic.getOriginalFilename().equals("")) {
                    Map<String, Object> map = new HashMap<>();
                    String filename = pic.getOriginalFilename();
                    String suffer = FilenameUtils.getExtension(filename);
                    String replace = getUuid();
                    String newName = replace + "." + suffer;
                    //3.准备以时间为界限的文件夹
                    String datePathDir = new SimpleDateFormat("yyyy/MM/dd/HH").format(new Date());
                    //4.创建文件夹
                    File temf = new File(uploadPath + "/" + datePathDir);
                    if (!temf.exists()) {
                        temf.mkdirs();
                    }
                    String path = "/" + datePathDir + "/" + newName;
                    String filePath = uploadPath + "/" + path;
                    File file = new File(filePath);
                    pic.transferTo(file);
//                    Thumbnails.of(uploadPath + "/" + path)
//                            .scale(1f)
//                            .outputQuality(0.5f)
//                            .toFile(uploadPath + "/" + path);
                    FilesDO filesDO = new FilesDO();
                    filesDO.setFileName(newName);
                    filesDO.setFilePath(datePathDir + "/");
                    try {
                        filesDO.setUploadBy(MobileShiroUtils.getUser().getUserName());
                    } catch (Exception e) {
                        filesDO.setUploadBy("系统上传");
                    }
                    filesDO.setUploadDate(new Date());
                    filesService.save(filesDO);
                    map.put("srcUrl", imgHttp + path);
                    map.put("fileid", filesDO.getId());
                    urls.add(map);
                }
            }
        }
        map.clear();
        map.put("url", urls);
        return RestResultGenerator.genResult(HttpStatus.OK, map);
    }






    private String getAccessToken() throws IOException {

        if (StringUtils.isNotBlank(getRedisClient().get("access_token"))) {
            return getRedisClient().get("access_token");
        }

        HttpGet httpGet = new HttpGet(
                "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=" + miniprogramappid + "&secret=" + miniprogramsecret);
        HttpClient httpClient = HttpClients.createDefault();
        HttpResponse res = httpClient.execute(httpGet);
        HttpEntity entity = res.getEntity();
        String result = EntityUtils.toString(entity, "UTF-8");
        String access_token = JSONObject.parseObject(result).getString("access_token");
        getRedisClient().set("access_token", access_token, "NX", "EX", 7200);
        return access_token;
    }

    @PostMapping("/qrCode/{meetingId}")
    private synchronized Map<String, Object> getQrCode(@PathVariable String meetingId) throws IOException {
        RestTemplate rest = new RestTemplate();
        InputStream inputStream;
        OutputStream outputStream;
        String access_token = getAccessToken();

        String url = "https://api.weixin.qq.com/wxa/getwxacodeunlimit?access_token=" + access_token;
        Map<String, Object> param = new HashMap<>();
        param.put("scene", meetingId);
        param.put("page", "pages/index/main");
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
        filesDO.setUploadBy("系统上传");
        filesDO.setUploadDate(new Date());
        filesService.save(filesDO);
        outputStream.flush();
        map.clear();
        map.put("id", filesDO.getId().toString());
        map.put("url", imgHttp+filePathName);
        return map;
    }



    //readInputStream方法--------------------------------------------------
    private static byte[] readInputStream(InputStream inStream) throws Exception {
        ByteArrayOutputStream outStream = new ByteArrayOutputStream();
        byte[] buffer = new byte[1024];//转换为二进制
        int len;
        while ((len = inStream.read(buffer)) != -1) {
            outStream.write(buffer, 0, len);
        }
        return outStream.toByteArray();
    }

    /**
     * 处理登录信息
     *
     * @param mobileUserDO
     * @return ResponseResult
     */
    private ResponseResult login(MobileUserDO mobileUserDO) {
        try {
            UsernamePasswordToken token = new UsernamePasswordToken(mobileUserDO.getOpenId(), mobileUserDO.getPassword());
            Subject subject = SecurityUtils.getSubject();
            subject.login(token);
        } catch (Exception e) {
            log.error(e.getMessage());
            return RestResultGenerator.genResult(HttpStatus.INTERNAL_SERVER_ERROR, "登录失败");
        }
        return RestResultGenerator.genResult(HttpStatus.OK, mobileUserDO);
    }
}

