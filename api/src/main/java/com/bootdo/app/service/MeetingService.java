package com.bootdo.app.service;

import com.bootdo.app.domain.MeetingDO;

import java.util.List;
import java.util.Map;

/**
 * 会议管理
 * 
 * @author Lambda
 * @email 18744422377@163.com
 * @date 2019-02-26 15:17:36
 */
public interface MeetingService {
	
	MeetingDO get(Long id);
	
	List<MeetingDO> list(Map<String, Object> map);

	List<MeetingDO> myMeetList(String userId);


	int count(Map<String, Object> map);
	
	int save(MeetingDO meeting);
	
	int update(MeetingDO meeting);
	
	int remove(Long id);
	
	int batchRemove(Long[] ids);
}
