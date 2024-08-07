package com.itwillbs.domain;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import lombok.Data;

@Data
public class TransactionVO {
	
	private	String	tran_num;
	private	String	top_tran_num;
	private	String	cli_num;
	private	String	pic_username;
	private	int	expenditure;
	private	int	income;
  
	private	Date	tran_date;
	private	Date	rec_date;
	private	Date	rel_date;
	private	Date	due_date;
	private	Date	ex_due_date;
  private Date  regdate;
  
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
	
	
	public void setInchangeList(List<InventoryChangeVO> inchangeList) {
	    this.inchangeList = new ArrayList<>(inchangeList);
	}
	
	
	
}
