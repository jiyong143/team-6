package kr.kh.team6.controller;

import java.io.IOException;

import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.team6.model.vo.CategoryVO;
import kr.kh.team6.model.vo.MemberVO;
import kr.kh.team6.service.CategoryService;
import kr.kh.team6.service.CategoryServiceImp;

@WebServlet("/category/update")
public class CategoryUpdateServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	CategoryService categoryService = new CategoryServiceImp();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		MemberVO user = (MemberVO) request.getSession().getAttribute("admin");
		if (user == null || !user.getMe_authority().equals("admin")) {
			request.setAttribute("msg", "관리자 권한이 필요합니다. 관리자로 로그인 후 다시 시도하세요");
			request.setAttribute("url", "/");
			request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
		}

		int num;
		try {
			num = Integer.parseInt(request.getParameter("ca_num"));
		} catch (Exception e) {
			num = 0;
		}
		
		String ca_title = request.getParameter("ca_title");
		CategoryVO category = categoryService.getCategory(num,ca_title);
		request.setAttribute("category", category);

		ArrayList<CategoryVO> list = categoryService.getCategoryList();
		request.setAttribute("list", list);
		request.getRequestDispatcher("/WEB-INF/views/category/update.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		MemberVO admin = (MemberVO) request.getSession().getAttribute("admin");

		int num;
		try {
			num = Integer.parseInt(request.getParameter("ca_num"));
		} catch (Exception e) {
			num = 0;
		}
		String ca_title = request.getParameter("ca_title");
		CategoryVO category = new CategoryVO(num, ca_title);
		boolean res = categoryService.updateCategory(category, admin);
		if (res) {
			request.setAttribute("msg", "카테고리를 수정했습니다.");
		} else {
			request.setAttribute("msg", "카테고리를 수정하지 못했습니다.");
		}
		request.setAttribute("url", "category/list?num=" + num);
		request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);

	}

}