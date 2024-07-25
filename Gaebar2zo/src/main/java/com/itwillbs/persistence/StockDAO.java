package com.itwillbs.persistence;

import java.util.List;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.InventoryVO;
import com.itwillbs.domain.TransactionVO;

public interface StockDAO {

	// 입고 리스트 호출
	List<TransactionVO> rcList() throws Exception;

	// 출고 리스트 호출
	List<TransactionVO> rsList() throws Exception;

	// 재고 리스트 호출
	List<InventoryVO> getStockList(Criteria cri) throws Exception;

	int getTotalCount() throws Exception;

	// 교환 리스트 호출
	List<TransactionVO> exList() throws Exception;

	// 반품 리스트 호출
	List<TransactionVO> reList() throws Exception;

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}