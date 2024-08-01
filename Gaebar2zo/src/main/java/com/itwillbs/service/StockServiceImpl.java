package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.Criteria;
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