package kr.kh.team6.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.team6.model.vo.CategoryVO;
import kr.kh.team6.service.CategoryService;
import kr.kh.team6.service.CategoryServiceImp;

@WebServlet("/category")
public class CategoryServlet extends HttpServlet {
	CategoryService categoryService = new CategoryServiceImp();
	
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.getRequestDispatcher("/WEB-INF/views/category.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		
		int ca_num = Integer.parseInt(request.getParameter("ca_num"));
		String ca_title = request.getParameter("ca_title");
		
		CategoryVO category = new CategoryVO(ca_num , ca_title);
		
		if(categoryService.insertCategory(category)) {
			 response.sendRedirect(request.getContextPath() + "/category");
		}else {
			 response.sendRedirect(request.getContextPath() + "/");
		}
		
	}

}
