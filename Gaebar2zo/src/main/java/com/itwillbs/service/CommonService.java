package com.itwillbs.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.ClientVO;
import com.itwillbs.domain.GoodsVO;
import com.itwillbs.domain.TransactionGoodsVO;
import com.itwillbs.domain.TransactionVO;
import com.itwillbs.domain.UsersVO;

@Service
public interface CommonService {

	// 거래처 리스트 조회
	public List<ClientVO> ClientList() throws Exception;
	public List<ClientVO> ClientList(ClientVO cvo) throws Exception;

	// 담당자 리스트 조회
	public List<UsersVO> ManagerList() throws Exception;

	// 제품 리스트 조회
	public List<GoodsVO> GoodsList() throws Exception;

	// 거래 리스트 조회 ( 교환 반품 발주 ) 
	public List<TransactionVO> TransactionList() throws Exception;

	// 거래 번호 -> 모든 정보 호출 
	public TransactionVO getTransactionDetails(String tran_num) throws Exception;

	// 거래 번호 -> 품목 정보 호출
	public List<TransactionGoodsVO> getTransactionGoods(String tran_num) throws Exception;
	
	// 상태 업데이트
	public void updateStatus(List<String> tran_nums, String pro_status) throws Exception;

	
	// 거래 리스트 삭제
	public void deleteTran(List<String> tran_num) throws Exception;


}
