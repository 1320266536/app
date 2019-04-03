package com.bootdo.app.service.impl;

import com.bootdo.app.dao.HistoryVideoDao;
import com.bootdo.app.domain.HistoryVideoDO;
import com.bootdo.app.service.HistoryVideoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;


@Service
public class HistoryVideoServiceImpl implements HistoryVideoService {
	@Autowired
	private HistoryVideoDao historyVideoDao;
	
	@Override
	public HistoryVideoDO get(Long id){
		return historyVideoDao.get(id);
	}
	
	@Override
	public List<HistoryVideoDO> list(Map<String, Object> map){
		return historyVideoDao.list(map);
	}
	
	@Override
	public int count(Map<String, Object> map){
		return historyVideoDao.count(map);
	}
	
	@Override
	public int save(HistoryVideoDO historyVideo){
		return historyVideoDao.save(historyVideo);
	}
	
	@Override
	public int update(HistoryVideoDO historyVideo){
		return historyVideoDao.update(historyVideo);
	}
	
	@Override
	public int remove(Long id){
		return historyVideoDao.remove(id);
	}
	
	@Override
	public int batchRemove(Long[] ids){
		return historyVideoDao.batchRemove(ids);
	}
	
}
