package com.bootdo.app.dao;

import com.bootdo.app.domain.VcardFloderDO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

/**
 * 名片夹
 * @author Lambda
 * @email 18744422377@163.com
 * @date 2019-02-26 15:17:36
 */
@Mapper
public interface VcardFloderDao {

	VcardFloderDO get(Long id);
	
	List<VcardFloderDO> list(Map<String, Object> map);
	
	int count(Map<String, Object> map);
	
	int save(VcardFloderDO vcardFloder);
	
	int update(VcardFloderDO vcardFloder);
	
	int remove(Long id);
	
	int batchRemove(Long[] ids);
}
