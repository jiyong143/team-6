package db.community.mybatis.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import db.community.mybatis.model.vo.BoardVO;
import db.community.mybatis.model.vo.CommentVO;
import db.community.mybatis.model.vo.CommunityVO;
import db.community.mybatis.model.vo.MemberVO;
import db.community.mybatis.model.vo.PostVO;

public interface CommunityDAO {

	boolean insertCommunity(@Param("community")CommunityVO commuity);
	ArrayList<CommunityVO> selectCommunityList();
	
	boolean insertMember(@Param("member")MemberVO member);
	ArrayList<CommunityVO> selectMemberList();
	
	boolean insertBoadrd(@Param("board")BoardVO board);
	ArrayList<BoardVO> selectBoardList();
	
	boolean insertPost(@Param("post")PostVO post);
	ArrayList<PostVO> selectPostList();
	
	boolean insertComment(@Param("comment")CommentVO comment);
	ArrayList<CommentVO> selectCommentList();

}
