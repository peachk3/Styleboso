package com.itwillbs.service;

import java.util.List;

import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.InventoryChangeVO;
import com.itwillbs.domain.InventoryVO;
import com.itwillbs.domain.TransactionVO;
import com.itwillbs.persistence.StockDAO;

@Service
public class StockServiceImpl implements StockService{
	@Inject
	private StockDAO sdao;

	private static final Logger logger = LoggerFactory.getLogger(StockServiceImpl.class);
	
	// 입고 리스트 호출
	@Override
	public List<TransactionVO> rcList(Criteria cri) throws Exception {
		logger.debug("ServiceImpl + 입고 리스트 호출");
		
		
		return sdao.rcList(cri);
	}

	
	@Override
	public int getTotalReceivingCount() throws Exception {

		
		return sdao.getTotalReceivingCount();
	}



	// 출고 리스트 호출
	@Override
	public List<TransactionVO> rsList(Criteria cri) throws Exception {
		logger.debug("ServiceImpl + 출고 리스트 호출");
		

		
		return sdao.rsList(cri);

	}

	@Override
	public int getTotalReleaseCount() throws Exception {

		
		return sdao.getTotalReleaseCount();
	}


	// 재고 리스트 호출
	@Override
	public List<InventoryVO> getStockList(Criteria cri) throws Exception {
		logger.debug(" ServiceImpl + 재고 리스트 호출 ");
		
		logger.debug("cri : " + cri);
		
		return sdao.getStockList(cri);
	}

	@Override
	public int getTotalCount() throws Exception {
		logger.debug(" getTotalCount() 실행 ");
		return sdao.getTotalCount();
	}

	// 교환 리스트 호출
	@Override
	public List<TransactionVO> exList() throws Exception {
		logger.debug(" ServiceImpl + 재고 리스트 호출 ");
		return sdao.exList();
	}

	// 반품 리스트 호출
	@Override
	public List<TransactionVO> reList() throws Exception {
		logger.debug(" ServiceImpl + 반품 리스트 호출 ");
		return sdao.reList();
	}
	
	// 반품 모달창 정보
	@Override
	public Map<String, Object> getReturnDetails(String tran_num) throws Exception {
		logger.debug(" 반품 모달창 정보 확인 ");
		return sdao.getReturnDetails(tran_num);
	}
	
	// 반품 모달창 품목 정보
	@Override
	public List<Map<String, Object>> getReturnItems(String top_tran_num) throws Exception {
		logger.debug(" 반품 모달창 품목 정보 ");
		return sdao.getReturnItems(top_tran_num);
	}

	// 반품 등록
	@Override
	public void adjustReturnAdd(TransactionVO tvo) throws Exception {
		logger.debug(" adjustReturnAdd(TransactionVO tvo) 실행 ");
		String tran_num = GetTranNum(tvo);
		logger.debug(" 생성된 tran_num : " + tran_num);
		tvo.setTran_num(tran_num);
		
		sdao.adjustReturnAdd_TransactionVO(tvo);
		
		List<InventoryChangeVO> icvoList = tvo.getInchangeList();
		
		for(InventoryChangeVO icvo : icvoList) {
			InventoryChangeVO newIvcb = new InventoryChangeVO();
			
			newIvcb.setTran_num(tran_num);
			newIvcb.setInven_num(icvo.getInven_num());
			newIvcb.setInven_qty(icvo.getInven_qty());
			
			sdao.adjustReturnAdd_InventoryChangeVO(newIvcb);
		}
	}
	
	// 반품 삭제
	@Override
	public void deleteReturnList(List<String> trannums) throws Exception {
		logger.debug(" 반품 삭제 ");
		
		sdao.deleteInventoryChange(trannums);
		sdao.deleteReturnList(trannums);
	}


	@Override
	public Map<String, Object> getTransactionDetails(String tran_num) throws Exception {

		logger.debug("입고 모달창 정보 확인");
		
		return sdao.getTransactionDetails(tran_num);
	}

