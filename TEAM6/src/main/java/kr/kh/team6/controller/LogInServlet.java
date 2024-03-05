package kr.kh.team6.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.kh.team6.model.dto.LoginDTO;
import kr.kh.team6.model.vo.MemberVO;
import kr.kh.team6.service.MemberService;
import kr.kh.team6.service.MemberServiceImp;


@WebServlet("/login")
public class LogInServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private MemberService memberService = new MemberServiceImp();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw"); 
		MemberVO user = memberService.getMember(new LoginDTO(id,pw));
		if(user!=null) {
			request.setAttribute("msg", "로그인에 성공했습니다.");
			request.setAttribute("url","");
			// 세션에 로그인한 회원의 정보를 저장해서 유지시킨다
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
		}else {
			// 실패하면 다시 로그인 페이지로 이동
			request.setAttribute("msg","로그인에 실패했습니다.");
			request.setAttribute("url","login");	
		}
		request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
		
	}

}