package com.itwillbs.service;

import java.util.List;

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









}