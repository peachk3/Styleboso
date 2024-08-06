package com.itwillbs.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.ClientVO;
import com.itwillbs.domain.GoodsVO;
import com.itwillbs.domain.TransactionGoodsVO;
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
	public List<ClientVO> ClientList(ClientVO cvo) throws Exception {
		logger.debug("DAO : ClientList(ClientVO cvo) 호출");
		
		return sqlSession.selectList(NAMESPACE + "clientList_cate", cvo);
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

	@Override
	public TransactionVO getTransactionDetails(String tran_num) throws Exception {
		logger.debug("DAO : getTransactionDetails(String tran_num) 호출");
		
        return sqlSession.selectOne(NAMESPACE + "getTransactionDetails", tran_num);
	}

	@Override
	public List<TransactionGoodsVO> getTransactionGoods(String tran_num) throws Exception {
		logger.debug("DAO : getTransactionGoods(String tran_num) 호출");	
		
        return sqlSession.selectList(NAMESPACE + "getTransactionGoods", tran_num);
	}

	@Override
	public void updateStatus(List<String> tran_nums, String pro_status) throws Exception {
		logger.debug("DAO : updateStatus(List<String> tran_nums, String pro_status) 호출 ");
		
		Map<String, Object> params = new HashMap<>();
        params.put("tran_nums", tran_nums);
        params.put("pro_status", pro_status);
        sqlSession.update(NAMESPACE+"updateStatus", params);
	}

	@Override
	public void deleteTran(List<String> tran_num) throws Exception {
		logger.debug(" deleteTran(List<String> tran_num) 실행");
		
		sqlSession.delete(NAMESPACE + "deleteTran", tran_num);
	}

	@Override
	public void updateReleaseStatus(List<String> tran_nums, String pro_status) throws Exception {
		logger.debug("DAO : updateReleaseStatus(List<String> tran_nums, String pro_status) 호출 ");
		
		Map<String, Object> params = new HashMap<>();
        params.put("tran_nums", tran_nums);
        params.put("pro_status", pro_status);
        sqlSession.update(NAMESPACE+"updateReleaseStatus", params);
		
		
	}


	
	


}