package com.danngn.member.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.danngn.common.JDBCTemplate;
import com.danngn.member.model.vo.Member;

public class MemberDao {
	
	private Properties prop = new Properties();
	
	public MemberDao() {
		
		String filePath = MemberDao.class.getResource("/sql/member/member-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	//회원가입
	public int insertMember(Connection conn, Member m) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertMember");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, m.getMemberId());
				pstmt.setString(2, m.getMemberPwd());
				pstmt.setString(3, m.getAddress());
				pstmt.setString(4, m.getEmail());
				
				result = pstmt.executeUpdate();
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	//로그인
	public Member loginMember(Connection conn, String memberId, String memberPwd) {
		
		Member m = null;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("loginMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, memberId);
				pstmt.setString(2, memberPwd);
				
			rset = pstmt.executeQuery();
			
			//유저 정보 담아주기
			if(rset.next()) {
				m = new Member(rset.getInt("MEMBER_NO")
								,rset.getString("MEMBER_ID")
								,rset.getString("MEMBER_PWD")
								,rset.getString("ADDRESS")
								,rset.getString("EMAIL")
								,rset.getString("ENROLL_DATE"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return m;
	}

}
