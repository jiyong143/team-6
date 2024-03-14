package kr.kh.team6.service;

import java.util.ArrayList;

import kr.kh.team6.model.vo.BoardVO;
import kr.kh.team6.model.vo.CategoryVO;
import kr.kh.team6.model.vo.MemberVO;

public interface BoardService {

	ArrayList<BoardVO> getBoardList();

	boolean insertBoard(BoardVO board);

	ArrayList<CategoryVO> getCategoryList();

	boolean deleteBoard(int num, MemberVO user);

	BoardVO getBoard(int num);

	boolean updateBoard(BoardVO board, MemberVO user);


}
