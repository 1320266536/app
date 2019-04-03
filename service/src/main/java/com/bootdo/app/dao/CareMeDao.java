package com.bootdo.app.dao;

import com.bootdo.app.domain.CareMeDO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

/**
 * 关注表
 *
 * @author Lambda
 * @email 18744422377@163.com
 * @date 2019-02-26 15:17:36
 */
@Mapper
public interface CareMeDao {

    CareMeDO get(Long id);

    List<CareMeDO> list(Map<String, Object> map);

    int count(Map<String, Object> map);

    int save(CareMeDO careMe);

    int update(CareMeDO careMe);

    int remove(Long id);

    int batchRemove(Long[] ids);

    int delLink(Map<String, Object> map);

    int isCare(Map<String, Object> map);

    int isHisCare(Map<String, Object> map);
}
