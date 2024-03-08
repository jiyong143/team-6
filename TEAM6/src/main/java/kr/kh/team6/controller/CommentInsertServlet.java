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


@WebServlet("/comment/insert")
public class CommentInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    private CommentService commentService = new CommentServiceImp();

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num;
		try {
			num=Integer.parseInt(request.getParameter("num"));
		}catch(Exception e) {
			num=0;
		}
		request.setAttribute("num", num);
		request.getRequestDispatcher("/WEB-INF/views/comment/insert.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int num;
		try {
			num=Integer.parseInt(request.getParameter("num"));
		}catch(Exception e) {
			num=0;
		}
		 String content = request.getParameter("content"); // 댓글 작성한 내용
		 // 댓글 작성자의 아이디 가져오기
		 MemberVO user =(MemberVO) request.getSession().getAttribute("user");
		 String id = user.getMe_id(); 	
		 // 댓글 객체 만들기	
		 CommentVO comment = new CommentVO(content,num,id);
		 // 서비스에게 댓글을 달라고 시키고 성공 여부를 판단
		 if(commentService.insertComment(comment)) {
			 request.setAttribute("msg", "댓글을 등록했습니다.");
			}else {
			 request.setAttribute("msg", "댓글을 등록 못했습니다.");
			}
		     request.setAttribute("url", "post/detail?num="+num); // 이거 post/detail인데 게시글 번호가 num이게 수정
			 request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);	
	}
}