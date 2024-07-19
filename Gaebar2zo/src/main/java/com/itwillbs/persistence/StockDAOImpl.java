package com.itwillbs.persistence;

import java.util.List;


import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

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

	@Override
	public List<TransactionVO> rsList() throws Exception {
		logger.debug("DAOImpl : 출고 리스트 호출");

		
		return sqlSession.selectList(NAMESPACE+"releaseList");
	}

	
	
	
	
	

}