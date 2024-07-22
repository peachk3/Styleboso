package com.itwillbs.persistence;

import java.util.List;

import com.itwillbs.domain.UsersVO;

public interface SystemDAO {
	//이메일 중복체크
	int emailCheck(String user_email)  throws Exception;
	
	//운영자,관리자,사원 전체 리스트 출력
	List<UsersVO> employeeListAll() throws Exception;


}
