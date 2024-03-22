package kr.kh.team6.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.team6.model.vo.BoardVO;
import kr.kh.team6.model.vo.MemberVO;
import kr.kh.team6.model.vo.PostVO;
import kr.kh.team6.service.PostService;
import kr.kh.team6.service.PostServiceImp;

@WebServlet("/member/post")
public class MemberPostServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private PostService postService = new PostServiceImp();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		MemberVO user = (MemberVO) request.getSession().getAttribute("user");
		if (user == null) {
			request.setAttribute("msg", "로그인이 필요한 서비스입니다.");
			request.setAttribute("url", "login");
			request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
		}
		
		int po_bo_num,po_num;
		try {
			po_bo_num = Integer.parseInt(request.getParameter("po_bo_num"));
			po_num = Integer.parseInt(request.getParameter("po_num"));
		} catch (Exception e) {
			po_bo_num = 0;
			po_num = 0;
		}
		
//		ArrayList<BoardVO> board = postService.selectBoard(po_bo_num);
		ArrayList<PostVO> postList = postService.getAllPostList();
		
		request.setAttribute("postList", postList);
		request.getRequestDispatcher("/WEB-INF/views/member/post.jsp").forward(request, response);
		
		
		
	}


}
