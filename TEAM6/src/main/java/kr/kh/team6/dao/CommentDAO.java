package kr.kh.team6.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.team6.model.vo.CommentVO;

public interface CommentDAO {

	boolean insertComment(@Param("comment")CommentVO comment);

	ArrayList<CommentVO> selectComments(@Param("num")int num);

	
}
