package kr.kh.team6.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.team6.model.vo.BoardVO;
import kr.kh.team6.model.vo.MemberVO;
import kr.kh.team6.service.BoardService;
import kr.kh.team6.service.BoardServiceImp;
import kr.kh.team6.service.CommentService;
import kr.kh.team6.service.CommentServiceImp;
import kr.kh.team6.service.PostService;
import kr.kh.team6.service.PostServiceImp;


@WebServlet("/post/delete")
public class PostDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private PostService postService = new PostServiceImp();   
    private CommentService commentService = new CommentServiceImp();
	private BoardService boardService = new BoardServiceImp();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 세션에 있는 회원 정보를 가져옴 (게시글 주인이 아닐 수 있기에)
		MemberVO user =(MemberVO)request.getSession().getAttribute("user");
		// 화면에서 보낸 num을 가져옴 
		int num;
		try {
		num=Integer.parseInt(request.getParameter("num"));
		}catch(Exception e) {
			num=0;
		}
		int bNum = Integer.parseInt(request.getParameter("bNum")); // 게시판의 번호
		// 게시판 자체를 가져온다 
		BoardVO board = boardService.getBoard(bNum);
		String bName = board.getBo_title();
		commentService.deleteComments(num); // 게시글에 있는 댓글을 먼저 삭제하는 메서드 
		// 서비스에게 시켜서 게시글 삭제 후  삭제 여부 받음
		if(postService.deletePost(num,user)) {
			request.setAttribute("msg", "게시글을 삭제했습니다.");
			request.setAttribute("url", "post/list?bNum=" + bNum +"&bName=" + bName );
			
		}else {
			request.setAttribute("msg", "게시글을 삭제하지 못했습니다.");
			request.setAttribute("url", "post/detail?num=" + num);
			
		}
		request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
		
		
	}


}