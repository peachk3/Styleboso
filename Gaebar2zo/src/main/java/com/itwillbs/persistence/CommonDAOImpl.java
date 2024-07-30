package com.itwillbs.persistence;

import java.util.List;


import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.ClientVO;
import com.itwillbs.domain.GoodsVO;
import com.itwillbs.domain.TransactionVO;
import com.itwillbs.domain.UsersVO;


@Repository
public class CommonDAOImpl implements CommonDAO{

	private static final Logger logger = LoggerFactory.getLogger(CommonDAOImpl.class);
	
	public static final String NAMESPACE="com.itwillbs.mapper.commonMapper.";

	@Inject
	public SqlSession sqlSession;
	
	@Override
	public List<ClientVO> ClientList() throws Exception {
		logger.debug("DAO : ClientList() 호출");
		
		return sqlSession.selectList(NAMESPACE + "clientList");
	}
	
	@Override
	public List<UsersVO> ManagerList() throws Exception {
		logger.debug("DAO : ManagerList() 호출");
		
		return sqlSession.selectList(NAMESPACE + "managerList");
	}

	@Override
	public List<GoodsVO> GoodsList() throws Exception {
		logger.debug("DAO : GoodsList() 호출");
		
		return sqlSession.selectList(NAMESPACE + "goodsList");
	}

	@Override
	public List<TransactionVO> TranList() throws Exception {
		logger.debug("dao : TranList() 호출");
		
		return sqlSession.selectList(NAMESPACE+"tranList");
	}

	
	


}