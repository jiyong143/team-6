package kr.kh.team6.service;

import java.util.ArrayList;

import kr.kh.team6.model.vo.BoardVO;
import kr.kh.team6.model.vo.CategoryVO;

public interface BoardService {

	ArrayList<BoardVO> getBoardList();

	boolean insertBoard(BoardVO board);

	ArrayList<CategoryVO> getCategoryList();

}
