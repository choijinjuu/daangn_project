package com.danngn.board.board_board.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.danngn.board.board_board.model.dao.BoardDao;
import com.danngn.board.board_board.model.vo.Board;
import com.danngn.common.JDBCTemplate;
import com.danngn.common.vo.Attachment;

public class BoardService {

	//게시글 등록
	public int insertBoard(int allCate, Board b, ArrayList<Attachment> list) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		//게시글 등록
		int result = new BoardDao().insertBoard(allCate, conn, b);
		
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

}
