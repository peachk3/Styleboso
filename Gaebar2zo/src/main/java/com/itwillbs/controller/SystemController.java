package com.itwillbs.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;





@RequestMapping(value="/system/*")
@Controller
public class SystemController {

	//http://localhost:8088/Styleboso/system/login
	private static final Logger logger = LoggerFactory.getLogger(SystemController.class);

	
	

	//http://localhost:8088/system/main
	// 대시보드 ( 메인 페이지 )
	@RequestMapping(value="/main",method=RequestMethod.GET)
	public void main_GET() throws Exception{
		logger.debug(" main_GET() 실행 ");


	}

	//http://localhost:8088/system/employeeList
	// 사용자 관리
	@RequestMapping(value="/employeeList",method=RequestMethod.GET)
	public void employeeList_GET() throws Exception{
		logger.debug(" employeeList_GET() 실행 ");


	}

	// 공통 코드 관리
	@RequestMapping(value="/code/common",method=RequestMethod.GET)
	public void code_common_GET() throws Exception{
		logger.debug(" code_common_GET() 실행 ");



	}


	// 품목 분류 코드 관리
	@RequestMapping(value="/code/item",method=RequestMethod.GET)
	public void code_item_GET() throws Exception{
		logger.debug(" code_item_GET() 실행 ");


	}








}