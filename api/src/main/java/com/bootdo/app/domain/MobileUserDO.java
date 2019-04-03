package com.bootdo.app.domain;

import lombok.Data;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


/**
 * 移动端用户表（用于app和小程序）
 *
 * @author Lambda
 * @email 18744422377@163.com
 * @date 2019-02-27 09:48:27
 */
@Data
public class MobileUserDO implements Serializable {
    private static final long serialVersionUID = 1L;

    //id
    private Long id;
    //头像
    private String headImg;
    //昵称
    private String nickName;
    //性别
    private String sex;
    //年龄
    private Integer age;
    //手机号
    private String phone;
    //密码
    private String password;
    //公司
    private String company;
    //职位
    private String positions;
    //行业
    private String industry;
    //邮箱
    private String mail;
    //注册时间
    private Date createDate;
    //名片
    private String businessCard;
    //真实姓名
    private String userName;
    //身份证号
    private String idCardNum;
    //手持身份证gmtModified
    private String handUpIdCard;
    //身份证正面图
    private String idCardPositive;
    //身份证反面图
    private String idCardReverse;
    //是否实名
    private Integer realFlag;
    //状态
    private Integer status;
    //环信id
    private String imCode;
    //微信Open_Id
    private String openId;
    //粉丝数量
    private Integer fansCount;
    //	作品数量
    private Integer videoCount;
    //	获赞数
    private Integer praisesCount;
    //	关注的数量
    private Integer careCount;
    //	用户来源
    private String userFrom;
    //	收到的名片数量
    private Integer vcCardCount;
    //	经度
    private String lon;
    //	纬度
    private String lat;
    //验证码
    private String verCode;
    //用户图集
    private List<String> albumList = new ArrayList<>();
    //用户图集
    private List<AlbumDO> albumObjectList;
    //作品集
    private List<VideoDO> works;
    //点赞视频集
    private List<VideoDO> praises;
    //查看别人资料时，当前登陆用户是否拉黑当前查看用户
    private Integer blackFlag;
    //    相距的距离
    private Double distance;
    //    微信code
    private String code;
    //    地址
    private String address;
    //    logo
    private String logo;
    //给安卓用的sessionId
    private String sessionId;
    //个性签名
    private String userSign;
    //生日
    private Date birthday;
    //星座
    private String constellation;
    //关注0 未关注 1 互相关注
    private int care;
}
