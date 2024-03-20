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

//첨부파일(file) 구현 시 주석해제
//@MultipartConfig(
//		maxFileSize = 1024 * 1024 * 10, 
//		maxRequestSize = 1024 * 1024 * 10 * 3, 
//		fileSizeThreshold = 1024 * 1024
//	)
@WebServlet("/post/update")
public class PostUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PostService postService = new PostServiceImp();
	private BoardService boardService = new BoardServiceImp();
	private CategoryService categoryService = new CategoryServiceImp();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

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
		// 게시판 이름 전달
		String bName = request.getParameter("bName");
		int bNum = Integer.parseInt(request.getParameter("bNum"));
		request.setAttribute("bName", bName);
		request.setAttribute("bNum", bNum);
		// 1. 게시글을 가져와서 화면에 전달
		// 화면에서 전송한 게시글 번호를 가져옴
		int num;
		try {
			num = Integer.parseInt(request.getParameter("num"));
		} catch (Exception e) {
			num = 0;
		}
		// 서비스에게 게시글 번호를 주면서 게시글을 가져오라고 명령
		PostVO post = postService.getPost(num);

		// 가져온 게시글을 화면에 전송
		request.setAttribute("post", post);

		// 서비스 보드VO로 잘못써서 수정 잘 해야함

		// 같으면
		// 3. 게시판을 가져와서 화면에 전달 : postService의 getBoardList()
		ArrayList<BoardVO> list2 = postService.getBoardList();
		// 서비스에게 게시판 리스트를 가져오라고 시킴
		request.setAttribute("list", list2);
		request.getRequestDispatcher("/WEB-INF/views/post/update.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		MemberVO user = (MemberVO) request.getSession().getAttribute("user");
		if (user == null) {
			request.setAttribute("msg", "로그인이 필요한 서비스입니다.");
			request.setAttribute("url", "login");
			request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
		} else {

			// 화면에서 전송한 게시글 번호, 제목, 내용을 가져옴
			int num;

			try {
				num = Integer.parseInt(request.getParameter("num"));

			} catch (Exception e) {
				num = 0;
			}
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			int bNum = Integer.parseInt(request.getParameter("bNum"));
			String bName = request.getParameter("bName");

			// 게시글 객체로 생성
			PostVO post = new PostVO(num, title, content, bNum);

			// 포스트서비스에게 게시글과 회원정보를 주면서 게시글을 수정하라고 명령
			boolean res = postService.updatePost(post, user);
			if (res) {
				request.setAttribute("msg", "수정을 성공했습니다.");
				request.setAttribute("url", "post/detail?num=" + num + "&bNum=" + bNum + "&bName=" + bName);
			} else {
				request.setAttribute("msg", "수정을 실패했습니다.");
				request.setAttribute("url", "post/update?num=" + num + "&bNum=" + bNum + "&bName=" + bName);
			}
			request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);

			/*
			 * ERD cloud에서 첨부파일(file) 구현 시 주석 해제 //새로 추가된 첨부파일 정보 가져옴 ArrayList<Part>
			 * fileList = (ArrayList<Part>) request.getParts();
			 * 
			 * //삭제할 첨부파일 정보 가져옴, 여러개일 수 있기 때문에 Values로 여러개를 읽어옴 String numsStr [] =
			 * request.getParameterValues("fi_num"); //문자열 -> 숫자로 바꿈 ArrayList<Integer> nums
			 * = new ArrayList<Integer>(); if(numsStr != null) { for(String numStr :
			 * numsStr) { try { int fi_num = Integer.parseInt(numStr); nums.add(fi_num); }
			 * catch (Exception e) {
			 * 
			 * } } }
			 */

		}
	}

}