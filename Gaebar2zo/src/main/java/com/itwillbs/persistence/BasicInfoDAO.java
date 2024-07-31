package com.itwillbs.persistence;

import java.util.List;

import com.itwillbs.domain.ClientVO;
import com.itwillbs.domain.ItemVO;
import com.itwillbs.domain.WarehouseCodeVO;
import com.itwillbs.domain.WarehouseVO;

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

	// 품목 상세보기 
	List<ItemVO> itemDetailsList(String item_num) throws Exception;

	// 품목 수정
	int updateItem(ItemVO ivo) throws Exception;

	// 창고 등록
	public void warehouseInsert(WarehouseCodeVO wcvo) throws Exception;

	// 창고 삭제
	public void warehouseDelete(List<String> whNums) throws Exception;

	// 창고 내부 삭제
	public void warehouseCodeDelete(List<String> whNums) throws Exception;

	// 창고 상세보기
	public List<WarehouseCodeVO> warehouseDetailsList(String s_cate_wh_code) throws Exception;
	
	// 창고 수정
	public void updateWhCode(WarehouseCodeVO whcvo) throws Exception;

	// 창고 내부 재고 리스트 
	public List<WarehouseVO> whInvenList(String wh_num) throws Exception;

	public List<WarehouseVO> whZoneListAll(String wh_code, String wh_zone) throws Exception;


}