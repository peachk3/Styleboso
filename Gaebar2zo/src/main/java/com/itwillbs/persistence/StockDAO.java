package com.itwillbs.persistence;

import java.util.List;
import java.util.Map;

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

	// 입고 모달창 정보 화출
	Map<String, Object> getTransactionDetails(String tran_num) throws Exception;

	// 입고 목록 삭제
	void deleteRecevingList(List<String> trannums) throws Exception;
	
	// 출고 모달창 정보 호출
	Map<String, Object> getTransactionDetails2(String tran_num) throws Exception;

	// 입고 모달창 품목 정보 호출
	List<Map<String, Object>> getTransactionItems(String top_tran_num) throws Exception;


	
	// 상태변경
//	void updateStatus(String tranNum, String status) throws Exception;
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}