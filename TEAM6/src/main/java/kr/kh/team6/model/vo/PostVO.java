package kr.kh.team6.model.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PostVO {

	private int po_num;
	private String po_title;
	private String po_content;
	private Date po_date;
	private int po_views;
	private int po_bo_num;
	private String  po_me_id;
	private String po_me_name;
	private BoardVO board;
	
	
	
	// 게시글의 날짜를 이쁘게 반환하는 메서드
	public String changeDate() {	
		SimpleDateFormat format = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분 ss초");
		return  format.format(this.po_date);	
	}

	public PostVO(String po_title, String po_content, int po_bo_num, String po_me_id) {
		this.po_title = po_title;
		this.po_content = po_content;
		this.po_bo_num = po_bo_num;
		this.po_me_id = po_me_id;
	}
	
	//이름 추가
	public PostVO(String po_title, String po_me_name, String po_content, int po_bo_num, String po_me_id) {
		this.po_title = po_title;
		this.po_me_name = po_me_name;
		this.po_content = po_content;
		this.po_bo_num = po_bo_num;
		this.po_me_id = po_me_id;
	}

	//수정 메서드
	public PostVO(int num, String title, String content, int bo_num) {
		po_num = num;
		po_title = title;
		po_content = content;
		po_bo_num = bo_num;
	}
	
}