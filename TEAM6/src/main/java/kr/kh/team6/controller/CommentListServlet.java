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


@WebServlet("/member/comment")
public class CommentListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private CommentService commentService = new CommentServiceImp();  
    private CategoryService categoryService = new CategoryServiceImp();
	private BoardService boardService = new BoardServiceImp();

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MemberVO user = (MemberVO) request.getSession().getAttribute("user");
		if (user == null) {
			request.setAttribute("msg", "로그인이 필요한 서비스입니다.");
			request.setAttribute("url", "login");
			request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
		}
		int co_num,co_po_num;// 댓글 번호// 게시글 번호
		String co_content = request.getParameter("co_content"); //댓글 내용
		String co_me_id = request.getParameter("co_me_id");//댓글 작성자 
		try {
			co_num = Integer.parseInt(request.getParameter("co_num"));
			co_po_num = Integer.parseInt(request.getParameter("co_po_num"));
		} catch (Exception e) {
			co_num = 0;
			co_po_num = 0;
		}
		CommentVO commentVo = new CommentVO(co_po_num, co_po_num, co_me_id, co_me_id);
		ArrayList<PostVO> postList= commentService.selectPost(co_po_num);
		ArrayList<CommentVO> commentList = commentService.getCommentList();
		ArrayList<CommentVO> comment = commentService.allCommentList(co_num);
		request.setAttribute("commentVo", commentVo);
		request.setAttribute("comment", comment);
		request.setAttribute("commentList", commentList);
		
		
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
		
		
		
		request.getRequestDispatcher("/WEB-INF/views/member/comment.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}