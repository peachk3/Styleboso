package com.itwillbs.persistence;

import javax.inject.Inject;


import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;


@Repository(value="usersDAO")
public class UsersDAO {
	
	// 디비연결
	@Inject
	private SqlSession sqlSession;
	
	// 매퍼의 주소(NAMESPACE)
	private static final String NAMESPACE="com.itwillbs.mapper.UsersMapper.";
	
	
	private static final Logger logger = LoggerFactory.getLogger(UsersDAO.class);
	
	// 회원정보+인증정보 한번에 조회
	public UsersDAO getMemberAuth(String username) throws Exception{
		logger.info(" getMemberAuth() 실행 ");
		
		return sqlSession.selectOne(NAMESPACE+"readMemberAuth",username);
	}
	

	
	
	
	
	
	
	
	
	
}
