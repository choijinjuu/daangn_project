package com.danngn.board.board_board.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.danngn.board.board_board.model.service.BoardService;
import com.danngn.board.board_board.model.vo.Board;
import com.danngn.common.MyFileRenamePolicy;
import com.danngn.common.vo.Attachment;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class BoardUpdateController
 */
//게시글 수정
@WebServlet("/update.bo")
public class BoardUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//수정 페이지 들어올시 정보 가져와서 뿌려주기
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		
		Board b = new BoardService().fleaDetail(boardNo);
		
		request.setAttribute("board", b);
		
		request.getRequestDispatcher("views/board/boardUpdateForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		//멀티파트로 받기
		if(ServletFileUpload.isMultipartContent(request)) {
			
			//파일 용량 제한
			int maxSize = 15 * 1024 * 1024;
			//저장할 파일 경로
			String savePath = request.getSession().getServletContext().getRealPath("/resources/board_img/");
			//파일명 저장
			MultipartRequest multiRequest = new MultipartRequest(request, savePath,maxSize,"UTF-8",new MyFileRenamePolicy());

			int price = 0;
			String subCategory = null;
			
			int boardNo = Integer.parseInt(multiRequest.getParameter("boardNo"));
			String category = multiRequest.getParameter("category");
			int memberNo = Integer.parseInt(multiRequest.getParameter("memberNo"));
			String title = multiRequest.getParameter("title");
			String content = multiRequest.getParameter("content");
			/* 서브 카테고리 처리 */
			if(multiRequest.getParameter("subCategory")==null) {
				subCategory="0";
			}else {
				subCategory = multiRequest.getParameter("subCategory");
			}
			String open_h = multiRequest.getParameter("open_h");
			String open_m = multiRequest.getParameter("open_m");
			/* 오픈시간, 클로즈시간 처리 */
			String openTime = open_h+"시"+open_m+"분";
			String close_h = multiRequest.getParameter("close_h");
			String close_m = multiRequest.getParameter("close_m");
			String closeTime = close_h+"시"+close_m+"분";
			String address = multiRequest.getParameter("address");
			String jobDate = multiRequest.getParameter("jobDate");
			/* 가격 처리 */
			if(multiRequest.getParameter("price")==null) {
				price=0;
			}else {
				price = Integer.parseInt(multiRequest.getParameter("price"));
			}
			
			ArrayList<Attachment> list = new ArrayList<>();
			
			//파일 처리
			for(int i=0; i<4; i++) {
				String key = "file"+i;

				if(multiRequest.getOriginalFileName(key) !=null ) {
					Attachment at = new Attachment();
						at.setBoardNo(boardNo);
						at.setAtName(multiRequest.getOriginalFileName(key));
						at.setAtChange(multiRequest.getFilesystemName(key));
						at.setAtPath("/resources/board_img/");
						
					if(i==1) {
						at.setFileLevel(1);
					}else {
						at.setFileLevel(2);
					}
					list.add(at);
				}	
			}
			Board b = new Board(boardNo, memberNo, title, content, category, price, subCategory, openTime, closeTime, address, jobDate);

			int result = 0;
			
			result = new BoardService().updateBoard(category, b,list);
			
			if(result>0) {//게시글 수정 완료시
				request.getSession().setAttribute("alertMsg", "게시글 수정 완료!");
				response.sendRedirect(request.getContextPath());
			}else {//게시글 작성 실패시
				request.setAttribute("errorMsg", "게시글 수정에 실패하셨습니다.");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
				if(list!=null) {
					for(int i=0; i<list.size(); i++) {
						//작성 실패시 파일도 지워주기
						new File(savePath+list.get(i).getAtChange()).delete();
					}
				}
			}
	
		}
	
	}

}
