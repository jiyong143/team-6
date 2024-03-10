package kr.kh.team6.service;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.kh.team6.dao.PostDAO;
import kr.kh.team6.model.vo.PostVO;
import kr.kh.team6.pagination.Criteria;

public class SearchServiceImp implements SearchService {
	
	private PostDAO postDao;

	public SearchServiceImp(){
		String resource = "kr/kh/team6/config/mybatis-config.xml";
		try {
			InputStream inputStream = Resources.getResourceAsStream(resource);
			SqlSessionFactory sessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
			SqlSession session = sessionFactory.openSession(true);
			postDao = session.getMapper(PostDAO.class);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public int getCount(Criteria cri) {
		if(cri == null) {
			cri = new Criteria();
		}
		return postDao.selectCount(cri);
	}

	@Override
	public ArrayList<PostVO> getPostList(Criteria cri) {
		if(cri == null) {
			cri = new Criteria();
		}
		return postDao.selectPostList(cri);
	}

}
