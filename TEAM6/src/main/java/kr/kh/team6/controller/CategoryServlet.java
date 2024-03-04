package kr.kh.team6.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.kh.team6.model.vo.CategoryVO;
import kr.kh.team6.model.vo.MemberVO;
import kr.kh.team6.service.CategoryService;
import kr.kh.team6.service.CategoryServiceImp;

@WebServlet("/category")
public class CategoryServlet extends HttpServlet {
	CategoryService categoryService = new CategoryServiceImp();

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		MemberVO user = (MemberVO) session.getAttribute("user");

		if (user == null) {
			request.setAttribute("msg", "로그인이 필요한 서비스입니다. 로그인 창으로 이동합니다.");
			request.setAttribute("url", "/login");
			request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
		}

		request.getRequestDispatcher("/WEB-INF/views/category.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String ca_title = request.getParameter("ca_title");

		if (categoryService.insertCategory(ca_title)) {
			request.setAttribute("msg", "카테고리가 추가 되었습니다.");
			request.setAttribute("url", "/board/list");
		} else {
			request.setAttribute("msg", "카테고리가 추가에 실패 했습니다.");
			request.setAttribute("url", "/category");
		}
		request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);

	}

}
