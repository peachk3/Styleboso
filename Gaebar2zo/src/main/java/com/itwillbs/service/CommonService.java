package com.itwillbs.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.ClientVO;
import com.itwillbs.domain.UsersVO;

@Service
public interface CommonService {

	// 거래처 리스트 조회
	public List<ClientVO> ClientList() throws Exception;

	// 담당자 리스트 조회
	public List<UsersVO> ManagerList() throws Exception;

}
