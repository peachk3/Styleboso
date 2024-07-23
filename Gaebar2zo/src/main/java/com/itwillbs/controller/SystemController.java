package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.domain.CodeVO;
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
	@RequestMapping(value = "logout", method = RequestMethod.POST)
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
	// http://localhost:8088/Styleboso/system/main
	// 대시보드 ( 메인 페이지 )
	@RequestMapping(value="/main",method=RequestMethod.GET)

	public void main_GET() throws Exception {
		logger.debug(" main_GET() 실행 ");


	}

	// -------------------------------------------------------------------------------------------
	// http://localhost:8088/Styleboso/system/employeeList
	// 사용자 관리(추가,삭제,조회)
	@RequestMapping(value = "/employeeList", method = RequestMethod.GET)
	public void employeeList_GET(Model model) throws Exception {
		logger.debug(" employeeList_GET() 실행 ");

		// 전체리스트
		List<UsersVO> employeeList = sService.employeeListAll();

		model.addAttribute("employeeList", employeeList);

	}

	// 공통 코드 관리
	@RequestMapping(value = "/code/common", method = RequestMethod.GET)
	public void code_common_GET(Model model) throws Exception {
		logger.debug(" code_common_GET() 실행 ");
		
		//공통코드 전체리스트
		List<CodeVO> codeList =sService.codeListAll();
		
		model.addAttribute("codeList", codeList);
		

	}



	// 품목 분류 코드 관리
	@RequestMapping(value = "/code/item", method = RequestMethod.GET)
	public void code_item_GET() throws Exception {
		logger.debug(" code_item_GET() 실행 ");

	}

}