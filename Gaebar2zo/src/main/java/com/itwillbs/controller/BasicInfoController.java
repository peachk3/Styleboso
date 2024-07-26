package com.itwillbs.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.domain.ClientVO;
import com.itwillbs.domain.ItemVO;
import com.itwillbs.domain.WarehouseCodeVO;
import com.itwillbs.service.BasicInfoService;
import com.mysql.cj.xdevapi.Client;


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
	// 거래처 관리------------------------------------------------
	@RequestMapping(value="/clientList",method=RequestMethod.GET)
	public void clientList_GET(Model model) throws Exception{
		logger.debug(" clientList_GET() 실행 ");
		
		List<ClientVO> clientList = bService.cliListAll();
		
		model.addAttribute("clientList", clientList);	

	}

	// 거래처 추가 - 등록 페이지로 이동
	@RequestMapping(value="/clientAdd",method=RequestMethod.GET)
	public void clientAdd_GET() throws Exception{
		logger.debug(" clientAdd_GET() 실행 ");
	}
	
	// 거래처 추가 - 거래처 등록
	@ResponseBody
	@RequestMapping(value="/clientInsert", method = RequestMethod.POST)
	public void clientInsert_POST(ClientVO vo) throws Exception {
		logger.debug(" clientInsert_POST() 실행 ");

		bService.cliInsert(vo);
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
	
	// 상세보기 페이지
	@ResponseBody
	@RequestMapping(value = "/clientDetails", method = RequestMethod.GET)
	public ResponseEntity<List<ClientVO>> clientDetailsList(@RequestParam("cli_num") String cli_num, Model model) throws Exception {
		logger.debug(" clientDetailsList() 실행");
		
		List<ClientVO> clientDetailsList = bService.clientDetailsList(cli_num);
		
		model.addAttribute("clientDetailsList", clientDetailsList);
		
		logger.debug("@@ 리스트 : " + clientDetailsList);
		logger.debug(" cli_num : " + cli_num);
		
		return new ResponseEntity<>(clientDetailsList, HttpStatus.OK);
	}
	
	// 거래처 수정
	@ResponseBody
	@RequestMapping(value = "/updateClient", method = RequestMethod.POST)
	public ResponseEntity<String> updateClient(@RequestBody ClientVO cvo) throws Exception {
		logger.debug(" updateClient() 실행 ");
		
		bService.updateClient(cvo);
		
		 try {
		        bService.updateClient(cvo);
		        return new ResponseEntity<>("Client updated successfully", HttpStatus.OK);
		    } catch (Exception e) {
		        logger.error("Error updating client", e);
		        return new ResponseEntity<>("Error updating client", HttpStatus.INTERNAL_SERVER_ERROR);
		    }
		
	}
	
	// 거래처 삭제
	@RequestMapping(value = "/deleteClient", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> deleteClient(@RequestBody Map<String, Object> payload) throws Exception{
		logger.debug(" deleteClient() 실행 ");
	
		@SuppressWarnings("unchecked")
        List<String> cliNums = (List<String>) payload.get("cli_nums");

        if (cliNums == null || cliNums.isEmpty()) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                                 .body(Map.of("status", "error", "message", "No clients selected"));
        }
        logger.debug("@@@@cli_num " + cliNums);

        try {
            bService.deleteClients(cliNums);
            return ResponseEntity.ok(Map.of("status", "success"));
        } catch (Exception e) {
            logger.error(" @@@@@@@@Error deleting clients", e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Map.of("status", "error", "message", e.getMessage()));
        }
	}
	
	// ------------------------------------------------거래처 관리

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