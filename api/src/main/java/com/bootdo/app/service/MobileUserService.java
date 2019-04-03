package com.bootdo.app.service;

import com.bootdo.app.domain.MobileUserDO;

import java.util.List;
import java.util.Map;

/**
 * 移动端用户表（用于app和小程序）
 * 
 * @author Lambda
 * @email 18744422377@163.com
 * @date 2019-02-26 15:17:36
 */
public interface MobileUserService {
	
	MobileUserDO getByPhone(String phone);

	MobileUserDO getByOpenId(String openId);

	MobileUserDO get(Long id);
	
	List<MobileUserDO> list(Map<String, Object> map);
	
	int count(Map<String, Object> map);
	
	int save(MobileUserDO mobileUser);
	
	int update(MobileUserDO mobileUser);
	
	int remove(Long id);
	
	int batchRemove(Long[] ids);

	List<MobileUserDO> nearByMe(String lat,
								String lon,
								String limit, Long id);

	List<MobileUserDO> userListByIdInArray(Long[] ids);

}
