package com.bootdo.app.service;

import com.bootdo.app.domain.JoinMeetingDO;

import java.util.List;
import java.util.Map;

/**
 * 参与会议人员表
 * 
 * @author Lambda
 * @email 18744422377@163.com
 * @date 2019-02-26 15:17:36
 */
public interface JoinMeetingService {
	
	JoinMeetingDO get(Long id);
	
	List<JoinMeetingDO> list(Map<String, Object> map);
	
	int count(Map<String, Object> map);
	
	int save(JoinMeetingDO joinMeeting);
	
	int update(JoinMeetingDO joinMeeting);
	
	int remove(Long id);
	
	int batchRemove(Long[] ids);
}
