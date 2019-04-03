package com.bootdo.app.service;

import com.bootdo.app.domain.AlbumDO;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 用户图集
 * 
 * @author Lambda
 * @email 18744422377@163.com
 * @date 2019-02-26 15:17:36
 */
public interface AlbumService {
	
	AlbumDO get(Long id);
	
	List<AlbumDO> list(Map<String, Object> map);
	
	int count(Map<String, Object> map);
	
	int save(AlbumDO album);
	
	int update(AlbumDO album);
	
	int remove(Long id);
	
	int batchRemove(Long[] ids);

	int removeByUserId(Long id);

}
