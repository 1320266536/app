package com.bootdo.app.dao;

import com.bootdo.app.domain.VideoDO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

import java.util.List;
import java.util.Map;

/**
 * 视频作品表
 *
 * @author Lambda
 * @email 18744422377@163.com
 * @date 2019-02-26 15:17:36
 */
@Mapper
public interface VideoDao {

    VideoDO get(Long id);

    List<VideoDO> list(Map<String, Object> map);

//    List<VideoDO> videoList(@Param("historyVideoIds") List<Long> historyVideoIds, @Param("permissionsVideoIds") List<Long> permissionsVideoIds,Map<String,Object> map);
    List<VideoDO> videoList(Map<String,Object> map);

    int count(Map<String, Object> map);

    int save(VideoDO video);

    int update(VideoDO video);

    int remove(Long id);

    int batchRemove(Long[] ids);

    @Update("update app_video set ${column}=${column}+1 where id=${id}")
    int updateCount(Map<String, Object> map);
}
