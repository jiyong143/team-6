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
import kr.kh.team6.model.vo.PostVO;
import kr.kh.team6.service.BoardService;
import kr.kh.team6.service.BoardServiceImp;
import kr.kh.team6.service.CategoryService;
import kr.kh.team6.service.CategoryServiceImp;
import kr.kh.team6.service.PostService;
import kr.kh.team6.service.PostServiceImp;

@WebServlet("/")
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PostService postService = new PostServiceImp();
	private BoardService boardService = new BoardServiceImp();
	private CategoryService categoryService = new CategoryServiceImp();

	public MainServlet() {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 검색어를 가져옴
		String search = request.getParameter("search");

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
		ArrayList<PostVO> list2 = postService.getSearchPostList(search);
		for (Integer cNum : cNumList) {
			categoryList.add(categoryService.getCategory(cNum));
		}
		// 검색어를 주고 게시글 리스트를 가져옴
		request.setAttribute("categoryList", categoryList);
		request.setAttribute("list", list2); // 화면에 전송
		request.getRequestDispatcher("/WEB-INF/views/home.jsp").forward(request, response);
	}

}
