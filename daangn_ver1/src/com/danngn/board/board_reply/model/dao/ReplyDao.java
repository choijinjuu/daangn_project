package com.danngn.board.board_reply.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.danngn.board.board_reply.model.vo.Reply;
import com.danngn.common.JDBCTemplate;
import com.danngn.member.model.dao.MemberDao;

public class ReplyDao {
	
	private Properties prop = new Properties();
	
	public ReplyDao() {
		
		String filePath = MemberDao.class.getResource("/sql/board/reply-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	//댓글 작성
	public int insertReply(Connection conn, Reply r) {
		
		int result = 0;
		PreparedStatement pstmt =null;
		
		String sql = prop.getProperty("insertReply");
		
		try {
			pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, r.getBoardNo());
				pstmt.setInt(2, r.getMemberNo());
				pstmt.setString(3, r.getContent());
				pstmt.setInt(4, r.getSecret());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	//댓글 목록 불러오기
	public ArrayList<Reply> selectReply(Connection conn, int boardNo) {
		
		ArrayList<Reply> rlist = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectReply");
		
		try {
			pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, boardNo);
				
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				rlist.add(new Reply(rset.getInt("REPLY_NO"),
									rset.getInt("BOARD_NO"),
									rset.getInt("MEMBER_NO"),
									rset.getString("CONTENT"),
									rset.getString("CREATE_DATE"),
									rset.getInt("SECRET"),
									rset.getString("PROFILE_IMG")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return rlist;
	}

	//댓글 삭제
	public int deleteBoard(Connection conn, int replyNo) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		//게시글 삭제
		String sql = prop.getProperty("deleteReply");
		
		//게시글 삭제
		try {
			pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, replyNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

}
