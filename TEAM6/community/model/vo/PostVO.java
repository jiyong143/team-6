package db.community.mybatis.model.vo;

import java.util.Objects;


// 게시판안에 게시글 넣기
public class PostVO {
	private int po_num;
	private String po_title;
	private String po_content;
	
	public PostVO(int po_num, String po_title, String po_content) {
		this.po_num = po_num;
		this.po_title = po_title;
		this.po_content = po_content;
	}

	@Override
	public int hashCode() {
		return Objects.hash(po_content);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		PostVO other = (PostVO) obj;
		return Objects.equals(po_content, other.po_content);
	}

	@Override
	public String toString() {
		return "PostVO [po_num=" + po_num + ", po_title=" + po_title + ", po_content=" + po_content + "]";
	}

}
