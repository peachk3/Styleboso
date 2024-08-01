package com.itwillbs.domain;

import java.sql.Timestamp;
import java.util.List;

import lombok.Data;

@Data
public class TransactionVO {
	
	private	String	tran_num;
	private	String	top_tran_num;
	private	String	cli_num;
	private	String	pic_username;
	private	Timestamp	tran_date;
	private	Timestamp	rec_date;
	private	Timestamp	rel_date;
	private	Timestamp	due_date;
	private	Timestamp	ex_due_date;
	private	String	pro_status;
	private	String	tran_cate_code;
	private	String	comm;

	// TransactionGoodsVO 조인
	private List<TransactionGoodsVO> tgvo;
	
	// ItemVO 조인
	private List<ItemVO> itemList;
	
	// InventoryChangeVO 조인
	private List<InventoryChangeVO> inchangeList;
	
	private List<ClientVO> clientList;
	
	private List<UsersVO> userList;
	
	private List<GoodsVO> goodsList;
	
}
