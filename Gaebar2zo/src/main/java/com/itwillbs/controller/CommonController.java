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
import com.itwillbs.domain.GoodsVO;
import com.itwillbs.domain.TransactionVO;
import com.itwillbs.domain.UsersVO;
import com.itwillbs.service.CommonService;

@RequestMapping(value="/common/*")
@Controller
public class CommonController {

	private static final Logger logger = LoggerFactory.getLogger(CommonController.class);

	// 서비스 객체 주입
	@Inject
	private CommonService cService;

	// 거래번호 조회
	@ResponseBody
	@RequestMapping(value="/transactionList",method=RequestMethod.GET,
			produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public List<TransactionVO> transactionList_GET(Model model) throws Exception{
		logger.debug(" transactionList_GET() 실행 ");
		
		List<TransactionVO> tranList = cService.TransactionList();
		logger.debug("size : "+ tranList.size());
		logger.debug("traList : "+ tranList);
		
		return tranList;

	}
	
	
	
	
	// 거래처 리스트 조회
	@ResponseBody
	@RequestMapping(value="/clientList",method=RequestMethod.GET,
			produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public List<ClientVO> clientList_GET(Model model) throws Exception{
		logger.debug(" clientList_GET() 실행 ");
		
		List<ClientVO> cList = cService.ClientList();
		logger.debug("size : "+ cList.size());
		logger.debug("cList : "+ cList);
		
		return cList;

	}

	// 담당자 리스트 조회
	@ResponseBody
	@RequestMapping(value="/managerList",method=RequestMethod.GET,
	produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public List<UsersVO> managerList_GET(Model model) throws Exception{
		logger.debug(" managerList_GET() 실행 ");
		
		List<UsersVO> mList = cService.ManagerList();
		logger.debug("size : "+ mList.size());
		logger.debug("mList : "+ mList);
		
		return mList;
		
	}
	
	// 제품 리스트 조회
	@ResponseBody
	@RequestMapping(value="/goodsList",method=RequestMethod.GET,
	produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public List<GoodsVO> goodsList_GET(Model model) throws Exception{
		logger.debug(" goodsList_GET() 실행 ");
		
		List<GoodsVO> gList = cService.GoodsList();
		logger.debug("size : "+ gList.size());
		logger.debug("gList : "+ gList);
		
		return gList;
		
	}













}