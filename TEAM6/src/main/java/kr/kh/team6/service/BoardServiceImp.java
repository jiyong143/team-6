package kr.kh.team6.service;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.kh.team6.dao.BoardDAO;
import kr.kh.team6.model.vo.BoardVO;
import kr.kh.team6.model.vo.CategoryVO;
import kr.kh.team6.model.vo.MemberVO;

public class BoardServiceImp implements BoardService {

	private BoardDAO boardDao;

	public BoardServiceImp() {
		String resource = "kr/kh/team6/config/mybatis-config.xml";

		try {
			InputStream inputStream = Resources.getResourceAsStream(resource);
			SqlSessionFactory sessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
			SqlSession session = sessionFactory.openSession(true);
			boardDao = session.getMapper(BoardDAO.class);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public boolean insertBoard(BoardVO board) {
		if (board == null 
				|| board.getBo_title() == null 
				|| board.getBo_title().isEmpty()) {
			return false;
		}
		 
		return boardDao.insertBoard(board);
	}

	@Override
	public ArrayList<BoardVO> getBoardList() {
		return boardDao.selectBoardList();
	}

	@Override
	public ArrayList<CategoryVO> getCategoryList() {
		return boardDao.selectCategoryList();
	}

	private boolean checkString(String str) {
		if (str == null || str.length() == 0) {
			return false;
		}
		return true;
	}

	@Override
	public boolean deleteBoard(int num, MemberVO user) {
		if (user == null) {
			return false;
		}
		BoardVO board = boardDao.selectBoard(num);
		if (board == null || !user.getMe_authority("admin")) {
			return false;
		}
		return boardDao.deleteBoard(num);
	}

	@Override
	public BoardVO getBoard(int num) {
		return boardDao.selectBoard(num);
	}

	@Override
	public boolean updateBoard(BoardVO board, MemberVO user) {
		if (user == null) {
			return false;
		}
		if (board == null || !user.getMe_authority().equals("admin") || !checkString(board.getBo_title())) {
			return false;
		}
		BoardVO dbBoard = boardDao.selectBoard(board.getBo_num());
		if (dbBoard == null) {
			return false;
		}
		// 같으면 게시글 수정
		return boardDao.updateBoard(board);
	}
}
