package db.community.mybatis.service;

import java.util.ArrayList;
import java.util.List;

import db.community.mybatis.controller.CommunityController;
import db.community.mybatis.model.vo.CommunityVO;

// 커뮤니티 관리 클래스
public class CommunityServiceImp implements CommunityService {

	@Override
	public void addCommunity() {
		List<CommunityVO> comuList = new ArrayList<CommunityVO>();
		System.out.println("커뮤니티 번호 입력 : ");
		int cm_num = CommunityController.sc.nextInt();
		if(cm_num <=0) {
			System.out.println("잘못 입력 하셨습니다.");
		}
		// 정규표현식()
		System.out.println("커뮤니티 명 입력(0~10자) : ");
		String cm_name = CommunityController.sc.nextLine();
		
		CommunityVO cv = new CommunityVO(cm_num,cm_name);
		comuList.add(cv);

	}

	@Override
	public void setCommunity() {
		
	}

	@Override
	public void delCommunity() {
		
	}

	@Override
	public void printCommunity() {
		List<CommunityVO> comuList = new ArrayList<CommunityVO>();
		comuList.toString();
		System.out.println("조회할 커뮤니티 번호");
		int cm_num = CommunityController.sc.nextInt();
		int comuIndex = comuList.indexOf(new CommunityVO(cm_num));
		if(comuIndex == -1) {
			System.out.println("존재하지 않습니다.");
		}else {
		System.out.println("--커뮤니티--\n"+ cm_num);
		}
	}




}
