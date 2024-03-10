package kr.kh.team6.service;

import java.util.ArrayList;

import kr.kh.team6.model.vo.PostVO;
import kr.kh.team6.pagination.Criteria;

public interface SearchService {

	int getCount(Criteria cri);

	ArrayList<PostVO> getPostList(Criteria cri);

}
