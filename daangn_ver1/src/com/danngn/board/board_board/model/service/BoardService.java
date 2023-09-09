package com.danngn.board.board_board.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.danngn.board.board_board.model.dao.BoardDao;
import com.danngn.board.board_board.model.vo.Board;
import com.danngn.common.JDBCTemplate;
import com.danngn.common.vo.Attachment;
import com.danngn.common.vo.PageInfo;

public class BoardService {

	//게시글 등록
	public int insertBoard(String category, Board b, ArrayList<Attachment> list) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		//게시글 등록
		int result = new BoardDao().insertBoard(category, conn, b);
		
		//첨부파일 등록
		int result2 = new BoardDao().insertAttach(conn, list);

		if(result*result2>0) {//게시글 등록 성공시
			JDBCTemplate.commit(conn);
		}else {//게시글 등록 실패시
			JDBCTemplate.rollback(conn);
		}
		
		//자원 닫기
		JDBCTemplate.close(conn);
		
		return result*result2;
	}

	//중고거래 총 게시물 수
//	public int totalFleaListCount() {
//		
//		Connection conn = JDBCTemplate.getConnection();
//		
//		int totalFleaListCount = new BoardDao().totalFleaListCount(conn);
//		
//		JDBCTemplate.close(conn);
//		
//		return totalFleaListCount;
//	}
	
	//게시글 총 게시물 수
	public int totalListCount(int category) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int totalListCount = new BoardDao().totalListCount(conn, category);
		
		JDBCTemplate.close(conn);
		
		return totalListCount;
	}
	
	//카테고리 검색시 총 게시물 수
	public int totalListCount(int category, int subCategory) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int totalListCount = new BoardDao().totalListCount(conn, category, subCategory);
		
		JDBCTemplate.close(conn);
		
		return totalListCount;
	}

	//중고거래 리스트
//	public ArrayList<Board> selectFleatList(PageInfo pi) {
//		
//		Connection conn = JDBCTemplate.getConnection();
//		
//		ArrayList<Board> list = new BoardDao().selectFleatList(conn, pi);
//		
//		JDBCTemplate.close(conn);
//		
//		return list;
//	}

	//카테고리 총 게시글 리스트
	public ArrayList<Board> selectBoardList(int category, PageInfo pi) {
			
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Board> list = new BoardDao().selectBoardList(conn, category, pi);
		
		JDBCTemplate.close(conn);
		
		return list;
	}
	
	//카테고리 검색시 총 게시글 리스트
	public ArrayList<Board> selectBoardList(int category, int subCategory, PageInfo pi) {

		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Board> list = new BoardDao().selectBoardList(conn, category, subCategory, pi);
		
		JDBCTemplate.close(conn);
		
		return list;
	}

	//중고거래 상세보기
	public Board BoardDetail(int cate, int boardNo) {

		Connection conn = JDBCTemplate.getConnection();
		
		Board b = new BoardDao().BoardDetail(conn, cate, boardNo);
		
		JDBCTemplate.close(conn);
		
		return b;
	}
	
	//게시글 삭제
	public int deleteBoard(int boardNo) {

		Connection conn = JDBCTemplate.getConnection();
		
		int result = new BoardDao().deleteBoard(conn, boardNo);
				
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}

	//게시글 수정
	public int updateBoard(String category, Board b, ArrayList<Attachment> list) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		//게시글 수정
		int result = new BoardDao().updateBoard(category, conn, b);

		//첨부파일 수정
		int result2 = new BoardDao().updateAttach(conn, list);

		if(result*result2>0) {//게시글 수정 성공시
			JDBCTemplate.commit(conn);
		}else {//게시글 수정 실패시
			JDBCTemplate.rollback(conn);
		}
		
		//자원 닫기
		JDBCTemplate.close(conn);
		
		return result*result2;
	}
}
