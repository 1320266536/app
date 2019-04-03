package com.bootdo.app.service.impl;

import com.bootdo.app.dao.FilesDao;
import com.bootdo.app.domain.FilesDO;
import com.bootdo.app.service.FilesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;



@Service
public class FilesServiceImpl implements FilesService {
    @Autowired
    private FilesDao filesDao;

    @Override
    public FilesDO get(Object id) {
        return filesDao.get(Long.valueOf(id.toString()));
    }

    @Override
    public List<FilesDO> list(Map<String, Object> map) {
        return filesDao.list(map);
    }

    @Override
    public int count(Map<String, Object> map) {
        return filesDao.count(map);
    }

    @Override
    public FilesDO save(FilesDO files) {
        if (filesDao.save(files) > 0) {
            return files;
        }
        return null;
    }

    @Override
    public int update(FilesDO files) {
        return filesDao.update(files);
    }

    @Override
    public int remove(Long id) {
        return filesDao.remove(id);
    }

    @Override
    public int batchRemove(Long[] ids) {
        return filesDao.batchRemove(ids);
    }

}
