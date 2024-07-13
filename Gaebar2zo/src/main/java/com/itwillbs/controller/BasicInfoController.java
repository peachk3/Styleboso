package com.itwillbs.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping(value="/Styleboso/basicInfo/*")
@Controller
public class BasicInfoController {

	private static final Logger logger = LoggerFactory.getLogger(BasicInfoController.class);

	
	
	// 품목 관리
	@RequestMapping(value="/itemList",method=RequestMethod.GET)
	public void itemList_GET() throws Exception{
		logger.debug(" itemList_GET() 실행 ");

	}

	// 품목 추가
	@RequestMapping(value="/itemAdd",method=RequestMethod.GET)
	public void itemAdd_GET() throws Exception{
		logger.debug(" itemAdd_GET() 실행 ");

	}

	// 거래처 관리
	@RequestMapping(value="/clientList",method=RequestMethod.GET)
	public void clientList_GET() throws Exception{
		logger.debug(" clientList_GET() 실행 ");

	}

	// 거래처 추가
	@RequestMapping(value="/clientAdd",method=RequestMethod.GET)
	public void clientAdd_GET() throws Exception{
		logger.debug(" clientAdd_GET() 실행 ");

	}


	// 창고 관리
	@RequestMapping(value="/warehouseList",method=RequestMethod.GET)
	public void warehouseList_GET() throws Exception{
		logger.debug(" warehouseList_GET() 실행 ");

	}

	// 창고 추가
	@RequestMapping(value="/warehouseAdd",method=RequestMethod.GET)
	public void warehouseAdd_GET() throws Exception{
		logger.debug(" warehouseAdd_GET() 실행 ");

	}











}