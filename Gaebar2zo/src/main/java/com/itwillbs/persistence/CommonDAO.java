package com.itwillbs.persistence;

import java.util.List;

import com.itwillbs.domain.ClientVO;
import com.itwillbs.domain.GoodsVO;
import com.itwillbs.domain.TransactionGoodsVO;
import com.itwillbs.domain.TransactionVO;
import com.itwillbs.domain.UsersVO;

public interface CommonDAO {

	// 거래처 리스트 조회
	public List<ClientVO> ClientList() throws Exception;
	public List<ClientVO> ClientList(ClientVO cvo) throws Exception;

	// 담당자 리스트 조회
	public List<UsersVO> ManagerList() throws Exception;

	// 제품 리스트 조회
	public List<GoodsVO> GoodsList() throws Exception;

	// 거래 리스트 조회
	public List<TransactionVO> TranList() throws Exception;

	// 거래번호 -> 모든 정보 호출
	public TransactionVO getTransactionDetails(String tran_num) throws Exception;

	// 거래번호 -> 품목 정보 호출
	public List<TransactionGoodsVO> getTransactionGoods(String tran_num) throws Exception;

	// 상태 업데이트
	public void updateStatus(List<String> tran_nums, String pro_status) throws Exception;



}