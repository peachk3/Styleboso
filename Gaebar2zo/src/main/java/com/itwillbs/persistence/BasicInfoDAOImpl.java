package com.itwillbs.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.ClientVO;
import com.itwillbs.domain.ItemVO;
import com.itwillbs.domain.WarehouseCodeVO;

@Repository
public class BasicInfoDAOImpl implements BasicInfoDAO{

	private static final Logger logger = LoggerFactory.getLogger(BasicInfoDAOImpl.class);

	@Inject
	public SqlSession sqlSession;

	public static final String NAMESPACE="com.itwillbs.mapper.basicInfoMapper.";

	// 창고코드 리스트 출력
	@Override
	public List<WarehouseCodeVO> listAll() {
		logger.debug(" listAll() 실행 ");
		
		return sqlSession.selectList(NAMESPACE + "listALL");
	}

	// 거래처 리스트 출력
	@Override
	public List<ClientVO> cliListAll() {
		logger.debug(" cliListAll() 실행 ");
		
		return sqlSession.selectList(NAMESPACE + "cliListALL");
	}

	// 품목 리스트 출력
	@Override
	public List<ItemVO> itemListAll() {
		logger.debug(" itemListAll() 실행 ");
		
		return sqlSession.selectList(NAMESPACE + "itemListALL");
	}

	// 거래처 사업자 번호 중복 확인
	@Override
	public int cliCrnDup(String cli_crn) throws Exception {
		logger.debug(" cliCrnDup() 실행 ");
		
		Integer result = sqlSession.selectOne(NAMESPACE + "cliCrnDup", cli_crn);
		
		return result;
	} 
	


}