package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.InventoryVO;
import com.itwillbs.domain.TransactionVO;

@Service
public interface StockService {

	// 입고 리스트 호출
	List<TransactionVO> rcList() throws Exception;

	// 출고 리스트 호출
	List<TransactionVO> rsList() throws Exception;

	// 재고 리스트 호출
	List<InventoryVO> getStockList() throws Exception;

	Map<String, Object> getTransactionDetails(String tran_num);

	
	// 상태 업데이트
//    void updateStatus(List<String> tranNums, String status) throws Exception;







}