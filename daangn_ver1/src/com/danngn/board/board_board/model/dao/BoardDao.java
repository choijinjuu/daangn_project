package com.danngn.board.board_board.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.danngn.board.board_board.model.vo.Board;
import com.danngn.common.JDBCTemplate;
import com.danngn.common.vo.Attachment;
import com.danngn.member.model.dao.MemberDao;

public class BoardDao {
	
private Properties prop = new Properties();
	
	public BoardDao() {
		
		String filePath = MemberDao.class.getResource("/sql/board/board-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	//게시글 등록
	public int insertBoard(int allCate, Connection conn, Board b) {

		int result = 0;
		int result2 = 0;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		String sql2 = "";
		
		/* 공통 게시글 등록 */
		String sql = prop.getProperty("insertBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, b.getMemberNo());
				pstmt.setString(2, b.getTitle());
				pstmt.setString(3, b.getContent());
				
				result = pstmt.executeUpdate();
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		if(allCate == 1) {
			/* 플리마켓 등록 */
			sql2 = prop.getProperty("insertFlea");
			
			try {
				pstmt2 = conn.prepareStatement(sql2);
				pstmt2.setInt(1, b.getCategory());
				pstmt2.setInt(2, b.getPrice());
				
				result2 = pstmt2.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				JDBCTemplate.close(pstmt2);
			}
		}else if(allCate == 2) {
			/* 동네가게 등록 */
			sql2 = prop.getProperty("insertStores");
			
			try {
				pstmt2 = conn.prepareStatement(sql2);
				pstmt2.setInt(1, b.getCategory());
				pstmt2.setString(2, b.getOpenTime());
				pstmt2.setString(3, b.getCloseTime());
				pstmt2.setString(4, b.getAddress());
				
				result2 = pstmt2.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				JDBCTemplate.close(pstmt2);
			}
			
		}else if(allCate == 3) {
			/* 알바 등록 */
			sql2 = prop.getProperty("insertJobs");
			
			try {
				pstmt2 = conn.prepareStatement(sql2);
				pstmt2.setString(1, b.getAddress());
				pstmt2.setString(2, b.getJobDate());
				
				result2 = pstmt2.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				JDBCTemplate.close(pstmt2);
			}
		}
		
		return result*result2;
	}

	//첨부파일 등록
	public int insertAttach(Connection conn, ArrayList<Attachment> list) {
		
		int result = 1;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertAttach");
		
		try {
			for(Attachment at : list) {
				pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, at.getAtName());
					pstmt.setString(2, at.getAtChange());
					pstmt.setString(3, at.getAtPath());
					pstmt.setInt(4, at.getFileLevel());
					
				result = pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

}
