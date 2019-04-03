package com.bootdo.system;

import com.bootdo.app.domain.FilesDO;
import com.bootdo.app.service.FilesService;
import com.bootdo.common.utils.*;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

@Slf4j
@RestController
@RequestMapping("/base")
public class BasisController extends BaseController {


    @Resource
    FilesService filesService;

    @Value("${bootdo.imgHttp}")
    private String imgHttp;

    @Value("${bootdo.uploadPath}")
    private String uploadPath;


    @PostMapping("/sendCode/{phone}")
    public ResponseResult sendCode(@PathVariable String phone) {
        String code = String.valueOf(MessageUtil.getCode());
        try {
            // NX是不存在时才set， XX是存在时才set， EX是秒，PX是毫秒
            String codeKey = phone + (new SimpleDateFormat("yyyyMMddhh").format(new Date()));
            getRedisClient()
                    .set(codeKey, code, StringUtils.isNotBlank(getRedisClient().get(codeKey)) ? "XX" : "NX", "EX", 300);

            MessageUtil.sendMessage(phone, "1", MessageUtil.getArray(code));
        } catch (Exception e) {
            e.printStackTrace();
            return RestResultGenerator.genResult(HttpStatus.INTERNAL_SERVER_ERROR);
        }
        return RestResultGenerator.genResult(HttpStatus.OK, Long.valueOf(code), "发送成功");
    }

    @PostMapping("/uploadFile")
    public ResponseResult uploadFile(@RequestParam MultipartFile[] files) throws IOException {
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


}
