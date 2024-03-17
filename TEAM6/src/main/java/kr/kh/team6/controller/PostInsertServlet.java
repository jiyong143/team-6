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
import kr.kh.team6.model.vo.PostVO;
import kr.kh.team6.service.BoardService;
import kr.kh.team6.service.BoardServiceImp;
import kr.kh.team6.service.CategoryService;
import kr.kh.team6.service.CategoryServiceImp;
import kr.kh.team6.service.PostService;
import kr.kh.team6.service.PostServiceImp;

@WebServlet("/post/insert")
public class PostInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PostService postService = new PostServiceImp();
	private BoardService boardService = new BoardServiceImp();
	private CategoryService categoryService = new CategoryServiceImp();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String search = request.getParameter("search");

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
		ArrayList<PostVO> list2 = postService.getSearchPostList(search);
		for (Integer cNum : cNumList) {
			categoryList.add(categoryService.getCategory(cNum));
		}
		// 검색어를 주고 게시글 리스트를 가져옴
		request.setAttribute("categoryList", categoryList);
		request.setAttribute("list", list2); // 화면에 전송
		// 세션에서 회원 정보를 가져옴(이미 로그인 상태겠지만 혹시나 추가)
		MemberVO user = (MemberVO) request.getSession().getAttribute("user");
		if (user == null) {
			request.setAttribute("msg", "로그인이 필요한 서비스입니다.");
			request.setAttribute("url", "login");
			request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
		} else {

			// 게시판 번호 가져옴
			int bNum = Integer.parseInt(request.getParameter("bNum"));
			request.setAttribute("bNum", bNum);
			String bName = request.getParameter("bName");
			request.setAttribute("bName", bName);
			request.getRequestDispatcher("/WEB-INF/views/post/insert.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int board = Integer.parseInt(request.getParameter("bNum"));
		String bName = request.getParameter("bName");
		// 세션에서 회원 정보 가져옴(게시글 등록 창을 넘어갈 때는 로그인 상태지만 시간이 많이 지난 경우)
		MemberVO user = (MemberVO) request.getSession().getAttribute("user");
		if (user == null) {
			request.setAttribute("msg", "로그인이 필요한 서비스입니다.");
			request.setAttribute("url", "post/list");
			request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
			return;
		}

		String writer = user.getMe_id(); // 게시글 작성자 아이디
		PostVO post = new PostVO(title, content, board, writer); // 추가할 게시글 객체
		if (postService.insertPost(post)) {
			request.setAttribute("msg", "게시글을 등록했습니다.");
			request.setAttribute("url", "/post/list?bNum=" + board);
		} else {
			request.setAttribute("msg", "게시글을 등록하지 못했습니다.");
			request.setAttribute("url", "/post/insert?bNum=" + board + "&bName=" + bName);
		}
		request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
	}
}