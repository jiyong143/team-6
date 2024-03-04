package kr.kh.team6.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.kh.team6.model.vo.BoardVO;
import kr.kh.team6.model.vo.CategoryVO;
import kr.kh.team6.model.vo.MemberVO;
import kr.kh.team6.service.BoardService;
import kr.kh.team6.service.BoardServiceImp;

@WebServlet("/board/insert")
public class BoardInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService boardService = new BoardServiceImp();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberVO user = (MemberVO) session.getAttribute("user");

		if (user == null) {
			request.setAttribute("msg", "로그인이 필요한 서비스입니다. 로그인 창으로 이동합니다.");
			request.setAttribute("url", "/login");
			request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
		}

		// 게시판 전체
		ArrayList<CategoryVO> list = boardService.getCategoryList();
		request.setAttribute("list", list);
		request.getRequestDispatcher("/WEB-INF/views/board/insert.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		MemberVO user = (MemberVO) session.getAttribute("user");

		if (user == null ||!user.getMe_autority("admin")) {
			response.sendRedirect(request.getContextPath() + "/board/list");
			return;
		}

		String title = request.getParameter("title");
		int ca_num = Integer.parseInt(request.getParameter("category"));

		BoardVO board = new BoardVO(title, ca_num);

		if (boardService.insertBoard(board)) {
			request.setAttribute("msg", "게시판을 추가 했습니다.");
			request.setAttribute("url", "/board/list");
		} else {
			request.setAttribute("msg", "게시판 추가에 실패 했습니다.");
			request.setAttribute("url", "/board/insert");
		}
		request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);

	}

}
