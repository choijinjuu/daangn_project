package com.danngn.member.comtroller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.danngn.board.board_board.model.service.BoardService;
import com.danngn.board.board_board.model.vo.Board;
import com.danngn.board.board_reply.model.vo.Reply;
import com.danngn.common.vo.PageInfo;
import com.danngn.member.model.service.MemberService;
import com.danngn.member.model.vo.Member;

/**
 * Servlet implementation class MyBoardListController
 */
//나의 게시글 리스트
@WebServlet("/myBoard.me")
public class MyBoardListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyBoardListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//페이징바 처리
		int listCount; //현재 총 게시글의 개수
		int currentPage; //현재 페이지
		int pageLimit; //페이지 하단에 보여질 페이징바의 페이지 최대 개수
		int boardLimit; //한 페이지에 보여질 게시글 최대 개수
		
		int maxPage; //가장 마지막 페이지가 몇인지 (총 페이지 개수)
		int startPage; //페이지 하단에 보여질 페이징바의 시작수
		int endPage; //페이지 하단에 보여질 페이징바의 끝 수
		
		PageInfo pi = null;
		ArrayList<Board> list = null;
		
		//세션에 담겨있는 로그인 유저 가져오기
		Member loginMember = (Member)request.getSession().getAttribute("loginMember");
		int memberNo = loginMember.getMemberNo();

		//게시글 총 수 구하기
		listCount = new MemberService().BoardListCount(memberNo);
		
		currentPage = Integer.parseInt(request.getParameter("currentPage").trim());
		pageLimit = 10;
		boardLimit = 5;
			
		maxPage = (int)Math.ceil((double)listCount/boardLimit);
		startPage = (currentPage-1)/pageLimit*pageLimit+1;
		endPage = startPage+pageLimit-1;
			
		if(endPage>maxPage) {
			endPage = maxPage;
		}
			
		pi = new PageInfo(listCount,currentPage,pageLimit,boardLimit,maxPage,startPage,endPage);
		
		//리스트 가져오기
		list = new MemberService().selectBoardList(memberNo, pi);
		
		request.setAttribute("list", list);
		request.setAttribute("pi", pi);

		//요청 주소로 위임
		request.getRequestDispatcher("views/member/myBoardList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
