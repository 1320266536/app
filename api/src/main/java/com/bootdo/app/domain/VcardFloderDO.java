package com.bootdo.app.domain;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;


/**
 * 名片夹
 * 
 * @author Lambda
 * @email 18744422377@163.com
 * @date 2019-02-26 15:17:36
 */
@Data
public class VcardFloderDO implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//id
	private Long id;
	//用户id
	private Long userId;
	//接受者id
	private Long receovedUserId;
	//发送时间
	private Date createTime;


}
