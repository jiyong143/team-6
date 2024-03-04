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
	


	public BoardVO(String title, int ca_num) {
		this.bo_title = title;	
		this.bo_ca_num = ca_num;
		
	}
	
	
}
