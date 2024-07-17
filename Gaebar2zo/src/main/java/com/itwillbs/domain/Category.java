package com.itwillbs.domain;

/*
  게시판 카테고리 설정을 위해 생성된 객체
  - 판매상태, 구장
 */

public class Category {
	
	private String sale_status;
	private String stad_id;
	
	private String ticket_status;
	private String boardTable_id;
	private String user_id;
	
	
	public Category(){
		this.sale_status = "ALL";
		this.stad_id = "ALL";
		this.ticket_status = "Upcoming";
		this.boardTable_id = "All";
	}
	
	public String getSale_status() {
		return sale_status;
	}
	public void setSale_status(String sale_status) {
		this.sale_status = sale_status;
	}

	public String getStad_id() {
		return stad_id;
	}
	public void setStad_id(String stad_id) {
		this.stad_id = stad_id;
	}
	
	public String getTicket_status() {
		return ticket_status;
	}
	public void setTicket_status(String ticket_status) {
		this.ticket_status = ticket_status;
	}
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
	public String getBoardTable_id() {
		return boardTable_id;
	}

	public void setBoardTable_id(String boardTable_id) {
		this.boardTable_id = boardTable_id;
	}

	@Override
	public String toString() {
		return "Category [sale_status=" + sale_status + ", stad_id=" + stad_id + ", ticket_status=" + ticket_status
				+ ", boardTable_id=" + boardTable_id + ", user_id=" + user_id + "]";
	}

	
}
