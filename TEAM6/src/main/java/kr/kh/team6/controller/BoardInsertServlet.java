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
import kr.kh.team6.service.BoardService;
import kr.kh.team6.service.BoardServiceImp;

@WebServlet("/board/insert")
public class BoardInsertServlet extends HttpServlet {
	 private static final long serialVersionUID = 1L;
	   private BoardService boardService = new BoardServiceImp();
	       
	   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      HttpSession session = request.getSession();
	      MemberVO user = (MemberVO)session.getAttribute("user") ;
	      
	      if (user == null) {
	         response.sendRedirect(request.getContextPath() + "/board/list");
	         return;
	      }
	      
	      // 게시판 전체
	      ArrayList<CategoryVO> list = boardService.getCategoryList();
	      request.setAttribute("list", list);
	      request.getRequestDispatcher("/WEB-INF/views/board/insert.jsp").forward(request, response);
	      
	      

	   }
	   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      
	      HttpSession session = request.getSession();
	      MemberVO user = (MemberVO)session.getAttribute("user") ;

	      if (user == null) {
	         response.sendRedirect(request.getContextPath() + "/board/list");
	         return;
	      }
	      
	      String title = request.getParameter("title");
	      String content = request.getParameter("content");
	      String writer = user.getMe_id();
	      int ca_num = Integer.parseInt(request.getParameter("category"));
	      
	      BoardVO board = new BoardVO(title,content,writer,ca_num);
	      
	      if(boardService.insertBoard(board)) {
	         response.sendRedirect(request.getContextPath() + "/board/list");
	      } else {
	         response.sendRedirect(request.getContextPath() + "/board/insert");
	      }
	      
	   }


}
