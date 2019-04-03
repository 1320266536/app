package com.bootdo.app.service.impl;

import com.bootdo.app.dao.VideoDao;
import com.bootdo.app.domain.VideoDO;
import com.bootdo.app.service.VideoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;


@Service
public class VideoServiceImpl implements VideoService {
	@Autowired
	private VideoDao videoDao;
	
	@Override
	public VideoDO get(Long id){
		return videoDao.get(id);
	}
	
	@Override
	public List<VideoDO> list(Map<String, Object> map){
		return videoDao.list(map);
	}

	@Override
	public List<VideoDO> videoList(Map<String, Object> map) {
		return videoDao.videoList(map);
	}

	@Override
	public int count(Map<String, Object> map){
		return videoDao.count(map);
	}
	
	@Override
	public int save(VideoDO video){
		return videoDao.save(video);
	}
	
	@Override
	public int update(VideoDO video){
		return videoDao.update(video);
	}
	
	@Override
	public int remove(Long id){
		return videoDao.remove(id);
	}
	
	@Override
	public int batchRemove(Long[] ids){
		return videoDao.batchRemove(ids);
	}

	@Override
	public int updateCount(Map<String, Object> map) {
		return videoDao.updateCount(map);
	}

}
