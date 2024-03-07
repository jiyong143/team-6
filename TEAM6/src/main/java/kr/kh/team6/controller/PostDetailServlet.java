package kr.kh.team6.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.team6.model.vo.MemberVO;
import kr.kh.team6.model.vo.PostVO;
import kr.kh.team6.service.PostService;
import kr.kh.team6.service.PostServiceImp;

@WebServlet("/post/detail")
public class PostDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private PostService postService = new PostServiceImp();   
   

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 화면에서 보낸 게시글 번호를 가져옴 
		int num;
		try {
			num = Integer.parseInt(request.getParameter("num"));
		}catch(Exception e) {
			num = 0;
		}	
		// 서비스에게 게시글 번호를 주면서 게시글 조회수를 증가하라고 시킴 
		postService.updateView(num);
		// 서비스에게 게시글 번호를 주면서 게시글을 가져온다
		PostVO post = postService.getPost(num);
		MemberVO member = postService.getPostMemberName(post); 
		String name = member.getMe_name(); // 클릭한 게시글의 작성자 이름 
		
		// 화면에 게시글을 전송 
		request.setAttribute("post", post);
		request.setAttribute("name", name);
		// 화면을 전송 
		request.getRequestDispatcher("/WEB-INF/views/post/detail.jsp").forward(request, response);
	}

	

}
