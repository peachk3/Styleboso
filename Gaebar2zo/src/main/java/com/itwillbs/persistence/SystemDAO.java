package com.itwillbs.persistence;

import java.util.List;

import com.itwillbs.domain.CodeVO;
import com.itwillbs.domain.ItemCodeVO;
import com.itwillbs.domain.UsersVO;

public interface SystemDAO {
	
	//이메일 중복체크
	int emailCheck(String user_email)  throws Exception;
	
	//=====================================================
	//운영자,관리자,사원 전체 리스트 출력
	List<UsersVO> employeeListAll() throws Exception;
	
	//공통코드 전체 리스트 출력
	List<CodeVO> codeListAll () throws Exception;

	// 그룹 코드에 따라 품목 코드 정보를 출력
	List<ItemCodeVO> itemCodeListAll(String group_code) throws Exception;
	 //=====================================================
	
	//공통 품목코드 수정(update) 
	void updateItemCode(ItemCodeVO icVo) throws Exception;

	 


}
