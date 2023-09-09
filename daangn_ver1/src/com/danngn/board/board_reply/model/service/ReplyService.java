package com.danngn.board.board_reply.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.danngn.board.board_board.model.dao.BoardDao;
import com.danngn.board.board_reply.model.dao.ReplyDao;
import com.danngn.board.board_reply.model.vo.Reply;
import com.danngn.common.JDBCTemplate;

public class ReplyService {

	//댓글 작성
	public int insertReply(Reply r) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new ReplyDao().insertReply(conn, r);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}

	//댓글 목록 불러오기
	public ArrayList<Reply> selectReply(int boardNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Reply> rlist = new ReplyDao().selectReply(conn, boardNo);
		
		JDBCTemplate.close(conn);
		
		return rlist;
	}

	//댓글 삭제
	public int deleteReply(int replyNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new ReplyDao().deleteBoard(conn, replyNo);
				
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}

}
