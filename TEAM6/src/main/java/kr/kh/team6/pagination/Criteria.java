package kr.kh.team6.pagination;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Criteria {
	
	private int page=1; // 현재 페이지
	private int perPageNum=10; // 한 페이지에서 다루는 컨텐츠의 개수 
	
	private String search=""; // 검색어의 기본값은 빈 문자열
	private String type="all"; // 검색 타입의 기본값은 전체 검색 

	public Criteria(int page) {
		this.page=page;
	}
	public Criteria(int page, int perPageNum) {
		this.page=page;
		this.perPageNum=perPageNum;
	}
	
	public Criteria(int page, int perPageNum, String type, String search) {
		this(page,perPageNum);
		this.type=type==null ? "all" : type;
		this.search=search==null ? "": search;
	}
	public int getPageStart() {
		return (page-1)*perPageNum;
	}
}