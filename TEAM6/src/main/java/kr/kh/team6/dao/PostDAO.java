package kr.kh.team6.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.team6.model.vo.BoardVO;
import kr.kh.team6.model.vo.MemberVO;
import kr.kh.team6.model.vo.PostVO;
import kr.kh.team6.pagination.Criteria;

public interface PostDAO {

	ArrayList<PostVO> selectPostList(@Param("cri") Criteria cri, @Param("bo_num")int bo_num);

	boolean insertPost(@Param("post")PostVO post);

	int selectTotalCount(@Param("cri")Criteria cri , @Param("bo_num")int bo_num);

	ArrayList<BoardVO> selectBoard();

	PostVO selectPost(@Param("num")int num);

	MemberVO selectPostMemberName(@Param("post")PostVO post);

	void updateView(@Param("num")int num);

	boolean deletePost(@Param("num")int num, @Param("user")MemberVO user);

	ArrayList<BoardVO> selectBoardList();

	boolean updatePost(@Param("post")PostVO post);

	ArrayList<PostVO> selectSearchPostList(@Param("search")String search);

	int selectCount(@Param("cri")Criteria cri);

	ArrayList<PostVO> selectAllPostList();

	boolean adminDeletePost(@Param("po_num")int po_num);



}