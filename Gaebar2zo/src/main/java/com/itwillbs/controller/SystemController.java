package com.itwillbs.controller;


import java.util.List;
import java.util.stream.Collectors;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.domain.CodeVO;
import com.itwillbs.domain.ItemCodeVO;
import com.itwillbs.domain.UsersVO;
import com.itwillbs.service.SystemService;


@RequestMapping(value = "/system/*")
@Controller
public class SystemController {

	@Inject
	private SystemService sService;

	private static final Logger logger = LoggerFactory.getLogger(SystemController.class);

	// http://localhost:8088/system/login
	// 로그인
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void login() throws Exception {
		logger.debug(" login() 실행 ");

	}

	// -------------------------------------------------------------------------------------------
	// 로그인 - 1) 입력받은 아이디, 비밀번호 확인 2) 권한 - 운영자, 관리자, 사원
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login_POST(HttpSession session, UsersVO uvo, @RequestParam(required = false) String redirect)
			throws Exception {
		// 파라미터에 전달할 정보 저장(아이디, 비밀번호)

		return "redirect:/system/main";
	}

	// -------------------------------------------------------------------------------------------
	// 로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.POST)
	public String logout_POST(HttpSession session) throws Exception {

		logger.debug("/logout -> logoutPOST() 호출");
		session.invalidate(); // 세션 무효화

		return "redirect:/system/main";
	}
	// -------------------------------------------------------------------------------------------
	//이메일 중복 체크 
	@GetMapping("/emailCheck")
	@ResponseBody
	public int emailCheck(@RequestParam("user_email")String user_email ) throws Exception {
		
		int result = sService.emailCheck(user_email);
		
		logger.info(" 결과값 :" + result);
		
		return result;
	}
	
	
	
	
	// -------------------------------------------------------------------------------------------
	//전화번호 중복 
	
	
	
	
	
	
	// -------------------------------------------------------------------------------------------
	// http://localhost:8088/system/main
	// 대시보드 ( 메인 페이지 )
	@RequestMapping(value="/main",method=RequestMethod.GET)

	public void main_GET() throws Exception {
		logger.debug(" main_GET() 실행 ");


	}

	// -------------------------------------------------------------------------------------------
	// http://localhost:8088/system/employeeList
	// 사용자 관리(추가,삭제,조회)
	@RequestMapping(value = "/employeeList", method = RequestMethod.GET)
	public void employeeList_GET(Model model) throws Exception {
		logger.debug(" employeeList_GET() 실행 ");

		// 전체리스트
		List<UsersVO> employeeList = sService.employeeListAll();

		model.addAttribute("employeeList", employeeList);

	}
	// ==========================================================================
	// 공통 코드 관리
	@RequestMapping(value = "/code/common", method = RequestMethod.GET)
	public void code_common_GET(Model model) throws Exception {
		logger.debug(" code_common_GET() 실행 ");
		
		//공통코드 전체리스트
		List<CodeVO> codeList =sService.codeListAll();
		
		model.addAttribute("codeList", codeList);
		
	}
	
	//공통 코드 (등록)
	@ResponseBody
	 @RequestMapping(value = "/saveGroupCode", method = RequestMethod.POST)
	 public ResponseEntity<String> saveGroupCode(@RequestBody CodeVO codeVo){
		 
		 try {
			 sService.saveGroupCode(codeVo);
			 return ResponseEntity.ok("success");
		 }catch(Exception e) {
			 return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("failure");
		 }
	 }
	
	//공통 코드 (수정)
		 @ResponseBody
		@RequestMapping(value = "/updateCode", method = RequestMethod.POST)
		public ResponseEntity<String> updateCode(@RequestBody CodeVO codeVo) throws Exception {
			 logger.debug(" @@@ updateCode() 실행");
			 sService.updateCode(codeVo);
			 
			logger.debug("controller => 공통 코드 업데이트 출력 성공: {}" + codeVo);
			
			return new ResponseEntity<>(HttpStatus.OK);
		}
	
	
	
	
	
	//공통 코드 (삭제)
	@ResponseBody
	@RequestMapping(value = "/deleteCode", method = RequestMethod.POST)
	public ResponseEntity<String> deleteCode(@RequestBody List<String> Codes) {
			try {
	            sService.deleteCode(Codes);
	            return ResponseEntity.ok("삭제되었습니다.");
	        } catch (Exception e) {
	        	 e.printStackTrace(); // 콘솔에 예외 로그를 출력
	            return ResponseEntity.status(500).body("삭제 중 오류가 발생했습니다.");
	        }
	    }
	   
	
	
//========================================================================
	// 품목 분류 코드 관리
	
	 @RequestMapping(value = "/code/item", method = RequestMethod.GET) 
	 public void code_item_GET(@RequestParam("group_code") String group_code, Model model) throws Exception {
	 
	  logger.debug(" code_item_GET() 실행 ");
	  logger.debug("그룹코드 : " + group_code);
	  
	// 그룹 코드에 따라 품목 정보를 출력 
	  List<ItemCodeVO> itemCodeList = sService.itemCodeListAll(group_code);
	  model.addAttribute("itemCodeList", itemCodeList);
	  model.addAttribute("groupCode", group_code);
	  
	  logger.debug(" @@@@@@@itemCodeList : " + itemCodeList);
	  
     }
	 //그룹 -> 품목코드 (등록)
	 @ResponseBody
	 @RequestMapping(value = "/saveItemCode", method = RequestMethod.POST)
	 public ResponseEntity<String> saveItemCode(@RequestBody ItemCodeVO icVo){
		 
		 try {
			 sService.saveItemCode(icVo);
			 return ResponseEntity.ok("success");
		 }catch(Exception e) {
			 return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("failure");
		 }
	 }
	 
	// 그룹-> 품목코드 수정 
	 @ResponseBody
	@RequestMapping(value = "/updateItemCode", method = RequestMethod.POST)
	public ResponseEntity<String> updateItem(@RequestBody ItemCodeVO icVo) throws Exception {
		 logger.debug(" @@@ updateItem() 실행");
		 sService.updateItemCode(icVo);
		 
		logger.debug("공통 품목 코드 출력 성공: {}" + icVo);
		
		return new ResponseEntity<>(HttpStatus.OK);
	}
	 
	 //그룹 -> 품목코드(체크) 삭제
	 @ResponseBody
	 @RequestMapping(value = "/deleteItemCode", method = RequestMethod.POST)
	 public String deleteItemCode(@RequestParam("itemCodes")List<String>itemCodes) {
		 try {
	            sService.deleteItemCode(itemCodes);
	            return "success";
	        } catch (Exception e) {
	            e.printStackTrace();
	            return "error";
	        }
	 }
	 
	
		 
	 
	 // 공통 품목 코드 중복 검사
//	 @ResponseBody
//	 @RequestMapping(value = "/checkItemCode", method = RequestMethod.GET)
//	 public ResponseEntity<String>checkItemCode(@RequestBody ItemCodeVO icVo) throws Exception{
//		 boolean checkDuplicate = sService.checkItemCode(icVo.getS_cate_item_code());
//		 
//		 if(checkDuplicate){
//			 return ResponseEntity.ok("duplicate");
//		 }else {
//			 return ResponseEntity.ok("not_duplicate");
//		 }
//	 }
	// ==========================================================================

}