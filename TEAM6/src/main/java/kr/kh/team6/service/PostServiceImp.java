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

public class PostServiceImp implements PostService{
	
	private PostDAO postDao;
	InputStream inputStream;
	SqlSession session;

	public PostServiceImp(){
		String resource = "kr/kh/team6/config/mybatis-config.xml";
		try {
			inputStream = Resources.getResourceAsStream(resource);
			SqlSessionFactory sessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
			session = sessionFactory.openSession(true);
			postDao = session.getMapper(PostDAO.class);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
 
	@Override
	public ArrayList <PostVO> getPostList(int bo_num) {
		return postDao.selectPostList(bo_num);
		
	}

	@Override
	public boolean insertPost(PostVO post) {
		if(post==null||
		   !checkString(post.getPo_title())||
		   !checkString(post.getPo_content())) { 
			return false;   
		} 
		return postDao.insertPost(post);
	}
	
	// 문자열이 null 또는 빈 문자열인지 확인해주는 메서드
	public boolean checkString(String str) {
		if(str==null||str.length()==0) {
			return false;
		}
		return true;
	}

	

}