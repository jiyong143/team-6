package kr.kh.team6.service;

import java.io.IOException;
import java.io.InputStream;
import java.util.regex.Pattern;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.kh.team6.dao.MemberDAO;
import kr.kh.team6.model.dto.LoginDTO;
import kr.kh.team6.model.vo.MemberVO;

public class MemberServiceImp implements MemberService {

	private MemberDAO memberDao;
	
	public MemberServiceImp() {
		String resource = "kr/kh/team6/config/mybatis-config.xml";
		InputStream inputStream;
		SqlSession session;
		try {
			inputStream = Resources.getResourceAsStream(resource);
			SqlSessionFactory sessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
			session = sessionFactory.openSession(true);
			memberDao = session.getMapper(MemberDAO.class);
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
	@Override
	public MemberVO login(LoginDTO loginDTO) {
		if(loginDTO == null) {
			return null;
		}
		//아이디를 주고 회원 정보를 요청
		MemberVO user = memberDao.selectMember(loginDTO.getId());
		//아이디가 잘못 입력되면
		if(user == null) {
			return null; //없다고 리턴
		}
		//아이디는 있고, 비번이 같은지 확인
		if(user.getMe_pw().equals(loginDTO.getPw())) {
			//같다면 user 리턴
			return user;
		}
		//비번이 다르면 null 리턴
		return null;
	}

	@Override
	public boolean signup(MemberVO memberVO) {
		if(memberVO == null) {
			return false;
		}
		//정규표현식 체크 코드
		if(!checkIdRegex(memberVO.getMe_id()) || !checkPwRegex(memberVO.getMe_pw())) {
			return false;
		}
		
		//아이디 중복
		MemberVO dbMember = memberDao.selectMember(memberVO.getMe_id());
		if(dbMember != null) {
			return false;
		}

		return memberDao.insertMember(memberVO);
	}
	
	//비번 정규표현식
	private boolean checkPwRegex(String me_pw) {
		String regexPw = "$[a-zA-Z0-9!@#$]{8,14}^";
		if(me_pw == null) {
			return false;
		}
		return Pattern.matches(regexPw, me_pw);
	}

	//아이디 정규표현식
	private boolean checkIdRegex(String me_id) {
		String regexId = "^[a-zA-Z0-9]{6,8}$";
		if(me_id == null) {
			return false;
		}
		return Pattern.matches(regexId, me_id);
	}

//	@Override
//	public MemberVO getAuthority(String admin) {
//		return memberDao.selectAuthority(admin);
//		
//	}

	@Override
	public boolean getAuthority(boolean admin) {
		return memberDao.selectAuthority(admin);
	}

}
