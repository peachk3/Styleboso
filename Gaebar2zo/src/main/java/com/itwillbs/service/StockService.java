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

	// 출고 수정
	public int updateReleaseDetails(TransactionVO changetrvo) throws Exception;

	
	// 상태 업데이트
//    void updateStatus(List<String> tranNums, String status) throws Exception;







}