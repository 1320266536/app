package com.bootdo.common.utils;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Data;
import org.springframework.http.HttpStatus;

@Data
@JsonInclude(JsonInclude.Include.NON_EMPTY)
public class ResponseResult<T> {

	private int code;
	private HttpStatus message;
	private T data;
	private String msg;

}