package com.itwillbs.domain;

import java.util.List;

import lombok.Data;

@Data
public class TransactionGoodsVO {
	
	private	String	tran_num;
	private	String	goods_num;
	private	Integer	goods_qty;
	
	private List<ItemVO> itemList;

	
	
	
}