	@Transactional
	@Override
	public void deleteRecevingList(List<String> tran_nums, List<String> top_tran_nums) throws Exception {
	    logger.debug("입고 삭제 시작: trannums=" + tran_nums + ", top_tran_nums=" + top_tran_nums);
	    
	    logger.debug("inventory_change 테이블에서 삭제 시작");
	    sdao.deleteInventoryChange(tran_nums);
	    logger.debug("inventory_change 테이블에서 삭제 완료");
	    
	    logger.debug("transaction 테이블에서 삭제 시작");
	    sdao.deleteRecevingList(tran_nums);
	    logger.debug("transaction 테이블에서 삭제 완료");
	    
	    logger.debug("상위 거래번호 상태 업데이트 시작");
	    sdao.updateTopTranNum(top_tran_nums);
	    logger.debug("상위 거래번호 상태 업데이트 완료");
	    
	    logger.debug("입고 삭제 완료");
	}

//	@Override
//	public void updateTopTranNum(List<String> topTranNums) throws Exception {
//		logger.debug(" 입고 삭제 - 상위거래 상태 되돌리기 ");
//
//		
//	}


	@Override
	public Map<String, Object> getTransactionDetails2(String tran_num) throws Exception {
		logger.debug("출고 모달창 정보 확인");
		
		return sdao.getTransactionDetails2(tran_num);
	}

	@Override
	public List<Map<String, Object>> getTransactionItems(String top_tran_num) throws Exception {
		logger.debug("입고 모달창 품목 정보 확인");
		
		return sdao.getTransactionItems(top_tran_num);
	}

	@Override
	public List<Map<String, Object>> getTransactionItems2(String top_tran_num) throws Exception {
		logger.debug("출고 모달창 품목 정보 확인");
		
		return sdao.getTransactionItems2(top_tran_num);
	}

	@Override
	@Transactional
	public void stockReceivingAdd(TransactionVO tvo) throws Exception {
		
		logger.debug("stockReceivingAdd(TransactionVO tvo) 실행 ");
		
		String tran_num = GetTranNum(tvo);
	    logger.debug("생성된 tran_num: " + tran_num);
	    tvo.setTran_num(tran_num);
	    
	    logger.debug("transaction 테이블에 데이터 삽입 시도");
	    sdao.stockReceivingAdd_TransactionVO(tvo);
	    logger.debug("transaction 테이블에 데이터 삽입 완료");
	    
	    logger.debug("top_tran_num : "+tvo.getTop_tran_num());
	    sdao.updateReceivingTopTranstatus(tvo);
	    
		List<InventoryChangeVO> icvoList = tvo.getInchangeList();
		
		// tgvoList에서 각 TransactionGoodsVO 객체를 꺼내어 처리
		for(InventoryChangeVO icvo : icvoList) {
		    // 새로운 TransactionGoodsVO 객체 생성
			InventoryChangeVO newIvcb = new InventoryChangeVO();
		    
		    // 리턴받은 TransactionVO의 tran_num 설정
			newIvcb.setTran_num(tran_num);  // 생성된 tran_num 사용
			newIvcb.setInven_num(icvo.getInven_num());
			newIvcb.setInven_qty(icvo.getInven_qty());
		    
		   logger.debug("inventory_change 테이블에 데이터 삽입 시도: " + newIvcb);
		   logger.debug("newIvcb before insertion: " + newIvcb);
	       sdao.stockReceivingAdd_InventoryChangeVO(newIvcb);
	       logger.debug("inventory_change 테이블에 데이터 삽입 완료");
		}
	    logger.debug("stockReceivingAdd 완료. 최종 tran_num: " + tran_num);
		logger.debug("입고 등록 성공");
	}

	

	private String GetTranNum(TransactionVO tvo) throws Exception{
		logger.debug("GetTranNum() 실행");
		
		String tran_num = sdao.GetTranNum(tvo);
		logger.debug("tran_num : "+ tran_num);
		
		return tran_num;
	}

	@Override
	public List<InventoryVO> getInventoryList(String goods_num) throws Exception {
		logger.debug("getInventoryList(String goodsNum) 실행");
		
		return sdao.getInventoryList(goods_num);
	}

