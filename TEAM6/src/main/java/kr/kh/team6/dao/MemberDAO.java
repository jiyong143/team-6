package kr.kh.team6.dao;

import org.apache.ibatis.annotations.Param;

import kr.kh.team6.model.vo.MemberVO;

public interface MemberDAO {

	boolean insertMember(@Param("member")MemberVO memberVO);

	MemberVO selectMember(@Param("me_id")String id);
}
