package com.itwillbs.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.CodeVO;
import com.itwillbs.domain.ItemCodeVO;
import com.itwillbs.domain.UsersVO;

@Repository
public class SystemDAOImpl implements SystemDAO{

	private static final Logger logger = LoggerFactory.getLogger(SystemDAOImpl.class);

	@Inject
	public SqlSession sqlSession;

	public static final String NAMESPACE="com.itwillbs.mapper.systemMapper.";

	//이메일 중복
	@Override
	public int emailCheck(String user_email) throws Exception {
		int result = sqlSession.selectOne(NAMESPACE + "emailCheck", user_email);
		
		logger.info("result :" + result);
				
				return result;
	}


	//운영자,관리자,사원 전체 리스트 출력
	@Override
	public List<UsersVO> employeeListAll() throws Exception {
		logger.debug("employeeListAll() 실행");
		
		return sqlSession.selectList(NAMESPACE+"employeeListAll");
	}
	
	//공통코드 전체 리스트 출력
	@Override
	public List<CodeVO> codeListAll() throws Exception {
		logger.info("codeListAll() 실행");
		
		return sqlSession.selectList(NAMESPACE + "codeListAll");
	}


	@Override
	public List<ItemCodeVO> itemCodeListAll() throws Exception {
		logger.debug(" itemCodeListAll() 실행 ");
		return sqlSession.selectList(NAMESPACE + "itemCodeListAll");
	}


//	//품목코드(대,소) 전체 리스트 출력
//
//	  @Override public List<ItemCodeVO> itemCodeListAll() throws Exception {
//	  logger.info("Service --> DAOitemCodeListAll() 실행");
//	  
//	  return sqlSession.selectList(NAMESPACE + "itemCodeListAll");
//	  }
//
//	  
//	  // 그룹 코드에 따라 품목 정보를 출력
//	@Override
//	public List<ItemCodeVO> itemCGroupListAll(String group_code) throws Exception {
//		logger.info("Service-->DAO itemCGroupListAll() 실행");
//		
//		return sqlSession.selectList(NAMESPACE+ "itemCGroupListAll" );
//	}
	 

	
	  









}