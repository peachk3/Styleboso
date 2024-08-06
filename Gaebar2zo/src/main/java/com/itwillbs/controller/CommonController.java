package com.itwillbs.controller;

import java.text.SimpleDateFormat;
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

import com.itwillbs.domain.ClientVO;
import com.itwillbs.domain.GoodsVO;
import com.itwillbs.domain.StatusUpdateRequest;
import com.itwillbs.domain.TransactionGoodsVO;
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

	   // 거래 리스트 조회
    @ResponseBody
    @RequestMapping(value="/transactionList", method=RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public List<TransactionVO> transactionList_GET(Model model) throws Exception {
        logger.debug(" transactionList_GET() 실행 ");
        
        List<TransactionVO> tranList = cService.TransactionList();
        logger.debug("size : "+ tranList.size());
        logger.debug("tranList : "+ tranList);
        
        return tranList;
    }

    // 거래 상세 정보 조회
    @RequestMapping(value="/transactionDetails", method=RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public ResponseEntity<Map<String, Object>> getTransactionDetails(@RequestParam("tran_num") String tran_num) throws Exception {
        Map<String, Object> response = new HashMap<>();
        TransactionVO tranDetails = cService.getTransactionDetails(tran_num);
        List<TransactionGoodsVO> tranGoods = cService.getTransactionGoods(tran_num);
        // rec_date 포맷팅
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String formattedDate = sdf.format(tranDetails.getTran_date());
        
        
        response.put("tranDetails", tranDetails);
        response.put("tranGoods", tranGoods);
        response.put("formattedTranDate", formattedDate);  // 포맷팅된 날짜 추가

        logger.debug("tranDetails : "+tranDetails);
        logger.debug("tranGoods : "+tranGoods);
        logger.debug("response : "+response);
        
        
        return ResponseEntity.ok(response);
    }

	// 거래처 리스트 조회
	@ResponseBody
	@RequestMapping(value="/clientList",method=RequestMethod.GET,
			produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public List<ClientVO> clientList_GET() throws Exception{
		logger.debug(" clientList_GET() 실행 ");
		
		List<ClientVO> cList = cService.ClientList();
		logger.debug("size : "+ cList.size());
		logger.debug("cList : "+ cList);
		
		return cList;
	}
	
	@ResponseBody
	@RequestMapping(value="/clientList2",method=RequestMethod.GET)      
	public List<ClientVO> clientList_GET(ClientVO vo) throws Exception{
		logger.debug(" clientList_GET(ClientVO cvo) 실행 ");
		
		List<ClientVO> cList = cService.ClientList(vo);
		logger.debug("size : "+ cList.size());
		logger.debug("cList : "+ cList);
		
		return cList;
	}

	// 담당자 리스트 조회
	@ResponseBody
	@RequestMapping(value="/managerList",method=RequestMethod.GET,
	produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public List<UsersVO> managerList_GET() throws Exception{
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
	public List<GoodsVO> goodsList_GET() throws Exception{
		logger.debug(" goodsList_GET() 실행 ");
		
		List<GoodsVO> gList = cService.GoodsList();
		logger.debug("size : "+ gList.size());
		logger.debug("gList : "+ gList);
		
		return gList;
	}

	// 상태 업데이트 
	@RequestMapping(value="/updateStatus",method=RequestMethod.POST)
	@ResponseBody
    public ResponseEntity<String> updateStatus(@RequestBody StatusUpdateRequest request) {
        try {
            cService.updateStatus(request.getTran_nums(), request.getPro_status());
            return ResponseEntity.ok("Status updated successfully");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error updating status");
        }
    }

	// 거래 리스트 삭제
	@ResponseBody
	@RequestMapping(value = "/deleteTran", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> deleteReceivingList_POST(@RequestBody Map<String, Object> tran_nums) throws Exception {
		logger.debug("deleteTran_POST() 실행 ");
		
		System.out.println(tran_nums);
		
		@SuppressWarnings("unchecked")
        List<String> tran_num = (List<String>) tran_nums.get("tran_num");
		System.out.println(tran_num);

        if (tran_num == null || tran_num.isEmpty()) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(Map.of("status", "error", "message", "No clients selected"));
        }
        logger.debug("@@@@cli_num " + tran_num);

        try {
        	cService.deleteTran(tran_num);
            return ResponseEntity.ok(Map.of("status", "success"));
        } catch (RuntimeException e) {
        	throw e;
        }
		
	}









}