package com.itwillbs.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.InventoryChangeVO;
import com.itwillbs.domain.InventoryVO;
import com.itwillbs.domain.PageVO;
import com.itwillbs.domain.TransactionVO;
import com.itwillbs.service.StockService;

@RequestMapping(value="/stock/*")
@Controller
public class StockController {

	@Inject
	private StockService sService;
	
	
	private static final Logger logger = LoggerFactory.getLogger(StockController.class);

	// 재고 현황
	//http://localhost:8088/stock/status
	@RequestMapping(value="/status",method=RequestMethod.GET)
	public String status_GET(Criteria cri,Model model,
							 @RequestParam(value="searchType", required = false) String searchType,
							 @RequestParam(value="keyword", required = false) String keyword 
							) throws Exception{
		logger.debug(" status_GET() 실행 ");
		logger.debug(" cri " + cri);
		
		// 검색 기능
		if(searchType != null && keyword != null && !keyword.trim().isEmpty()) {
			cri.setSearchType(searchType);
			cri.setKeyword(keyword);
		}
		
		List<InventoryVO> sl = sService.getStockList(cri);
		logger.debug(" size : " + sl.size());
		logger.debug(" sl : " + sl);
		
		// 하단 페이징처리 정보객체 생성
		PageVO pageVO = new PageVO();
		pageVO.setCri(cri);
		pageVO.setTotalCount(sService.getTotalCount());
		logger.debug(" cri " + pageVO.getCri());
		
		// 연결된 뷰페이지로 정보 전달
		model.addAttribute("sl", sl);
		model.addAttribute("pageVO", pageVO);
		model.addAttribute("searchType", searchType);
		model.addAttribute("keyword", keyword);
		
		return "/stock/status";

	}



	// 재고 조정 ( adjustment )

	// 재고 교환
	@RequestMapping(value="/adjustment/exchange",method=RequestMethod.GET)
	public void adjustment_exchange_GET(Model model) throws Exception{
		logger.debug(" adjustment_exchange_GET() 실행");
		
		// 교환 리스트 호출
		List<TransactionVO> ex = sService.exList();
		logger.debug("size : "+ ex.size());
		model.addAttribute("ex", ex);
	}
	
	// 교환 등록
	@RequestMapping(value="/adjustment/exchangeAdd",method=RequestMethod.GET)
	public void exchangeAdd_GET() throws Exception{
		logger.debug(" exchangeAdd_GET() 실행 ");
	}

	
	// 재고 반품
	@RequestMapping(value="/adjustment/return",method=RequestMethod.GET)
	public void adjustment_return_GET(Model model) throws Exception{
		logger.debug(" adjustment_return_GET() 실행");
		
		// 반품 리스트 호출
		List<TransactionVO> re = sService.reList();
		logger.debug("size : "+ re.size());
		model.addAttribute("re", re);
	}
	
	// 반품 모달 정보
	@ResponseBody
	@RequestMapping(value = "/getReturnDetails",method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public Map<String, Object> getReturnDetails(@RequestParam("tran_num") String tran_num,
												@RequestParam("top_tran_num") String top_tran_num) throws Exception {
		Map<String, Object> result = new HashMap<>();
		
		// 기본 거래 정보 가져오기
		Map<String, Object> details = sService.getReturnDetails(tran_num);
		
		// 품목 정보 가져오기
		List<Map<String, Object>> items = sService.getReturnItems(top_tran_num);

		// LocalDateTime을 String으로 변환
		LocalDateTime tranDate = (LocalDateTime) details.get("tran_date");
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss");
		String tranDateString = tranDate.format(formatter);

		// 결과 맵에 모든 정보 추가
		result.putAll(details);
		result.put("tran_date", tranDateString);
		result.put("items", items);

		logger.debug("details : " + details);
		logger.debug("items : " + items);
		logger.debug("result : " + result);

		logger.debug("tran_num: " + tran_num);
		logger.debug("top_tran_num: " + top_tran_num);

		return result;
	}

	// 반품 등록 - GET
	@RequestMapping(value = "/adjustment/returnAdd", method = RequestMethod.GET)
	public void returnAdd_GET() throws Exception {
		logger.debug(" returnAdd_GET() 실행 ");
	}
	
	// 반품 등록 - POST
	@RequestMapping(value = "/returnAdd",method = RequestMethod.POST)
	@ResponseBody
	public void returnAdd_POST(@RequestBody Map<String, String> requestData) throws Exception {
		ObjectMapper mapper = new ObjectMapper();
		
		TransactionVO tvo = mapper.readValue(requestData.get("tvo"), TransactionVO.class);
		List<InventoryChangeVO> icvoList = mapper.readValue(requestData.get("icvo"), new TypeReference<List<InventoryChangeVO>>() {
		});
		tvo.setInchangeList(icvoList);
		logger.debug(" tvo : " + tvo);
		logger.debug(" icvoList : " + icvoList);
		
		sService.adjustReturnAdd(tvo);
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

	@RequestMapping(value = "/getTransactionDetails", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public Map<String, Object> getTransactionDetails(@RequestParam("tran_num") String tran_num) {
	    Map<String, Object> details = sService.getTransactionDetails(tran_num);

	    // LocalDateTime을 String으로 변환
	    LocalDateTime recDate = (LocalDateTime) details.get("rec_date");
	    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
	    String recDateString = recDate.format(formatter);

	    // 변환된 String을 다시 맵에 추가
	    details.put("rec_date", recDateString);

	    return details;
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