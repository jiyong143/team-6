package kr.kh.team6.pagination;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Criteria {
	
	private int page=1; // 현재 페이지
	private int perPageNum=10; // 한 페이지에서 다루는 컨텐츠의 개수 
	
	private String search=""; // 검색어의 기본값은 빈 문자열
	private String type="title"; // 검색 타입의 기본값은 제목 검색 

	public Criteria(int page) {
		this.page=page;
	}
	public Criteria(int page, int perPageNum) {
		this.page=page;
		this.perPageNum=perPageNum;
	}
}
