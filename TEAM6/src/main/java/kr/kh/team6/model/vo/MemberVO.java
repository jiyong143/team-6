package kr.kh.team6.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class MemberVO {
	
	private String me_id;	
	private String me_birth;	
	private String me_email;
	private String me_phone;
	private String me_pw;
	private String me_address;
	private String me_name;
	private String me_ms_state;
	private String me_authority;
	
	
	public MemberVO(String me_id, String me_birth, String me_email, String me_phone, String me_pw, String me_address,
			String me_name, String me_ms_state) {
		this.me_id = me_id;
		this.me_birth = me_birth;
		this.me_email = me_email;
		this.me_phone = me_phone;
		this.me_pw = me_pw;
		this.me_address = me_address;
		this.me_name = me_name;
		this.me_ms_state=me_ms_state;
	}


}