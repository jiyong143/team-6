package kr.kh.team6.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.team6.model.vo.BoardVO;
import kr.kh.team6.model.vo.PostVO;
import kr.kh.team6.pagination.Criteria;

public interface PostDAO {

	ArrayList<PostVO> selectPostList(@Param("cri") Criteria cri, @Param("bo_num")int bo_num);

	boolean insertPost(@Param("post")PostVO post);

	int selectTotalCount(@Param("cri")Criteria cri , @Param("bo_num")int bo_num);

	ArrayList<BoardVO> selectBoard();


}