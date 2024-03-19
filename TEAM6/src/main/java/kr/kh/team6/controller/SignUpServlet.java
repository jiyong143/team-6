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
import kr.kh.team6.service.MemberService;
import kr.kh.team6.service.MemberServiceImp;

@WebServlet("/signup")
public class SignUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService memberService = new MemberServiceImp();
	private BoardService boardService = new BoardServiceImp();
	private CategoryService categoryService = new CategoryServiceImp();

	// 1. 서블릿 생성 후 doGet에 request.getRequestDispatcher 구현
	// 지금까지한건 화면에서 서버로 정보를 보낸 것
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

		request.getRequestDispatcher("/WEB-INF/views/signup.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String pw2 = request.getParameter("pw2");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String email = request.getParameter("email");
		String birth = request.getParameter("birth");

		MemberVO member = new MemberVO(id, pw, name, phone, address, email, birth);
		
		//모두 입력했을 시
		if(memberService.signup(member)) {
			//회원가입에 성공하면 메인 페이지로 이동
			request.setAttribute("msg", "회원가입에 성공했습니다.");
			request.setAttribute("url", "");
		} else {
			// 실패하면 회원가입 페이지 유지
			request.setAttribute("msg", "회원가입에 실패했습니다.");
			request.setAttribute("url", "signup");
		}
		request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);

	}

}