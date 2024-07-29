package com.itwillbs.domain;

import java.util.List;

import lombok.Data;

@Data
public class GoodsVO {

	private	String	goods_num;
	private	String	item_num;
	private	String	goods_color;
	private	String	goods_size;
	
	private List<ItemVO> itemList;
	private List<InventoryVO> invenList;
	
}
