package com.bootdo.app.domain;

import lombok.Data;

import java.io.Serializable;


/**
 * 用户图集
 *
 * @author Lambda
 * @email 18744422377@163.com
 * @date 2019-02-26 15:17:36
 */
@Data
public class AlbumDO implements Serializable {
    private static final long serialVersionUID = 1L;

    //id
    private Long id;
    //用户id
    private Long userId;
    //图片id
    private String picId;
    //图片排序号
    private Integer sort;
    //图片路径
    private String filePath;
}
