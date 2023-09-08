package com.danngn.board.board_board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.danngn.board.board_board.model.service.BoardService;
import com.danngn.board.board_board.model.vo.Board;

/**
 * Servlet implementation class FleaDetailFormController
 */
//중고거래 상세보기 페이지
@WebServlet("/fleaDetail.bo")
public class FleaDetailFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FleaDetailFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		
		Board b = new BoardService().fleaDetail(boardNo);
		
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
		
		request.setAttribute("Board", b);
		
		//요청 페이지로 위임
		request.getRequestDispatcher("views/board/fleaDetailForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
