package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.ClientVO;
import com.itwillbs.domain.ItemVO;
import com.itwillbs.domain.WarehouseCodeVO;
import com.itwillbs.domain.WarehouseVO;
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

	// 거래처 등록
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

	@Override
	public void insertItem(ItemVO itemvo) throws Exception {
		logger.debug(" 품목 등록 ");
		
		bidao.itemInsert(itemvo);
	}

	@Override
	public void deleteItems(List<String> itemNums) throws Exception {
		logger.debug(" 품목 삭제 ");
		
		bidao.itemDelete(itemNums);
	}

	@Override
	public List<ItemVO> itemDetailsList(String item_num) throws Exception {
		logger.debug(" 품목 상세보기 ");
		
		return bidao.itemDetailsList(item_num);
	}

	@Override
	public int updateItem(ItemVO ivo) throws Exception {
		logger.debug(" 품목 수정 ");
		
		return bidao.updateItem(ivo);
	}

	@Override
	public void insertWarehouse(WarehouseCodeVO wcvo) throws Exception {
		logger.debug(" 창고 등록 ");
		
		bidao.warehouseInsert(wcvo);
	}

	@Override
	public void deleteWarehouse(List<String> whNums) throws Exception {
		logger.debug(" 창고 삭제");
		
		bidao.warehouseDelete(whNums);
	}

	@Override
	public void deleteWareCode(List<String> whNums) throws Exception {
		logger.debug(" 창고 내부 렉 구역 삭제");
		
		bidao.warehouseCodeDelete(whNums);
	}

	
	@Override
	public List<WarehouseCodeVO> warehouseDetailsList(String s_cate_wh_code) throws Exception {
		logger.debug(" 창고 상세보기 ");
		
		return bidao.warehouseDetailsList(s_cate_wh_code);
	}


	@Override
	public void updateWhCode(WarehouseCodeVO whcvo) throws Exception {
		logger.debug(" 창고 정보 수정 ");
		
		bidao.updateWhCode(whcvo);
	}
	
	
	
}
