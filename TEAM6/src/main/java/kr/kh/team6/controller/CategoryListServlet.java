package kr.kh.team6.controller;

import java.io.IOException;
import java.util.ArrayList;

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

@WebServlet("/category/list")
public class CategoryListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	CategoryService categoryService = new CategoryServiceImp();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		MemberVO user = (MemberVO) session.getAttribute("user");

		if (user == null || !"admin".equals(user.getMe_authority())) {
			request.setAttribute("msg", "관리자 권한이 필요합니다. 관리자로 로그인 후 다시 시도하세요");
			request.setAttribute("url", "/");
			request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
		}

		ArrayList<CategoryVO> list = categoryService.getCategoryList();

		request.setAttribute("list", list);// 화면에 전송

		request.getRequestDispatcher("/WEB-INF/views/category/list.jsp").forward(request, response);
	}
}