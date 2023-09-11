package com.danngn.board.board_board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.danngn.board.board_board.model.service.BoardService;
import com.danngn.board.board_board.model.vo.Board;
import com.danngn.board.board_reply.model.service.ReplyService;
import com.danngn.board.board_reply.model.vo.Reply;

/**
 * Servlet implementation class FleaDetailFormController
 */
//중고거래 상세보기 페이지
@WebServlet("/boardDetail.bo")
public class BoardDetailFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardDetailFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int cate = Integer.parseInt(request.getParameter("cate"));
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		
		//각 카테고리별로
		if(cate==1) {
			
			//중고거래 카테고리로 들어왔을시
			
			Board b = new BoardService().BoardDetail(cate, boardNo);
			ArrayList<Reply> r = new ReplyService().selectReply(boardNo);
			
			switch(b.getSubCategory()) {
			case "1" : b.setSubCategory("디지털기기");
			break;
			case "2" : b.setSubCategory("스포츠, 레저");
			break;
			case "3" : b.setSubCategory("생활, 가전");
			break;
			case "4" : b.setSubCategory("티켓, 교환권");
			break;
			case "5" : b.setSubCategory("기타");
			break;
			}
			
			//조회수도 올려주기
			new BoardService().CountUp(boardNo);
			
			request.setAttribute("Board", b);
			request.setAttribute("Reply", r);
			
			//요청 페이지로 위임
			request.getRequestDispatcher("views/board/fleaDetailForm.jsp").forward(request, response);			
			
		}else if(cate==2) {
			
			//동네가게에서 들어왔을시
			
			Board b = new BoardService().BoardDetail(cate, boardNo);
			ArrayList<Reply> r = new ReplyService().selectReply(boardNo);
			
			switch(b.getSubCategory()) {
				case "1" : b.setSubCategory("식당");
						break;
				case "2" : b.setSubCategory("카페");
						break;
				case "3" : b.setSubCategory("뷰티, 미용");
						break;
				case "4" : b.setSubCategory("운동");
						break;
				case "5" : b.setSubCategory("기타");
						break;
			}
			
			//조회수도 올려주기
			new BoardService().CountUp(boardNo);

			request.setAttribute("Board", b);
			request.setAttribute("Reply", r);
			
			//요청 페이지로 위임
			request.getRequestDispatcher("views/board/storesDetailForm.jsp").forward(request, response);
			
		}else {
			
			//알바로 들어왔을시
			
			Board b = new BoardService().BoardDetail(cate, boardNo);
			ArrayList<Reply> r = new ReplyService().selectReply(boardNo);
			
			request.setAttribute("Board", b);
			request.setAttribute("Reply", r);
			
			//조회수도 올려주기
			int count = new BoardService().CountUp(boardNo);

			//요청 페이지로 위임
			request.getRequestDispatcher("views/board/jobsDetailForm.jsp").forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
