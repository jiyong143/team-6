package kr.kh.team6.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.team6.model.vo.BoardVO;
import kr.kh.team6.model.vo.CategoryVO;

public interface CategoryDAO {
	
	boolean insertCategory(@Param("ca_title")String ca_title);

	ArrayList<CategoryVO> seleteCategoryList();

	CategoryVO seleteCategory(@Param("ca_num")int ca_num);

	boolean deleteCategory(@Param("num")int num);

	CategoryVO selectGetCategory(@Param("ca_num")int ca_num);

	boolean updateCategory(@Param("category")CategoryVO category);

}
