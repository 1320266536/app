package com.bootdo.app.service.impl;

import com.bootdo.app.dao.CareMeDao;
import com.bootdo.app.domain.CareMeDO;
import com.bootdo.app.service.CareMeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;


@Service
public class CareMeServiceImpl implements CareMeService {
	@Autowired
	private CareMeDao careMeDao;
	
	@Override
	public CareMeDO get(Long id){
		return careMeDao.get(id);
	}
	
	@Override
	public List<CareMeDO> list(Map<String, Object> map){
		return careMeDao.list(map);
	}
	
	@Override
	public int count(Map<String, Object> map){
		return careMeDao.count(map);
	}
	
	@Override
	public int save(CareMeDO careMe){
		return careMeDao.save(careMe);
	}
	
	@Override
	public int update(CareMeDO careMe){
		return careMeDao.update(careMe);
	}
	
	@Override
	public int remove(Long id){
		return careMeDao.remove(id);
	}
	
	@Override
	public int batchRemove(Long[] ids){
		return careMeDao.batchRemove(ids);
	}

	@Override
	public int delLink(Map<String, Object> map) {
		return careMeDao.delLink(map);
	}

	@Override
	public int isCare(Map<String, Object> map) {
		int care = careMeDao.isCare(map);
		if(care == 1) {
			care = careMeDao.isHisCare(map);
			if(care == 1) {
				return 2;
			} else {
				return 1;
			}
		}
		return 0;
	}

}
