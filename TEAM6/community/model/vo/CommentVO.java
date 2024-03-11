package db.community.mybatis.model.vo;

import java.util.Objects;


//게시글에 댓글달기 
public class CommentVO {
	private int co_num;
	private String co_content;
	
	public CommentVO(int co_num, String co_content) {
		this.co_num = co_num;
		this.co_content = co_content;
	}

	@Override
	public int hashCode() {
		return Objects.hash(co_num);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CommentVO other = (CommentVO) obj;
		return co_num == other.co_num;
	}

	@Override
	public String toString() {
		return "CommentVO [co_num=" + co_num + ", co_content=" + co_content + "]";
	}

}
