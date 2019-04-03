package com.bootdo.app.domain;

import lombok.Data;

import java.io.Serializable;


/**
 * 标签字典表
 * 
 * @author Lambda
 * @email 18744422377@163.com
 * @date 2019-02-26 15:17:36
 */
@Data
public class TagDictionaryDO implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//id
	private Long id;
	//类别
	private Integer type;
	//描述
	private String tdDesc;
	//状态
	private Integer status;


}
