package com.danngn.board.board_reply.model.vo;

public class Reply {
	
	//	REPLY_NO
	//	BOARD_NO
	//	USER_NO
	//	CONTENT
	//	CREATE_DATE
	//	SECRET
	
	private int replyNo;
	private int boardNo;
	private int memberNo;
	private String content;
	private String createDate;
	private int secret;
	
	private String title;
	private String category;
	private String titleImg;
	private String profileImg;
	
	public Reply() {
		super();
	}
	//회원이 쓴 리플 리스트 생성자
		public Reply(int replyNo, int boardNo, int memberNo, String content, String title, String category,
				String titleImg) {
			super();
			this.replyNo = replyNo;
			this.boardNo = boardNo;
			this.memberNo = memberNo;
			this.content = content;
			this.title = title;
			this.category = category;
			this.titleImg = titleImg;
		}
		//게시판 중 댓글 목록 생성자
		public Reply(int replyNo, int boardNo, int memberNo, String content, String createDate, int secret, String profileImg) {
			super();
			this.replyNo = replyNo;
			this.boardNo = boardNo;
			this.memberNo = memberNo;
			this.content = content;
			this.createDate = createDate;
			this.secret = secret;
			this.profileImg = profileImg;
		}
	public Reply(int replyNo, int boardNo, int memberNo, String content, String createDate, int secret, String title,
			String category, String titleImg, String profileImg) {
		super();
		this.replyNo = replyNo;
		this.boardNo = boardNo;
		this.memberNo = memberNo;
		this.content = content;
		this.createDate = createDate;
		this.secret = secret;
		this.title = title;
		this.category = category;
		this.titleImg = titleImg;
		this.profileImg = profileImg;
	}
	
	public int getReplyNo() {
		return replyNo;
	}
	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public int getSecret() {
		return secret;
	}
	public void setSecret(int secret) {
		this.secret = secret;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
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
		return "Reply [replyNo=" + replyNo + ", boardNo=" + boardNo + ", memberNo=" + memberNo + ", content=" + content
				+ ", createDate=" + createDate + ", secret=" + secret + ", title=" + title + ", category=" + category
				+ ", titleImg=" + titleImg + ", profileImg=" + profileImg + "]";
	}
}
