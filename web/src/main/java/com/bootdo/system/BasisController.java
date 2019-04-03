package com.bootdo.system;

import com.bootdo.app.domain.FilesDO;
import com.bootdo.app.service.FilesService;
import com.bootdo.common.utils.MessageUtil;
import com.bootdo.common.utils.ResponseResult;
import com.bootdo.common.utils.ShiroUtils;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

@RestController
@RequestMapping("/base")
public class BasisController {

    @Resource
    FilesService filesService;


    @Value("${bootdo.imgHttp}")
    private String imgHttp;

    @Value("${bootdo.uploadPath}")
    private String uploadPath;



    @PostMapping("/uploadFiles")
    public List<Map<String, Object>> uploadPic(@RequestParam MultipartFile[] files, HttpServletRequest request) throws IOException {

        List<Map<String, Object>> urls = new ArrayList<>();
        if (files.length > 0) {
            for (MultipartFile pic : files) {
                if (!pic.getOriginalFilename().equals("")) {
                    Map<String, Object> map = new HashMap<>();
                    String filename = pic.getOriginalFilename();
                    String suffer = FilenameUtils.getExtension(filename);
                    String replace = UUID.randomUUID().toString().replace("-", "");
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
                    filesDO.setUploadBy(ShiroUtils.getUser().getUsername());
                    filesDO.setUploadDate(new Date());
                    filesDO.setFileType(filename.substring(filename.lastIndexOf(".")+1));
                    filesService.save(filesDO);
                    map.put("srcUrl", imgHttp + path);
                    map.put("fileid", filesDO.getId());
                    urls.add(map);
                }
            }
        }
        return urls;
    }


}
