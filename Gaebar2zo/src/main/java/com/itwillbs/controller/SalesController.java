package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.domain.ClientVO;
import com.itwillbs.service.SalesService;

@RequestMapping(value="/Styleboso/sales/*")
@Controller
public class SalesController {

	private static final Logger logger = LoggerFactory.getLogger(SalesController.class);

	// 서비스 객체 주입
	@Inject
	private SalesService sService;

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
	
	// 수주 추가
	@RequestMapping(value="/salesOrderAdd",method=RequestMethod.POST)
	public void salesOrderAdd_POST() throws Exception{
		logger.debug(" salesOrderAdd_POST() 실행 ");
		
	}

	// 발주 관리
	@RequestMapping(value="/purchaseOrderList",method=RequestMethod.GET)
	public void puchaseOrderList_GET() throws Exception{
		logger.debug(" puchaseOrderList_GET() 실행 ");

	}

	// 발주 추가
	@RequestMapping(value="/purchaseOrderAdd",method=RequestMethod.GET)
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