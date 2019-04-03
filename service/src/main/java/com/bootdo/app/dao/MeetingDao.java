package com.bootdo.app.dao;

import com.bootdo.app.domain.MeetingDO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

/**
 * 会议管理
 * @author Lambda
 * @email 18744422377@163.com
 * @date 2019-02-26 15:17:36
 */
@Mapper
public interface MeetingDao {

	MeetingDO get(Long id);
	
	List<MeetingDO> list(Map<String, Object> map);

	List<MeetingDO> myMeetList(String userId);

	int count(Map<String, Object> map);
	
	int save(MeetingDO meeting);
	
	int update(MeetingDO meeting);
	
	int remove(Long id);
	
	int batchRemove(Long[] ids);
}
