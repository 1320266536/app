package com.bootdo.app.domain;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;


/**
 * 视频作品表
 *
 * @author Lambda
 * @email 18744422377@163.com
 * @date 2019-02-26 15:17:36
 */
@Data
public class VideoDO implements Serializable {
    private static final long serialVersionUID = 1L;

    //id
    private Long id;
    //用户id
    private Long userId;
    //视频主题
    private String theme;
    //发布时间
    private Date releaseTime;
    //私密性
    private Integer permissions;
    //视频ID
    private String fileid;
    //点赞
    private Integer praises;
    //评论数量
    private Integer comments;
    //转发数量
    private Integer share;
    //状态
    private Integer status;
    //备注
    private String remarks;
    //是否推荐
    private Integer recommended;
    //推荐日期
    private Date reTime;
    //经纬度
    private String coordinates;
    //用户是否点赞
    private int praiseFlag;
    //用户实体类
    private MobileUserDO mobileUserDO;

}
