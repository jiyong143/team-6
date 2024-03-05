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

public class BoardServiceImp implements BoardService {
	
	private BoardDAO boardDao;
	InputStream inputStream;
	SqlSession session;
	
	public BoardServiceImp() {
		
		String resource = "kr/kh/team6/config/mybatis-config.xml";
		try {
			inputStream = Resources.getResourceAsStream(resource);
			SqlSessionFactory sessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
			session = sessionFactory.openSession(true);
			boardDao = session.getMapper(BoardDAO.class);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public ArrayList<BoardVO> getBoardList() {
		
		return boardDao.selectBoardList(); 
	}

}
