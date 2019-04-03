package com.bootdo.app.service.impl;

import com.bootdo.app.dao.MobileUserDao;
import com.bootdo.app.domain.MobileUserDO;
import com.bootdo.app.service.MobileUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;


@Service
public class MobileUserServiceImpl implements MobileUserService {
    @Autowired
    private MobileUserDao mobileUserDao;

    @Override
    public MobileUserDO getByPhone(String phone) {
        return mobileUserDao.getByPhone(phone);
    }

    @Override
    public MobileUserDO getByOpenId(String openId) {
        return mobileUserDao.getByOpenId(openId);
    }

    @Override
    public MobileUserDO get(Long id) {
        return mobileUserDao.get(id);
    }

    @Override
    public List<MobileUserDO> list(Map<String, Object> map) {
        return mobileUserDao.list(map);
    }

    @Override
    public int count(Map<String, Object> map) {
        return mobileUserDao.count(map);
    }

    @Override
    public int save(MobileUserDO mobileUser) {
        return mobileUserDao.save(mobileUser);
    }

    @Override
    public int update(MobileUserDO mobileUser) {
        return mobileUserDao.update(mobileUser);
    }

    @Override
    public int remove(Long id) {
        return mobileUserDao.remove(id);
    }

    @Override
    public int batchRemove(Long[] ids) {
        return mobileUserDao.batchRemove(ids);
    }

    @Override
    public List<MobileUserDO> nearByMe(String lat, String lon, String limit, Long id) {
        return mobileUserDao.nearByMe(lat, lon, limit, id);
    }

    @Override
    public List<MobileUserDO> userListByIdInArray(Long[] ids) {
        return mobileUserDao.userListByIdInArray(ids);
    }

}
