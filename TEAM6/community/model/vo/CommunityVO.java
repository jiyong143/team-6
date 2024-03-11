package db.community.mybatis.model.vo;

import java.util.Objects;

public class CommunityVO {
	
	public  int cm_num;
	public  String cm_name;
	
	public CommunityVO(int cm_num, String cm_name) {
		this.cm_num = cm_num;
		this.cm_name = cm_name;
	}

	public CommunityVO(int cm_num) {
	}

	@Override
	public int hashCode() {
		return Objects.hash(cm_name);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CommunityVO other = (CommunityVO) obj;
		return Objects.equals(cm_name, other.cm_name);
	}

	@Override
	public String toString() {
		return "----커뮤니티----"+ "\n커뮤니티 번호 : " + cm_num + "\n커뮤니티 명 : " + cm_name;
	}
	

}