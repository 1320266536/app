package com.bootdo.app.domain;

import lombok.Data;

import java.io.Serializable;


/**
 * 用户意见反馈表
 * 
 * @author Lambda
 * @email 18744422377@163.com
 * @date 2019-02-26 15:17:36
 */
@Data
public class FeedBackDO implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//id
	private Long id;
	//用户id
	private Long userId;
	//用户昵称
	private String nickName;
	//反馈内容
	private String content;


}
