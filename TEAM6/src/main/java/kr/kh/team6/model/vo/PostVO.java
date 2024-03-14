package kr.kh.team6.model.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import kr.kh.team6.service.BoardService;
import kr.kh.team6.service.BoardServiceImp;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
@AllArgsConstructor
public class PostVO {
	
	private BoardService boardService = new BoardServiceImp();

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
	
	public BoardVO getBoard() {
		return boardService.getBoard(this.po_bo_num);
	}
	
	// 게시글의 내용의 앞 5글자만 가져오는 메서드( 만약 내용이 5글자 미만이면 다 가져온다)
	public String getFront() {
		 String answer = "";
		 String[] arr = this.po_content.split("");
		 int length= arr.length;
		 if(length<=5) {
			 return this.po_content;
		 }else {
			 for(int i=0;i<5;i++) {
				 answer += arr[i];
			 }
			 return answer + "...";
		 }
	}
	
	// 게시글의 작성 날짜와 현재 날짜의 차이를 계산하고 하루 미만 차이면 몇시간인지, 날을 넘기면 몇일전인지 알려주는 메서드 (미완성)
	/*
	public String gapTime() {
		
	}*/
				


	
	
	
}