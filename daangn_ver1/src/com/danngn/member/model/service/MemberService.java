package com.danngn.member.model.service;

import java.sql.Connection;

import com.danngn.common.JDBCTemplate;
import com.danngn.member.model.dao.MemberDao;
import com.danngn.member.model.vo.Member;

public class MemberService {

	//회원가입
	public int insertMember(Member m) {

		Connection conn = JDBCTemplate.getConnection();
		
		int result = new MemberDao().insertMember(conn, m);
		
		if(result>0) {//회원가입 성공시 커밋
			JDBCTemplate.commit(conn);
		}else {//회원가입 실패시 롤백
			JDBCTemplate.rollback(conn);
		}
		
		//자원 닫기
		JDBCTemplate.close(conn);
		
		return result;
	}

	//로그인
	public Member loginMember(String memberId, String memberPwd) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		Member m = new MemberDao().loginMember(conn, memberId, memberPwd);
		
		//자원 반납
		JDBCTemplate.close(conn);
		
		return m;
	}

}
