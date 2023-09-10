package com.danngn.member.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.danngn.board.board_board.model.vo.Board;
import com.danngn.board.board_reply.model.vo.Reply;
import com.danngn.common.JDBCTemplate;
import com.danngn.common.vo.PageInfo;
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
								,rset.getString("ENROLL_DATE")
								,rset.getString("PROFILE_IMG")
								,rset.getString("UPDATE_DATE"));
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

	//회원정보 수정
	public int updateMember(Connection conn, Member m) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateMember");
		
			try {
				pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, m.getMemberPwd());
					pstmt.setString(2, m.getAddress());
					pstmt.setString(3, m.getEmail());
					pstmt.setString(4, m.getProfile_img());
					pstmt.setInt(5, m.getMemberNo());
					
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				JDBCTemplate.close(pstmt);
			}
		
		return result;
	}

	//작성한 게시글 총 수 조회
	public int BoardListCount(Connection conn, int memberNo) {
		
		int listCount = 0;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("boardTotalCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, memberNo);
		
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("COUNT");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return listCount;
	}

	//작성한 게시글 리스트
	public ArrayList<Board> selectBoardList(Connection conn, int memberNo, PageInfo pi) {
		
		ArrayList<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		//중고거래 총 게시글 리스트
		String sql = prop.getProperty("selectBoardList");			
		
		try {
			int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit()+1;
			int endRow = (startRow+pi.getBoardLimit())-1;
			
			pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, memberNo);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
		
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Board(rset.getInt("BOARD_NO"),
									rset.getInt("MEMBER_NO"),
									rset.getString("TITLE"),
									rset.getInt("COUNT"),
									rset.getString("CATEGORY"),
									rset.getString("TITLEIMG")));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

	//작성한 댓글 수
	public int ReplyListCount(Connection conn, int memberNo) {
		
		int listCount = 0;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("replyTotalCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, memberNo);
		
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("COUNT");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return listCount;
	}

	//작성한 댓글 리스트
	public ArrayList<Reply> selectReplyList(Connection conn, int memberNo, PageInfo pi) {
		
		ArrayList<Reply> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectReplyList");			
		
		try {
			int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit()+1;
			int endRow = (startRow+pi.getBoardLimit())-1;
			
			pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, memberNo);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
		
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Reply(rset.getInt("REPLY_NO"),
									rset.getInt("BOARD_NO"),
									rset.getInt("MEMBER_NO"),
									rset.getString("CONTENT"),
									rset.getString("TITLE"),
									rset.getString("CATEGORY"),
									rset.getString("TITLEIMG")));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

}
