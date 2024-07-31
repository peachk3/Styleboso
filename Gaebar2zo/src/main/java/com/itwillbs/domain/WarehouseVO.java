package com.itwillbs.domain;

import java.util.List;

import lombok.Data;

@Data
public class WarehouseVO {
	
	private	String	wh_num;
	private	String	wh_name;
	private String 	wh_zone;
	private String  wh_rack;
	private String  wh_row;
	private String  wh_column;
	private	String	wh_code;

	private List<InventoryVO> inventoryList;
}
