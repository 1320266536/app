package com.bootdo.app.domain;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;


/**
 * 用户统计表
 * 
 * @author Lambda
 * @email 18744422377@163.com
 * @date 2019-02-26 15:17:36
 */
@Data
public class StatisticalDO implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//id
	private Long id;
	//用户id
	private Long userId;
	//动作
	private Integer action;
	//对象
	private String object;
	//创建时间
	private Date createDate;

}
