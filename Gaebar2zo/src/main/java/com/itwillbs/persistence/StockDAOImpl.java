package com.itwillbs.persistence;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.InventoryChangeVO;
import com.itwillbs.domain.InventoryVO;
import com.itwillbs.domain.TransactionVO;

@Repository
public class StockDAOImpl implements StockDAO{

	
	private static final Logger logger = LoggerFactory.getLogger(StockDAOImpl.class);
	
	@Inject
	public SqlSession sqlSession;
	
	
	public static final String NAMESPACE="com.itwillbs.mapper.stockMapper.";

	// 입고 리스트 호출
	@Override
	public List<TransactionVO> rcList(Criteria cri) throws Exception {
		logger.debug("DAOImpl : 입고 리스트 호출");
		
		return sqlSession.selectList(NAMESPACE+"receivingList",cri);
	}
	
	// 입고 리스트 개수 세기
	@Override
	public int getTotalReceivingCount() throws Exception {

		return sqlSession.selectOne(NAMESPACE+"totalreceivingCount");
	}

	// 출고 리스트 호출
	@Override
	public List<TransactionVO> rsList(Criteria cri) throws Exception {
		logger.debug("DAOImpl : 출고 리스트 호출");

		
		return sqlSession.selectList(NAMESPACE+"releaseList",cri);
	}

