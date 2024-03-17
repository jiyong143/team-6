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
import kr.kh.team6.model.vo.PostVO;
import kr.kh.team6.service.BoardService;
import kr.kh.team6.service.BoardServiceImp;
import kr.kh.team6.service.CategoryService;
import kr.kh.team6.service.CategoryServiceImp;
import kr.kh.team6.service.MemberService;
import kr.kh.team6.service.MemberServiceImp;
import kr.kh.team6.service.PostService;
import kr.kh.team6.service.PostServiceImp;

@WebServlet("/admin/manager")
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private MemberService memberService = new MemberServiceImp();
	private PostService postService = new PostServiceImp();
	private BoardService boardService = new BoardServiceImp();
	private CategoryService categoryService = new CategoryServiceImp();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 관리가 권한 예외 처리
		HttpSession session = request.getSession();
		MemberVO user = (MemberVO) session.getAttribute("admin");

		if (user == null || !user.getMe_authority().equals("admin")) {
			request.setAttribute("msg", "관리자 권한이 필요합니다. 관리자로 로그인 후 다시 시도하세요");
			request.setAttribute("url", "/");
			request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
		}
		// 각 기능마다 list 출력하기
		//category리스트
		ArrayList<CategoryVO> categoryList = categoryService.getCategoryList();
		//board 리스트 
		ArrayList<BoardVO> boardList = boardService.getBoardList();
		//post리스트
		ArrayList<PostVO> postList = postService.getAllPostList();
		//member리스트
		ArrayList<MemberVO> memberList = memberService.getMemberList();
		int memberCount = memberList.size();
		System.out.println(memberCount);
		//board
		request.setAttribute("boardList", boardList);// 화면에 전송
		//category
		request.setAttribute("categoryList", categoryList);// 화면에 전송
		//poost
		request.setAttribute("postList", postList);
		//member
		request.setAttribute("memberList", memberList);
		
		request.setAttribute("memberCount", memberCount);
		/* 카테고리 서비스에서 리스트 가져오는 코드 /* 게시판 서비스에서 리스트 가져오는 코드 /* 게시글 서비스에서 리스트 가져오는 코드 /*
		 * 멤버 서비스에서 리스트 가져오는 코드 작성 전체 회원수
		 */
		
		request.getRequestDispatcher("/WEB-INF/views/admin/manager.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
