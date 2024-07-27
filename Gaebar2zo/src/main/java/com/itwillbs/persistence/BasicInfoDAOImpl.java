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

	// 거래처 등록
	@Override
	public void cliInsert(ClientVO vo) throws Exception {
		logger.debug(" cliInsert() 실행 ");
		
		sqlSession.insert(NAMESPACE + "cliUpdate",vo);
	}

	// 거래처 정보 상세보기
	@Override
	public List<ClientVO> clientDetailsList(String cli_num) throws Exception {
		logger.debug(" clientDetailsList() 실행 ");
		
		return sqlSession.selectList(NAMESPACE + "cliDetials", cli_num);
	}

	// 거래처 정보 수정
	@Override
	public void updateClient(ClientVO cvo) throws Exception {
		logger.debug(" updateClient() 실행 ");
		
		sqlSession.update(NAMESPACE + "updateClient", cvo);
	}

	// 거래처 삭제
	@Override
	public void deleteClients(List<String> cliNums) throws Exception {
		logger.debug("deleteClients() 실행 ");
		
		sqlSession.delete(NAMESPACE + "deleteClient", cliNums);
	}

	// 품목 등록
	@Override
	public void itemInsert(ItemVO itemvo) throws Exception {
		logger.debug(" itemInsert() 실행 ");
		
		sqlSession.insert(NAMESPACE + "insertItem", itemvo);
	}

	// 품목 삭제
	@Override
	public void itemDelete(List<String> itemNums) throws Exception {
		logger.debug(" itemDelete() 실행");
		
		sqlSession.delete(NAMESPACE + "deleteItem", itemNums);
	}

	@Override
	public List<ItemVO> itemDetailsList(String item_num) throws Exception {
		logger.debug(" itemDetailsList() 실행 ");
		
		return sqlSession.selectList(NAMESPACE + "itemDetailsList", item_num);
	}



}