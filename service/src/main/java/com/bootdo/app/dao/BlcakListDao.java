package com.bootdo.app.dao;

import com.bootdo.app.domain.BlcakListDO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

/**
 * 黑名单
 *
 * @author Lambda
 * @email 18744422377@163.com
 * @date 2019-02-26 15:17:36
 */
@Mapper
public interface BlcakListDao {

    BlcakListDO get(Long id);

    List<BlcakListDO> list(Map<String, Object> map);

    int count(Map<String, Object> map);

    int save(BlcakListDO blcakList);

    int update(BlcakListDO blcakList);

    int remove(Long id);

    int batchRemove(Long[] ids);

    int delLink(Map<String, Object> map);
}
