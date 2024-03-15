package kr.kh.team6.service;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.kh.team6.dao.CategoryDAO;
import kr.kh.team6.model.vo.BoardVO;
import kr.kh.team6.model.vo.CategoryVO;
import kr.kh.team6.model.vo.MemberVO;

public class CategoryServiceImp implements CategoryService {

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
		if (ca_title == null || ca_title.length() == 0) {
			return false;
		}
		return categoryDAO.insertCategory(ca_title);
	}

	@Override
	public ArrayList<CategoryVO> getCategoryList() {
		return categoryDAO.seleteCategoryList();
	}

	@Override
	public boolean deleteCategory(int num, MemberVO user) {
		if (user == null) {
			return false;
		}
		CategoryVO category = categoryDAO.seleteCategorydel(num);
		if (category == null || !user.getMe_authority("admin")) {
			return false;
		}
		return categoryDAO.deleteCategory(num);
	}

	@Override
	public CategoryVO getCategory(int num, String ca_title) {
		return categoryDAO.seleteCategory(num,ca_title);
	}

	@Override
	public boolean updateCategory(CategoryVO category, MemberVO admin) {
		if (admin == null || category == null) {
			return false;
		}
		if (!admin.getMe_authority().equals("admin") || !checkString(category.getCa_title())) {
			return false;
		}
		CategoryVO dbCategory = categoryDAO.selectGetCategory(category.getCa_num());
		if (dbCategory == null) {
			return false;
		}
		// 같으면 게시글 수정
		return categoryDAO.updateCategory(category);
	}

	private boolean checkString(String str) {
		if (str == null || str.length() == 0) {
			return false;
		}
		return true;
	}

	@Override
	public CategoryVO getCategory(int cNum) {
		return categoryDAO.selectCategory(cNum); 
	}

	@Override
	public ArrayList<BoardVO> getBoardInCategory(int ca_num) {
		if(ca_num==0) {
			return null;
		}
		return categoryDAO.selectBoardInCategory(ca_num);
	}

}