package com.bootdo.app.dao;

import com.bootdo.app.domain.AlbumDO;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 用户图集
 * @author Lambda
 * @email 18744422377@163.com
 * @date 2019-02-26 15:17:36
 */
@Mapper
public interface AlbumDao {

	AlbumDO get(Long id);
	
	List<AlbumDO> list(Map<String, Object> map);
	
	int count(Map<String, Object> map);
	
	int save(AlbumDO album);
	
	int update(AlbumDO album);
	
	int remove(Long id);
	
	int batchRemove(Long[] ids);

	@Delete("delete from app_album where user_id=#{id}")
	int removeByUserId(@Param("id") Long id);
}
