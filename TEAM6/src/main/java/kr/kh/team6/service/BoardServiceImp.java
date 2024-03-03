package kr.kh.team6.service;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.kh.team6.dao.BoardDAO;
import kr.kh.team6.model.vo.BoardVO;
import kr.kh.team6.model.vo.CategoryVO;

public class BoardServiceImp implements BoardService{

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
		if( board == null || 
			board.getBo_title() == null || 
			board.getBo_title().length() == 0) {
			return false;
		}
		if(board.getBo_me_id() == null) {
			return false;
		}
		if(board.getBo_content() == null) {
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
}