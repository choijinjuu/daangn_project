package com.danngn.board.board_reply.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.danngn.board.board_reply.model.service.ReplyService;
import com.danngn.board.board_reply.model.vo.Reply;
import com.google.gson.Gson;

/**
 * Servlet implementation class ReplyController
 */
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

		//댓글 목록 불러오기
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));

		ArrayList<Reply> rlist = new ReplyService().selectReply(boardNo);

		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(rlist,response.getWriter());
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
