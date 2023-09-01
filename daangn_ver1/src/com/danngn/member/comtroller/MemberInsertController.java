package com.danngn.member.comtroller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.danngn.member.model.service.MemberService;
import com.danngn.member.model.vo.Member;

/**
 * Servlet implementation class MemberInsertController
 */
//회원가입 서블릿
@WebServlet("/insert.me")
public class MemberInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//요청 주소로 위임
		request.getRequestDispatcher("views/member/memberEnrollForm.jsp").forward(request, response);
				
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		//파라미터로 값 받기
		String memberId = request.getParameter("memberId");
		String memberPwd = request.getParameter("memberPwd");
		String address = request.getParameter("address");
		String email = request.getParameter("email");
		
		//멤버 객체 생성
		Member m = new Member(memberId, memberPwd, address, email);
		
		int result = new MemberService().insertMember(m);
		
		if(result>0) {//회원가입 성공시
			request.getSession().setAttribute("alertMsg", "회원가입을 환영합니다!");
			//메인페이지로 돌려주기
			response.sendRedirect(request.getContextPath());
		}else {//회원가입 실패시
			//실패시 errorPage
			request.setAttribute("errorMsg", "회원가입에 실패하셨습니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
	
	}

}
