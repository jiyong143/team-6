package kr.kh.team6.service;

import java.util.ArrayList;

import kr.kh.team6.model.vo.CommentVO;
import kr.kh.team6.model.vo.PostVO;

public interface CommentService {

	boolean insertComment(CommentVO comment);

	ArrayList<CommentVO> getComments(int num);

	boolean deleteComment(int cNum);
	
	CommentVO getContent(int cNum);

	boolean updateComment(int cNum, String content);

	CommentVO getComment(int cNum);

	void deleteComments(int num);

	ArrayList<CommentVO> getCommentList();

	boolean adminDeleteComment(int co_num);

	ArrayList<CommentVO> allCommentList(int co_num);

	ArrayList<PostVO> selectPost(int co_po_num);


}