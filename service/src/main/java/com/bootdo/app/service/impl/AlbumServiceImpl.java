package com.bootdo.app.service.impl;

import com.bootdo.app.dao.AlbumDao;
import com.bootdo.app.domain.AlbumDO;
import com.bootdo.app.service.AlbumService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;


@Service
public class AlbumServiceImpl implements AlbumService {
	@Autowired
	private AlbumDao albumDao;
	
	@Override
	public AlbumDO get(Long id){
		return albumDao.get(id);
	}
	
	@Override
	public List<AlbumDO> list(Map<String, Object> map){
		return albumDao.list(map);
	}
	
	@Override
	public int count(Map<String, Object> map){
		return albumDao.count(map);
	}
	
	@Override
	public int save(AlbumDO album){
		return albumDao.save(album);
	}
	
	@Override
	public int update(AlbumDO album){
		return albumDao.update(album);
	}
	
	@Override
	public int remove(Long id){
		return albumDao.remove(id);
	}
	
	@Override
	public int batchRemove(Long[] ids){
		return albumDao.batchRemove(ids);
	}

	@Override
	public int removeByUserId(Long id) {
		return albumDao.removeByUserId(id);
	}

}
