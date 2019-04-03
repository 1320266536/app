package com.bootdo.common.utils;

import org.springframework.http.HttpStatus;

public class RestResultGenerator {

	public static ResponseResult<Integer> genResult(HttpStatus status){

		ResponseResult<Integer> result = new ResponseResult<>();
		result.setData(0);
		result.setMsg("无消息");
		result.setMessage(status);
		result.setCode(status.value());
		return result;
	}
	public static <T> ResponseResult<T> genResult(HttpStatus status, T data,String message){
		ResponseResult<T> result = new ResponseResult<>();
		result.setData(data);
		result.setMsg(message);
		result.setMessage(status);
		result.setCode(status.value());
		return result;
	}
	public static <T> ResponseResult<T> genResult(HttpStatus status, T data){
		ResponseResult<T> result = new ResponseResult<>();
		result.setData(data);
		result.setMsg("无消息");
		result.setMessage(status);
		result.setCode(status.value());
		return result;
	}
	public static  ResponseResult<Integer> genResult(HttpStatus status, String message){
		ResponseResult<Integer> result = new ResponseResult<>();
		result.setCode(status.value());
		result.setMsg(message);
		result.setData(0);
		result.setMessage(status);
		return result;
	}


}