package kr.kh.team6.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.team6.model.vo.MemberVO;
import kr.kh.team6.model.vo.PostVO;
import kr.kh.team6.service.PostService;
import kr.kh.team6.service.PostServiceImp;

/**
 * Servlet implementation class AdminPostDeleteServlet
 */
@WebServlet("/admin/postdelete")
public class AdminPostDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
		PostService postService = new PostServiceImp();
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberVO user = (MemberVO) request.getSession().getAttribute("admin");

		if (user == null ||!user.getMe_authority().equals("admin")) {
			request.setAttribute("msg", "관리자 권한이 필요합니다. 관리자로 로그인 후 다시 시도하세요");
			request.setAttribute("url", "/");
			request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
		}
		int po_num = Integer.parseInt(request.getParameter("po_num"));
		
		boolean res = postService.adminDeletePost(po_num);
		
		if (res) {
			request.setAttribute("msg", "게시물을 삭제 했습니다.");
			request.setAttribute("url", "admin/post");
		}
		else {
			request.setAttribute("msg", "게시물을 삭제하지 못했습니다..");
			request.setAttribute("url", "admin/post?po_num=" + po_num);
		}
		
		request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