	// 출고 리스트 개수 세기
	@Override
	public int getTotalReleaseCount() throws Exception {

		return sqlSession.selectOne(NAMESPACE+"totalreleaseCount");
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

	// 교환 리스트 호출
	@Override
	public List<TransactionVO> exList() throws Exception {
		logger.debug("DAOImpl : 교환 리스트 호출");
		return sqlSession.selectList(NAMESPACE+"exchangeList");
	}

	// 반품 리스트 호출
	@Override
	public List<TransactionVO> reList() throws Exception {
		logger.debug("DAOImpl : 반품 리스트 호출");
		return sqlSession.selectList(NAMESPACE+"returnList");
	}
	
	// 반품 모달창 정보 호출
    @Override
	public Map<String, Object> getReturnDetails(String tran_num) throws Exception {
		logger.debug(" DAOImpl : 반품 모달창 정보 호출 ");
		return sqlSession.selectOne(NAMESPACE + "getReturnDetails", tran_num);
	}

    // 반품 모달창 품목 정보 호출
	@Override
	public List<Map<String, Object>> getReturnItems(String top_tran_num) throws Exception {
		logger.debug(" DAOImpl : 반품 모달창 품목 정보 호출 ");
		return sqlSession.selectOne(NAMESPACE + "getTransactionItems", top_tran_num);
	}
	
	// 반품 등록 - TransactionVO
	@Override
	public void adjustReturnAdd_TransactionVO(TransactionVO tvo) throws Exception {
		logger.debug(" DAOImpl : 반품 등록 - TransactionVO ");
		sqlSession.insert(NAMESPACE + "adjustReturnAdd_TransactionVO", tvo);
	}

	// 반품 등록 - InventoryChangeVO
	@Override
	public void adjustReturnAdd_InventoryChangeVO(InventoryChangeVO newIvcb) throws Exception {
		logger.debug(" DAOImpl : 반품 등록 - InventoryChangeVO ");
		sqlSession.insert(NAMESPACE + "adjustReturnAdd_InventoryChangeVO", newIvcb);
	}
	
	// 반품 삭제
	@Override
	public void deleteReturnList(List<String> trannums) throws Exception {
		logger.debug(" deleteReturnList(List<String> trannums) 실행 ");
		sqlSession.delete(NAMESPACE + "deleteTransactionList", trannums);
	}

	// 거래 상세 정보 호출
    @Override
    public Map<String, Object> getTransactionDetails(String tran_num) throws Exception {
        logger.debug("DAOImpl : 입고 상세 정보 호출");
        // 쿼리 파라미터로 tran_num을 전달하여 결과를 반환합니다.
        return sqlSession.selectOne(NAMESPACE + "getTransactionDetails", tran_num);
    }


	@Override
	public void deleteRecevingList(List<String> tran_nums) throws Exception {

		logger.debug(" deleteRecevingList(List<String> trannums) 실행");

		
		
		sqlSession.delete(NAMESPACE + "deleteTransactionList", tran_nums);
	}
	
	@Override
	public void updateTopTranNum(@Param("top_tran_nums") List<String> top_tran_nums) throws Exception {
	    logger.debug(" updateTopTranNum(List<String> top_tran_nums) 실행");
	    
	    logger.debug("top_tran_nums : "+top_tran_nums);
	    sqlSession.update(NAMESPACE + "updateTopTranNum", top_tran_nums);
	}

	@Override
	public void deleteInventoryChange(List<String> tran_nums) throws Exception {
	    logger.debug("deleteInventoryChange(List<String> trannums) 실행");
	    sqlSession.delete(NAMESPACE + "deleteInventoryChange", tran_nums);
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
	public String GetTranNum(TransactionVO tvo) throws Exception{
		logger.debug("DAO : GetTranNum() 호출");
		logger.debug("tvo : "+ tvo);
		
		String tran_num = sqlSession.selectOne(NAMESPACE + "getTranNum", tvo);
		
		logger.debug("tran_num : "+ tran_num);
		
		return tran_num;
	}

	@Override
	public void stockReceivingAdd_TransactionVO(TransactionVO tvo) throws Exception{
	logger.debug("DAO : stockReceivingAdd_TransactionVO() 호출");
		
		logger.debug("tvo : "+ tvo);
		
		sqlSession.insert(NAMESPACE + "stockReceivingAdd_TransactionVO", tvo);
		
		logger.debug("DAO : 입고 거래 테이블 등록 완료");
				
	}
	
	@Override
	public void stockReceivingAdd_InventoryChangeVO(InventoryChangeVO newIvcb) throws Exception {

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

	@Override
	public void updateReceivingTopTranstatus(TransactionVO tvo) throws Exception {

		logger.debug("DAO :updateTopTranstatus(TransactionVO tvo)");
		logger.debug(" 상위 거래번호 상태 변경");
		
		sqlSession.update(NAMESPACE+"updateReceivingTopTranstatus",tvo);
	}

	@Override
	public void updateReleaseTopTranstatus(TransactionVO tvo) throws Exception {
		logger.debug("DAO :updateReleaseTopTranstatus(TransactionVO tvo)");
		logger.debug(" 상위 거래번호 상태 변경");
		
		sqlSession.update(NAMESPACE+"updateReleaseTopTranstatus",tvo);
		
	}


	@Override
	public void updateRecevingStatus(List<String> tran_nums, String pro_status) throws Exception {
		logger.debug("DAO : updateStatus(List<String> tran_nums, String pro_status) 호출 ");
		
		Map<String, Object> params = new HashMap<>();
        params.put("tran_nums", tran_nums);
        params.put("pro_status", pro_status);
        sqlSession.update(NAMESPACE+"updateRecevingStatus", params);
		
		
	}
	
	@Override
	public void updateRecevingTopTranStatus(List<String> top_tran_nums, String pro_status) throws Exception {
	    logger.debug("DAO : updateRecevingTopTranStatus(List<String> top_tran_nums, String pro_status) 호출 ");
	    
	    Map<String, Object> params = new HashMap<>();
	    params.put("top_tran_nums", top_tran_nums);
	    params.put("pro_status", pro_status);
	    sqlSession.update(NAMESPACE+"updateRecevingTopTranStatus", params);
	}
	
	@Override
	public void updateReleaseStatus(List<String> tran_nums, String pro_status) throws Exception {
		logger.debug("DAO : updateReleaseStatus(List<String> tran_nums, String pro_status) 호출 ");
		
		Map<String, Object> params = new HashMap<>();
        params.put("tran_nums", tran_nums);
        params.put("pro_status", pro_status);
        sqlSession.update(NAMESPACE+"updateReleaseStatus", params);
	}

	@Override
	public void updateReleaseTopTranStatus(List<String> top_tran_nums, String pro_status) throws Exception {
		  logger.debug("DAO : updateReleaseTopTranStatus(List<String> top_tran_nums, String pro_status) 호출 ");
		    
		    Map<String, Object> params = new HashMap<>();
		    params.put("top_tran_nums", top_tran_nums);
		    params.put("pro_status", pro_status);
		    sqlSession.update(NAMESPACE+"updateReleaseTopTranStatus", params);
	}

	
	@Override
	public List<TransactionVO> receivingPurchaseOrderList() throws Exception {
		logger.debug("DAO : receivingPurchaseOrderList() 호출");
		
		return sqlSession.selectList(NAMESPACE + "receivingPurchaseOrderList");
	}

	@Override
	public List<TransactionVO> receivingExchangeList() throws Exception {
		logger.debug("DAO : receivingExchangeList() 호출");
		
		return sqlSession.selectList(NAMESPACE + "receivingExchangeList");
	}
	
	@Override
	public List<TransactionVO> receivingReturnList() throws Exception {
		logger.debug("DAO : receivingReturnList() 호출");
		
		return sqlSession.selectList(NAMESPACE + "receivingReturnList");
	}
	
	
	@Override
	public List<TransactionVO> releaseSalesOrderList() throws Exception {
		logger.debug("DAO : releaseSalesOrderList() 호출");
		
		return sqlSession.selectList(NAMESPACE + "releaseSalesOrderList");
	}
	
	@Override
	public List<TransactionVO> releaseExchangeList() throws Exception {
		logger.debug("DAO : releaseExchangeList() 호출");
		
		return sqlSession.selectList(NAMESPACE + "releaseExchangeList");
	}
	
	
	
	
	
	
	

}