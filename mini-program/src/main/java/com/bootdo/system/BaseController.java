package com.bootdo.system;

import cn.hutool.core.util.ObjectUtil;
import com.bootdo.app.domain.MobileUserDO;
import com.bootdo.app.service.FilesService;
import com.bootdo.common.utils.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import redis.clients.jedis.Jedis;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

public class BaseController {
    @Resource
    FilesService filesService;
    @Value("${spring.redis.host}")
    private String host;
    @Value("${spring.redis.password}")
    private String password;
    @Value("${spring.redis.port}")
    private int port;
    @Value("${bootdo.imgHttp}")
    private String imgHttp;

    private Jedis jedis = null;

    protected Map<String, Object> map = new HashMap<>();

    protected SimpleDateFormat getSdf() {
        return new SimpleDateFormat("yyyy-MM-dd");
    }

    protected SimpleDateFormat getSdf(String format) {
        return new SimpleDateFormat(format);
    }

    protected String getUuid() {
        return UUID.randomUUID().toString().replace("-", "");
    }

    protected Jedis getRedisClient() {
        if (ObjectUtil.isNotNull(jedis)) {
            return jedis;
        }
        jedis = new Jedis(host, port);
        jedis.auth(password);
        return jedis;
    }

    /**
     * 处理用户图片信息，把id换成可见的url
     *
     * @param mobileUserDO
     */
    protected void dealUserPicInfo(MobileUserDO mobileUserDO) {
        if (StringUtils.isNotBlank(mobileUserDO.getHeadImg())) {
            mobileUserDO.setHeadImg(imgHttp + filesService.get(mobileUserDO.getHeadImg()).getFilePath());
        }
        if (StringUtils.isNotBlank(mobileUserDO.getBusinessCard())) {
            mobileUserDO.setBusinessCard(imgHttp + filesService.get(mobileUserDO.getBusinessCard()).getFilePath());
        }
        if (StringUtils.isNotBlank(mobileUserDO.getLogo())) {
            mobileUserDO.setBusinessCard(imgHttp + filesService.get(mobileUserDO.getLogo()).getFilePath());
        }

    }


}
