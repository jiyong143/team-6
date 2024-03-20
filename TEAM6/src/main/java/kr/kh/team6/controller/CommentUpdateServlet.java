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
import kr.kh.team6.service.MemberService;
import kr.kh.team6.service.MemberServiceImp;
import kr.kh.team6.service.PostService;
import kr.kh.team6.service.PostServiceImp;


@WebServlet("/comment/update")
public class CommentUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private CommentService commentService = new CommentServiceImp();
    private PostService postService = new PostServiceImp();
    private MemberService memberService = new MemberServiceImp();
    private BoardService boardService = new BoardServiceImp();
	private CategoryService categoryService = new CategoryServiceImp();
    
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
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
	
		String bName = request.getParameter("bName");
		int bNum = Integer.parseInt(request.getParameter("bNum"));
		request.setAttribute("bName", bName);
		request.setAttribute("bNum", bNum);
		int cNum;
		try {
			cNum = Integer.parseInt(request.getParameter("cNum"));
		} catch (Exception e) {
			cNum = 0;
		}
		request.setAttribute("cNum", cNum);
		// 서비스에게 시켜서 해당 댓글을 가져온다( 그냥 내용만 가져오면 된다)
		CommentVO comment = commentService.getContent(cNum);
		
		request.setAttribute("comment", comment);
		// 댓글의 게시글 번호 가져옴
		int pNum = comment.getCo_po_num();
		request.setAttribute("pNum", pNum);
		
		PostVO post = postService.getPost(pNum);
		String id= post.getPo_me_id();
		MemberVO member = memberService.getMember(id);
		String name = member.getMe_name();
		request.setAttribute("name", name);
		request.setAttribute("post", post);
		MemberVO user = (MemberVO)request.getSession().getAttribute("user");
		if(comment == null
				|| !comment.getCo_me_id().equals(user.getMe_id())) {
					//다르면 게시글 상세로 보내고, 작성자가 아닙니다라고 메세지를 띄움
					request.setAttribute("msg", "댓글 작성자가 아닙니다.");
					request.setAttribute("url", "post/detail?num="+pNum);
					request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
					return; //return을 쓰면 else할 필요없이 바로 상세화면으로 이동
				}
		
		request.getRequestDispatcher("/WEB-INF/views/comment/update.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cNum = Integer.parseInt(request.getParameter("cNum"));
		
		int pNum = Integer.parseInt(request.getParameter("pNum"));
		String content = request.getParameter("content");
		
		String bName = request.getParameter("bName");
		int bNum = Integer.parseInt(request.getParameter("bNum"));
		
		request.setAttribute("bName", bName);
		request.setAttribute("bNum", bNum);
		
		if(commentService.updateComment(cNum,content)) {
			request.setAttribute("msg", "댓글을 수정했습니다.");
			request.setAttribute("url", "post/detail?num="+pNum + "&bNum=" + bNum + "&bName=" + bName);	
		}else { 
			request.setAttribute("msg", "댓글 수정을 실패했습니다.");
			request.setAttribute("url", "comment/update?bNum=" + bNum + "&cNum=" + cNum + "&bName=" + bName);
		}
		
		request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
	}

}