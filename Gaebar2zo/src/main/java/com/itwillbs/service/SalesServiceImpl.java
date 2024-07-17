package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.ClientVO;
import com.itwillbs.persistence.SalesDAO;

@Service
public class SalesServiceImpl implements SalesService{
	
	private static final Logger logger = LoggerFactory.getLogger(SalesServiceImpl.class);

	@Inject
	private SalesDAO sdao;
	
//	@Override
//	public List<ClientVO> ClientList() throws Exception {
//		logger.debug("거래처 리스트 조회");
//		
//		return sdao.ClientList();
//	}



}