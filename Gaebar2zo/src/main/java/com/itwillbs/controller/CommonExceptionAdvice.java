package com.itwillbs.controller;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 *	예외 처리(보조기능)를 수행하는 객체 
 *
 */


@ControllerAdvice
public class CommonExceptionAdvice {

	private static final Logger logger = LoggerFactory.getLogger(CommonExceptionAdvice.class);

	@ExceptionHandler(Exception.class)
	public String testException(Model model,Exception e) {
		logger.debug(" Exception(예외) 발생!!!");
		logger.debug(" testException() 실행 ");

		model.addAttribute("e", e);

		return "/commonException";
	}

	public ModelAndView testException2(Exception e) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/commonException");
		mav.addObject("e",e);

		return mav;
	}

	@ResponseBody
	@ExceptionHandler(RuntimeException.class)
	public ResponseEntity<String> handleRuntimeException(RuntimeException ex) {
		// 문자열로 오류 메시지를 반환합니다.
		String errorMessage = ex.getMessage();
		
		// 응답 헤더에 UTF-8 인코딩을 설정합니다.
		HttpHeaders headers = new HttpHeaders();
		headers.add(HttpHeaders.CONTENT_TYPE, "application/json; charset=UTF-8");
		
		// 문자열 메시지와 함께 BAD_REQUEST 상태를 반환합니다.
		return new ResponseEntity<>(errorMessage, headers, HttpStatus.BAD_REQUEST);
    }








}