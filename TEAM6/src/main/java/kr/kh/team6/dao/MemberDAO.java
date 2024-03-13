package kr.kh.team6.dao;

import org.apache.ibatis.annotations.Param;

import kr.kh.team6.model.vo.MemberVO;

public interface MemberDAO {

	boolean insertMember(@Param("member")MemberVO memberVO);

	MemberVO selectAuthority(@Param("admin")String admin);

	boolean selectAuthority(boolean admin);
	
	MemberVO selectMember(@Param("me_id")String id);

	int countName(@Param("id")String id, @Param("name")String name);

	int countPhone(@Param("id")String id,@Param("phone") String phone);

	int countEmail(@Param("id")String id, @Param("email")String email);

	boolean updateMember(@Param("id")String id, @Param("pw")String pw, @Param("phone") String phone,  @Param("address")String address, @Param("name") String name,  @Param("email")String email);

}