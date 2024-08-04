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
import com.itwillbs.domain.TransactionGoodsVO;
import com.itwillbs.domain.TransactionVO;
import com.itwillbs.persistence.StockDAO;

@Service
public class StockServiceImpl implements StockService{
	@Inject
	private StockDAO sdao;

	
	private static final Logger logger = LoggerFactory.getLogger(StockServiceImpl.class);
	
	
	// 입고 리스트 호출
	@Override
	public List<TransactionVO> rcList() throws Exception {
		logger.debug("ServiceImpl + 입고 리스트 호출");
		
		
		return sdao.rcList();
	}

	
	// 출고 리스트 호출
	@Override
	public List<TransactionVO> rsList() throws Exception {
		logger.debug("ServiceImpl + 출고 리스트 호출");
		
		
		return sdao.rsList();
	}

	// 재고 리스트 호출
	@Override
	public List<InventoryVO> getStockList(Criteria cri) throws Exception {
		logger.debug("ServiceImpl + 재고 리스트 호출");
		int page = (cri.getPage() - 1)*10;
		
		cri.setPage(page);
		
		logger.debug("cri : " + cri);
		
		return sdao.getStockList(cri);
	}


	@Override
	public int getTotalCount() throws Exception {
		logger.debug(" getTotalCount() 실행 ");
		return sdao.getTotalCount();
	}


	@Override
	public Map<String, Object> getTransactionDetails(String tran_num) throws Exception{

		logger.debug("입고 모달창 정보 확인");
		
		return sdao.getTransactionDetails(tran_num);
	}


	@Override
	public void deleteRecevingList(List<String> trannums) throws Exception {
		logger.debug(" 입고 삭제 ");
		
		sdao.deleteRecevingList(trannums);
	}


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
	public List<Map<String, Object>> getTransactionItems2(String tran_num) throws Exception {
		logger.debug("출고 모달창 품목 정보 확인");
		
		
		return sdao.getTransactionItems2(tran_num);
	}


	@Override
	@Transactional
	public void stockReceivingAdd(TransactionVO tvo) throws Exception {
		
		logger.debug("stockReceivingAdd(TransactionVO tvo) 실행 ");
		
		
//		tvo.setTran_num(GetTranNum(tvo));
		
		String tran_num = GetTranNum(tvo);
	    logger.debug("생성된 tran_num: " + tran_num);
	    tvo.setTran_num(tran_num);
	    
	    
	    logger.debug("transaction 테이블에 데이터 삽입 시도");
	    sdao.stockReceivingAdd_TransactionVO(tvo);
	    logger.debug("transaction 테이블에 데이터 삽입 완료");
	    
	    
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

	

	private String GetTranNum(TransactionVO tvo) {
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

	
	
	
	
//	@Override
//	  public void updateStatus(List<String> tranNums, String status) throws Exception{
//        for (String tranNum : tranNums) {
//            sdao.updateStatus(tranNum, status);
//        }
//    }



	
	
	
	
	
	
	
	
	

}