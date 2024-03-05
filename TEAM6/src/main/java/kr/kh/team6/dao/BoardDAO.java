package kr.kh.team6.dao;

import java.util.ArrayList;

import kr.kh.team6.model.vo.BoardVO;

public interface BoardDAO {

	ArrayList<BoardVO> selectBoardList();

}
