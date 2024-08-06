package com.itwillbs.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.TransactionGoodsVO;
import com.itwillbs.domain.TransactionVO;

@Repository
public class SalesDAOImpl implements SalesDAO{
	
	private static final Logger logger = LoggerFactory.getLogger(SalesDAOImpl.class);
	
	public static final String NAMESPACE="com.itwillbs.mapper.salesMapper.";

	@Inject
	public SqlSession sqlSession;

	@Override
	public List<TransactionVO> salesOrderList() throws Exception {
		logger.debug("DAO : salesOrderList() 호출");
		
		return sqlSession.selectList(NAMESPACE + "salesOrderList");
	}

	@Override
	public void salesOrderAdd_TransactionVO(TransactionVO tvo) throws Exception {
		logger.debug("DAO : salesOrderAdd_TransactionVO() 호출");
		
		logger.debug("tvo : "+ tvo);
		
		sqlSession.insert(NAMESPACE + "salesOrderAdd_TransactionVO", tvo);
		
		logger.debug("DAO : 수주 거래 테이블 등록 완료");
		
	}

	@Override
	public void salesOrderAdd_TransactionGoodsVO(TransactionGoodsVO tgvo) throws Exception {
		logger.debug("DAO : salesOrderAdd_TransactionGoodsVO() 호출");
		
		logger.debug("tgvo : "+ tgvo);
		
		sqlSession.insert(NAMESPACE + "salesOrderAdd_TransactionGoodsVO", tgvo);
		
		logger.debug("DAO : 수주 거래 품목 테이블 등록 완료");	
	}
	
	@Override
	public List<TransactionVO> salesOrderInfo(String tran_num) throws Exception {
		logger.debug("DAO : salesOrderInfo() 호출");
		
		return sqlSession.selectList(NAMESPACE + "salesOrderInfo", tran_num);
	}
	
	@Override
	public void salesOrderUpdate_TransactionVO(TransactionVO tvo) throws Exception {
		logger.debug("DAO : salesOrderUpdate_TransactionVO() 호출");
		
		logger.debug("tvo : "+ tvo);
		
		sqlSession.insert(NAMESPACE + "salesOrderUpdate_TransactionVO", tvo);
		
		logger.debug("DAO : 수주 거래 테이블 수정 완료");
		
	}

	@Override
	public void salesOrderUpdate_TransactionGoodsVO(TransactionGoodsVO tgvo) throws Exception {
		logger.debug("DAO : salesOrderUpdate_TransactionGoodsVO() 호출");
		
		logger.debug("tgvo : "+ tgvo);
		
		sqlSession.insert(NAMESPACE + "salesOrderUpdate_TransactionGoodsVO", tgvo);
		
		logger.debug("DAO : 수주 거래 품목 테이블 수정 완료");
		
	}

	@Override
	public void purchaseOrderAdd_TransactionVO(TransactionVO tvo) throws Exception {
		logger.debug("DAO : purchaseOrderAdd_TransactionVO() 호출");
		
		logger.debug("tvo : "+ tvo);
		
		sqlSession.insert(NAMESPACE + "purchaseOrderAdd_TransactionVO", tvo);
		
		logger.debug("DAO : 발주 거래 테이블 등록 완료");
		
	}

	@Override
	public void purchaseOrderAdd_TransactionGoodsVO(TransactionGoodsVO tgvo) throws Exception {
		logger.debug("DAO : purchaseOrderAdd_TransactionGoodsVO() 호출");
		
		logger.debug("tgvo : "+ tgvo);
		
		sqlSession.insert(NAMESPACE + "purchaseOrderAdd_TransactionGoodsVO", tgvo);
		
		logger.debug("DAO : 발주 거래 품목 테이블 등록 완료");	
		
	}

	@Override
	public String GetTranNum(TransactionVO tvo) throws Exception {
		logger.debug("DAO : GetTranNum() 호출");
		logger.debug("tvo : "+ tvo);
		
		String tran_num = sqlSession.selectOne(NAMESPACE + "getTranNum", tvo);
		
		logger.debug("tran_num : "+ tran_num);
		
		return tran_num;
	}




}