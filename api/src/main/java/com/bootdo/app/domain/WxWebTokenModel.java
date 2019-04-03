package com.bootdo.app.domain;

import lombok.Data;

@Data
public class WxWebTokenModel
{
    private String access_token;

    private int expires_in;

    private String refresh_token;

    private String openid;

    private String scope;

    private String unionid;

    private String errcode;

    private String errmsg;

    private String session_key;

}
