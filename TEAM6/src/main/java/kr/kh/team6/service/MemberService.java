package kr.kh.team6.service;

import java.util.ArrayList;

import kr.kh.team6.model.dto.LoginDTO;
import kr.kh.team6.model.vo.MemberVO;
import kr.kh.team6.model.vo.PostVO;

public interface MemberService {

	MemberVO login(LoginDTO loginDTO);

	boolean signup(MemberVO memberVO);

	boolean getAuthority(boolean admin);

	MemberVO getMember(LoginDTO loginDTO);
	
	boolean checkPwRegex(String me_pw);
	
	boolean checkNameRegex(String me_name);

	int compareName(String id, String name);

	boolean checkPhoneRegex(String phone);

	int comparePhone(String id, String phone);

	boolean checkEmailRegex(String email);

	int compareEmail(String id, String email);

	boolean checkAddressRegex(String address);

	boolean updateMember(String id, String pw, String phone, String address, String name, String email);

	boolean checkIdRegex(String id);

	boolean checkDuplicateId(MemberVO member, String id);
  
	ArrayList<MemberVO> getMemberList();

	boolean deleteMember(String me_id, MemberVO user);

	MemberVO getMember(String id);

	ArrayList<PostVO> selectPost(String id);

	ArrayList<MemberVO> getAdminMemberList();
	
}