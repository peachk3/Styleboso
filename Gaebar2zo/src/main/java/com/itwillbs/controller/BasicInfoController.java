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
import com.itwillbs.domain.WarehouseVO;
import com.itwillbs.service.BasicInfoService;
import com.mysql.cj.xdevapi.Client;


@RequestMapping(value="/basicInfo/*")
@Controller
public class BasicInfoController {

	private static final Logger logger = LoggerFactory.getLogger(BasicInfoController.class);
	
	@Inject
	private BasicInfoService bService;
	
	// 품목 관리
	//http://localhost:8088/basicInfo/itemList
	@RequestMapping(value="/itemList",method=RequestMethod.GET)
	public void itemList_GET(Model model) throws Exception{
		logger.debug(" itemList_GET() 실행 ");

		List<ItemVO> itemList = bService.itemListAll();
		
		model.addAttribute("itemList", itemList);
		
		logger.debug("@@@@@@@ itemList : " + itemList);
	}

	// 품목 추가 페이지
	@RequestMapping(value="/itemAdd",method=RequestMethod.GET)
	public void itemAdd_GET() throws Exception{
		logger.debug(" itemAdd_GET() 실행 ");

	}
	
	// 품목 추가 - 등록
	@ResponseBody
	@RequestMapping(value = "/itemInsert", method = RequestMethod.POST)
	public void itemInsert_POST(ItemVO itemvo) throws Exception {
		logger.debug(" itemInsert_POST() 실행 ");
		
		bService.insertItem(itemvo);
		logger.debug("itemvo : " + itemvo);
	}
	
	// 품목 삭제
	@ResponseBody
	@RequestMapping(value = "/deleteItem", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> deleteItem_POST(@RequestBody Map<String, Object> payload) throws Exception {
		logger.debug(" deleteItem_POST() 실행 ");
		
		@SuppressWarnings("unchecked")
        List<String> itemNums = (List<String>) payload.get("item_nums");

        if (itemNums == null || itemNums.isEmpty()) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                                 .body(Map.of("status", "error", "message", "No clients selected"));
        }
        logger.debug("@@@@item_num " + itemNums);

        try {
            bService.deleteItems(itemNums);
            return ResponseEntity.ok(Map.of("status", "success"));
        } catch (Exception e) {
            logger.error(" @@@@@@@@Error deleting clients", e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Map.of("status", "error", "message", e.getMessage()));
        }
		
	}
	
	// 품목 상세보기
	@ResponseBody
	@RequestMapping(value = "/itemDetails", method = RequestMethod.GET)
	public ResponseEntity<List<ItemVO>> itemDetailsList(@RequestParam("item_num") String item_num, Model model) throws Exception {
		logger.debug(" itemDetailsList() 실행 ");
		
		List<ItemVO> itemDetailsList = bService.itemDetailsList(item_num);
		
		model.addAttribute("itemDetailsList",itemDetailsList);
		
		logger.debug(" @@@ 리스트 : " + itemDetailsList);
		logger.debug("@@ item_num : " + item_num);
		
		return new ResponseEntity<>(itemDetailsList, HttpStatus.OK);
	}
	
	// 품목 수정
	@ResponseBody
	@RequestMapping(value = "/updateItem", method = RequestMethod.POST)
	public ResponseEntity<Integer> updateItem(@RequestBody ItemVO ivo) throws Exception {
		logger.debug(" updateItem() 실행 ");
		
		int result = bService.updateItem(ivo);
		
		return new ResponseEntity<Integer>(result, HttpStatus.OK);
	}

	// ----------------------------------거래처 관리------------------------------------------------
	//http://localhost:8088/basicInfo/clientList
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
	
	// ------------------------------------------------거래처 관리------------------------------

	// -------------------------------------------------창고 관리-------------------------------
	//http://localhost:8088/system/login
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

	// 창고 등록
	@ResponseBody
	@RequestMapping(value="/warehouseInsert", method = RequestMethod.POST)
	public void warehouseInsert_POST(WarehouseCodeVO wcvo) throws Exception {
		logger.debug(" warehouseInsert_POST() 실행 ");
		
		//List<WarehouseCodeVO> whCodeList =
		bService.insertWarehouse(wcvo);
		logger.debug("");
	}

