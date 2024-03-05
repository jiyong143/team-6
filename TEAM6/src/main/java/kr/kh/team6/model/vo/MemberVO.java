package kr.kh.team6.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class MemberVO {

	private String me_id;
	private String me_pw;
	private String me_phone;
	private String me_address;
	private String me_name;
	private String me_email;
	private String me_autority;
	private String me_ms_state;
	private int me_birth;
	
	//회원가입 시
	public MemberVO(String me_id, String me_pw, String me_phone, String me_address,
					String me_name, String me_email, int me_birth) {
		this.me_id = me_id;
		this.me_pw = me_pw;
		this.me_phone = me_phone;
		this.me_address = me_address;
		this.me_name = me_name;
		this.me_email = me_email;
		this.me_birth = me_birth;
	}
	
}
