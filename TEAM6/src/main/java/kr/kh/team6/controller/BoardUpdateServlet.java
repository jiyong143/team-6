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
		
	
		MemberVO user = (MemberVO) request.getSession().getAttribute("admin");
		if (user == null || !user.getMe_authority().equals("admin")) {
			request.setAttribute("msg", "관리자 권한이 필요합니다. 관리자로 로그인 후 다시 시도하세요");
			request.setAttribute("url", "/");
			request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
		}

		int bo_num;
		try {
			bo_num = Integer.parseInt(request.getParameter("bo_num"));
		} catch (Exception e) {
			bo_num = 0;
		}
		BoardVO board = boardService.getBoard(bo_num);
		request.setAttribute("board", board);

		ArrayList<CategoryVO> list = boardService.getCategoryList();
		request.setAttribute("list", list);
		request.getRequestDispatcher("/WEB-INF/views/board/update.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		MemberVO admin = (MemberVO) request.getSession().getAttribute("admin");

		int bo_num,bo_ca_num;
		try {
			bo_num = Integer.parseInt(request.getParameter("bo_num"));
			bo_ca_num = Integer.parseInt(request.getParameter("bo_ca_num"));
		} catch (Exception e) {
			bo_num = 0;
			bo_ca_num = 0;
		}
		String bo_title = request.getParameter("bo_title");
		BoardVO board = new BoardVO(bo_num, bo_title, bo_ca_num);
		boolean res = boardService.updateBoard(board, admin);
		if (res) {
			request.setAttribute("msg", "게시판을 수정했습니다.");
		} else {
			request.setAttribute("msg", "게시판을 수정하지 못했습니다.");
		}
		request.setAttribute("url", "board/list?bo_num=" + bo_num);
		request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);

	}

}
