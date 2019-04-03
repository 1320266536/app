package com.bootdo.app.service;

import com.bootdo.app.domain.FeedBackDO;

import java.util.List;
import java.util.Map;

/**
 * 用户意见反馈表
 * 
 * @author Lambda
 * @email 18744422377@163.com
 * @date 2019-02-26 15:17:36
 */
public interface FeedBackService {
	
	FeedBackDO get(Long id);
	
	List<FeedBackDO> list(Map<String, Object> map);
	
	int count(Map<String, Object> map);
	
	int save(FeedBackDO feedBack);
	
	int update(FeedBackDO feedBack);
	
	int remove(Long id);
	
	int batchRemove(Long[] ids);
}
