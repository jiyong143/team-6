package kr.kh.team6.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import kr.kh.team6.model.vo.BoardVO;
import kr.kh.team6.model.vo.MemberVO;
import kr.kh.team6.model.vo.PostVO;
import kr.kh.team6.service.PostService;
import kr.kh.team6.service.PostServiceImp;

@WebServlet("/post/update")
@MultipartConfig(
	maxFileSize = 1024 * 1024 * 10, 
	maxRequestSize = 1024 * 1024 * 10 * 3, 
	fileSizeThreshold = 1024 * 1024
)
public class PostUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PostService postService = new PostServiceImp();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 게시글을 가져와서 화면에 전달
		//화면에서 전송한 게시글 번호를 가져옴
		int num;
		try {
			num = Integer.parseInt(request.getParameter("num")); 
		} catch(Exception e) {
			num = 0;
		}
		//서비스에게 게시글 번호를 주면서 게시글을 가져오라고 명령(이미 구현)
		PostVO post = postService.getPost(num);
		//가져온 게시글을 화면에 전송
		request.setAttribute("post", post);
		
		//2. 작성자가 맞는지 확인
		//세션에 회원 정보를 가져옴
		MemberVO user = (MemberVO)request.getSession().getAttribute("user");
		//게시글 작성자와 회원아이디가 같은지 확인
		if(post == null
		|| !post.getPo_me_id().equals(user.getMe_id())) {
			//다르면 게시글 상세로 보내고, 작성자가 아닙니다라고 메세지를 띄움
			request.setAttribute("msg", "작성자가 아닙니다.");
			request.setAttribute("url", "post/detail?num="+num);
			request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
			return; //return을 쓰면 else할 필요없이 바로 상세화면으로 이동
		}
		/* 첨부파일(file) ERD cloud 구현 후 주석 해제
		//게시글의 첨부파일을 가져와서 화면에 전송
		ArrayList<FileVO> fileList = postService.getFile(num);
		request.setAttribute("fileList", fileList);
		*/
		
		//같으면
		//3. 게시판을 가져와서 화면에 전달 : postService의 getBoardList()
		ArrayList<BoardVO> list = postService.getBoardList();
		//서비스에게 게시판 리스트를 가져오라고 시킴
		request.setAttribute("list", list);
		request.getRequestDispatcher("/WEB-INF/views/post/update.jsp").forward(request, response);	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MemberVO user = (MemberVO)request.getSession().getAttribute("user");
		
		//화면에서 전송한 번호, 제목, 내용, 게시판을 가져옴
		int num, board;
		try {
			num = Integer.parseInt(request.getParameter("num"));
			board = Integer.parseInt(request.getParameter("board"));
		}catch(Exception e) {
			num = 0;
			board = 0;
		}
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		//게시글 객체로 생성
		PostVO post = new PostVO(num, title, content, board);
		
		/* ERD cloud에서 첨부파일(file) 구현 시 주석 해제
		//새로 추가된 첨부파일 정보 가져옴
		ArrayList<Part> fileList = (ArrayList<Part>) request.getParts();
		
		//삭제할 첨부파일 정보 가져옴, 여러개일 수 있기 때문에 Values로 여러개를 읽어옴
		String numsStr [] = request.getParameterValues("fi_num");
		//문자열 -> 숫자로 바꿈
		ArrayList<Integer> nums = new ArrayList<Integer>();
		if(numsStr != null) {
			for(String numStr : numsStr) {
				try {
					int fi_num = Integer.parseInt(numStr);
					nums.add(fi_num);
				} catch (Exception e) {
					
				}			
			}
		}
		*/
		
		//포스트서비스에게 게시글과 회원정보를 주면서 게시글을 수정하라고 명령
		boolean res = postService.updatePost(post, user);
		if(res) {
			request.setAttribute("msg", "수정을 성공했습니다.");
		}
		else {
			request.setAttribute("msg", "수정을 실패했습니다.");
		}
		request.setAttribute("url", "post/detail?num="+num);			
		request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
	}

}
