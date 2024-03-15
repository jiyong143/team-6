package kr.kh.team6.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.team6.model.vo.MemberVO;
import kr.kh.team6.service.CategoryService;
import kr.kh.team6.service.CategoryServiceImp;


@WebServlet("/category/delete")
public class CategoryDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	CategoryService categoryService = new CategoryServiceImp();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		MemberVO user = (MemberVO) request.getSession().getAttribute("admin");

		if (user == null ||!user.getMe_authority().equals("admin")) {
			request.setAttribute("msg", "관리자 권한이 필요합니다. 관리자로 로그인 후 다시 시도하세요");
			request.setAttribute("url", "/");
			request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
		}
		
		
		int num;
		try {
			num = Integer.parseInt(request.getParameter("num"));
		} catch (Exception e) {
			num = 0;
		}
		boolean res = categoryService.deleteCategory(num, user);
		if (res ||!user.getMe_authority("admin")) {
			request.setAttribute("msg", "카테고리를 삭제했습니다.");
			request.setAttribute("url", "category/list");
		}
		else {
			request.setAttribute("msg", "카테고리를 삭제하지 못했습니다.");
			request.setAttribute("url", "category/list?num=" + num);
		}
		// message.jsp 화면을 전송
		request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
	}
}