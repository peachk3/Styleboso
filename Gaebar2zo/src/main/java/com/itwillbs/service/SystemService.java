package com.itwillbs.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.UsersVO;

@Service
public interface SystemService {

	//운영자,관리자,사원 전체 리스트 출력
	List<UsersVO> employeeListAll() throws Exception;






}