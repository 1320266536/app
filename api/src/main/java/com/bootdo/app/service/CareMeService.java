package com.bootdo.app.service;

import com.bootdo.app.domain.CareMeDO;

import java.util.List;
import java.util.Map;

/**
 * 关注表
 * 
 * @author Lambda
 * @email 18744422377@163.com
 * @date 2019-02-26 15:17:36
 */
public interface CareMeService {
	
	CareMeDO get(Long id);
	
	List<CareMeDO> list(Map<String, Object> map);
	
	int count(Map<String, Object> map);
	
	int save(CareMeDO careMe);
	
	int update(CareMeDO careMe);
	
	int remove(Long id);
	
	int batchRemove(Long[] ids);

	int delLink(Map<String, Object> map);

	int isCare(Map<String, Object> map);
}
