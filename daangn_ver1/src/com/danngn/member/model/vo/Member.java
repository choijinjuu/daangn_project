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
	private String profile_img;
	private String updateDate;
	
	private int fileLevel;
	
	public Member() {
		super();
	}
	//회원가입 생성자
	public Member(String memberId, String memberPwd, String address, String email) {
		super();
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.address = address;
		this.email = email;
	}
	//정보수정 생성자
	public Member(int memberNo, String memberPwd, String address, String email, String profile_img) {
		super();
		this.memberNo = memberNo;
		this.memberPwd = memberPwd;
		this.address = address;
		this.email = email;
		this.profile_img = profile_img;
	}
	public Member(int memberNo, String memberId, String memberPwd, String address, String email, String enrollDate,
			String profile_img, String updateDate) {
		super();
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.address = address;
		this.email = email;
		this.enrollDate = enrollDate;
		this.profile_img = profile_img;
		this.updateDate = updateDate;
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

	public String getProfile_img() {
		return profile_img;
	}

	public void setProfile_img(String profile_img) {
		this.profile_img = profile_img;
	}

	public String getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}

	public int getFileLevel() {
		return fileLevel;
	}

	public void setFileLevel(int fileLevel) {
		this.fileLevel = fileLevel;
	}

	@Override
	public String toString() {
		return "Member [memberNo=" + memberNo + ", memberId=" + memberId + ", memberPwd=" + memberPwd + ", address="
				+ address + ", email=" + email + ", enrollDate=" + enrollDate + ", profile_img=" + profile_img
				+ ", updateDate=" + updateDate + ", fileLevel=" + fileLevel + "]";
	}
}
