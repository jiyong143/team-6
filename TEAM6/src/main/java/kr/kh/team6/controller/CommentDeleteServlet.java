package kr.kh.team6.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.team6.model.vo.CommentVO;
import kr.kh.team6.model.vo.MemberVO;
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
		 MemberVO user = (MemberVO)request.getSession().getAttribute("user");
		
         // 댓글 가져오기
		 CommentVO comment = commentService.getComment(cNum);
		 
		 // 댓글의 게시글 번호 가져오기 
		 
		 int pNum = comment.getCo_po_num();
		 
		 if(comment==null||!user.getMe_id().equals(comment.getCo_me_id())) {
			 request.setAttribute("msg", "댓글 작성자가 아닙니다.");
			 request.setAttribute("url", "post/detail?num="+pNum);
		     request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
			 return; //return을 쓰면 else할 필요없이 바로 상세화면으로 이동
		 }
		 
		// 문제 없으니 댓글 삭제 
		 
		if(commentService.deleteComment(cNum)) {
			request.setAttribute("msg", "댓글을 삭제했습니다.");	
		}else {
			request.setAttribute("msg", "댓글을 삭제를 실패했습니다.");		
		}
		request.setAttribute("url", "post/detail?num="+pNum);
		request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
	}
}