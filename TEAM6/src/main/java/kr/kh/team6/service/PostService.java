package kr.kh.team6.service;

import java.util.ArrayList;

import kr.kh.team6.model.vo.PostVO;

public interface PostService {

	ArrayList<PostVO> getPostList(int bo_num);

	boolean insertPost(PostVO post);

	

}