	@Override
	@Transactional
	public void stockReleaseAdd(TransactionVO tvo) throws Exception {
		
		logger.debug("stockReleaseAdd(TransactionVO tvo) 실행 ");
		
		String tran_num = GetTranNum(tvo);
	    logger.debug("생성된 tran_num: " + tran_num);
	    tvo.setTran_num(tran_num);
	    
	    logger.debug("transaction 테이블에 데이터 삽입 시도");
	    sdao.stockReleaseAdd_TransactionVO(tvo);
	    logger.debug("transaction 테이블에 데이터 삽입 완료");
	    
	    logger.debug("top_tran_num : "+tvo.getTop_tran_num());
	    sdao.updateReleaseTopTranstatus(tvo);

		List<InventoryChangeVO> icvoList = tvo.getInchangeList();
		
		// tgvoList에서 각 TransactionGoodsVO 객체를 꺼내어 처리
		for(InventoryChangeVO icvo : icvoList) {
		    // 새로운 TransactionGoodsVO 객체 생성
			InventoryChangeVO newIvcb = new InventoryChangeVO();
		    
		    // 리턴받은 TransactionVO의 tran_num 설정
			newIvcb.setTran_num(tran_num);  // 생성된 tran_num 사용
			newIvcb.setInven_num(icvo.getInven_num());
			newIvcb.setInven_qty(icvo.getInven_qty());
		    
		   logger.debug("inventory_change 테이블에 데이터 삽입 시도: " + newIvcb);
		   logger.debug("newIvcb before insertion: " + newIvcb);
	       sdao.stockReleaseAdd_InventoryChangeVO(newIvcb);
	       logger.debug("inventory_change 테이블에 데이터 삽입 완료");
		}
	    logger.debug("stockReceivingAdd 완료. 최종 tran_num: " + tran_num);
		logger.debug("입고 등록 성공");

	}

	@Override
	public void deleteReleaseList(List<String> trannums, List<String> top_tran_nums) throws Exception {
		logger.debug("입고 삭제 시작: trannums=" + trannums + ", top_tran_nums=" + top_tran_nums);
		// 먼저 inventory_change 테이블에서 삭제
	    sdao.deleteInventoryChange(trannums);
	    
		sdao.deleteRecevingList(trannums);
		
		logger.debug("상위 거래번호 상태 업데이트 시작");
		sdao.updateRLTopTranNum(top_tran_nums);
		logger.debug("상위 거래번호 상태 업데이트 완료");
	}


	@Override
	public int updateDetails(TransactionVO changetrvo) throws Exception {
			logger.debug(" 입고 or 출고 수정 ");
		// 먼저 inventory_change 테이블에서 삭제
	   
		return sdao.updateDetails(changetrvo);
	}
	
	@Transactional
	@Override
	public void updateRecevingStatus(List<String> tran_nums, String pro_status, List<String> top_tran_nums) throws Exception {
		logger.debug(" 입고 상태 업데이트");
		
	    sdao.updateRecevingTopTranStatus(top_tran_nums, pro_status);
		
		sdao.updateRecevingStatus(tran_nums, pro_status);
	}

	@Override
	public void updateReleaseStatus(List<String> tran_nums, String pro_status,List<String> top_tran_nums) throws Exception {
		logger.debug(" 출고 상태 업데이트");
		
	    sdao.updateReleaseTopTranStatus(top_tran_nums, pro_status);

		sdao.updateReleaseStatus(tran_nums, pro_status);		
	}
	
	// 반품 상태 업데이트
	@Override
	public void updateReturnStatus(List<String> tran_nums, String pro_status, List<String> top_tran_nums) throws Exception {
		logger.debug(" 반품 상태 업데이트");
		
	    sdao.updateReleaseTopTranStatus(top_tran_nums, pro_status);

		sdao.updateReleaseStatus(tran_nums, pro_status);	
	}

	@Override
	public List<TransactionVO> receivingPurchaseOrderList() throws Exception {
		
		logger.debug("receivingPurchaseOrderList() 실행");
		
		return sdao.receivingPurchaseOrderList();
	}
	
	@Override
	public List<TransactionVO> receivingExchangeList() throws Exception {
		
		logger.debug("receivingPurchaseOrderList() 실행");
		
		return sdao.receivingExchangeList();
	}
	
	@Override
	public List<TransactionVO> receivingReturnList() throws Exception {
		
		logger.debug("receivingPurchaseOrderList() 실행");
		
		return sdao.receivingReturnList();
	}
	
	@Override
	public List<TransactionVO> releaseSalesOrderList() throws Exception {
		
		logger.debug("releaseSalesOrderList() 실행");
		
		return sdao.releaseSalesOrderList();
	}
	
	@Override
	public List<TransactionVO> releaseExchangeList() throws Exception {
		
		logger.debug("releaseExchangeList() 실행");
		
		return sdao.releaseExchangeList();
	}

}