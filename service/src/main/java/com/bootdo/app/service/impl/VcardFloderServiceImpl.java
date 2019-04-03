package com.bootdo.app.service.impl;

import com.bootdo.app.dao.VcardFloderDao;
import com.bootdo.app.domain.VcardFloderDO;
import com.bootdo.app.service.VcardFloderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;


@Service
public class VcardFloderServiceImpl implements VcardFloderService {
	@Autowired
	private VcardFloderDao vcardFloderDao;
	
	@Override
	public VcardFloderDO get(Long id){
		return vcardFloderDao.get(id);
	}
	
	@Override
	public List<VcardFloderDO> list(Map<String, Object> map){
		return vcardFloderDao.list(map);
	}
	
	@Override
	public int count(Map<String, Object> map){
		return vcardFloderDao.count(map);
	}
	
	@Override
	public int save(VcardFloderDO vcardFloder){
		return vcardFloderDao.save(vcardFloder);
	}
	
	@Override
	public int update(VcardFloderDO vcardFloder){
		return vcardFloderDao.update(vcardFloder);
	}
	
	@Override
	public int remove(Long id){
		return vcardFloderDao.remove(id);
	}
	
	@Override
	public int batchRemove(Long[] ids){
		return vcardFloderDao.batchRemove(ids);
	}
	
}
