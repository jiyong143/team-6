package kr.kh.team6.dao;

import org.apache.ibatis.annotations.Param;

import kr.kh.team6.model.vo.CategoryVO;

public interface CategoryDAO {
	
	boolean insertCategory(@Param("category")CategoryVO category);

}
