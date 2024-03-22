package kr.kh.team6.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class CommentVO {

	private int co_num;
	private String co_content; 
	private int co_po_num;
	private String co_me_id;
	private PostVO post;
	
	
	public CommentVO(String co_content, int co_po_num, String co_me_id) {
		this.co_content = co_content;
		this.co_po_num = co_po_num;
		this.co_me_id = co_me_id;
	}
	
	public CommentVO(Integer co_num, String co_content, Integer co_po_num, String co_me_id) {
	    this.co_num = co_num;
	    this.co_content = co_content;
	    this.co_po_num = co_po_num;
	    this.co_me_id = co_me_id;
	}

	public CommentVO(int co_po_num, int co_num, String co_content, String co_me_id) {
			this.co_po_num = co_po_num;
		    this.co_num = co_num;
		    this.co_content = co_content;
		    this.co_me_id = co_me_id;
	}
}