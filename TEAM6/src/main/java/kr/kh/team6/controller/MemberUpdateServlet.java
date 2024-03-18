package kr.kh.team6.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.team6.model.dto.LoginDTO;
import kr.kh.team6.model.vo.MemberVO;
import kr.kh.team6.service.MemberService;
import kr.kh.team6.service.MemberServiceImp;


@WebServlet("/member/update")
public class MemberUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private MemberService memberService = new MemberServiceImp();  
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MemberVO user = (MemberVO) request.getSession().getAttribute("user");
		if(user==null) {
			request.setAttribute("msg", "로그인이 필요한 서비스입니다.");
			request.setAttribute("url", "login");
			request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
		}else {
		request.getRequestDispatcher("/WEB-INF/views/member/update.jsp").forward(request, response);
		}
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
		
		// 입력하지 않은 것이 하나라도 있을 때
		
		if(pw==null||pw.length()==0||pw2==null||pw2.length()==0||
		   name==null||name.length()==0||phone==null||phone.length()==0||
		   email==null||email.length()==0||address==null||address.length()==0) {
			request.setAttribute("msg", "필수 항목들을 모두 입력해주세요.");
			request.setAttribute("url","member/update");
			request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
			return;
		}
		   
		
		// 비번이 비번확인과 다르거나 정규표현식 안맞을 때
		if(!pw.equals(pw2)||!memberService.checkPwRegex(pw)) {
			request.setAttribute("msg", "비번과 비번 확인이 다르거나 형식에 맞지 않는 비번입니다.");
			request.setAttribute("url", "member/update");
			request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
			return;
		}
		// 닉네임이 정규표현식에 맞지 않거나 나를  제외하고 다른 회원들의 닉네임들 중 중복이 있을 때
		if(!memberService.checkNameRegex(name)||
		    memberService.compareName(id,name)==1){	
			request.setAttribute("msg", "중복된 닉네임이거나 형식에 맞지 않는 닉네임입니다.");
			request.setAttribute("url", "member/update");
			request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
			return;
		}	
		
		
		// 전화번호가 형식에 맞지 않거나 나를 제외한 다른 회원의 전화번호 중 중복이 있을 때
		if(!memberService.checkPhoneRegex(phone)||
			memberService.comparePhone(id,phone)==1) {
			request.setAttribute("msg", "이미 가입된 전화번호이거나 형식에 맞지 않는 전화번호입니다.");
			request.setAttribute("url", "member/update");
			request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
			return;
		}
		// 이메일이 형식에 맞지 않거나 나를 제외한 다른 회원의 이메일 중 중복이 있을 때
		if(!memberService.checkEmailRegex(email)||
		    memberService.compareEmail(id,email)==1) {
			request.setAttribute("msg", "이미 가입된 이메일이거나 형식에 맞지 않는 이메일입니다.");
			request.setAttribute("url", "member/update");
			request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
			return;
		}
		// 주소가 형식에 맞지 않을 때 
		if(!memberService.checkAddressRegex(address)) {
			request.setAttribute("msg", "형식에 맞지 않는 주소입니다.");
			request.setAttribute("url", "member/update");
			request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
			return;
		}
		  
		// 전혀 문제가 없는 경우
		
		if(memberService.updateMember(id,pw,phone,address,name,email)) {
			LoginDTO loginDto = new LoginDTO(id, pw);
			MemberVO user = memberService.getMember(loginDto);
			request.getSession().setAttribute("user", user); // 수정 후 개인정보 소유
			request.setAttribute("msg", "개인정보 수정 완료");
		}else {
			request.setAttribute("msg", "개인정보 수정 실패");
		}
		request.setAttribute("url", "member/update");	
		request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
	}

}