package com.itwillbs.persistence;

import java.util.List;

import com.itwillbs.domain.UsersVO;

public interface SystemDAO {

	//운영자,관리자,사원 전체 리스트 출력
	List<UsersVO> employeeListAll() throws Exception;

}
