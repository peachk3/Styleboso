package com.itwillbs.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.InventoryChangeVO;
import com.itwillbs.domain.InventoryVO;
import com.itwillbs.domain.TransactionGoodsVO;
import com.itwillbs.domain.TransactionVO;

@Repository
public class StockDAOImpl implements StockDAO{

	
	private static final Logger logger = LoggerFactory.getLogger(StockDAOImpl.class);
	
	@Inject
	public SqlSession sqlSession;
	
	
	public static final String NAMESPACE="com.itwillbs.mapper.stockMapper.";

	// 입고 리스트 호출
	@Override
	public List<TransactionVO> rcList() throws Exception {
		logger.debug("DAOImpl : 입고 리스트 호출");
		
		return sqlSession.selectList(NAMESPACE+"receivingList");
	}
	
	// 출고 리스트 호출
	@Override
	public List<TransactionVO> rsList() throws Exception {
		logger.debug("DAOImpl : 출고 리스트 호출");

		
		return sqlSession.selectList(NAMESPACE+"releaseList");
	}

	// 재고 리스트 호출
	@Override
	public List<InventoryVO> getStockList(Criteria cri) throws Exception {
		logger.debug("DAOImpl : 재고 리스트 호출");
		
		return sqlSession.selectList(NAMESPACE+"getStockList",cri);
	}

	@Override
	public int getTotalCount() throws Exception {
		logger.debug(" getTotalCount() 실행 ");
		return sqlSession.selectOne(NAMESPACE+"totalCount");
	}

    // 거래 상세 정보 호출
    @Override
    public Map<String, Object> getTransactionDetails(String tran_num) {
        logger.debug("DAOImpl : 입고 상세 정보 호출");
        // 쿼리 파라미터로 tran_num을 전달하여 결과를 반환합니다.
        return sqlSession.selectOne(NAMESPACE + "getTransactionDetails", tran_num);
    }

	@Override
	public void deleteRecevingList(List<String> trannums) throws Exception {

		logger.debug(" deleteRecevingList(List<String> trannums) 실행");

		
		
		sqlSession.delete(NAMESPACE + "deleteTransactionList", trannums);
	}
	
	@Override
	public void deleteInventoryChange(List<String> trannums) throws Exception {
	    logger.debug("deleteInventoryChange(List<String> trannums) 실행");
	    sqlSession.delete(NAMESPACE + "deleteInventoryChange", trannums);
	}
	
	
	

	@Override
	public Map<String, Object> getTransactionDetails2(String tran_num) throws Exception {
        logger.debug("DAOImpl : 출고 상세 정보 호출");
        
        
        return sqlSession.selectOne(NAMESPACE + "getTransactionDetails2", tran_num);
	}

	@Override
	public List<Map<String, Object>> getTransactionItems(String top_tran_num) throws Exception {

		logger.debug("DAOImpl : 입고 모달창 - 품목정보 호출");
		
		return sqlSession.selectList(NAMESPACE+"getTransactionItems", top_tran_num);
	}

	@Override
	public List<Map<String, Object>> getTransactionItems2(String top_tran_num) throws Exception {
		logger.debug("DAOImpl : 출고 모달창 - 품목정보 호출");
		
		
		return sqlSession.selectList(NAMESPACE+"getTransactionItems", top_tran_num);
		
	}

	@Override
	public String GetTranNum(TransactionVO tvo) {
		logger.debug("DAO : GetTranNum() 호출");
		logger.debug("tvo : "+ tvo);
		
		String tran_num = sqlSession.selectOne(NAMESPACE + "getTranNum", tvo);
		
		logger.debug("tran_num : "+ tran_num);
		
		return tran_num;
	}

	@Override
	public void stockReceivingAdd_TransactionVO(TransactionVO tvo) {
	logger.debug("DAO : stockReceivingAdd_TransactionVO() 호출");
		
		logger.debug("tvo : "+ tvo);
		
		sqlSession.insert(NAMESPACE + "stockReceivingAdd_TransactionVO", tvo);
		
		logger.debug("DAO : 입고 거래 테이블 등록 완료");
				
	}
	
	@Override
	public void stockReceivingAdd_InventoryChangeVO(InventoryChangeVO newIvcb) {

		logger.debug("DAO : stockReceivingAdd_InventoryChangeVO() 호출");
		
		logger.debug("newIvcb : "+ newIvcb);
		
		sqlSession.insert(NAMESPACE + "stockAdd_InventoryChangeVO", newIvcb);
		
		logger.debug("DAO : 입고 거래 품목 테이블 등록 완료");	
		
	}
	
	
	
	
	@Override
	public List<InventoryVO> getInventoryList(String goods_num) throws Exception {
		logger.debug("DAO : getInventoryList(String goodsNum) 호출");
		
		
		return sqlSession.selectList(NAMESPACE + "getInventoryList", goods_num);
	}

	@Override
	public void stockReleaseAdd_TransactionVO(TransactionVO tvo) throws Exception {
		logger.debug("DAO : stockReleaseAdd_TransactionVO() 호출");
		
		logger.debug("tvo : "+ tvo);
		
		sqlSession.insert(NAMESPACE + "stockReleaseAdd_TransactionVO", tvo);
		
		logger.debug("DAO : 출고 거래 테이블 등록 완료");		
	}

	@Override
	public void stockReleaseAdd_InventoryChangeVO(InventoryChangeVO newIvcb) throws Exception {
		logger.debug("DAO : stockReleaseAdd_InventoryChangeVO() 호출");
		
		logger.debug("newIvcb : "+ newIvcb);
		
		sqlSession.insert(NAMESPACE + "stockAdd_InventoryChangeVO", newIvcb);
		
		logger.debug("DAO : 출고 거래 품목 테이블 등록 완료");	
		
	}

	@Override
	public int updateDetails(TransactionVO changetrvo) throws Exception {

		logger.debug("DAO : updateDetails() 호출");
		
		logger.debug("changetrvo : "+ changetrvo);
		
		return sqlSession.update(NAMESPACE + "updateDetails", changetrvo);
	}


//	@Override
//	public void stockReceivingAdd_TransactionGoodsVO(TransactionGoodsVO newTgvo) {
//		logger.debug("DAO : salesOrderAdd_TransactionGoodsVO() 호출");
//		
//		logger.debug("tgvo : "+ newTgvo);
//		
//		sqlSession.insert(NAMESPACE + "stockReceivingAdd_TransactionGoodsVO", newTgvo);
//		
//		logger.debug("DAO : 수주 거래 품목 테이블 등록 완료");	
//	}




	
	
	
	
	
	
	
	
	

}