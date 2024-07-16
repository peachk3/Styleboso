package com.itwillbs.controller;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.itwillbs.persistence.UsersDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml",
					"file:src/main/webapp/WEB-INF/spring/security-context.xml"
				}
		)


public class DBConnectTest {
 
	@Inject
	private DataSource ds;
	
	@Inject
	private PasswordEncoder pwEncoder;
	
	@Inject
	private UsersDAO mdao;
	
//	@Test
	public void 회원정보_인증정보_조회_테스트() throws Exception{
		UsersDAO result = mdao.getMemberAuth("admin99");
		
		System.out.println(result);
	}
	
	
	
	
//	@Test
	public void test1() throws SQLException {
		System.out.println("ds : "+ ds);
		System.out.println("con : "+ds.getConnection());
		System.out.println("pwEncoder"+pwEncoder);
	}
	
	// 회원정보 생성
//	@Test
	public void 회원정보생성_테스트() throws Exception{
		for(int i=0;i<100;i++) {
		
		// 디비연결
		Connection con = ds.getConnection();
		
		// SQL 구문 작성 & pstmt 객체
		String sql = "insert into users(username,password,user_per_name,user_pos) values(?,?,?,?)";
		
		PreparedStatement pstmt = con.prepareStatement(sql);
		// ??? 값 입력
		// 비밀번호 (암호화)
		pstmt.setString(2, pwEncoder.encode("pw"+i));
		pstmt.setString(4, "대리");
		
		
			if(i<80) {
				pstmt.setString(1, "user"+i); // 아이디
				pstmt.setString(3, "사용자"+i); // 이름
				
			} else if(i<90){
				pstmt.setString(1, "manager"+i); // 아이디
				pstmt.setString(3, "운영자"+i); // 이름
			} else {
				pstmt.setString(1, "admin"+i); // 아이디
				pstmt.setString(3, "관리자"+i); // 이름
			}
		
			
			pstmt.executeUpdate();
			
		} // for 문 
		
		System.out.println(" 테스트 회원가입 성공! ");
		
		
		
	}
	
	// 회원정보 생성
	
	
	
	@Test
	public void 회원권한생성_테스트() throws Exception{
		for(int i=0;i<100;i++) {
		
		// 디비연결
		Connection con = ds.getConnection();
		
		// SQL 구문 작성 & pstmt 객체
		String sql = "insert into authorities(username,authority) values(?,?)";
		
		PreparedStatement pstmt = con.prepareStatement(sql);
			
			
			// ??? 값 입력
			if(i<80) {
				pstmt.setString(1, "user"+i); // 아이디
				pstmt.setString(2, "ROLE_ADMIN"); // 권한정보
			} else if(i<90){
				pstmt.setString(1, "manager"+i); // 아이디
				pstmt.setString(2, "ROLE_ADMIN"); // 권한정보
			} else {
				pstmt.setString(1, "admin"+i); // 아이디
				pstmt.setString(2, "ROLE_ADMIN"); // 권한정보
			}
		
			
			pstmt.executeUpdate();
			
		} // for 문 
		
		System.out.println(" 테스트 회원가입 성공! ");
	}
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
