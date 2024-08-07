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
	
	// 반품 삭제
	void deleteReturnList(List<String> trannums) throws Exception;
	
	// 입고 모달창 정보 호출
	Map<String, Object> getTransactionDetails(String tran_num) throws Exception;

	// 입고 목록 삭제
	void deleteRecevingList(List<String> trannums) throws Exception;

	// 출고 모달창 정보 호출
	Map<String, Object> getTransactionDetails2(String tran_num) throws Exception;

	// 입고 - 품목 정보 호출
	List<Map<String, Object>> getTransactionItems(String top_tran_num) throws Exception;

	// 출고 - 품목 정보 호출
	List<Map<String, Object>> getTransactionItems2(String top_tran_num) throws Exception;

	
	// 입고 등록
	public void stockReceivingAdd(TransactionVO tvo) throws Exception;

	
	// 재고 데이터 로드 
	List<InventoryVO> getInventoryList(String goods_num) throws Exception;

	
	// 출고 등록
	public void stockReleaseAdd(TransactionVO tvo) throws Exception;

	// 출고 삭제
	public void deleteReleaseList(List<String> trannums) throws Exception;


	// 입고 / 출고 수정
	public int updateDetails(TransactionVO changetrvo) throws Exception;


	
	// 입고 상태 업데이트
	public void updateRecevingStatus(List<String> tran_nums, String pro_status, List<String> top_tran_nums) throws Exception;
	
	// 출고 상태 업데이트
	public void updateReleaseStatus(List<String> tran_nums, String pro_status, List<String> top_tran_nums) throws Exception;


	// 발주 리스트
	public List<TransactionVO> receivingPurchaseOrderList() throws Exception;

	// 교환 리스트
	public List<TransactionVO> receivingExchangeList() throws Exception;

	// 반품 리스트
	public List<TransactionVO> receivingReturnList() throws Exception;

	
	// 수주 리스트
	public List<TransactionVO> releaseSalesOrderList() throws Exception;
	
	// 교환 리스트
	public List<TransactionVO> releaseExchangeList() throws Exception;



}