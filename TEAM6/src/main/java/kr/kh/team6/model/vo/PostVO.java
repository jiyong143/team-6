package kr.kh.team6.model.vo;

import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class PostVO {

	private int po_num;
	private String po_title;
	private String po_content;
	private Date po_date;
	private int po_views;
	private int po_bo_num;
	private String  po_me_id;
	private BoardVO board;
	
	
	
	// 날짜 바꿔주는 메서드 
	public String toString2(PostVO post) {
	
		return null;
	}

	public PostVO(String po_title, String po_content, int po_bo_num, String po_me_id) {
		this.po_title = po_title;
		this.po_content = po_content;
		this.po_bo_num = po_bo_num;
		this.po_me_id = po_me_id;
	}
	
}