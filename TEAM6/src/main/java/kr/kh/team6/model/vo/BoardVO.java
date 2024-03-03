package kr.kh.team6.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class BoardVO {
	private int bo_num;
	private int bo_ca_num;
	private String bo_me_id;
	private String bo_title;
	private String bo_content;
	private int bo_view;
	private CategoryVO category;
	
	public BoardVO(int ca_num,String bo_title, String bo_content, String bo_me_id) {
		this.bo_ca_num = ca_num;
		this.bo_title = bo_title;
		this.bo_content = bo_content;
		this.bo_me_id = bo_me_id;
	}
}
