package com.itwillbs.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.TransactionVO;

@Service
public interface StockService {

	// 입고 리스트 호출
	List<TransactionVO> rcList() throws Exception;










}