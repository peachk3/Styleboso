package com.itwillbs.persistence;

import java.util.List;

import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.InventoryChangeVO;
import com.itwillbs.domain.InventoryVO;
import com.itwillbs.domain.TransactionVO;

public interface StockDAO {

	// 입고 리스트 호출
	List<TransactionVO> rcList(Criteria cri) throws Exception;

	// 입고 리스트 개수 세기
	public int getTotalReceivingCount() throws Exception;

	// 출고 리스트 호출
	List<TransactionVO> rsList(Criteria cri) throws Exception;

	// 출고 리스트 개수 세기
	public int getTotalReleaseCount() throws Exception;
	
	// 재고 리스트 호출
	List<InventoryVO> getStockList(Criteria cri) throws Exception;
	int getTotalCount() throws Exception;

	// 교환 리스트 호출
	List<TransactionVO> exList() throws Exception;

	// 반품 리스트 호출
	List<TransactionVO> reList() throws Exception;
	
	// 반품 모달창 정보 호출
	Map<String, Object> getReturnDetails(String tran_num) throws Exception;

	// 반품 모달창 품목 정보 호출
	List<Map<String, Object>> getReturnItems(String top_tran_num) throws Exception;
	
	// 반품 등록
	void adjustReturnAdd_TransactionVO(TransactionVO tvo) throws Exception;
	
	// 반품 등록 - InventoryChangeVO
	void adjustReturnAdd_InventoryChangeVO(InventoryChangeVO newIvcb) throws Exception;
	
	// 반품 삭제
	void deleteReturnList(List<String> trannums) throws Exception;
	
	// 입고 모달창 정보 화출
	Map<String, Object> getTransactionDetails(String tran_num) throws Exception;

	// 입고/출고 삭제
	void deleteRecevingList(List<String> tran_nums) throws Exception;

	// 입고삭제 - 상위 거래번호 상태 되돌리기
	void updateTopTranNum(@Param("top_tran_nums") List<String> topTranNums) throws Exception;

	// 출고 삭제 - 상위 거래번호 상태 되돌리기
	void updateRLTopTranNum(List<String> top_tran_nums) throws Exception;
	
	
	// 입고/츨고 inventory change 삭제
	void deleteInventoryChange(List<String> trannums) throws Exception;

	
	// 출고 모달창 정보 호출
	Map<String, Object> getTransactionDetails2(String tran_num) throws Exception;

	// 입고 모달창 품목 정보 호출
	List<Map<String, Object>> getTransactionItems(String top_tran_num) throws Exception;

	// 출고 모달창 품목 정보 호출 
	List<Map<String, Object>> getTransactionItems2(String top_tran_num) throws Exception;

	
	// GetTranNum 추출
	public String GetTranNum(TransactionVO tvo) throws Exception;

	// 입고 등록_TransactionVO
	public void stockReceivingAdd_TransactionVO(TransactionVO tvo) throws Exception;

	// 입고 등록_InventoryChangeVO
	public void stockReceivingAdd_InventoryChangeVO(InventoryChangeVO newIvcb) throws Exception;
	
	
	// 재고 데이터 로드 
	List<InventoryVO> getInventoryList(String goods_num) throws Exception;

	
	// 출고 등록_TransactionVO
	public void stockReleaseAdd_TransactionVO(TransactionVO tvo) throws Exception;
	
	// 출고 등록_InventoryChangeVO
	public void stockReleaseAdd_InventoryChangeVO(InventoryChangeVO newIvcb) throws Exception;

	// 입고/출고 수정
	public int updateDetails(TransactionVO changetrvo) throws Exception;
  
	
	// 입고 시 상위 거래번호 상태 변경
	public void updateReceivingTopTranstatus(TransactionVO tvo) throws Exception;

	// 출고 시 상위 거래번호 상태 변경
	public void updateReleaseTopTranstatus(TransactionVO tvo) throws Exception;


	// 입고 상태 업데이트
	public void updateRecevingStatus(List<String> tran_nums, String pro_status) throws Exception;
	// 입고 상태 업데이트 -> 상위거래번호 상태 업데이트
	public void updateRecevingTopTranStatus(List<String> top_tran_nums, String pro_status) throws Exception;
	
	
	// 출고 상태 업데이트
	public void updateReleaseStatus(List<String> tran_nums, String pro_status) throws Exception;
	// 출고 상태 업데이트 -> 상위거래번호 상태 업데이트
	public void updateReleaseTopTranStatus(List<String> top_tran_nums, String pro_status) throws Exception;


	
	// 반품 상태 업데이트
	public void updateReturnStatus(List<String> tran_nums, String pro_status) throws Exception;
	// 반품 상태 업데이트 -> 상위거래번호 상태 업데이트
	public void updateReturnTopTranStatus(List<String> top_tran_nums, String pro_status) throws Exception;
	
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