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
	InputStream inputStream;
	SqlSession session;
	
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
		
		//아이디 정규표현식 체크
		if(!checkIdRegex(memberVO.getMe_id())) {
			System.out.println("영문 대·소문자, 숫자 6~8자만 사용가능합니다.");
			return false;
		}
		
		//아이디 중복
		MemberVO dbMember = memberDao.selectMember(memberVO.getMe_id());
		if(dbMember != null) {
			System.out.println("중복된 아이디입니다.");
			return false;
		}
		
		//비번 정규표현식 체크
		if(!checkPwRegex(memberVO.getMe_pw())) {
			System.out.println("영문 대·소문자, 숫자, 특수기호(!@#$) 8~14자만 사용가능합니다.");
			return false;
		}
		
		//비번 확인
		if(!memberVO.getMe_pw().equals(memberVO.getMe_pw())) {
			System.out.println("입력한 비번과 다릅니다.");
			return false;
		}
		
		//생년월일은 6자 고정 INT
		if(!checkBirthRegex(memberVO.getMe_birth())) {
			System.out.println("생년월일은 주민번호 앞 6자리를 입력하세요.");
			return false;
		}
		
		//이름은 TEXT인데, 최대 5글자
		if(!checkNameRegex(memberVO.getMe_name())) {
			System.out.println("이름은 한글로 최대 5자 까지 가능합니다.");
			return false;
		}
		
		//전화번호 11자 고정 CHAR(11)
		if(!checkPhoneRegex(memberVO.getMe_phone())) {
			System.out.println("전화번호는 -를 제외한 11자리를 입력하세요.");
			return false;
		}
		
		//이메일은 이메일 형식으로만 가능 최대 30자 VARCAHR(30)
		if(!checkEmailRegex(memberVO.getMe_email())) {
			System.out.println("이메일은 최대 30자 까지 가능합니다.");
			return false;
		}
		
		//주소는 TEXT인데, 최대 50글자/ ex) 양식 : OO시 OO구 OO동
		if(!checkAddressRegex(memberVO.getMe_address())) {
			System.out.println("주소를 올바르게 입력하세요. 예시) 양식 : OO시 OO구 OO동");
			return false;
		}
		
		//모두 올바르게 적으면 등록
		return memberDao.insertMember(memberVO);
	}
	
	
	


	

	//생일 정규표현식
	private boolean checkBirthRegex(String me_birth) {
		String regexBirth = "^[0-9]{6}$";
		if(me_birth == null) {
			return false;
		}
		return Pattern.matches(regexBirth, me_birth);
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

	// 아이디, 비밀번호 객체에 대응하는 회원을 가져오는 메서드 
	@Override
	public MemberVO getMember(LoginDTO loginDTO) {
		if(loginDTO==null||
		   loginDTO.getId()==null||
		   loginDTO.getPw()==null) {
			return null;
		}
		MemberVO member = memberDao.selectMember(loginDTO.getId());
		if(member==null) {
			return null; 
		}
		// 비번은 회원가입시 암호화 관리돼 db에서 직접 비교할 수 없기에 서버쪽에서 한다
		if(member.getMe_pw().equals(loginDTO.getPw())) {
			return member;
		}
		return null;
	}
	
	//비번 정규표현식
	@Override
	public boolean checkPwRegex(String me_pw) {
		String regexPw = "^[a-zA-Z0-9!@#$]{8,14}$";
		if(me_pw == null) {
			return false;
		}
		return Pattern.matches(regexPw, me_pw);
	}
	
	
	@Override
	public boolean checkNameRegex(String me_name) {
		String regexName = "^[ㄱ-힣]{1,5}$";
		if(me_name == null) {
			return false;
		}
		return Pattern.matches(regexName, me_name);
	}
	
	@Override
	public int compareName(String id, String name) {
		if(id==null||name==null) {
			return 1;
		}
		return memberDao.countName(id,name);
	}
	
	//휴대폰번호 정규표현식
	@Override
	public boolean checkPhoneRegex(String phone) {
		String regexPhone = "^[0-9]{11}$";
		if(phone == null) {			
			return false;
		}
		return Pattern.matches(regexPhone, phone);
	}
	
	@Override
	public int comparePhone(String id, String phone) {
		if(id==null||phone==null) {
			return  1 ;
		}
		return memberDao.countPhone(id,phone);
	}
	
	//이메일 정규표현식
	@Override
	public boolean checkEmailRegex(String email) {
		String regexEmail = "^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$";
		if(email == null) {			
			return false;
		}
		return Pattern.matches(regexEmail, email);
	}
	
	@Override
	public int compareEmail(String id, String email) {
		if(id==null||email==null) {
			return 1;
		}
		return memberDao.countEmail(id,email);
		
	}
	//주소 정규표현식
	@Override
	public boolean checkAddressRegex(String address) {
		String regexAddress = "([가-힣])+(시) +([가-힣])+(구) +([가-힣])+(동)";
		if(address == null) {
			return false;			
		}
		return Pattern.matches(regexAddress, address);
	}
	@Override
	public boolean updateMember(String id, String pw, String phone, String address, String name, String email) {
		if(id==null||pw==null||phone==null||address==null||name==null||email==null) {
			return false;
		}
		return memberDao.updateMember(id,pw,phone,address,name,email);
	}
	

}