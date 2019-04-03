package com.bootdo.app.domain;

import lombok.Data;

@Data
public class WxUserinfoModel
{
    private String openid;

    private String nickname;

    private String sex;

    private String province;

    private String city;

    private String country;

    private String headimgurl;

    private String privilege;

    private String unionid;

    private String errmsg;

    private String errcode;

}
