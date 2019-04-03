package com.bootdo.common.utils;

import cn.hutool.http.HttpRequest;
import cn.hutool.http.HttpUtil;
import cn.hutool.json.JSONUtil;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.Map;


@Component
public class HttpClientUtils {

    public  String post(String url, Object body ){
        //创建请求
        HttpRequest request= HttpUtil.createPost(url);
        //设置响应头
        Map<String,String> map=new HashMap<>();
        map.put("Content-Type","application/json");
        request.addHeaders(map);
        //执行方法
        request.timeout(360000000);
        System.out.println( JSONUtil.parse(body));
        request.body(JSONUtil.parse(body));
        return  request.execute().body();
    }


    public  String post(String url ){
        //创建请求
        HttpRequest request= HttpUtil.createPost(url);
        //设置响应头
        Map<String,String> map=new HashMap<>();
        map.put("Content-Type","application/json");
        request.addHeaders(map);
        //执行方法
        request.timeout(360000000);
        return  request.execute().body();
    }
    public  String get(String url,Object body ){
        //创建请求
        HttpRequest request= HttpUtil.createGet(url);
        //设置响应头
        Map<String,String> map=new HashMap<>();
        map.put("Content-Type","application/json");
        request.addHeaders(map);
        //执行方法
        request.timeout(360000000);
        request.body(JSONUtil.parse(body));
        return  request.execute().body();
    }
    public  String get(String url ){
        //创建请求
        HttpRequest request= HttpUtil.createGet(url);
        //设置响应头
        Map<String,String> map=new HashMap<>();
        map.put("Content-Type","application/json");
        request.addHeaders(map);
        //执行方法
        request.timeout(360000000);
        return  request.execute().body();
    }
}
