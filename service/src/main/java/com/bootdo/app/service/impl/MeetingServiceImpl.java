package com.bootdo.app.service.impl;

import com.bootdo.app.dao.MeetingDao;
import com.bootdo.app.domain.MeetingDO;
import com.bootdo.app.service.MeetingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;


@Service
public class MeetingServiceImpl implements MeetingService {
	@Autowired
	private MeetingDao meetingDao;
	
	@Override
	public MeetingDO get(Long id){
		return meetingDao.get(id);
	}
	
	@Override
	public List<MeetingDO> list(Map<String, Object> map){
		return meetingDao.list(map);
	}

	@Override
	public List<MeetingDO> myMeetList(String userId) {
		return meetingDao.myMeetList(userId);
	}

	@Override
	public int count(Map<String, Object> map){
		return meetingDao.count(map);
	}
	
	@Override
	public int save(MeetingDO meeting){
		return meetingDao.save(meeting);
	}
	
	@Override
	public int update(MeetingDO meeting){
		return meetingDao.update(meeting);
	}
	
	@Override
	public int remove(Long id){
		return meetingDao.remove(id);
	}
	
	@Override
	public int batchRemove(Long[] ids){
		return meetingDao.batchRemove(ids);
	}
	
}
