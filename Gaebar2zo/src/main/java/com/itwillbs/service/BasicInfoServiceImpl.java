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
	public List<WarehouseCodeVO> listAll() {
		logger.debug("창고 리스트 조회");
		
		return bidao.listAll();
	}

	// 거래처 리스트 출력
	@Override
	public List<ClientVO> cliListAll() {
		logger.debug("고객사 리스트 조회");
		
		return bidao.cliListAll();
	}

	// 품목 리스트 출력
	@Override
	public List<ItemVO> itemListAll() {
		logger.debug(" 품목 리스트 조회 ");
		
		return bidao.itemListAll();
	}

	// 사업자 번호 중복 조회
	@Override
	public boolean isCliCrnDuplicate(String cli_crn) throws Exception {
		logger.debug(" 사업자 번호 중복 조회 ");
		int count = bidao.cliCrnDup(cli_crn);
		
		return count > 0;
	}

	@Override
	public void cliInsert(ClientVO vo) throws Exception {
		logger.debug(" 거래처 등록 ");
		
		bidao.cliInsert(vo);
	}

	@Override
	public List<ClientVO> clientDetailsList(String cli_num) throws Exception {
		logger.debug(" 거래처 상세보기 ");
		
		return bidao.clientDetailsList(cli_num);
	}

	@Override
	public void updateClient(ClientVO cvo) throws Exception {
		logger.debug(" 거래처 수정 ");
		
		bidao.updateClient(cvo);
	}

	@Override
	public void deleteClients(List<String> cliNums) throws Exception {
		logger.debug(" 거래처 삭제 ");
		
		bidao.deleteClients(cliNums);
	}
	
	
}
