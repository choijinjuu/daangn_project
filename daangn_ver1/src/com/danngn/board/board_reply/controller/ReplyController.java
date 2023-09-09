package com.danngn.board.board_reply.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.danngn.board.board_board.model.service.BoardService;
import com.danngn.board.board_reply.model.service.ReplyService;
import com.danngn.board.board_reply.model.vo.Reply;
import com.google.gson.Gson;

/**
 * Servlet implementation class ReplyController
 */
//리플 등록 및 삭제
@WebServlet("/reply.re")
public class ReplyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReplyController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//로그인한 상황에서만 댓글 작성 가능
		if(request.getParameter("replyNo") != null) {
			
			int replyNo = Integer.parseInt(request.getParameter("replyNo"));
			int boardNo = Integer.parseInt(request.getParameter("boardNo"));
			int memNo = Integer.parseInt(request.getParameter("memNo"));
			
			int result = new ReplyService().deleteReply(replyNo);

			if(result > 0) {
				request.getSession().setAttribute("alertMsg", "댓글 삭제 완료");
				response.sendRedirect(request.getContextPath()+"/fleaDetail.bo?boardNo=25&memNo=47");
			}else {
				request.setAttribute("errorMsg", "댓글 삭제 실패");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//댓글 작성
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		String replyContent = request.getParameter("replyContent");
		int secret = Integer.parseInt(request.getParameter("secret"));
		
		Reply r = new Reply();
			r.setMemberNo(memberNo);
			r.setBoardNo(boardNo);
			r.setContent(replyContent);
			r.setSecret(secret);
		
		int result = new ReplyService().insertReply(r);
		
		response.getWriter().print(result);
	}

}
