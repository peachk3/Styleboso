package com.itwillbs.service;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.TransactionVO;

@Service
public interface SalesService {

	// 수주 등록
	public void SalesOrderAdd(TransactionVO tvo) throws Exception;


}
