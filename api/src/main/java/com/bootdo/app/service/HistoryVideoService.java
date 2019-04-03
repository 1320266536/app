package com.bootdo.app.service;

import com.bootdo.app.domain.HistoryVideoDO;

import java.util.List;
import java.util.Map;

/**
 * 用户视频历史表
 * 
 * @author Lambda
 * @email 18744422377@163.com
 * @date 2019-02-26 15:17:36
 */
public interface HistoryVideoService {
	
	HistoryVideoDO get(Long id);
	
	List<HistoryVideoDO> list(Map<String, Object> map);
	
	int count(Map<String, Object> map);
	
	int save(HistoryVideoDO historyVideo);
	
	int update(HistoryVideoDO historyVideo);
	
	int remove(Long id);
	
	int batchRemove(Long[] ids);
}
