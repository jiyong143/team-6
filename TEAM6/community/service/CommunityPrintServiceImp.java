package db.community.mybatis.service;

public class CommunityPrintServiceImp implements CommunityPrintService {

	@Override //메인메뉴 출력
	public void printMainMenu() {
		System.out.println("----메인메뉴----");
		System.out.println("1.커뮤니티 관리");
		System.out.println("2.게시판 관리");
		System.out.println("3.게시글 관리");
		System.out.println("4.댓글 관리");
		System.out.println("5.회원 관리");
		System.out.println("0.프로그램 종료");
		System.out.println("--------------");
		System.out.println("메뉴 입력 : ");
		
	}

	@Override //게시판 출력
	public void printBoard() {
		System.out.println("----게시판----");
		System.out.println("1.게시판 추가");
		System.out.println("2.게시판 수정");
		System.out.println("3.게시판 삭제");
		System.out.println("4.게시판 조회");
		System.out.println("0.뒤로 가기");
		System.out.println("------------");
		System.out.println("메뉴 입력 : ");
		
	}

	@Override //게시글 출력
	public void printPost() {
		System.out.println("----게시글----");
		System.out.println("1.게시글 추가");
		System.out.println("2.게시글 수정");
		System.out.println("3.게시글 삭제");
		System.out.println("4.게시글 조회");
		System.out.println("0.뒤로 가기");
		System.out.println("------------");
		System.out.println("메뉴 입력 : ");

		
	}

	@Override //댓글 출력
	public void printComment() {
		System.out.println("----댓 글----");
		System.out.println("1.댓글 추가");
		System.out.println("2.댓글 수정");
		System.out.println("3.댓글 삭제");
		System.out.println("4.댓글 조회");
		System.out.println("0.뒤로 가기");
		System.out.println("------------");
		System.out.println("메뉴 입력 : ");
		
	}

	@Override //회원 출력
	public void printMember() {
		System.out.println("----회 원----");
		System.out.println("1.회원 추가");
		System.out.println("2.회원 수정");
		System.out.println("3.회원 탈퇴");
		System.out.println("4.회원 조회");
		System.out.println("0.뒤로 가기");
		System.out.println("------------");
		System.out.println("메뉴 입력 : ");
		
	}

	@Override
	public void printCommunity() {
		System.out.println("----커뮤니티----");
		System.out.println("1.커뮤니티 추가");
		System.out.println("2.커뮤니티 수정");
		System.out.println("3.커뮤니티 삭제");
		System.out.println("4.커뮤니티 조회");
		System.out.println("0.프로그램 종료");
		System.out.println("--------------");
		System.out.println("메뉴 입력 : ");
		
	}

}
