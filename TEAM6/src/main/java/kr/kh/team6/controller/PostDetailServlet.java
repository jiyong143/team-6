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
import kr.kh.team6.model.vo.CommentVO;
import kr.kh.team6.model.vo.MemberVO;
import kr.kh.team6.model.vo.PostVO;
import kr.kh.team6.service.BoardService;
import kr.kh.team6.service.BoardServiceImp;
import kr.kh.team6.service.CategoryService;
import kr.kh.team6.service.CategoryServiceImp;
import kr.kh.team6.service.CommentService;
import kr.kh.team6.service.CommentServiceImp;
import kr.kh.team6.service.PostService;
import kr.kh.team6.service.PostServiceImp;

@WebServlet("/post/detail")
public class PostDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private PostService postService = new PostServiceImp();   
    private CommentService commentService = new CommentServiceImp();
    private BoardService boardService = new BoardServiceImp();
    private CategoryService categoryService = new CategoryServiceImp();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 로그인 안된 사람인지 확인 
		MemberVO user = (MemberVO) request.getSession().getAttribute("user");
		if (user == null) {
			request.setAttribute("msg", "로그인이 필요한 서비스입니다.");
			request.setAttribute("url", "login");
			request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
		}else {
		// 화면에서 보낸 게시글 번호를 가져옴 
		int num;
		try {
			num = Integer.parseInt(request.getParameter("num"));
		}catch(Exception e) {
			num=0;
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
		request.setAttribute("num", num);

		// 서비스에게 게시글 번호를 주면서 게시글 조회수를 증가하라고 시킴 
		postService.updateView(num);
		// 서비스에게 게시글 번호를 주면서 게시글을 가져온다
		PostVO post = postService.getPost(num);
		MemberVO member = postService.getPostMemberName(post); 
		String name= member.getMe_name(); // 클릭한 게시글의 작성자 이름 
		
		// 게시글에 딸린 댓글들을 가져온다
		ArrayList <CommentVO> comments = commentService.getComments(num);
		request.setAttribute("comments", comments);
		
		// 화면에 게시글을 전송 
		request.setAttribute("post", post);
		request.setAttribute("name", name);
		// 화면을 전송 
		request.getRequestDispatcher("/WEB-INF/views/post/detail.jsp").forward(request, response);
	}
	}
}
