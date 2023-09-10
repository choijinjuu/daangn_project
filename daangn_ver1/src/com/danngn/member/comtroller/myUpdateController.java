package com.danngn.member.comtroller;

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
import com.danngn.member.model.service.MemberService;
import com.danngn.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class mypageFormController
 */
//마이페이지보여주고, 수정가능한 서블릿
@WebServlet("/updateMy.me")
public class myUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public myUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//요청주소로 위임
		request.getRequestDispatcher("views/member/mypageForm.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		//세션에 담겨있는 로그인 유저 가져오기
		Member loginMember = (Member)request.getSession().getAttribute("loginMember");

		//멀티파트로 받기
		if(ServletFileUpload.isMultipartContent(request)) {
			//파일 용량 제한
			int maxSize = 15 * 1024 * 1024;
			//저장할 파일 경로
			String savePath = request.getSession().getServletContext().getRealPath("/resources/member_img/");
			//파일명 저장
			MultipartRequest multiRequest = new MultipartRequest(request, savePath,maxSize,"UTF-8");

			int memberNo = Integer.parseInt(multiRequest.getParameter("memberNo"));
			String memberPwd = multiRequest.getParameter("memberPwd");
			String address = multiRequest.getParameter("address");
			String email = multiRequest.getParameter("email");
			String profile_img = "";
			
			if(multiRequest.getFile("file1")==null) {
				//파일이 안들어왔으면
				profile_img = "resources/css_img/basic_img.png";
			}else {
				//파일이 들어왔으면
				//파일 이름 추출하기
				String filePath = multiRequest.getFile("file1").getAbsolutePath();
				File file = new File(filePath);
				profile_img = "resources/member_img/"+file.getName();
			}

			Member m = new Member(memberNo, memberPwd, address, email, profile_img);
			
			int result = 0;
			
			result = new MemberService().updateMember(m);

			if(result>0) {//게시글 수정 완료시
				//로그인 다시해서 로그인 유저 정보 업데이트
				Member m2 = new MemberService().loginMember(loginMember.getMemberId(), memberPwd);

				request.getSession().setAttribute("loginMember", m2);
				request.getSession().setAttribute("alertMsg", "회원정보 수정 완료!");
				
				response.sendRedirect(request.getContextPath());
			}else {//게시글 작성 실패시
				request.setAttribute("errorMsg", "회원정보 수정에 실패하셨습니다.");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
				
				new File("/"+profile_img).delete();
			}
	
		}
	}

}
