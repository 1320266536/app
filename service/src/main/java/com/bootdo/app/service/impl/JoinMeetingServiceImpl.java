package com.bootdo.app.service.impl;

import com.bootdo.app.dao.JoinMeetingDao;
import com.bootdo.app.domain.JoinMeetingDO;
import com.bootdo.app.service.JoinMeetingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;


@Service
public class JoinMeetingServiceImpl implements JoinMeetingService {
	@Autowired
	private JoinMeetingDao joinMeetingDao;
	
	@Override
	public JoinMeetingDO get(Long id){
		return joinMeetingDao.get(id);
	}
	
	@Override
	public List<JoinMeetingDO> list(Map<String, Object> map){
		return joinMeetingDao.list(map);
	}
	
	@Override
	public int count(Map<String, Object> map){
		return joinMeetingDao.count(map);
	}
	
	@Override
	public int save(JoinMeetingDO joinMeeting){
		return joinMeetingDao.save(joinMeeting);
	}
	
	@Override
	public int update(JoinMeetingDO joinMeeting){
		return joinMeetingDao.update(joinMeeting);
	}
	
	@Override
	public int remove(Long id){
		return joinMeetingDao.remove(id);
	}
	
	@Override
	public int batchRemove(Long[] ids){
		return joinMeetingDao.batchRemove(ids);
	}
	
}
