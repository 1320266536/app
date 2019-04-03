package com.bootdo.app.service.impl;

import com.bootdo.app.dao.TagDictionaryDao;
import com.bootdo.app.domain.TagDictionaryDO;
import com.bootdo.app.service.TagDictionaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;


@Service
public class TagDictionaryServiceImpl implements TagDictionaryService {
	@Autowired
	private TagDictionaryDao tagDictionaryDao;
	
	@Override
	public TagDictionaryDO get(Long id){
		return tagDictionaryDao.get(id);
	}
	
	@Override
	public List<TagDictionaryDO> list(Map<String, Object> map){
		return tagDictionaryDao.list(map);
	}
	
	@Override
	public int count(Map<String, Object> map){
		return tagDictionaryDao.count(map);
	}
	
	@Override
	public int save(TagDictionaryDO tagDictionary){
		return tagDictionaryDao.save(tagDictionary);
	}
	
	@Override
	public int update(TagDictionaryDO tagDictionary){
		return tagDictionaryDao.update(tagDictionary);
	}
	
	@Override
	public int remove(Long id){
		return tagDictionaryDao.remove(id);
	}
	
	@Override
	public int batchRemove(Long[] ids){
		return tagDictionaryDao.batchRemove(ids);
	}
	
}
