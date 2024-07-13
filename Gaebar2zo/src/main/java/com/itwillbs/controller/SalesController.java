package com.itwillbs.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping(value="/Styleboso/sales/*")
@Controller
public class SalesController {

	private static final Logger logger = LoggerFactory.getLogger(SalesController.class);

		// 수주 관리
		@RequestMapping(value="/salesOrderList",method=RequestMethod.GET)
		public void salesOrderList_GET() throws Exception{
			logger.debug(" salesOrderList_GET() 실행 ");

		}


		// 수주 추가
		@RequestMapping(value="/salesOrderAdd",method=RequestMethod.GET)
		public void salesOrderAdd_GET() throws Exception{
			logger.debug(" salesOrderAdd_GET() 실행 ");

		}

		// 발주 관리
		@RequestMapping(value="/puchaseOrderList",method=RequestMethod.GET)
		public void puchaseOrderList_GET() throws Exception{
			logger.debug(" puchaseOrderList_GET() 실행 ");

		}

		// 발주 추가
		@RequestMapping(value="/puchaseOrderAdd",method=RequestMethod.GET)
		public void puchaseOrder_GET() throws Exception{
			logger.debug(" puchaseOrderAdd_GET() 실행 ");

		}

		// 출하 관리
		@RequestMapping(value="/shipmentList",method=RequestMethod.GET)
		public void shipmentList_GET() throws Exception{
			logger.debug(" shipmentList_GET() 실행 ");

		}

		// 출하 추가
		@RequestMapping(value="/shipmentAdd",method=RequestMethod.GET)
		public void shipmentAdd_GET() throws Exception{
			logger.debug(" shipmentAdd_GET() 실행 ");

		}














}