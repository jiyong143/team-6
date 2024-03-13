package kr.kh.team6.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.team6.service.MemberService;
import kr.kh.team6.service.MemberServiceImp;


@WebServlet("/member/update")
public class MemberUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private MemberService memberService = new MemberServiceImp();  
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("/WEB-INF/views/member/update.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 입력한 정보들 가져오기
		String pw = request.getParameter("pw");
		String pw2 = request.getParameter("pw2");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String id = request.getParameter("id");
		String oName = request.getParameter("oName");
		String oPhone = request.getParameter("oPhone");
		String oEmail = request.getParameter("oEmail");

		// 비번이 비번확인과 다르거나 정규표현식 안맞을 때
		if(!pw.equals(pw2)||!memberService.checkPwRegex(pw)) {
			request.setAttribute("mag", "비번과 비번 확인이 다르거나 형식에 맞지 않는 비번입니다.");
			request.setAttribute("url", "member/update");
			request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
		}
		// 닉네임이 정규표현식에 맞지 않거나 나의 닉네임을 제외한 다른 회원들의 닉네임들 중 중복이 있을 때
		if(!memberService.checkNameRegex(name)||
		    memberService.compareName(id,name)==1){	
			request.setAttribute("msg", "닉네임이 다른 사람과 겹치거나 형식에 맞지 않는 닉네임입니다.");
			request.setAttribute("url", "member/update");
			request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
		}	
		
	}

}