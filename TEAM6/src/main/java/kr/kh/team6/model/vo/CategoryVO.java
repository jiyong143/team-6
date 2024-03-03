package kr.kh.team6.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CategoryVO {
	private int ca_num;
	private String ca_title;
	
	
	
	public CategoryVO(int ca_num, String ca_title) {
		super();
		this.ca_num = ca_num;
		this.ca_title = ca_title;
	}

}
