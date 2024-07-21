package com.itwillbs.controller;

import java.util.ArrayList;



import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.domain.InventoryVO;
import com.itwillbs.domain.TransactionVO;
import com.itwillbs.service.StockService;

@RequestMapping(value="/stock/*")
@Controller
public class StockController {

	@Inject
	private StockService sService;
	
	
	private static final Logger logger = LoggerFactory.getLogger(StockController.class);

	// 재고 현황
	@RequestMapping(value="/status",method=RequestMethod.GET)
	public void status_GET(Model model) throws Exception{
		logger.debug(" status_GET() 실행 ");
		
		List<InventoryVO> sl = sService.getStockList();
		model.addAttribute("sl", sl);

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
	public void receivingList_GET(Model model) throws Exception{
		logger.debug(" receivingList_GET() 실행 ");

		
		// 입고 리스트 호출
	    List<TransactionVO> rc = sService.rcList();
		logger.debug("size : "+ rc.size());
	    model.addAttribute("rc", rc);
	    		
		
	    
	}

//	@ResponseBody
//	 @RequestMapping(value="/updateStatus",method=RequestMethod.POST,
//			 		produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
//	    public ResponseEntity<?> updateStatus(@RequestBody StatusUpdateRequest request) {
//	        try {
//	            sService.updateStatus(request.getTran_nums(), request.getStatus());
//	            return ResponseEntity.ok().build();
//	        } catch (Exception e) {
//	            e.printStackTrace(); // 예외 로그 출력
//	            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Status update failed");
//	        }
//	    }
//	   
//	
	
	
	
	
	
	
	// 입고 등록
	@RequestMapping(value="/receivingAdd",method=RequestMethod.GET)
	public void receivingAdd_GET() throws Exception{
		logger.debug(" receivingAdd_GET() 실행 ");


	}

	
	
	
	// 출고 관리
	@RequestMapping(value="/releaseList",method=RequestMethod.GET)
	public void releaseList_GET(Model model) throws Exception{
		logger.debug(" releaseList_GET() 실행 ");

		
		// 출고 리스트 호출
	    List<TransactionVO> rs = sService.rsList();
		logger.debug("size : "+ rs.size());
	    model.addAttribute("rs", rs);
		

	}

	// 출고 등록
	@RequestMapping(value="/releaseAdd",method=RequestMethod.GET)
	public void releaseAdd_GET() throws Exception{
		logger.debug(" releaseAdd_GET() 실행 ");


	}







}