package com.danngn.board.board_board.model.vo;

public class Board {
	
	//BOARD_NO		NUMBER
	//MEMBER_NO		NUMBER
	//TITLE			VARCHAR2(80 BYTE)
	//CONTENT		VARCHAR2(500 BYTE)
	//COUNT			NUMBER
	//CREATE_DATE	DATE
	
	private int boardNo;
	private int memberNo;
	private String title;
	private String content;
	private int count;
	private String createDate;
	private int category;
	private int price;
	private String openTime;
	private String closeTime;
	private String address;
	private String jobDate;
	
	public Board() {
		super();
	}
	public Board(int memberNo, String title, String content, int category, int price, String openTime, String closeTime,
			String address, String jobDate) {
		super();
		this.memberNo = memberNo;
		this.title = title;
		this.content = content;
		this.category = category;
		this.price = price;
		this.openTime = openTime;
		this.closeTime = closeTime;
		this.address = address;
		this.jobDate = jobDate;
	}
	public Board(int boardNo, int memberNo, String title, String content, int count, String createDate, int category,
			int price, String openTime, String closeTime, String address, String jobDate) {
		super();
		this.boardNo = boardNo;
		this.memberNo = memberNo;
		this.title = title;
		this.content = content;
		this.count = count;
		this.createDate = createDate;
		this.category = category;
		this.price = price;
		this.openTime = openTime;
		this.closeTime = closeTime;
		this.address = address;
		this.jobDate = jobDate;
	}
	
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getOpenTime() {
		return openTime;
	}
	public void setOpenTime(String openTime) {
		this.openTime = openTime;
	}
	public String getCloseTime() {
		return closeTime;
	}
	public void setCloseTime(String closeTime) {
		this.closeTime = closeTime;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getJobDate() {
		return jobDate;
	}
	public void setJobDate(String jobDate) {
		this.jobDate = jobDate;
	}
	
	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", memberNo=" + memberNo + ", title=" + title + ", content=" + content
				+ ", count=" + count + ", createDate=" + createDate + ", category=" + category + ", price=" + price
				+ ", openTime=" + openTime + ", closeTime=" + closeTime + ", address=" + address + ", jobDate="
				+ jobDate + "]";
	}
}