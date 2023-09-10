package com.danngn.member.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.danngn.board.board_board.model.dao.BoardDao;
import com.danngn.board.board_board.model.vo.Board;
import com.danngn.board.board_reply.model.vo.Reply;
import com.danngn.common.JDBCTemplate;
import com.danngn.common.vo.Attachment;
import com.danngn.common.vo.PageInfo;
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

	//정보수정
	public int updateMember(Member m) {

		Connection conn = JDBCTemplate.getConnection();
		
		//회원 정보 수정
		int result = new MemberDao().updateMember(conn, m);
		
		if(result>0) {//게시글 수정 성공시
			JDBCTemplate.commit(conn);
		}else {//게시글 수정 실패시
			JDBCTemplate.rollback(conn);
		}
		
		//자원 닫기
		JDBCTemplate.close(conn);
		
		return result;
	}

	//작성한 게시글 총 수 조회
	public int BoardListCount(int memberNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int BoardListCount = new MemberDao().BoardListCount(conn, memberNo);
		
		JDBCTemplate.close(conn);
		
		return BoardListCount;
	}

	//작성한 게시글 리스트
	public ArrayList<Board> selectBoardList(int memberNo, PageInfo pi) {

		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Board> list = new MemberDao().selectBoardList(conn, memberNo, pi);
		
		JDBCTemplate.close(conn);
		
		return list;
	}

	//작성한 댓글 수
	public int ReplyListCount(int memberNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int ReplyListCount = new MemberDao().ReplyListCount(conn, memberNo);
		
		JDBCTemplate.close(conn);
		
		return ReplyListCount;
	}

	//작성한 댓글 리스트
	public ArrayList<Reply> selectReplyList(int memberNo, PageInfo pi) {

		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Reply> list = new MemberDao().selectReplyList(conn, memberNo, pi);
		
		JDBCTemplate.close(conn);
		
		return list;
	}

}
