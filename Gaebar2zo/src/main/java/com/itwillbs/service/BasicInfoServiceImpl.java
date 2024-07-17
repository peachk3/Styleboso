package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.ClientVO;
import com.itwillbs.domain.WarehouseCodeVO;
import com.itwillbs.persistence.BasicInfoDAO;

@Service
public class BasicInfoServiceImpl implements BasicInfoService{
	
	private static final Logger logger = LoggerFactory.getLogger(BasicInfoServiceImpl.class);

	@Inject
	private BasicInfoDAO bidao;

	@Override
	public List<WarehouseCodeVO> listAll() {
		logger.debug("창고 리스트 조회");
		
		return bidao.listAll();
	}

	@Override
	public List<ClientVO> cliListAll() {
		logger.debug("고객사 리스트 조회");
		
		return bidao.cliListAll();
	}

 
	
	
}
