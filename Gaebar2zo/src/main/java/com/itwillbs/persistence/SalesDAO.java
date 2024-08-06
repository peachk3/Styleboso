package com.itwillbs.persistence;

import com.itwillbs.domain.TransactionGoodsVO;
import com.itwillbs.domain.TransactionVO;

public interface SalesDAO {

	// 수주 등록_TransactionVO
	public void salesOrderAdd_TransactionVO(TransactionVO tvo) throws Exception;

	// 수주 등록_TransactionGoodsVO
	public void salesOrderAdd_TransactionGoodsVO(TransactionGoodsVO newTgvo) throws Exception;
	
	// 발주 등록_TransactionVO
	public void purchaseOrderAdd_TransactionVO(TransactionVO tvo) throws Exception;
	
	// 발주 등록_TransactionGoodsVO
	public void purchaseOrderAdd_TransactionGoodsVO(TransactionGoodsVO newTgvo) throws Exception;

	// GetTranNum 추출
	public String GetTranNum(TransactionVO tvo);



}