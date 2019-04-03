package com.bootdo.app.service.impl;

import com.bootdo.app.dao.StatisticalDao;
import com.bootdo.app.domain.StatisticalDO;
import com.bootdo.app.service.StatisticalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;


@Service
public class StatisticalServiceImpl implements StatisticalService {
	@Autowired
	private StatisticalDao statisticalDao;
	
	@Override
	public StatisticalDO get(Long id){
		return statisticalDao.get(id);
	}
	
	@Override
	public List<StatisticalDO> list(Map<String, Object> map){
		return statisticalDao.list(map);
	}
	
	@Override
	public int count(Map<String, Object> map){
		return statisticalDao.count(map);
	}
	
	@Override
	public int save(StatisticalDO statistical){
		return statisticalDao.save(statistical);
	}
	
	@Override
	public int update(StatisticalDO statistical){
		return statisticalDao.update(statistical);
	}
	
	@Override
	public int remove(Long id){
		return statisticalDao.remove(id);
	}
	
	@Override
	public int batchRemove(Long[] ids){
		return statisticalDao.batchRemove(ids);
	}
	
}
