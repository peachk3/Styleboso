package com.itwillbs.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class StockDAOImpl implements StockDAO{

	@Inject
	public SqlSession sqlSession;

	public static final String NAMESPACE="com.itwillbs.mapper.stockMapper.";



}