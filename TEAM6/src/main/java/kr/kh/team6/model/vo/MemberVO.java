package kr.kh.team6.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
public class MemberVO {

	private String me_id;
	private String me_pw;
	private String me_birth;
	private String me_name;
	private String me_phone;
	private String me_email;
	private String me_address;
	private String me_authority;
	private String me_ms_state;
	
	
	//회원가입 시
	public MemberVO(String me_id, String me_pw, String me_birth, String me_name, String me_phone,
					 String me_email, String me_address) {
		this.me_id = me_id;
		this.me_pw = me_pw;
		this.me_birth = me_birth;
		this.me_name = me_name;
		this.me_phone = me_phone;
		this.me_email = me_email;
		this.me_address = me_address;
	}
	

	public boolean getMe_authority(String admin) {
		this.me_authority = admin;
		return true;
	}

	public boolean equals(String me_autority, String admin) {
		this.me_authority = admin;
		this.me_authority = me_autority;
		
		return true;
	}

 


	
}