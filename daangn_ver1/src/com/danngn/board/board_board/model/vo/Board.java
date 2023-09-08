package com.danngn.board.board_board.model.vo;

import com.danngn.common.vo.Attachment;
import com.danngn.member.model.vo.Member;

public class Board {
	
	//BOARD_NO		NUMBER
	//MEMBER_NO		NUMBER
	//TITLE			VARCHAR2(80 BYTE)
	//CONTENT		VARCHAR2(500 BYTE)
	//COUNT			NUMBER
	//CREATE_DATE	DATE
	
	private int boardNo;
	private int memberNo;
	private String writer;
	private String title;
	private String content;
	private int count;
	private String createDate;
	private String category;
	private int price;
	private String subCategory;
	private String openTime;
	private String closeTime;
	private String address;
	private String jobDate;
	
	private String titleImg;
	private String profileImg;
	
	//기본생성자
	public Board() {
		super();
	}
	//게시글 작성 생성자
	public Board(int memberNo, String title, String content, String category, int price, String subCategory,
			String openTime, String closeTime, String address, String jobDate) {
		super();
		this.memberNo = memberNo;
		this.title = title;
		this.content = content;
		this.category = category;
		this.price = price;
		this.subCategory = subCategory;
		this.openTime = openTime;
		this.closeTime = closeTime;
		this.address = address;
		this.jobDate = jobDate;
	}
	//게시글 수정 생성자
	public Board(int boardNo, int memberNo, String title, String content, String category, int price,
			String subCategory, String openTime, String closeTime, String address, String jobDate) {
		super();
		this.boardNo = boardNo;
		this.memberNo = memberNo;
		this.title = title;
		this.content = content;
		this.category = category;
		this.price = price;
		this.subCategory = subCategory;
		this.openTime = openTime;
		this.closeTime = closeTime;
		this.address = address;
		this.jobDate = jobDate;
	}
	//중고거래 리스트 생성자 추후 모든 카테고리로 하나 만들어야될듯..*****************
	public Board(int boardNo, int memberNo, String title, int count, String category, int price, String address,
			String titleImg) {
		super();
		this.boardNo = boardNo;
		this.memberNo = memberNo;
		this.title = title;
		this.count = count;
		this.category = category;
		this.price = price;
		this.address = address;
		this.titleImg = titleImg;
	}
	//중고거래 디테일 게시글 생성자 추후 모든 카테괴 하나로 만들어야ㄷ될듯@@@************
	public Board(int boardNo, int memberNo, String writer, String title, String content, int count, String category, int price,
			String subCategory, String address, String titleImg, String profileImg) {
		super();
		this.boardNo = boardNo;
		this.memberNo = memberNo;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.count = count;
		this.category = category;
		this.price = price;
		this.subCategory = subCategory;
		this.address = address;
		this.titleImg = titleImg;
		this.profileImg = profileImg;
	}
	public Board(int boardNo, int memberNo, String writer, String title, String content, int count, String createDate,
			String category, int price, String subCategory, String openTime, String closeTime,
			String address, String jobDate, String titleImg, String profileImg) {
		super();
		this.boardNo = boardNo;
		this.memberNo = memberNo;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.count = count;
		this.createDate = createDate;
		this.category = category;
		this.price = price;
		this.subCategory = subCategory;
		this.openTime = openTime;
		this.closeTime = closeTime;
		this.address = address;
		this.jobDate = jobDate;
		this.titleImg = titleImg;
		this.profileImg = profileImg;
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
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
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
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getSubCategory() {
		return subCategory;
	}
	public void setSubCategory(String subCategory) {
		this.subCategory = subCategory;
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
	public String getTitleImg() {
		return titleImg;
	}
	public void setTitleImg(String titleImg) {
		this.titleImg = titleImg;
	}
	public String getProfileImg() {
		return profileImg;
	}
	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}
	
	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", memberNo=" + memberNo + ", writer=" + writer + ", title=" + title
				+ ", content=" + content + ", count=" + count + ", createDate=" + createDate + ", category=" + category
				+ ", price=" + price + ", subCategory=" + subCategory + ", openTime=" + openTime + ", closeTime="
				+ closeTime + ", address=" + address + ", jobDate=" + jobDate + ", titleImg=" + titleImg
				+ ", profileImg=" + profileImg + "]";
	}
}