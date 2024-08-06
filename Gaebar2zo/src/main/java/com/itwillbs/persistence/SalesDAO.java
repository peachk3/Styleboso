package com.itwillbs.persistence;

import java.util.List;

import com.itwillbs.domain.TransactionGoodsVO;
import com.itwillbs.domain.TransactionVO;

public interface SalesDAO {

	// 수주 리스트
	public List<TransactionVO> salesOrderList() throws Exception;

	// 수주 등록_TransactionVO
	public void salesOrderAdd_TransactionVO(TransactionVO tvo) throws Exception;

	// 수주 등록_TransactionGoodsVO
	public void salesOrderAdd_TransactionGoodsVO(TransactionGoodsVO newTgvo) throws Exception;
	
	// 수주 정보
	public List<TransactionVO> salesOrderInfo(String tran_num) throws Exception;
	
	// 수주 정보 수정_TransactionVO
	public void salesOrderUpdate_TransactionVO(TransactionVO tvo) throws Exception;
	
	// 수주 등록 수정_TransactionGoodsVO
	public void salesOrderUpdate_TransactionGoodsVO(TransactionGoodsVO newTgvo) throws Exception;
	
	// 발주 등록_TransactionVO
	public void purchaseOrderAdd_TransactionVO(TransactionVO tvo) throws Exception;
	
	// 발주 등록_TransactionGoodsVO
	public void purchaseOrderAdd_TransactionGoodsVO(TransactionGoodsVO newTgvo) throws Exception;

	// GetTranNum 추출
	public String GetTranNum(TransactionVO tvo) throws Exception;





}