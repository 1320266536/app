package com.bootdo.app.domain;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;
import java.util.List;


/**
 * 会议管理
 *
 * @author Lambda
 * @email 18744422377@163.com
 * @date 2019-02-26 15:17:36
 */
@Data
public class MeetingDO implements Serializable {
    private static final long serialVersionUID = 1L;

    //id
    private Long id;
    //会议名称
    private String name;
    //会议内容
    private String content;
    //会议时间
    private Date mtTime;
    //会议地点
    private String adress;
    //经纬度
    private String coordinates;
    // 二维码
    private String qrCode;
    //参与会议的人员
    private List<JoinMeetingDO> list;
    //是否已经参与
    private int joinFlag;
    //    参与人数
    private int joinCount;
}
