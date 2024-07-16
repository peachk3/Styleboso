package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.TransactionVO;
import com.itwillbs.persistence.StockDAO;

@Service
public class StockServiceImpl implements StockService{
	@Inject
	private StockDAO sdao;

	// 입고 리스트 호출
	@Override
	public List<TransactionVO> rcList() throws Exception {

		
		
		return sdao.rcList();
	}

	
	
	
	
	
	
	
	

}