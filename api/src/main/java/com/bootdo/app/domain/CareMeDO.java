package com.bootdo.app.domain;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;


/**
 * 关注表
 * 
 * @author Lambda
 * @email 18744422377@163.com
 * @date 2019-02-26 15:17:36
 */
@Data
public class CareMeDO implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//id
	private Long id;
	//用户id
	private Long userId;
	//关注用户id
	private Long careUserId;
	//关注时间
	private Date createDate;


}
