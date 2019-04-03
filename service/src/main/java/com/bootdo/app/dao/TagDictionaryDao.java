package com.bootdo.app.dao;

import com.bootdo.app.domain.TagDictionaryDO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

/**
 * 标签字典表
 * @author Lambda
 * @email 18744422377@163.com
 * @date 2019-02-26 15:17:36
 */
@Mapper
public interface TagDictionaryDao {

	TagDictionaryDO get(Long id);
	
	List<TagDictionaryDO> list(Map<String, Object> map);
	
	int count(Map<String, Object> map);
	
	int save(TagDictionaryDO tagDictionary);
	
	int update(TagDictionaryDO tagDictionary);
	
	int remove(Long id);
	
	int batchRemove(Long[] ids);
}
