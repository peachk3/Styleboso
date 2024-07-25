package com.itwillbs.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.CodeVO;
import com.itwillbs.domain.ItemCodeVO;
import com.itwillbs.domain.UsersVO;

@Service
public interface SystemService {
	//이메일 중복
	int emailCheck(String user_email) throws Exception;
	
	//================================================
	//운영자,관리자,사원 전체 리스트 출력
	List<UsersVO> employeeListAll() throws Exception;

	//공통코드 전체 리스트 출력 
	List<CodeVO> codeListAll() throws Exception;
	
	// 그룹 코드에 따라 품목 정보를 조회하는 로직
	List<ItemCodeVO> itemCodeListAll(String group_code) throws Exception;







}