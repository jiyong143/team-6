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


@WebServlet("/comment/update")
public class CommentUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private CommentService commentService = new CommentServiceImp();
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int cNum;
		try {
			cNum = Integer.parseInt(request.getParameter("cNum"));
		} catch (Exception e) {
			cNum = 0;
		}
		request.setAttribute("cNum", cNum);
		// 서비스에게 시켜서 해당 댓글을 가져온다( 그냥 내용만 가져오면 된다)
		CommentVO comment = commentService.getContent(cNum);
		
		request.setAttribute("comment", comment);
		// 댓글의 게시글 번호 가져옴
		int pNum = comment.getCo_po_num();
	
		request.setAttribute("pNum", pNum);
		MemberVO user = (MemberVO)request.getSession().getAttribute("user");
		
		if(comment == null
				|| !comment.getCo_me_id().equals(user.getMe_id())) {
					//다르면 게시글 상세로 보내고, 작성자가 아닙니다라고 메세지를 띄움
					request.setAttribute("msg", "댓글 작성자가 아닙니다.");
					request.setAttribute("url", "post/detail?num="+pNum);
					request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
					return; //return을 쓰면 else할 필요없이 바로 상세화면으로 이동
				}
		
		request.getRequestDispatcher("/WEB-INF/views/comment/update.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cNum = Integer.parseInt(request.getParameter("cNum"));
		
		int pNum = Integer.parseInt(request.getParameter("pNum"));
		String content = request.getParameter("content");
		
		if(commentService.updateComment(cNum,content)) {
			request.setAttribute("msg", "댓글을 수정했습니다.");
		}else {
			request.setAttribute("msg", "댓글 수정을 실패했습니다.");
		}
		request.setAttribute("url", "post/detail?num="+pNum);			
		request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
	}

}