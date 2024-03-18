package kr.kh.team6.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

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
import kr.kh.team6.service.CategoryService;
import kr.kh.team6.service.CategoryServiceImp;

@WebServlet("/board/update")
public class BoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService boardService = new BoardServiceImp();
	private CategoryService categoryService = new CategoryServiceImp();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		MemberVO user = (MemberVO) request.getSession().getAttribute("user");
		if (!user.getMe_authority("admin")) {
			request.setAttribute("msg", "관리자 권한이 필요합니다. 관리자로 로그인 후 다시 시도하세요");
			request.setAttribute("url", "/");
			request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
			return;
		}
		// 왼쪽 토글 : 게시판들을 모두 가져온다
		ArrayList<BoardVO> bList = boardService.getBoardList();
		// 게시판을 포함하는 카테고리들의 번호로 구성된 리스트를 만든다
		List<Integer> list = new ArrayList<Integer>();
		for (BoardVO board : bList) {
			list.add(board.getBo_ca_num());
		}

		// 위 리스트 중복 제거
		Set<Integer> set = new HashSet<>(list);
		List<Integer> cNumList = new ArrayList<>(set);
		// 게시판 갖는 카테고리 리스트 생성
		ArrayList<CategoryVO> categoryList = new ArrayList<CategoryVO>();
		for (Integer cNum : cNumList) {
			categoryList.add(categoryService.getCategory(cNum));
		}
		// 검색어를 주고 게시글 리스트를 가져옴
		request.setAttribute("categoryList", categoryList);
		int num;
		try {
			num = Integer.parseInt(request.getParameter("bo_num"));
		} catch (Exception e) {
			num = 0;
		}
		BoardVO board = boardService.getBoard(num);
		ArrayList<CategoryVO> list2 = boardService.getCategoryList();
		request.setAttribute("board", board);
		request.setAttribute("list", list2);
		request.getRequestDispatcher("/WEB-INF/views/board/update.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		MemberVO user = (MemberVO) request.getSession().getAttribute("user");

		int num, category;
		try {
			num = Integer.parseInt(request.getParameter("bo_num"));
			category = Integer.parseInt(request.getParameter("bo_ca_num"));
		} catch (Exception e) {
			num = 0;
			category = 0;
		}
		String title = request.getParameter("bo_title");
		BoardVO board = new BoardVO(num, title, category);
		System.out.println("두포num" + num);
		System.out.println("두포board" + board);
		System.out.println("두포category" + category);
		System.out.println("두포title" + title);
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
