package com.itwillbs.persistence;

import java.util.List;


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
	
	


	
	
	
	
	

}