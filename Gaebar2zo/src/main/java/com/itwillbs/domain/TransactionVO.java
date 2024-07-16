package com.itwillbs.domain;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class TransactionVO {
	
	private	String	tran_num;
	private	String	top_tran_num;
	private	String	cli_num;
	private	String	pic_username;
	private	LocalDateTime	tran_date;
	private	LocalDateTime	rec_date;
	private	LocalDateTime	rel_date;
	private	LocalDateTime	due_date;
	private	String	pro_status;
	private	String	tran_cate_code;
	private	String	comm;

}