	// 창고 삭제
	@RequestMapping(value = "/deleteWarehouse", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> deleteWarehouse(@RequestBody Map<String, Object> payload) throws Exception{
		logger.debug(" deleteClient() 실행 ");
	
		@SuppressWarnings("unchecked")
        List<String> whNums = (List<String>) payload.get("s_cate_wh_codes");
		logger.debug(" whNums : " + whNums);

        if (whNums == null || whNums.isEmpty()) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                                 .body(Map.of("status", "error", "message", "No clients selected"));
        }
        logger.debug("@@@@whNums " + whNums);

        try {
        	bService.deleteWareCode(whNums); // 창고 내부 구역 삭제
            bService.deleteWarehouse(whNums); // 창고 삭제
            return ResponseEntity.ok(Map.of("status", "success"));
        } catch (Exception e) {
            logger.error(" @@@@@@@@Error", e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Map.of("status", "error", "message", e.getMessage()));
        }
	}
	
	// 창고 상세보기
	@ResponseBody
	@RequestMapping(value = "/warehouseDetails", method = RequestMethod.GET)
	public ResponseEntity<List<WarehouseCodeVO>> warehouseDetailsList(@RequestParam("s_cate_wh_code") String s_cate_wh_code, Model model) throws Exception {
		logger.debug(" warehouseDetailsList() 실행");
		
		List<WarehouseCodeVO> warehouseDetailsList = bService.warehouseDetailsList(s_cate_wh_code);
		
		model.addAttribute("warehouseDetailsList", warehouseDetailsList);
		
		logger.debug("@@ 리스트 : " + warehouseDetailsList);
		logger.debug(" s_cate_wh_code : " + s_cate_wh_code);
		
		return new ResponseEntity<>(warehouseDetailsList, HttpStatus.OK);
	}
	
	// 창고 정보 수정
	@ResponseBody
	@RequestMapping(value = "/updateWhCode", method = RequestMethod.POST)
	public ResponseEntity<String> updateWhCode(@RequestBody WarehouseCodeVO whcvo) throws Exception {
		logger.debug(" updateWhCode() 실행 ");
		
		bService.updateWhCode(whcvo);
		
		 try {
		        bService.updateWhCode(whcvo);
		        return new ResponseEntity<>(" updated successfully", HttpStatus.OK);
		    } catch (Exception e) {
		        logger.error("Error updating", e);
		        return new ResponseEntity<>("Error updating", HttpStatus.INTERNAL_SERVER_ERROR);
		    }
		
	}
	
	// ===================================================================================
	
	// 창고 페이지
	@RequestMapping(value = "/warehouse", method = RequestMethod.GET)
	public void warehouse_GET() throws Exception{
		logger.debug(" warehouse 페이지 ");
		
	}
	
	// 창고 구역 리스트
	@ResponseBody
	@RequestMapping(value = "/whZoneList", method = RequestMethod.GET)
	public List<WarehouseVO> whZoneList_GET(@RequestParam("wh_code") String wh_code, @RequestParam("wh_zone") String wh_zone, Model model) throws Exception{
		List<WarehouseVO> whZoneList = bService.whZoneListAll(wh_code, wh_zone);
		
		model.addAttribute("whZoneList", whZoneList);
		logger.debug("wh_code : " + wh_code);
		logger.debug("wh_zone : " + wh_zone);
		
		logger.debug(" whZoneList : "  + whZoneList);
		return whZoneList;
	}
	
	// 창고 재고 리스트
	@ResponseBody
	@RequestMapping(value = "/whInven", method = RequestMethod.GET)
	public ResponseEntity<List<WarehouseVO>> whInvenList(@RequestParam("wh_num") String wh_num, Model model) throws Exception{
		
		logger.debug(" whInvenList() 실행 ");
		
		List<WarehouseVO> whInvenList = bService.whInvenList(wh_num);
		
		model.addAttribute(whInvenList);
		logger.debug(" whInv : " + whInvenList);
		
		return new ResponseEntity<>(whInvenList, HttpStatus.OK);
	}

	
	
	
}