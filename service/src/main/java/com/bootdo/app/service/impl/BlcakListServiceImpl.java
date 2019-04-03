package com.bootdo.app.service.impl;

import com.bootdo.app.dao.BlcakListDao;
import com.bootdo.app.domain.BlcakListDO;
import com.bootdo.app.service.BlcakListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;


@Service
public class BlcakListServiceImpl implements BlcakListService {
	@Autowired
	private BlcakListDao blcakListDao;
	
	@Override
	public BlcakListDO get(Long id){
		return blcakListDao.get(id);
	}
	
	@Override
	public List<BlcakListDO> list(Map<String, Object> map){
		return blcakListDao.list(map);
	}
	
	@Override
	public int count(Map<String, Object> map){
		return blcakListDao.count(map);
	}
	
	@Override
	public int save(BlcakListDO blcakList){
		return blcakListDao.save(blcakList);
	}
	
	@Override
	public int update(BlcakListDO blcakList){
		return blcakListDao.update(blcakList);
	}
	
	@Override
	public int remove(Long id){
		return blcakListDao.remove(id);
	}
	
	@Override
	public int batchRemove(Long[] ids){
		return blcakListDao.batchRemove(ids);
	}

	@Override
	public int delLink(Map<String, Object> map) {
		return blcakListDao.delLink(map);
	}

}
