package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

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
	public Map<String, Object> getReturnDetails(String tran_num) {
		logger.debug(" 반품 모달창 정보 확인 ");
		return sdao.getReturnDetails(tran_num);
	}
	
	// 반품 모달창 품목 정보
	@Override
	public List<Map<String, Object>> getReturnItems(String top_tran_num) {
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
	
	
	private String GetTranNum(TransactionVO tvo) {
		String tran_num = sdao.getTranNum(tvo);
		return tran_num;
	}


	@Override
	public Map<String, Object> getTransactionDetails(String tran_num) {
		// TODO Auto-generated method stub
        return sdao.getTransactionDetails(tran_num);
	}





//	@Override
//	  public void updateStatus(List<String> tranNums, String status) throws Exception{
//        for (String tranNum : tranNums) {
//            sdao.updateStatus(tranNum, status);
//        }
//    }



	
	
	
	
	
	
	
	
	

}