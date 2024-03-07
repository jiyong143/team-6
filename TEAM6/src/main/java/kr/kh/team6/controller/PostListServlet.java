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
import kr.kh.team6.pagination.Criteria;
import kr.kh.team6.pagination.PageMaker;
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
			// 선택한 게시판 번호 가져오는 부분 추가 
			String search = request.getParameter("search");
			String type = request.getParameter("type");
			int page;
			try {
				page=Integer.parseInt(request.getParameter("page"));
			}catch(Exception e) {
				page=1;
			}
			Criteria cri = new Criteria(page,2,type,search);
			int bo_num =1;
			// 화면에 게시글 리스트를 전송... 화면에서 사용할 이름은 postList 로 하자
			ArrayList <PostVO> postList = postService.getPostList(cri, bo_num);
			request.setAttribute("postList", postList);
			// 검색어, 검색타입에 맞는 전체 게시글 개수를 가져오는 과정
			int totalCount = postService.getTotalCount(cri, bo_num);
			PageMaker pm = new PageMaker(5,cri,totalCount);
			request.setAttribute("pm", pm);
			request.getRequestDispatcher("/WEB-INF/views/post/list.jsp").forward(request, response);
		}
			
	}

	
	

}