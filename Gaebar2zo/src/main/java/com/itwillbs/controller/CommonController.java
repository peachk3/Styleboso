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
import com.itwillbs.service.CommonService;

@RequestMapping(value="/Styleboso/common/*")
@Controller
public class CommonController {

	private static final Logger logger = LoggerFactory.getLogger(CommonController.class);

	// 서비스 객체 주입
	@Inject
	private CommonService cService;

	
	// 거래처 리스트 조회
	@ResponseBody
	@RequestMapping(value="/clientList",method=RequestMethod.GET,
			produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public List<ClientVO> clientList_GET(Model model) throws Exception{
		logger.debug(" clientList_GET() 실행 ");
		
		// 서비스 -> DB의 정보를 가져오기
		List<ClientVO> cList = cService.ClientList();
		logger.debug("size : "+ cList.size());
		logger.debug("cList : "+ cList);
		
		return cList;

	}














}