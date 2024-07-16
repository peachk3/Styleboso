package com.itwillbs.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.WarehouseCodeVO;

@Repository
public class BasicInfoDAOImpl implements BasicInfoDAO{

	private static final Logger logger = LoggerFactory.getLogger(BasicInfoDAOImpl.class);

	@Inject
	public SqlSession sqlSession;

	public static final String NAMESPACE="com.itwillbs.mapper.basicInfoMapper.";

	@Override
	public List<WarehouseCodeVO> listAll() {
		logger.debug(" listAll() 실행 ");
		
		return sqlSession.selectList(NAMESPACE + "listALL");
	}




}