package com.itwillbs.domain;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class ShipmentVO {
	
	private	String	ship_num;
	private	String	tran_num;
	private	String	ship_wh_code;
	private	LocalDateTime	ship_due_date;
	private	String	comm;

}
