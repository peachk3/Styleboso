package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.ClientVO;
import com.itwillbs.domain.ItemVO;
import com.itwillbs.domain.WarehouseCodeVO;
import com.itwillbs.persistence.BasicInfoDAO;

@Service
public class BasicInfoServiceImpl implements BasicInfoService{
	
	private static final Logger logger = LoggerFactory.getLogger(BasicInfoServiceImpl.class);

	@Inject
	private BasicInfoDAO bidao;

	// 창고코드 리스트 출력
	@Override
	public List<WarehouseCodeVO> listAll() throws Exception {
		logger.debug("창고 리스트 조회");
		
		return bidao.listAll();
	}

	// 거래처 리스트 출력
	@Override
	public List<ClientVO> cliListAll() throws Exception {
		logger.debug("고객사 리스트 조회");
		
		return bidao.cliListAll();
	}

	// 품목 리스트 출력
	@Override
	public List<ItemVO> itemListAll() throws Exception {
		logger.debug(" 품목 리스트 조회 ");
		
		return bidao.itemListAll();
	}

 
	
	
}
