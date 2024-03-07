package kr.kh.team6.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.team6.service.CommentService;
import kr.kh.team6.service.CommentServiceImp;


@WebServlet("/comment/delete")
public class CommentDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private CommentService commentService = new CommentServiceImp();   
   
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int cNum;
		try {
			cNum=Integer.parseInt(request.getParameter("cNum"));
		}catch(Exception e) {
			cNum=0;
		}
		if(commentService.deleteComment(cNum)) {
			request.setAttribute("msg", "댓글을 삭제했습니다.");	
		}else {
			request.setAttribute("msg", "댓글을 삭제를 실패했습니다.");		
		}
		request.setAttribute("url", "post/list");
		request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
