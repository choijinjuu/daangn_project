package com.danngn.board.board_board.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.danngn.board.board_board.model.vo.Board;
import com.danngn.common.JDBCTemplate;
import com.danngn.common.vo.Attachment;
import com.danngn.common.vo.PageInfo;
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
	public int insertBoard(String category, Connection conn, Board b) {

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
				pstmt.setString(4, b.getCategory());
				
				result = pstmt.executeUpdate();
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		if(category.equals("1")) {
			/* 플리마켓 등록 */
			sql2 = prop.getProperty("insertFlea");
			
			try {
				pstmt2 = conn.prepareStatement(sql2);
				pstmt2.setString(1, b.getSubCategory());
				pstmt2.setInt(2, b.getPrice());
				
				result2 = pstmt2.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				JDBCTemplate.close(pstmt2);
			}
		}else if(category.equals("2")) {
			/* 동네가게 등록 */
			sql2 = prop.getProperty("insertStores");
			
			try {
				pstmt2 = conn.prepareStatement(sql2);
				pstmt2.setString(1, b.getSubCategory());
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
			
		}else if(category.equals("3")) {
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

	//중고거래 총 게시물 수
	public int totalFleaListCount(Connection conn) {
		
		int listCount = 0;
		ResultSet rset = null;
		Statement stmt = null;
		
		String sql = prop.getProperty("fleaTotalCount");
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			if(rset.next()) {
				listCount = rset.getInt("COUNT");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(stmt);
		}
		
		return listCount;
	}
	
	//중고거래 카테고리로 검색시 총 게시글 수
	public int totalFleaListCount(Connection conn, int subCategory) {
		
		int listCount = 0;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("fleaCateTotalCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, subCategory);
		
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

	//중고거래 리스트
	public ArrayList<Board> selectFleatList(Connection conn, PageInfo pi) {

		ArrayList<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectFleaList");
		
		try {
			int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit()+1;
			int endRow = (startRow+pi.getBoardLimit())-1;
			
			pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
		
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Board(rset.getInt("BOARD_NO"),
								rset.getInt("MEMBER_NO"),
								rset.getString("TITLE"),
								rset.getInt("COUNT"),
								rset.getString("CATEGORY"),
								rset.getInt("PRICE"),
								rset.getString("ADDRESS"),
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

	//중고거래 카테고리 검색시 리스트
	public ArrayList<Board> selectFleatList(Connection conn, int subCategory, PageInfo pi) {

		ArrayList<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCateFleaList");
		
		try {
			int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit()+1;
			int endRow = (startRow+pi.getBoardLimit())-1;
			
			pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, subCategory);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
		
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Board(rset.getInt("BOARD_NO"),
								rset.getInt("MEMBER_NO"),
								rset.getString("TITLE"),
								rset.getInt("COUNT"),
								rset.getString("SUB_CATEGORY"),
								rset.getInt("PRICE"),
								rset.getString("ADDRESS"),
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

	//중고거래 상세보기
	public Board BoardDetail(Connection conn, int boardNo) {
		
		Board b = null;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("boardDetail");
		
		try {
			pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, boardNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				b = new Board(rset.getInt("BOARD_NO"),
								rset.getInt("MEMBER_NO"),
								rset.getString("WRITER"),
								rset.getString("TITLE"),
								rset.getString("CONTENT"),
								rset.getInt("COUNT"),
								rset.getString("CATEGORY"),
								rset.getInt("PRICE"),
								rset.getString("SUB_CATEGORY"),
								rset.getString("ADDRESS"),
								rset.getString("PROFILE_IMG"),
								rset.getString("TITLEIMG"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return b;
	}

	//게시글 삭제
	public int deleteBoard(Connection conn, int boardNo) {
		
		int result = 0;
		int result2 = 0;
		int result3 = 0;
		PreparedStatement pstmt = null;
		
		//게시글 삭제
		String sql = prop.getProperty("deleteBoard");
		//파일 삭제
		String sql2 = prop.getProperty("deleteAttach");
		//플리마켓 삭제
		String sql3 = prop.getProperty("deleteFlea");
		
		//게시글 삭제
		try {
			pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, boardNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		//어태치 삭제
		try {
			pstmt = conn.prepareStatement(sql2);
				pstmt.setInt(1, boardNo);
			
			result2 = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		//중고거래 삭제
		try {
			pstmt = conn.prepareStatement(sql3);
				pstmt.setInt(1, boardNo);
			
			result3 = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result*result2*result3;
	}

	//게시글 수정
	public int updateBoard(String category, Connection conn, Board b) {
		
		int result = 0;
		int result2 = 0;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		String sql2 = "";
		
		/* 공통 게시글 수정 */
		String sql = prop.getProperty("updateBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, b.getTitle());
				pstmt.setString(2, b.getContent());
				pstmt.setInt(3, b.getBoardNo());
				
			result = pstmt.executeUpdate();
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		if(category.equals("1")) {
			/* 플리마켓 수정 */
			sql2 = prop.getProperty("updateFlea");
			
			try {
				pstmt2 = conn.prepareStatement(sql2);
					pstmt2.setString(1, b.getSubCategory());
					pstmt2.setInt(2, b.getPrice());
					pstmt2.setInt(3, b.getBoardNo());
				
				result2 = pstmt2.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				JDBCTemplate.close(pstmt2);
			}
		}else if(category.equals("2")) {
			/* 동네가게 수정 */
			sql2 = prop.getProperty("updateStores");
			
			try {
				pstmt2 = conn.prepareStatement(sql2);
					pstmt2.setString(1, b.getSubCategory());
					pstmt2.setString(2, b.getOpenTime());
					pstmt2.setString(3, b.getCloseTime());
					pstmt2.setString(4, b.getAddress());
					pstmt2.setInt(5, b.getBoardNo());
				
				result2 = pstmt2.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				JDBCTemplate.close(pstmt2);
			}
			
		}else if(category.equals("3")) {
			/* 알바 등록 */
			sql2 = prop.getProperty("updateJobs");
			
			try {
				pstmt2 = conn.prepareStatement(sql2);
					pstmt2.setString(1, b.getAddress());
					pstmt2.setString(2, b.getJobDate());
					pstmt2.setInt(3, b.getBoardNo());
						
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

	//첨부파일 수정
	public int updateAttach(Connection conn, ArrayList<Attachment> list) {
		
		int result = 1;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateAttach");
		
		try {
			for(Attachment at : list) {
				pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, at.getAtName());
					pstmt.setString(2, at.getAtChange());
					pstmt.setString(3, at.getAtPath());
					pstmt.setInt(4, at.getFileLevel());
					pstmt.setInt(5, at.getBoardNo());
					
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
