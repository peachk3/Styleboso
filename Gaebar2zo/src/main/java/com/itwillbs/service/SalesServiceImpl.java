package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.itwillbs.domain.TransactionGoodsVO;
import com.itwillbs.domain.TransactionVO;
import com.itwillbs.persistence.SalesDAO;

@Service
public class SalesServiceImpl implements SalesService{
	
	private static final Logger logger = LoggerFactory.getLogger(SalesServiceImpl.class);

	@Inject
	private SalesDAO sdao;

	@Override
	public void SalesOrderAdd(TransactionVO tvo) throws Exception {
		
		logger.debug("SalesOrderAdd() 실행");
		
		tvo.setTran_num(GetTranNum(tvo));
		
		// DAO 메서드 호출
		sdao.salesOrderAdd_TransactionVO(tvo);
		
		List<TransactionGoodsVO> tgvoList = tvo.getTgvo();
		
		// tgvoList에서 각 TransactionGoodsVO 객체를 꺼내어 처리
		for (TransactionGoodsVO tgvo : tgvoList) {
			
		    // 새로운 TransactionGoodsVO 객체 생성
		    TransactionGoodsVO newTgvo = new TransactionGoodsVO();
		    
		    // 리턴받은 TransactionVO의 tran_num 설정
		    newTgvo.setTran_num(tvo.getTran_num());

		    // 원래 tgvo의 goods_num과 goods_qty 설정
		    newTgvo.setGoods_num(tgvo.getGoods_num());
		    newTgvo.setGoods_qty(tgvo.getGoods_qty());
		    
		    sdao.salesOrderAdd_TransactionGoodsVO(newTgvo);
		}
		
		logger.debug("수주 등록 성공");
		
	}
	
	private String GetTranNum(TransactionVO tvo) {
		logger.debug("GetTranNum() 실행");
		
		String tran_num = sdao.GetTranNum(tvo);
		logger.debug("tran_num : "+ tran_num);
		
		return tran_num;
	}



}