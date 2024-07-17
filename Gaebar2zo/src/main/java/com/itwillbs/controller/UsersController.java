package com.itwillbs.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.service.UsersService;

@RequestMapping(value="/Styleboso/system/*")
@Controller
public class UsersController {
	
		private static final Logger logger = LoggerFactory.getLogger(SystemController.class);
		
		//서비스주입
		@Inject
		private UsersService uService;
		
		//http://localhost:8088/Styleboso/system/login
		// 로그인
		@RequestMapping(value="/login",method=RequestMethod.GET)
		public void login() throws Exception{
			System.out.println(" login() 실행 ");
		
		}
		
		//로그아웃 
		@RequestMapping(value = "logout", method = RequestMethod.POST)
		public String logout_POST(HttpSession session) throws Exception{
			
			logger.debug("/logout -> logoutPOST() 호출");
			session.invalidate(); // 세션 무효화
			
			return "redirect:/Styleboso/system/main";
		}
		
		
		
		
}