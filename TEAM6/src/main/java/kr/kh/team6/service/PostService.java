package kr.kh.team6.service;

import java.util.ArrayList;

import kr.kh.team6.model.vo.PostVO;
import kr.kh.team6.pagination.Criteria;

public interface PostService {

	ArrayList<PostVO> getPostList(Criteria cri, int bo_num);

	boolean insertPost(PostVO post);

	int getTotalCount(Criteria cri, int bo_num);

	

}