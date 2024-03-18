package kr.kh.team6.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.team6.model.vo.MemberVO;
import kr.kh.team6.service.MemberService;
import kr.kh.team6.service.MemberServiceImp;

 //멤버리스트 출력하는 코드 작성
@WebServlet("/admin/member")
public class AdminMemberListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       private MemberService memberService = new MemberServiceImp();
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberVO user = (MemberVO) request.getSession().getAttribute("admin");

		if (user == null ||!user.getMe_authority().equals("admin")) {
			request.setAttribute("msg", "관리자 권한이 필요합니다. 관리자로 로그인 후 다시 시도하세요");
			request.setAttribute("url", "/");
			request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
		}
		ArrayList<MemberVO> memberList = memberService.getMemberList();
		int memberCount = memberList.size();
		
		request.setAttribute("memberList", memberList);
		
		request.setAttribute("memberCount", memberCount);
		//수정해야함
		//member
		request.setAttribute("memberList", memberList);
		//member count
		request.setAttribute("memberCount", memberCount);
		request.getRequestDispatcher("/WEB-INF/views/admin/member.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
