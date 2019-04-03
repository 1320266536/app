package com.bootdo.app.domain;

import lombok.Data;

import java.io.Serializable;


/**
 * 参与会议人员表
 * 
 * @author Lambda
 * @email 18744422377@163.com
 * @date 2019-02-26 15:17:36
 */
@Data
public class JoinMeetingDO implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//id
	private Long id;
	//会议id
	private Long mtId;
	//用户id
	private Long userId;
	//微信openID
	private String openId;
	//头像ID
	private String pic;


}
