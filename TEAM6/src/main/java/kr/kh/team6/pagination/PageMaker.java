package kr.kh.team6.pagination;

import lombok.Data;

@Data
public class PageMaker {

	private int totalCount; // 전체 컨텐츠 개수 => 마지막 페이지네이션의 마지막 페이지를 계산하기 위해서 
	private int startPage; // 페이지네이션 시작 페이지 번호
	private int endPage; // 페이지네이션 마지막 페이지 번호
	private boolean prev; // 이전버튼 활성화
	private boolean next; // 다음버튼 활성화
	private int displayPageNum; // 한 페이지네이션에서 보여준 페이지의 최대 숫자 개수
	private Criteria cri; 
	
	// totalCount, displayPageNum, perPageNum(cri) 를 이용하여 
	//endPage, startPage, prev, next 를 계산하는 메서드
	public void calculate() {
		// 현재 페이지에 대한 최대 페이지 번호 
		endPage = (int)(Math.ceil(cri.getPage()/(double)displayPageNum)*displayPageNum);
		startPage= endPage - displayPageNum +1;
		int tmpEndPage = (int)(Math.ceil(totalCount/(double)cri.getPerPageNum()));
		// endPage 와 tmpEndPage 중 작은 값을 endPage로 설정
		if(endPage>tmpEndPage) {
			endPage = tmpEndPage;
		}
		prev = startPage==1 ? false : true;
		next = endPage==tmpEndPage ? false : true;
	}
	public PageMaker(int displayPageNum, Criteria cri, int totalCount) {
		this.displayPageNum=displayPageNum;
		this.cri=cri;
		this.totalCount=totalCount;
		calculate();
	}
}