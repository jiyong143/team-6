package kr.kh.team6.service;

import kr.kh.team6.model.dto.LoginDTO;
import kr.kh.team6.model.vo.MemberVO;

public interface MemberService {

	MemberVO login(LoginDTO loginDTO);

	boolean signup(MemberVO memberVO);

//	MemberVO getAuthority(String admin);

	boolean getAuthority(boolean admin);

	MemberVO getMember(LoginDTO loginDTO);
	
	boolean checkPwRegex(String me_pw);
	
	boolean checkNameRegex(String me_name);

	int compareName(String id, String name);

	
}