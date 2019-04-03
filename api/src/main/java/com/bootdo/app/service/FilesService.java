package com.bootdo.app.service;


import com.bootdo.app.domain.FilesDO;

import java.util.List;
import java.util.Map;

/**
 * 文件表
 *
 * @author Lambda~
 * @email hanzhiqiang803@gmail.com
 * @date 2018-11-13 15:55:24
 */
public interface FilesService {

    FilesDO get(Object id);

    List<FilesDO> list(Map<String, Object> map);

    int count(Map<String, Object> map);

    FilesDO save(FilesDO files);

    int update(FilesDO files);

    int remove(Long id);

    int batchRemove(Long[] ids);
}
