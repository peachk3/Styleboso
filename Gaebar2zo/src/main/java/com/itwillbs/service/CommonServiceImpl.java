package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.ClientVO;
import com.itwillbs.domain.GoodsVO;
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
	public List<UsersVO> ManagerList() throws Exception {
		logger.debug("거래처 리스트 조회");
		
		return cdao.ManagerList();
	}

	@Override
	public List<GoodsVO> GoodsList() throws Exception {
		logger.debug("제품 리스트 조회");
		
		return cdao.GoodsList();
	}

}