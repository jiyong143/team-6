package kr.kh.team6.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class MemberVO {
	private String me_id;
	private int me_birth;
	private String me_email;
	private String me_phone;
	private String me_pw;
	private String me_address;
	private String me_name;
	private String me_ms_state;
	private String me_authority;
}
