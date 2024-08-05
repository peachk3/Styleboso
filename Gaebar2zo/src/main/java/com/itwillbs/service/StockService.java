package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.InventoryVO;
import com.itwillbs.domain.TransactionVO;

@Service
public interface StockService {

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
	Map<String, Object> getReturnDetails(String tran_num) throws Exception;
	
	// 반품 - 품목 정보 호출
	List<Map<String, Object>> getReturnItems(String top_tran_num) throws Exception;

	// 반품 등록
	void adjustReturnAdd(TransactionVO tvo) throws Exception;
	
	Map<String, Object> getTransactionDetails(String tran_num);




	
	// 상태 업데이트
//    void updateStatus(List<String> tranNums, String status) throws Exception;







}