package com.itwillbs.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping(value="/Styleboso/stock/*")
@Controller
public class StockController {


	private static final Logger logger = LoggerFactory.getLogger(StockController.class);

	// 재고 현황
	@RequestMapping(value="/status",method=RequestMethod.GET)
	public void status_GET() throws Exception{
		logger.debug(" status_GET() 실행 ");

	}



	// 재고 조정 ( adjustment )

	// 재고 교환
	@RequestMapping(value="/adjustment/exchange",method=RequestMethod.GET)
	public void adjustment_exchange_GET() throws Exception{
		logger.debug(" adjustment_exchange_GET() 실행");
	}

	// 재고 반품
	@RequestMapping(value="/adjustment/return",method=RequestMethod.GET)
	public void adjustment_return_GET() throws Exception{
		logger.debug(" adjustment_return_GET() 실행");
	}


	// 입고 관리
	@RequestMapping(value="/receivingList",method=RequestMethod.GET)
	public void receivingList_GET() throws Exception{
		logger.debug(" receivingList_GET() 실행 ");


	}

	// 입고 등록
	@RequestMapping(value="/receivingAdd",method=RequestMethod.GET)
	public void receivingAdd_GET() throws Exception{
		logger.debug(" receivingAdd_GET() 실행 ");


	}

	// 출고 관리
	@RequestMapping(value="/releaseList",method=RequestMethod.GET)
	public void releaseList_GET() throws Exception{
		logger.debug(" releaseList_GET() 실행 ");


	}

	// 출고 등록
	@RequestMapping(value="/releaseAdd",method=RequestMethod.GET)
	public void releaseAdd_GET() throws Exception{
		logger.debug(" releaseAdd_GET() 실행 ");


	}







}