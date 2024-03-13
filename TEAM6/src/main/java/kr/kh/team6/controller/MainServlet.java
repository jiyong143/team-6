package kr.kh.team6.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.team6.model.vo.PostVO;
import kr.kh.team6.service.PostService;
import kr.kh.team6.service.PostServiceImp;


@WebServlet("/")
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PostService postService = new PostServiceImp();
    
	   
    public MainServlet() {
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//검색어를 가져옴
		String search = request.getParameter("search");

		//검색어를 주고 게시글 리스트를 가져옴
		ArrayList<PostVO> list = postService.getSearchPostList(search);
		request.setAttribute("list", list); //화면에 전송

		request.getRequestDispatcher("/WEB-INF/views/home.jsp").forward(request, response);
	}

	

}