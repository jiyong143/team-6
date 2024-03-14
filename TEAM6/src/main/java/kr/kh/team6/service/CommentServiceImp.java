package kr.kh.team6.service;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.kh.team6.dao.CommentDAO;
import kr.kh.team6.model.vo.CommentVO;

public class CommentServiceImp implements CommentService {
	
	private CommentDAO commentDao;
	
	public CommentServiceImp() {
		String resource = "kr/kh/team6/config/mybatis-config.xml";

		try {
			InputStream inputStream = Resources.getResourceAsStream(resource);
			SqlSessionFactory sessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
			SqlSession session = sessionFactory.openSession(true);
			commentDao = session.getMapper(CommentDAO.class);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public boolean insertComment(CommentVO comment) {
		if(comment==null|| 
		   comment.getCo_content()==null||
		   comment.getCo_me_id()==null||
		   comment.getCo_po_num()==0) {
			return false;
		}		
		return commentDao.insertComment(comment);
	}

	@Override
	public ArrayList<CommentVO> getComments(int num) {
		return commentDao.selectComments(num);
		
	}

	@Override
	public boolean deleteComment(int cNum) {
		if(cNum==0) {
			return false;
		}
		return commentDao.deleteComment(cNum);
	}

	@Override
	public CommentVO getContent(int cNum) {
		if(cNum==0) { 
			return null;
		}
		return commentDao.selectContent(cNum);
	}

	@Override
	public boolean updateComment(int cNum, String content) {
		if(cNum==0||content==null) {
			return false;
		}
			return commentDao.updateComment(cNum,content); 
	}

	@Override
	public CommentVO getComment(int cNum) {
		if(cNum==0) {
			return null;
		}
		return commentDao.selectComment(cNum);
		
	}

	@Override
	public void deleteComments(int num) {
		commentDao.deleteComments(num);
		
	}

}