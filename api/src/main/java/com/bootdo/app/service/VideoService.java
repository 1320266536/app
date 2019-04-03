package com.bootdo.app.service;

import com.bootdo.app.domain.VideoDO;

import java.util.List;
import java.util.Map;

/**
 * 视频作品表
 * 
 * @author Lambda
 * @email 18744422377@163.com
 * @date 2019-02-26 15:17:36
 */
public interface VideoService {
	
	VideoDO get(Long id);
	
	List<VideoDO> list(Map<String, Object> map);

	List<VideoDO> videoList(Map<String, Object> map);

	int count(Map<String, Object> map);
	
	int save(VideoDO video);
	
	int update(VideoDO video);
	
	int remove(Long id);
	
	int batchRemove(Long[] ids);

	int updateCount(Map<String, Object> map);

}
