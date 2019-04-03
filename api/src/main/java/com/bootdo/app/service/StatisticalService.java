package com.bootdo.app.service;

import com.bootdo.app.domain.StatisticalDO;

import java.util.List;
import java.util.Map;

/**
 * 用户统计表
 * 
 * @author Lambda
 * @email 18744422377@163.com
 * @date 2019-02-26 15:17:36
 */
public interface StatisticalService {
	
	StatisticalDO get(Long id);
	
	List<StatisticalDO> list(Map<String, Object> map);
	
	int count(Map<String, Object> map);
	
	int save(StatisticalDO statistical);
	
	int update(StatisticalDO statistical);
	
	int remove(Long id);
	
	int batchRemove(Long[] ids);
}
