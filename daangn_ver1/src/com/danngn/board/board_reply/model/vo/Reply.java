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
	
	public Reply() {
		super();
	}
	public Reply(int replyNo, int boardNo, int memberNo, String content, String createDate, int secret) {
		super();
		this.replyNo = replyNo;
		this.boardNo = boardNo;
		this.memberNo = memberNo;
		this.content = content;
		this.createDate = createDate;
		this.secret = secret;
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
	
	@Override
	public String toString() {
		return "Reply [replyNo=" + replyNo + ", boardNo=" + boardNo + ", memberNo=" + memberNo + ", content=" + content
				+ ", createDate=" + createDate + ", secret=" + secret + "]";
	}
}
