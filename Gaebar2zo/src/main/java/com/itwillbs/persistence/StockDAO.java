package com.itwillbs.persistence;

import java.util.List;
import java.util.Map;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.InventoryChangeVO;
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
	
	// 반품 모달창 정보 호출
	Map<String, Object> getReturnDetails(String tran_num);

	// 반품 모달창 품목 정보 호출
	List<Map<String, Object>> getReturnItems(String top_tran_num);
	
	// 반품 등록
	void adjustReturnAdd_TransactionVO(TransactionVO tvo);
	
	// 반품 등록 - InventoryChangeVO
	void adjustReturnAdd_InventoryChangeVO(InventoryChangeVO newIvcb);
	
	Map<String, Object> getTransactionDetails(String tran_num);

	// GetTranNum 추출
	String getTranNum(TransactionVO tvo);







	
	// 상태변경
//	void updateStatus(String tranNum, String status) throws Exception;
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}