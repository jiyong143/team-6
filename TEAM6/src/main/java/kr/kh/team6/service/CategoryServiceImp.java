package kr.kh.team6.service;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.kh.team6.dao.CategoryDAO;
import kr.kh.team6.model.vo.CategoryVO;

public class CategoryServiceImp implements CategoryService{
	
	CategoryDAO categoryDAO;

	public CategoryServiceImp() {
		String resource = "kr/kh/team6/config/mybatis-config.xml";
		
		try {
			InputStream inputStream = Resources.getResourceAsStream(resource);
			SqlSessionFactory sessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
			SqlSession session = sessionFactory.openSession(true);
			categoryDAO = session.getMapper(CategoryDAO.class);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public boolean insertCategory(String ca_title) {
		if(ca_title == null || ca_title.length() == 0) {
			return false;
		}
		return categoryDAO.insertCategory(ca_title);
	}
	

}
