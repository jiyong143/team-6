package kr.kh.team6.model.vo;

import java.util.ArrayList;

import kr.kh.team6.service.CategoryService;
import kr.kh.team6.service.CategoryServiceImp;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CategoryVO {
	private int ca_num;
	private String ca_title;
	
	// 카테고리에 대해 그것에 있는 모든 게시판을 가져오는 메서드
	
	CategoryService categoryService = new CategoryServiceImp();
	
	public ArrayList <BoardVO> getBoardInCategory(){
		return categoryService.getBoardInCategory(this.ca_num); 
	}
	 
	public CategoryVO(int ca_num, String ca_title) {
		this.ca_num=ca_num;
		this.ca_title=ca_title;
	}

}
