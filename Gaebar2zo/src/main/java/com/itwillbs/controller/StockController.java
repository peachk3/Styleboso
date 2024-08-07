 package com.itwillbs.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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
import com.itwillbs.domain.StatusUpdateRequest;
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
	public void adjustment_return_GET(Criteria cri, Model model) throws Exception{
		logger.debug(" adjustment_return_GET() 실행");
		
		// 반품 리스트 호출
		List<TransactionVO> re = sService.reList(cri);
		logger.debug("size : "+ re.size());
		
		// 하단 페이징처리 정보객체 생성
		PageVO pageVO = new PageVO();
		pageVO.setCri(cri);
		pageVO.setTotalCount(sService.getReturnTotalCount());
		logger.debug(" cri " + pageVO.getCri());
		
		// 연결된 뷰페이지로 정보 전달
		model.addAttribute("re", re);
		model.addAttribute("pageVO", pageVO);
		
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
	
	//http://localhost:8088/stock/adjustment/returnAdd
	// 반품 등록 - GET
	@RequestMapping(value = "/adjustment/returnAdd", method = RequestMethod.GET)
	public void returnAdd_GET() throws Exception {
		logger.debug(" returnAdd_GET() 실행 ");
	}
	
	// 반품 등록 - POST
	@RequestMapping(value = "/adjustment/returnAdd",method = RequestMethod.POST)
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
	
	// 반품 삭제
		@ResponseBody
		@RequestMapping(value = "/deleteRE", method = RequestMethod.POST)
		public ResponseEntity<Map<String, Object>> deleteReturnList_POST(@RequestBody Map<String, Object> payload) throws Exception {
			logger.debug(" deleteRE_POST() 실행 ");
			
			@SuppressWarnings("unchecked")
	        List<String> trannums = (List<String>) payload.get("tran_nums");
			
		    @SuppressWarnings("unchecked")
		    List<String> top_tran_nums = (List<String>) payload.get("top_tran_nums");
		    
		    logger.debug("trannums : " + trannums);
		    logger.debug("top_tran_nums : " + top_tran_nums);
		    
		    
	        if (trannums == null || trannums.isEmpty()) {
	            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
	                                 .body(Map.of("status", "error", "message", "No clients selected"));
	        }
	        logger.debug("@@@@tran_nums  " + trannums);

	        try {
	            sService.deleteReturnList(trannums, top_tran_nums);
	            return ResponseEntity.ok(Map.of("status", "success"));
	        } catch (Exception e) {
	            logger.error(" @@@@@@@@Error deleting clients", e);
	            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Map.of("status", "error", "message", e.getMessage()));
	        }
			
		}

	// 입고 관리
	@RequestMapping(value="/receivingList",method=RequestMethod.GET)
	public void receivingList_GET(Criteria cri,Model model) throws Exception{
		logger.debug(" receivingList_GET() 실행 ");

		
		// 입고 리스트 호출
	    List<TransactionVO> rc = sService.rcList(cri);
	    
	    // 하단 페이징처리 정보객체 생성
	    PageVO pageVO = new PageVO();
	    pageVO.setCri(cri);
	    pageVO.setTotalCount(sService.getTotalReceivingCount());
	    logger.debug(" cri " + pageVO.getCri());
	    

	    model.addAttribute("rc", rc);
	    model.addAttribute("pageVO", pageVO);
		logger.debug("size : "+ rc.size());
		
	    
	}

	
	// 입고 모달 정보
	@ResponseBody
	@RequestMapping(value = "/getTransactionDetails", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public Map<String, Object> getTransactionDetails(@RequestParam("tran_num") String tran_num, 
	                                                 @RequestParam("top_tran_num") String top_tran_num) throws Exception {
	    Map<String, Object> result = new HashMap<>();
	    
	    // 기본 거래 정보 가져오기
	    Map<String, Object> details = sService.getTransactionDetails(tran_num);
	    
	    // 품목 정보 가져오기
	    List<Map<String, Object>> items = sService.getTransactionItems(top_tran_num);
	    
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
	
	
	
	
	
	
	
	
	
	
	
	// 입고 삭제
	@ResponseBody
	@RequestMapping(value = "/deleteRC", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> deleteReceivingList_POST(@RequestBody Map<String, Object> payload) throws Exception {
		logger.debug(" deleteRC_POST() 실행 ");
		
		@SuppressWarnings("unchecked")
        List<String> tran_nums = (List<String>) payload.get("tran_nums");

	    @SuppressWarnings("unchecked")
	    List<String> top_tran_nums = (List<String>) payload.get("top_tran_nums");
	    
		
	    if (tran_nums == null || tran_nums.isEmpty() || tran_nums == null || top_tran_nums.isEmpty()) {
	        return ResponseEntity.status(HttpStatus.BAD_REQUEST)
	                             .body(Map.of("status", "error", "message", "No items selected or missing data"));
	    }
	    
	    logger.debug("@@@@tran_nums  " + tran_nums);
	    logger.debug("@@@@top_tran_nums  " + top_tran_nums);
	    
	    
	    
	    try {
	        sService.deleteRecevingList(tran_nums,top_tran_nums);
	        return ResponseEntity.ok(Map.of("status", "success"));
	    } catch (Exception e) {
	        logger.error("Error processing delete and update", e);
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
	                             .body(Map.of("status", "error", "message", e.getMessage(), "details", e.toString()));
	    }
		
	}
//	
	
	
	
	
	
	
	// 입고 등록 - get
	@RequestMapping(value="/receivingAdd",method=RequestMethod.GET)
	public void receivingAdd_GET(Model model) throws Exception{
		logger.debug(" receivingAdd_GET() 실행 ");
		
		List<TransactionVO> po = sService.receivingPurchaseOrderList();
		logger.debug("size : "+ po.size());
		logger.debug("po : "+ po);
	    model.addAttribute("po", po);
	    
	    List<TransactionVO> ex = sService.receivingExchangeList();
		logger.debug("size : "+ ex.size());
		logger.debug("ex : "+ ex);
	    model.addAttribute("ex", ex);
	    
	    List<TransactionVO> re = sService.receivingReturnList();
		logger.debug("size : "+ re.size());
		logger.debug("re : "+ re);
	    model.addAttribute("re", re);
	}

	
	// 입고 등록 - post
	@RequestMapping(value="/receivingAdd",method = RequestMethod.POST)
	@ResponseBody
	public void receivingAdd_POST(@RequestBody Map<String, String> requestData) throws Exception{
	    
	    ObjectMapper mapper = new ObjectMapper();
	    
	    TransactionVO tvo = mapper.readValue(requestData.get("tvo"), TransactionVO.class);
	    List<InventoryChangeVO> icvoList = mapper.readValue(requestData.get("icvo"), 
	                                new TypeReference<List<InventoryChangeVO>>(){});
	    
	    tvo.setInchangeList(icvoList);
	    logger.debug("tvo : " + tvo);
	    logger.debug("icvoList : " + icvoList);
	    
	    sService.stockReceivingAdd(tvo);
	}
	
	// 재고 데이터 호출
	@ResponseBody
    @RequestMapping(value="/invenList", method=RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public List<InventoryVO> getInventoryList(@RequestParam String goods_num) throws Exception{
    
		logger.debug("Received goods_num: " + goods_num);
	
		List<InventoryVO> result = sService.getInventoryList(goods_num);
		
		logger.debug("result : "+ result);
		
		return result;
	}
		
	
	
	
	
	
	// 출고 관리
	@RequestMapping(value="/releaseList",method=RequestMethod.GET)
	public void releaseList_GET(Criteria cri ,Model model) throws Exception{
		logger.debug(" releaseList_GET() 실행 ");

		
		// 출고 리스트 호출
	    List<TransactionVO> rs = sService.rsList(cri);
	    
	    
	    // 하단 페이징처리 정보객체 생성
	    PageVO pageVO = new PageVO();
	    pageVO.setCri(cri);
	    pageVO.setTotalCount(sService.getTotalReleaseCount());
	    logger.debug(" cri " + pageVO.getCri());
	    

		logger.debug("size : "+ rs.size());
	    model.addAttribute("rs", rs);
	    model.addAttribute("pageVO", pageVO);
		
	}

	// 출고 모달 정보
	@RequestMapping(value = "/getTransactionDetails2", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public Map<String, Object> getTransactionDetails2(@RequestParam("tran_num") String tran_num,
														@RequestParam("top_tran_num") String top_tran_num) throws Exception{
		Map<String, Object> result = new HashMap<>();

		Map<String, Object> details = sService.getTransactionDetails2(tran_num);
	    
		// 품목 정보 가져오기 
		List<Map<String, Object>> items = sService.getTransactionItems2(top_tran_num);
		
		// LocalDateTime을 String으로 변환
	    LocalDateTime tranDate = (LocalDateTime) details.get("tran_date");
	    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss");
	    String tranDateString = tranDate.format(formatter);
	    // 변환된 String을 다시 맵에 추가
	    result.putAll(details);
	    result.put("tran_date", tranDateString);
	    result.put("items", items);
	    
	    logger.debug("details : " + details);
	    logger.debug("items : " + items);
	    logger.debug("result : " + result);
	    
	    logger.debug("tran_num: " + tran_num);
	    
	    return result;
	    
	}

	    
	
	// 출고 등록
	@RequestMapping(value="/releaseAdd",method=RequestMethod.GET)
	public void releaseAdd_GET(Model model) throws Exception{
		logger.debug(" releaseAdd_GET() 실행 ");
		
		List<TransactionVO> so = sService.releaseSalesOrderList();
		logger.debug("size : "+ so.size());
		logger.debug("so : "+ so);
	    model.addAttribute("so", so);
	    
	    List<TransactionVO> ex = sService.releaseExchangeList();
		logger.debug("size : "+ ex.size());
		logger.debug("ex : "+ ex);
	    model.addAttribute("ex", ex);


	}

	// 출고 등록 - post
		@RequestMapping(value="/releaseAdd",method = RequestMethod.POST)
		@ResponseBody
		public void releaseAdd_POST(@RequestBody Map<String, String> requestData) throws Exception{
		    
		    ObjectMapper mapper = new ObjectMapper();
		    
		    TransactionVO tvo = mapper.readValue(requestData.get("tvo"), TransactionVO.class);
		    List<InventoryChangeVO> icvoList = mapper.readValue(requestData.get("icvo"), 
		                                new TypeReference<List<InventoryChangeVO>>(){});
		    
		    tvo.setInchangeList(icvoList);
		    logger.debug("tvo : " + tvo);
		    logger.debug("icvoList : " + icvoList);
		    
		    sService.stockReleaseAdd(tvo);
		}
	
	// 출고 삭제 
		@ResponseBody
		@RequestMapping(value = "/deleteRL", method = RequestMethod.POST)
		public ResponseEntity<Map<String, Object>> deleteReleaseList_POST(@RequestBody Map<String, Object> payload) throws Exception {
			logger.debug(" deleteRL_POST() 실행 ");
			
			@SuppressWarnings("unchecked")
	        List<String> tran_nums = (List<String>) payload.get("tran_nums");

		    @SuppressWarnings("unchecked")
		    List<String> top_tran_nums = (List<String>) payload.get("top_tran_nums");

		    if (tran_nums == null || tran_nums.isEmpty() || tran_nums == null || top_tran_nums.isEmpty()) {
		        return ResponseEntity.status(HttpStatus.BAD_REQUEST)
		                             .body(Map.of("status", "error", "message", "No items selected or missing data"));
		    }
		    
		    logger.debug("@@@@tran_nums  " + tran_nums);
		    logger.debug("@@@@top_tran_nums  " + top_tran_nums);
		    
		    
		    
		    try {
		        sService.deleteReleaseList(tran_nums,top_tran_nums);
		        return ResponseEntity.ok(Map.of("status", "success"));
		    } catch (Exception e) {
		        logger.error("Error processing delete and update", e);
		        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
		                             .body(Map.of("status", "error", "message", e.getMessage(), "details", e.toString()));
		    }
			
		}
	
	// 입고/출고 수정
	  @RequestMapping(value="/updateDetails",method=RequestMethod.POST)
	    @ResponseBody
	    public ResponseEntity<Integer> updateDetails(@RequestBody TransactionVO changetrvo) throws Exception {
			logger.debug(" updateDetails() 실행 ");
			logger.debug("Received tran_num: " + changetrvo.getTran_num());

			int result = sService.updateDetails(changetrvo);
			
			return new ResponseEntity<Integer>(result, HttpStatus.OK);
	  
	  }

		

	  

		// 입고 상태 업데이트 
		@RequestMapping(value="/updateRecevingStatus",method=RequestMethod.POST)
		@ResponseBody
	    public ResponseEntity<String> updateRecevingStatus(@RequestBody StatusUpdateRequest request) {
		        try {
		            sService.updateRecevingStatus(request.getTran_nums(), request.getPro_status(),request.getTop_tran_nums());
		            return ResponseEntity.ok("Status updated successfully");
		        } catch (Exception e) {
		            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error updating status");
		        }
		    }

		// 출고 상태 업데이트 
		@RequestMapping(value="/updateReleaseStatus",method=RequestMethod.POST)
		@ResponseBody
	    public ResponseEntity<String> updateReleaseStatus(@RequestBody StatusUpdateRequest request) {
		        try {
		            sService.updateReleaseStatus(request.getTran_nums(), request.getPro_status(),request.getTop_tran_nums());
		            return ResponseEntity.ok("Status updated successfully");
		        } catch (Exception e) {
		            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error updating status");
		        }
		    }

		// 반품 상태 업데이트 
		@RequestMapping(value="/updateReturnStatus",method=RequestMethod.POST)
		@ResponseBody
		public ResponseEntity<String> updateReturnStatus(@RequestBody StatusUpdateRequest request) {
			try {
				sService.updateReturnStatus(request.getTran_nums(), request.getPro_status(),request.getTop_tran_nums());
				logger.debug("tran_num : "+request.getTran_nums());
				logger.debug("top_tran_num : "+request.getTop_tran_nums());
				
				
				return ResponseEntity.ok("Status updated successfully");
			} catch (Exception e) {
				return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error updating status");
			}
		}

	  
	  
	  
	  
	  


}