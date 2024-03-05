package kr.kh.team6.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.team6.model.vo.MemberVO;
import kr.kh.team6.model.vo.PostVO;
import kr.kh.team6.service.PostService;
import kr.kh.team6.service.PostServiceImp;


@WebServlet("/post/list")
public class PostListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PostService postService = new PostServiceImp(); 
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		// 세션에서 회원 정보를 가져온다 
		MemberVO user =(MemberVO)request.getSession().getAttribute("user");
		if(user==null) {
			request.setAttribute("msg","로그인이 필요한 서비스입니다.");
			request.setAttribute("url", "login");
			request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
		}else {	
			// 클릭한 게시판의 번호를 가져오는 것 추가 
			int num =1;
		    ArrayList <PostVO> postList = postService.getPostList(num);
		    
		    // 화면에 게시글 리스트를 전송... 화면에서 사용할 이름은 postList 로 하자
		    request.setAttribute("postList", postList);
			request.getRequestDispatcher("/WEB-INF/views/board/list.jsp").forward(request, response);
		}
			
	}

	
	

}