package kr.kh.team6.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.team6.model.vo.BoardVO;
import kr.kh.team6.model.vo.PostVO;

public interface PostDAO {

	ArrayList<PostVO> selectPostList(@Param("bo_num")int bo_num);

	boolean insertPost(@Param("post")PostVO post);


}