package com.itwillbs.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.ClientVO;
import com.itwillbs.domain.ItemVO;
import com.itwillbs.domain.WarehouseCodeVO;

@Service
public interface BasicInfoService {
	
	// 창고코드 리스트 출력
	List<WarehouseCodeVO> listAll() throws Exception;

	// 거래처 리스트 출력
	List<ClientVO> cliListAll() throws Exception;

	// 품목 리스트 출력
	List<ItemVO> itemListAll() throws Exception;

}