package com.itwillbs.domain;

import java.util.List;

import lombok.Data;

@Data
public class ItemVO {
	
	private	String	item_num;
	private	String	item_cate_code;
	private	String	item_cli_code;
	private	String	item_name;
	private	Integer item_purchase_price;
	private	String	item_mat;
	private	String	comm;
	
	private String group_name;
	
	private List<ItemCodeVO> itemCodeList;
	private List<CodeVO> codeList;
	
	private List<TransactionGoodsVO> tranGoodsList;
	
	private List<GoodsVO> goodsList;
	private List<InventoryVO> inventoryList;

	
}
