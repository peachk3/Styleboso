package com.itwillbs.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.UsersVO;

@Repository
public class SystemDAOImpl implements SystemDAO{

	private static final Logger logger = LoggerFactory.getLogger(SystemDAOImpl.class);

	@Inject
	public SqlSession sqlSession;

	public static final String NAMESPACE="com.itwillbs.mapper.systemMapper.";

	//운영자,관리자,사원 전체 리스트 출력
	@Override
	public List<UsersVO> employeeListAll() throws Exception {
		logger.debug("employeeListAll() 실행");
		
		return sqlSession.selectList(NAMESPACE+"employeeListAll");
	}


	
	










}