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

		
		
		sqlSession.delete(NAMESPACE + "deleteRecevingList", trannums);
	}

	@Override
	public Map<String, Object> getTransactionDetails2(String tran_num) throws Exception {
        logger.debug("DAOImpl : 출고 상세 정보 호출");
        
        
        return sqlSession.selectOne(NAMESPACE + "getTransactionDetails2", tran_num);
	}


	// 상태 변경
//	@Override
//	 public void updateStatus(String tranNum, String status) {
//        Map<String, Object> params = new HashMap<>();
//        params.put("tranNum", tranNum);
//        params.put("status", status);
//        sqlSession.update(NAMESPACE+"updateStatus", params);
//    }

	
	
	
	
	
	
	
	
	

}