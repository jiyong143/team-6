package kr.kh.team6.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.team6.model.vo.BoardVO;
import kr.kh.team6.model.vo.CategoryVO;

public interface BoardDAO {

	boolean insertBoard(@Param("board")BoardVO board);

	ArrayList<BoardVO> selectBoardList();

	ArrayList<CategoryVO> selectCategoryList();

	BoardVO selectBoard(@Param("num")int num);

	boolean deleteBoard(@Param("num")int num);

	boolean updateBoard(@Param("board")BoardVO board);
	

	

}
