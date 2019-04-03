package com.bootdo.system;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.util.ObjectUtil;
import com.bootdo.app.domain.AlbumDO;
import com.bootdo.app.domain.MobileUserDO;
import com.bootdo.app.service.AlbumService;
import com.bootdo.app.service.FilesService;
import com.bootdo.common.utils.DistanceUtil;
import com.bootdo.common.utils.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import redis.clients.jedis.Jedis;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

public class BaseController {
    @Resource
    FilesService filesService;
    @Resource
    AlbumService albumService;
    @Value("${spring.redis.host}")
    private String host;
    @Value("${spring.redis.password}")
    private String password;
    @Value("${spring.redis.port}")
    private int port;
    @Value("${bootdo.imgHttp}")
    private String imgHttp;

    private static Jedis jedis = null;

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
        if (StringUtils.isNotBlank(password)) {
            jedis.auth(password);
        }
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

        map.clear();
        map.put("userId", mobileUserDO.getId());
        map.put("sort", "sort");
        map.put("order", "asc");
        List<AlbumDO> list = albumService.list(map);
        if (CollectionUtil.isNotEmpty(list)) {
            mobileUserDO.setHeadImg(imgHttp + filesService.get(list.get(0).getPicId()).getFilePath());
            list.forEach(albumDO -> {
                albumDO.setFilePath(imgHttp + filesService.get(albumDO.getPicId()).getFilePath());
            });
            mobileUserDO.setAlbumObjectList(list);
        }

    }

    protected void dealUserDistance(double lon1, double lat1, MobileUserDO mobileUserDO) {
        if (StringUtils.isNotBlank(mobileUserDO.getLat()) && StringUtils.isNotBlank(mobileUserDO.getLon())) {
            Double distance = DistanceUtil.getDistance(lon1, lat1, Double.valueOf(mobileUserDO.getLon()), Double.valueOf(mobileUserDO.getLat()));
            mobileUserDO.setDistance(distance);
        }

    }
}
