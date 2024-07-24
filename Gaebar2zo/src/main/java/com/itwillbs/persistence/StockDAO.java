package com.itwillbs.persistence;

import java.util.List;
import java.util.Map;

import com.itwillbs.domain.InventoryVO;
import com.itwillbs.domain.TransactionVO;

public interface StockDAO {

	// 입고 리스트 호출
	List<TransactionVO> rcList() throws Exception;

	// 출고 리스트 호출
	List<TransactionVO> rsList() throws Exception;

	// 재고 리스트 호출
	List<InventoryVO> getStockList() throws Exception;

	Map<String, Object> getTransactionDetails(String tran_num);


	
	// 상태변경
//	void updateStatus(String tranNum, String status) throws Exception;
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}