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
import kr.kh.team6.pagination.Criteria;
import kr.kh.team6.pagination.PageMaker;
import kr.kh.team6.service.BoardService;
import kr.kh.team6.service.BoardServiceImp;
import kr.kh.team6.service.CategoryService;
import kr.kh.team6.service.CategoryServiceImp;
import kr.kh.team6.service.PostService;
import kr.kh.team6.service.PostServiceImp;

@WebServlet("/post/list")
public class PostListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PostService postService = new PostServiceImp();
	BoardService boardService = new BoardServiceImp();
	private CategoryService categoryService = new CategoryServiceImp();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 게시판들을 모두 가져온다
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
		// 세션에서 회원 정보를 가져온다
		MemberVO user = (MemberVO) request.getSession().getAttribute("user");
		if (user == null) {
			request.setAttribute("msg", "로그인이 필요한 서비스입니다.");
			request.setAttribute("url", "login");
			request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
		} else {
			// 선택한 게시판 번호 가져오는 부분 추가
			String search = request.getParameter("search");
			String type = request.getParameter("type");
			int page;
			try {
				page = Integer.parseInt(request.getParameter("page"));
			} catch (Exception e) {
				page = 1;
			}
			Criteria cri = new Criteria(page, 10, type, search);
			int bo_num = Integer.parseInt(request.getParameter("bNum"));
			// 게시판 자체를 가져온다
			BoardVO board = boardService.getBoard(bo_num);
			request.setAttribute("board", board);
			request.setAttribute("bo_num", bo_num);
			// 화면에 게시글 리스트를 전송... 화면에서 사용할 이름은 postList 로 하자
			ArrayList<PostVO> postList = postService.getPostList(cri, bo_num);
			request.setAttribute("postList", postList);
			// 검색어, 검색타입에 맞는 전체 게시글 개수를 가져오는 과정
			int totalCount = postService.getTotalCount(cri, bo_num);
			PageMaker pm = new PageMaker(5, cri, totalCount);
			request.setAttribute("pm", pm);
			request.getRequestDispatcher("/WEB-INF/views/post/list.jsp").forward(request, response);
		}

	}

}