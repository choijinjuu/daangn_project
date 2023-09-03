package com.danngn.common.vo;

public class Attachment {
	
	//	FILE_NO	NUMBER
	//	BOARD_NO	NUMBER
	//	AT_NAME	VARCHAR2(50 BYTE)
	//	AT_CHANGE	VARCHAR2(50 BYTE)
	//	AT_PATH	VARCHAR2(80 BYTE)
	//	AT_DATE	DATE
	//	FILE_LEVEL	NUMBER
	
	private int fileNo;
	private int boardNo;
	private String atName;
	private String atChange;
	private String atPath;
	private String atDate;
	private int fileLevel;
	
	public Attachment() {
		super();
	}
	public Attachment(int fileNo, int boardNo, String atName, String atChange, String atPath, String atDate,
			int fileLevel) {
		super();
		this.fileNo = fileNo;
		this.boardNo = boardNo;
		this.atName = atName;
		this.atChange = atChange;
		this.atPath = atPath;
		this.atDate = atDate;
		this.fileLevel = fileLevel;
	}
	
	public int getFileNo() {
		return fileNo;
	}
	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getAtName() {
		return atName;
	}
	public void setAtName(String atName) {
		this.atName = atName;
	}
	public String getAtChange() {
		return atChange;
	}
	public void setAtChange(String atChange) {
		this.atChange = atChange;
	}
	public String getAtPath() {
		return atPath;
	}
	public void setAtPath(String atPath) {
		this.atPath = atPath;
	}
	public String getAtDate() {
		return atDate;
	}
	public void setAtDate(String atDate) {
		this.atDate = atDate;
	}
	public int getFileLevel() {
		return fileLevel;
	}
	public void setFileLevel(int fileLevel) {
		this.fileLevel = fileLevel;
	}
	
	@Override
	public String toString() {
		return "Attachment [fileNo=" + fileNo + ", boardNo=" + boardNo + ", atName=" + atName + ", atChange=" + atChange
				+ ", atPath=" + atPath + ", atDate=" + atDate + ", fileLevel=" + fileLevel + "]";
	}
}
