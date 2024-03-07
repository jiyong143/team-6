package kr.kh.team6.service;

import java.util.ArrayList;

import kr.kh.team6.model.vo.CommentVO;

public interface CommentService {

	boolean insertComment(CommentVO comment);

	ArrayList<CommentVO> getComments(int num);

}