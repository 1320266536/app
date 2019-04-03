package com.bootdo.app.service;

import com.bootdo.app.domain.TagDictionaryDO;

import java.util.List;
import java.util.Map;

/**
 * 标签字典表
 * 
 * @author Lambda
 * @email 18744422377@163.com
 * @date 2019-02-26 15:17:36
 */
public interface TagDictionaryService {
	
	TagDictionaryDO get(Long id);
	
	List<TagDictionaryDO> list(Map<String, Object> map);
	
	int count(Map<String, Object> map);
	
	int save(TagDictionaryDO tagDictionary);
	
	int update(TagDictionaryDO tagDictionary);
	
	int remove(Long id);
	
	int batchRemove(Long[] ids);
}
