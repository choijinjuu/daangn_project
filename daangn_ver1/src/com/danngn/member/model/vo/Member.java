package com.danngn.member.model.vo;

public class Member {
	
	//MEMBER_NO		NUMBER
	//MEMBER_ID		VARCHAR2(30 BYTE)
	//MEMBER_PWD	VARCHAR2(30 BYTE)
	//ADDRESS		VARCHAR2(100 BYTE)
	//EMAIL			VARCHAR2(30 BYTE)
	//ENROLL_DATE	DATE
	
	private int memberNo;
	private String memberId;
	private String memberPwd;
	private String address;
	private String email;
	private String enrollDate;
	private String frofile_img;
	
	public Member() {
		super();
	}
	public Member(int memberNo, String memberId, String memberPwd, String address, String email, String enrollDate,
			String frofile_img) {
		super();
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.address = address;
		this.email = email;
		this.enrollDate = enrollDate;
		this.frofile_img = frofile_img;
	}
	
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberPwd() {
		return memberPwd;
	}
	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getEnrollDate() {
		return enrollDate;
	}
	public void setEnrollDate(String enrollDate) {
		this.enrollDate = enrollDate;
	}
	public String getFrofile_img() {
		return frofile_img;
	}
	public void setFrofile_img(String frofile_img) {
		this.frofile_img = frofile_img;
	}
	
	@Override
	public String toString() {
		return "Member [memberNo=" + memberNo + ", memberId=" + memberId + ", memberPwd=" + memberPwd + ", address="
				+ address + ", email=" + email + ", enrollDate=" + enrollDate + ", frofile_img=" + frofile_img + "]";
	}
}
