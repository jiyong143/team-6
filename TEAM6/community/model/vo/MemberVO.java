package db.community.mybatis.model.vo;

import java.util.Objects;

public class MemberVO {
	
	private String me_id;// 사용자 아이디
	private String me_name; // 사용자 이름
	private String me_pw; // 사용자 비번
	private String me_email; // 사용자 이메일
	private String me_address; // 사용자 주소
	private String me_phoneNum; // 사용자 폰번호
	
	public MemberVO(String me_id, String me_name, String me_pw,
			String me_email, String me_address,String me_phoneNum) {
		this.me_id = me_id;
		this.me_name = me_name;
		this.me_pw = me_pw;
		this.me_email = me_email;
		this.me_address = me_address;
		this.me_phoneNum = me_phoneNum;
	}

	@Override
	public int hashCode() {
		return Objects.hash(me_address, me_email, me_id, me_phoneNum);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		MemberVO other = (MemberVO) obj;
		return Objects.equals(me_address, other.me_address) && Objects.equals(me_email, other.me_email)
				&& Objects.equals(me_id, other.me_id) && Objects.equals(me_phoneNum, other.me_phoneNum);
	}

	@Override
	public String toString() {
		return "MemberVO [me_id=" + me_id + ", me_name=" + me_name + ", me_pw=" + me_pw + ", me_email=" + me_email
				+ ", me_address=" + me_address + ", me_phoneNum=" + me_phoneNum + "]";
	}
	

}
