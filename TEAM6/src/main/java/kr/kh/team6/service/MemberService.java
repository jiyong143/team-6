package kr.kh.team6.service;

import kr.kh.team6.model.dto.LoginDTO;
import kr.kh.team6.model.vo.MemberVO;

public interface MemberService {

	MemberVO getMember(LoginDTO loginDTO);

	boolean signup(MemberVO memberVO);  

}