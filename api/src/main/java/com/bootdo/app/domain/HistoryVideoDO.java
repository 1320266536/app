package com.bootdo.app.domain;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;


/**
 * 用户视频历史表
 * 
 * @author Lambda
 * @email 18744422377@163.com
 * @date 2019-02-26 15:17:36
 */
@Data
public class HistoryVideoDO implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//id
	private Long id;
	//用户id
	private Long userId;
	//视频id
	private Long videoId;
	//创建日期
	private Date createDate;


}
