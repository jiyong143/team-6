package kr.kh.team6.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.team6.model.vo.BoardVO;
import kr.kh.team6.model.vo.CategoryVO;
import kr.kh.team6.model.vo.MemberVO;
import kr.kh.team6.service.BoardService;
import kr.kh.team6.service.BoardServiceImp;

@WebServlet("/board/update")
public class BoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService boardService = new BoardServiceImp();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int num;
		try {
			num = Integer.parseInt(request.getParameter("num"));
		} catch (Exception e) {
			num = 0;
		}
		BoardVO board = boardService.getBoard(num);
		request.setAttribute("board", board);

		MemberVO user = (MemberVO) request.getSession().getAttribute("user");
		if (board == null ||!user.getMe_authority("admin")) {
			request.setAttribute("msg", "관리자 권한이 필요합니다. 관리자로 로그인 후 다시 시도하세요");
			request.setAttribute("url", "/");
			request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
			return;
		}

		ArrayList<CategoryVO> list = boardService.getCategoryList();
		request.setAttribute("list", list);
		request.getRequestDispatcher("/WEB-INF/views/board/update.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		MemberVO user = (MemberVO) request.getSession().getAttribute("user");

		int num, category;
		try {
			num = Integer.parseInt(request.getParameter("num"));
			category = Integer.parseInt(request.getParameter("category"));
		} catch (Exception e) {
			num = 0;
			category = 0;
		}
		String title = request.getParameter("title");
		BoardVO board = new BoardVO(num, title, category);
		boolean res = boardService.updateBoard(board, user);
		if (res) {
			request.setAttribute("msg", "게시판을 수정했습니다.");
		} else {
			request.setAttribute("msg", "게시판을 수정하지 못했습니다.");
		}
		request.setAttribute("url", "board/list?num=" + num);
		request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);

	}

}
