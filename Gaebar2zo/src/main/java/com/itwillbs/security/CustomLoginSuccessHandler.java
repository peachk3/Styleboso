package com.itwillbs.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler{

       
      private static final Logger logger = LoggerFactory.getLogger(CustomLoginSuccessHandler.class);
   
	
	 @Override public void onAuthenticationSuccess(HttpServletRequest request,
	 HttpServletResponse response, Authentication authentication) throws
	 IOException, ServletException {
	 logger.info("onAuthenticationSuccess() 실행 - 로그인 성공");
	 
	 // 사용자 권한 로깅 (선택사항)
	 authentication.getAuthorities().forEach( authority ->
	 logger.info("사용자 권한 정보 : " + authority.getAuthority()) );
	 
	 // 모든 사용자를 main.jsp 페이지로 리다이렉트
	 response.sendRedirect(request.getContextPath()+ "/loginout/main"); }
	 

}
