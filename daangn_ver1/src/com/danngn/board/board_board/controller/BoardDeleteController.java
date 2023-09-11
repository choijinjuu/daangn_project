package com.danngn.board.board_board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.danngn.board.board_board.model.service.BoardService;

/**
 * Servlet implementation class DeleteController
 */
//게시물 삭제
@WebServlet("/delete.bo")
public class BoardDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int cate = Integer.parseInt(request.getParameter("cate"));
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		
		int result = new BoardService().deleteBoard(boardNo);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "게시글 삭제 완료");
			
			if(cate==1) {
				//중고거래로 돌려주기
				response.sendRedirect(request.getContextPath()+"/fleaListForm.bo?cate=1&currentPage=1&subCategory=0");
			}else if(cate==2) {
				//동네가게로 돌려주기
				response.sendRedirect(request.getContextPath()+"/storesListForm.bo?cate=2&currentPage=1&subCategory=0");
			}else {
				//알바로 돌려주기
				response.sendRedirect(request.getContextPath()+"/jobsListForm.bo?cate=3&currentPage=1&subCategory=0");
			}
			
		}else {
			request.setAttribute("errorMsg", "게시글 삭제 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
	}
//	storesListForm.bo?cate=2&currentPage=1&subCategory=0
//	jobsListForm.bo?cate=3&currentPage=1&subCategory=0
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
