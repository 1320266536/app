package com.bootdo.app.service.impl;

import com.bootdo.app.dao.FeedBackDao;
import com.bootdo.app.domain.FeedBackDO;
import com.bootdo.app.service.FeedBackService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;


@Service
public class FeedBackServiceImpl implements FeedBackService {
	@Autowired
	private FeedBackDao feedBackDao;
	
	@Override
	public FeedBackDO get(Long id){
		return feedBackDao.get(id);
	}
	
	@Override
	public List<FeedBackDO> list(Map<String, Object> map){
		return feedBackDao.list(map);
	}
	
	@Override
	public int count(Map<String, Object> map){
		return feedBackDao.count(map);
	}
	
	@Override
	public int save(FeedBackDO feedBack){
		return feedBackDao.save(feedBack);
	}
	
	@Override
	public int update(FeedBackDO feedBack){
		return feedBackDao.update(feedBack);
	}
	
	@Override
	public int remove(Long id){
		return feedBackDao.remove(id);
	}
	
	@Override
	public int batchRemove(Long[] ids){
		return feedBackDao.batchRemove(ids);
	}
	
}
