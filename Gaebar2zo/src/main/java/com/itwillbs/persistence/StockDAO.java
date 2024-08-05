package com.itwillbs.persistence;

import java.util.List;
import java.util.Map;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.InventoryChangeVO;
import com.itwillbs.domain.InventoryVO;
import com.itwillbs.domain.TransactionGoodsVO;
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
	
	// 입고 모달창 정보 화출
	Map<String, Object> getTransactionDetails(String tran_num) throws Exception;

	// 입고/출고 삭제
	void deleteRecevingList(List<String> trannums) throws Exception;

	// 입고/츨고 inventory change 삭제
	void deleteInventoryChange(List<String> trannums) throws Exception;

	
	// 출고 모달창 정보 호출
	Map<String, Object> getTransactionDetails2(String tran_num) throws Exception;

	// 입고 모달창 품목 정보 호출
	List<Map<String, Object>> getTransactionItems(String top_tran_num) throws Exception;

	// 출고 모달창 품목 정보 호출 
	List<Map<String, Object>> getTransactionItems2(String top_tran_num) throws Exception;

	
	
	
	// GetTranNum 추출
	public String GetTranNum(TransactionVO tvo);

	// 입고 등록_TransactionVO
	public void stockReceivingAdd_TransactionVO(TransactionVO tvo);

	// 입고 등록_InventoryChangeVO
	public void stockReceivingAdd_InventoryChangeVO(InventoryChangeVO newIvcb);
	
	
	
	// 재고 데이터 로드 
	List<InventoryVO> getInventoryList(String goods_num) throws Exception;

	
	// 출고 등록_TransactionVO
	public void stockReleaseAdd_TransactionVO(TransactionVO tvo) throws Exception;
	
	// 출고 등록_InventoryChangeVO
	public void stockReleaseAdd_InventoryChangeVO(InventoryChangeVO newIvcb) throws Exception;


	
	// 상태변경
//	void updateStatus(String tranNum, String status) throws Exception;
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}