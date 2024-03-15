package kr.kh.team6.service;

import java.util.ArrayList;

import kr.kh.team6.model.vo.BoardVO;
import kr.kh.team6.model.vo.CategoryVO;
import kr.kh.team6.model.vo.MemberVO;

public interface CategoryService {

	boolean insertCategory(String ca_title);

	ArrayList<CategoryVO> getCategoryList();

	boolean deleteCategory(int num, MemberVO user);

	CategoryVO getCategory(int num, String ca_title);

	boolean updateCategory(CategoryVO category, MemberVO admin);

	CategoryVO getCategory(int cNum);

	ArrayList<BoardVO> getBoardInCategory(int ca_num);


	
	
	
}