package com.itwillbs.persistence;

import java.util.List;

import com.itwillbs.domain.ClientVO;
import com.itwillbs.domain.ItemVO;
import com.itwillbs.domain.WarehouseCodeVO;

public interface BasicInfoDAO {

	// 창고코드 리스트 출력
	List<WarehouseCodeVO> listAll();

	// 거래처 리스트 출력
	List<ClientVO> cliListAll();

	// 품목 리스트 출력
	List<ItemVO> itemListAll();

	// 거래처 번호 중복 확인
	public int cliCrnDup(String cli_crn) throws Exception;

	// 거래처 등록
	public void cliInsert(ClientVO vo) throws Exception;

	// 거래처 상세보기
	List<ClientVO> clientDetailsList(String cli_num) throws Exception;

	// 거래처 수정
	void updateClient(ClientVO cvo) throws Exception;

	// 거래처 삭제
	void deleteClients(List<String> cliNums) throws Exception;

	// 품목 추가
	void itemInsert(ItemVO itemvo) throws Exception;

	// 품목 삭제
	void itemDelete(List<String> itemNums) throws Exception;

}