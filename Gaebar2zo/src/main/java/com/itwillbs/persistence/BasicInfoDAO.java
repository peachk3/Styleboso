package com.itwillbs.persistence;

import java.util.List;

import com.itwillbs.domain.ClientVO;
import com.itwillbs.domain.ItemVO;
import com.itwillbs.domain.WarehouseCodeVO;

public interface BasicInfoDAO {

	// 창고코드 리스트 출력
	List<WarehouseCodeVO> listAll() throws Exception;

	// 거래처 리스트 출력
	List<ClientVO> cliListAll() throws Exception;

	// 품목 리스트 출력
	List<ItemVO> itemListAll() throws Exception;

}