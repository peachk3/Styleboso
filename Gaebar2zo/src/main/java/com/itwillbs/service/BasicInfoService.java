package com.itwillbs.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.ClientVO;
import com.itwillbs.domain.ItemVO;
import com.itwillbs.domain.WarehouseCodeVO;

@Service
public interface BasicInfoService {
	
	// 창고코드 리스트 출력
	List<WarehouseCodeVO> listAll();

	// 거래처 리스트 출력
	List<ClientVO> cliListAll();

	// 품목 리스트 출력
	List<ItemVO> itemListAll();

	// 거래처 사업자 번호 중복 확인
	boolean isCliCrnDuplicate(String cli_crn) throws Exception;

	public void cliInsert(ClientVO vo) throws Exception;

	// 거래처 리스트 상세 보기
	List<ClientVO> clientDetailsList(String cli_num) throws Exception;

	// 거래처 수정
	void updateClient(ClientVO cvo) throws Exception;

}