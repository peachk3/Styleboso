package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.domain.ClientVO;
import com.itwillbs.domain.ItemVO;
import com.itwillbs.domain.WarehouseCodeVO;
import com.itwillbs.service.BasicInfoService;


@RequestMapping(value="/basicInfo/*")
@Controller
public class BasicInfoController {

	private static final Logger logger = LoggerFactory.getLogger(BasicInfoController.class);
	
	
	@Inject
	private BasicInfoService bService;
	
	//http://localhost:8088/basicInfo/itemList
	// 품목 관리
	@RequestMapping(value="/itemList",method=RequestMethod.GET)
	public void itemList_GET(Model model) throws Exception{
		logger.debug(" itemList_GET() 실행 ");

		List<ItemVO> itemList = bService.itemListAll();
		
		model.addAttribute("itemList", itemList);
	}

	// 품목 추가
	@RequestMapping(value="/itemAdd",method=RequestMethod.GET)
	public void itemAdd_GET() throws Exception{
		logger.debug(" itemAdd_GET() 실행 ");

	}

	//http://localhost:8088/Styleboso/basicInfo/clientList
	// 거래처 관리
	@RequestMapping(value="/clientList",method=RequestMethod.GET)
	public void clientList_GET(Model model) throws Exception{
		logger.debug(" clientList_GET() 실행 ");
		
		List<ClientVO> clientList = bService.cliListAll();
		
		model.addAttribute("clientList", clientList);	

	}

	// 거래처 추가
	@RequestMapping(value="/clientAdd",method=RequestMethod.GET)
	public void clientAdd_GET() throws Exception{
		logger.debug(" clientAdd_GET() 실행 ");

	}
	
	// 사업자 번호 중복 확인
	@RequestMapping(value="/check-crn", method = RequestMethod.GET)
	@ResponseBody
	public int clientCrnCheck(@RequestParam String cli_crn) throws Exception {
		logger.debug(" clientCrnCheck() 실행 ");
		
		boolean isDuplicate = bService.isCliCrnDuplicate(cli_crn);
	
		logger.debug(" 결과 : " + isDuplicate);
		
		return isDuplicate ? 1 : 0;
	}

	// 창고 관리
	//http://localhost:8088/Styleboso/system/login
	// user1 pw1
	//http://localhost:8088/Styleboso/basicInfo/warehouseList
	@RequestMapping(value="/warehouseList",method=RequestMethod.GET)
	public void warehouseList_GET(Model model) throws Exception{
		logger.debug(" warehouseList_GET() 실행 ");
		
		List<WarehouseCodeVO> whCodeList = bService.listAll();
		
		model.addAttribute("whCodeList",whCodeList);
		
	}

	// 창고 추가
	@RequestMapping(value="/warehouseAdd",method=RequestMethod.GET)
	public void warehouseAdd_GET() throws Exception{
		logger.debug(" warehouseAdd_GET() 실행 ");

	}











}