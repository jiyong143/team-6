package kr.kh.team6.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.team6.model.vo.MemberVO;
import kr.kh.team6.service.MemberService;
import kr.kh.team6.service.MemberServiceImp;

@WebServlet("/signup")
public class SignUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService memberService = new MemberServiceImp();

    //1. 서블릿 생성 후 doGet에 request.getRequestDispatcher 구현
    //지금까지한건 화면에서 서버로 정보를 보낸 것
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/signup.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String pw2 = request.getParameter("pw2");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String email = request.getParameter("email");
		String birth = request.getParameter("birth");

		MemberVO member = new MemberVO(id, pw, phone, address, name, email, birth);
		
		//입력하지 않은 것이 하나라도 있을 시
		if(id == null || id.length() == 0
		|| pw == null || pw.length() == 0 
		|| pw2 == null || pw2.length() == 0 
		|| name == null||name.length() == 0
		||phone == null||phone.length() == 0
		||email == null||email.length() == 0
		||address == null||address.length() == 0
		|| birth == null || birth.length() == 0) {
			request.setAttribute("msg", "필수 항목들을 모두 입력해주세요.");
			request.setAttribute("url","signup");
			request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
			return;
		}
		   
		// 비번이 비번확인과 다르거나 정규표현식 안맞을 때
		if(!pw.equals(pw2)||!memberService.checkPwRegex(pw)) {
			request.setAttribute("msg", "비번과 비번 확인이 다르거나 형식에 맞지 않는 비번입니다.");
			request.setAttribute("url", "signup");
			request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
			return;
		}
		
		// 닉네임이 정규표현식에 맞지 않거나 나를  제외하고 다른 회원들의 닉네임들 중 중복이 있을 때
		if(!memberService.checkNameRegex(name)||
		    memberService.compareName(id,name)==1){	
			request.setAttribute("msg", "중복된 닉네임이거나 형식에 맞지 않는 닉네임입니다.");
			request.setAttribute("url", "signup");
			request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
			return;
		}	
		
		// 전화번호가 형식에 맞지 않거나 나를 제외한 다른 회원의 전화번호 중 중복이 있을 때
		if(!memberService.checkPhoneRegex(phone)||
			memberService.comparePhone(id,phone)==1) {
			request.setAttribute("msg", "이미 가입된 전화번호이거나 형식에 맞지 않는 전화번호입니다.");
			request.setAttribute("url", "signup");
			request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
			return;
		}
		
		// 이메일이 형식에 맞지 않거나 나를 제외한 다른 회원의 이메일 중 중복이 있을 때
		if(!memberService.checkEmailRegex(email)||
		    memberService.compareEmail(id,email)==1) {
			request.setAttribute("msg", "이미 가입된 이메일이거나 형식에 맞지 않는 이메일입니다.");
			request.setAttribute("url", "signup");
			request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
			return;
		}
		
		// 주소가 형식에 맞지 않을 때 
		if(!memberService.checkAddressRegex(address)) {
			request.setAttribute("msg", "형식에 맞지 않는 주소입니다.");
			request.setAttribute("url", "signup");
			request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
			return;
		}
		
		//모두 입력했을 시
		if(memberService.signup(member)) {
			//회원가입에 성공하면 메인 페이지로 이동
			request.setAttribute("msg", "회원가입에 성공했습니다.");
			request.setAttribute("url", "");
		}
		else {
			//실패하면 회원가입 페이지 유지
			request.setAttribute("msg", "회원가입에 실패했습니다.");
			request.setAttribute("url", "signup");
		}
		request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);

	}

}