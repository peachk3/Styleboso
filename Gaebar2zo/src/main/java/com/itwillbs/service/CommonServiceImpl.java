package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.ClientVO;
import com.itwillbs.domain.GoodsVO;
import com.itwillbs.domain.TransactionGoodsVO;
import com.itwillbs.domain.TransactionVO;
import com.itwillbs.domain.UsersVO;
import com.itwillbs.persistence.CommonDAO;

@Service
public class CommonServiceImpl implements CommonService{

	private static final Logger logger = LoggerFactory.getLogger(CommonServiceImpl.class);

	@Inject
	private CommonDAO cdao;
	
	@Override
	public List<ClientVO> ClientList() throws Exception {
		logger.debug("거래처 리스트 조회");
		
		return cdao.ClientList();
	}

	@Override
	public List<ClientVO> ClientList(ClientVO cvo) throws Exception {
		logger.debug("거래처 리스트 조회");
		logger.info("cvo : "+ cvo);
		
		return cdao.ClientList(cvo);
	}

	@Override
	public List<UsersVO> ManagerList() throws Exception {
		logger.debug("담당자 리스트 조회");
		
		return cdao.ManagerList();
	}

	@Override
	public List<GoodsVO> GoodsList() throws Exception {
		logger.debug("제품 리스트 조회");
		
		return cdao.GoodsList();
	}

	@Override
	public List<TransactionVO> TransactionList() throws Exception {
		logger.debug("거래 리스트 조회");
		
		return cdao.TranList();
	}

	@Override
	public TransactionVO getTransactionDetails(String tran_num) throws Exception {
		logger.debug("거래번호 -> 거래 정보 호출");
		
		return cdao.getTransactionDetails(tran_num);
	}

	@Override
	public List<TransactionGoodsVO> getTransactionGoods(String tran_num) throws Exception{
		logger.debug("거래번호 -> 품목 정보 호출");
		
		return cdao.getTransactionGoods(tran_num);
	}

	@Override
	public void updateStatus(List<String> tran_nums, String pro_status) throws Exception {
		logger.debug(" 상태 업데이트");
		
		cdao.updateStatus(tran_nums, pro_status);
	}


	
	
	
	
	
	
	
}