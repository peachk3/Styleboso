package com.itwillbs.persistence;

import java.util.List;

import com.itwillbs.domain.TransactionVO;

public interface StockDAO {

	// 입고 리스트 호출
	List<TransactionVO> rcList() throws Exception;

	// 출고 리스트 호출
	List<TransactionVO> rsList() throws Exception;
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}