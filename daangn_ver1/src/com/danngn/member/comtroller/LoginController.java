package com.danngn.member.comtroller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.danngn.member.model.service.MemberService;
import com.danngn.member.model.vo.Member;

/**
 * Servlet implementation class LoginController
 */
//로그인 서블릿
@WebServlet("/login.me")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//요청 주소로 위임
		request.getRequestDispatcher("views/member/loginForm.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		String memberId = request.getParameter("memberId");
		String memberPwd = request.getParameter("memberPwd");
		
		Member m = new MemberService().loginMember(memberId, memberPwd);
		
		if(m == null) {//로그인 실패시 에러페이지로 돌려주기
			request.setAttribute("errorMsg", "로그인에 실패하셨습니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}else {//로그인 성공시 메인페이지로
			//로그인 정보 session에 담아주기
			request.getSession().setAttribute("loginMember", m);
			//알림창도 띄워주기
			request.getSession().setAttribute("alertMsg", "로그인 되었습니다.");
			
			//페이지 돌려주기
			response.sendRedirect(request.getContextPath());
		}
	}

}
