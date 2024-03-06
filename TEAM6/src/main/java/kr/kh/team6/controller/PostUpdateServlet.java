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

@WebServlet("/post/update")
public class PostUpdateServlet extends HttpServlet {

	PostService postService = new PostServiceImp();

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		MemberVO user = (MemberVO) request.getSession().getAttribute("user");
		if (user == null) {
			request.setAttribute("msg", "로그인이 필요한 서비스입니다.");
			request.setAttribute("url", "login");
			request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
		}

		int po_num;
		try {
			po_num = Integer.parseInt(request.getParameter("po_num"));
		} catch (Exception e) {
			po_num = 0;
		}
		PostVO post = postService.getPost(po_num);
		request.setAttribute("post", post);
		
		//서비스 보드VO로 잘못써서 수정 잘 해야함
		
		ArrayList<BoardVO> list = postService.getBoardList();
		request.setAttribute("list", list);
		request.getRequestDispatcher("/WEB-INF/views/post/update.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		MemberVO user = (MemberVO) request.getSession().getAttribute("user");

		int po_num, po_bo_num;
		try {
			po_num = Integer.parseInt(request.getParameter("po_num"));
			po_bo_num = Integer.parseInt(request.getParameter("po_bo_num"));
		} catch (Exception e) {
			po_num = 0;
			po_bo_num = 0;
		}
		String po_title = request.getParameter("po_title");
		BoardVO board = new BoardVO(po_num, po_title, po_bo_num);
		boolean res = postService.updatePost(board, user);
		if (res) {
			request.setAttribute("msg", "게시글을 수정했습니다.");
		} else {
			request.setAttribute("msg", "게시글을 수정하지 못했습니다.");
		}
		request.setAttribute("url", "post/list?po_num=" + po_num);
		request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);

	}

}