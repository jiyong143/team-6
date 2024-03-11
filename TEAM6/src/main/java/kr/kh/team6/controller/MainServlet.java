package kr.kh.team6.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.team6.model.vo.PostVO;
import kr.kh.team6.pagination.Criteria;
import kr.kh.team6.pagination.PageMaker;
import kr.kh.team6.service.SearchService;
import kr.kh.team6.service.SearchServiceImp;


@WebServlet("/")
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private SearchService searchService = new SearchServiceImp();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//검색어를 가져옴, 현재 페이지 정보도 가져옴
		String search = request.getParameter("search");
		int page;
		try {
			page = Integer.parseInt(request.getParameter("page"));
		} catch(Exception e) {
			page = 1;
		}
		
		//검색어, 현재 페이지, 한 페이지 컨텐츠 개수르 이용하여 현재 페이지 정보 객체를 생성
		Criteria cri = new Criteria(page, search, 3);
		//검색어에 맞는 전체 게시글 개수를 가져옴
		int totalCount = searchService.getCount(cri);	//cri 정보를 주고 현재 컨텐츠 개수를 가져오세요
		PageMaker pm = new PageMaker(3, cri, totalCount);
		request.setAttribute("pm", pm);
		//현재 페이지 정보에 맞는 게시글 리스트를 가져오는 코드
		ArrayList<PostVO> list = searchService.getSearchPostList(cri);
		request.setAttribute("list", list); //화면에 전송
		request.getRequestDispatcher("/WEB-INF/views/home.jsp").forward(request, response);
	}

}