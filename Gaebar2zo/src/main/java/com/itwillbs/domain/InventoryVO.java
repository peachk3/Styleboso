package com.itwillbs.domain;

import java.util.List;

import lombok.Data;

@Data
public class InventoryVO {

	private	String	inven_num;
	private	String	wh_num;
	private	String	goods_num;
	private	Integer	inven_qty;
	
	private List<ItemVO> itemList;
	private List<GoodsVO> goodsList;
	private List<WarehouseVO> warehouseList;
}
