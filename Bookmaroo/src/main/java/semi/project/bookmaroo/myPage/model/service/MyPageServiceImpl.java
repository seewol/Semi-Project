package semi.project.bookmaroo.myPage.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import semi.project.bookmaroo.board.model.vo.Board;
import semi.project.bookmaroo.board.model.vo.Reply;
import semi.project.bookmaroo.board.model.vo.Review;
import semi.project.bookmaroo.common.model.vo.PageInfo;
import semi.project.bookmaroo.myPage.model.dao.MyPageDAO;

@Service("myService")
public class MyPageServiceImpl implements MyPageService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MyPageDAO myDAO;

	@Override
	public int countMyReviewList(int mNo) {
		return myDAO.countMyReviewList(sqlSession, mNo);
	}

	@Override
	public ArrayList<Review> getMyReviewList(PageInfo reviewPi, int mNo) {
		return myDAO.getMyReviewList(sqlSession, reviewPi, mNo);
	}

	@Override
	public int countMyReplyList(int mNo) {
		return myDAO.countMyReplyList(sqlSession, mNo);
	}

	@Override
	public ArrayList<Reply> getMyReplyList(PageInfo replyPi, int mNo) {
		return myDAO.getMyReplyList(sqlSession, replyPi, mNo);
	}

	@Override
	public int countMyBoardList(int mNo) {
		return myDAO.countMyBoardList(sqlSession, mNo);
	}

	@Override
	public ArrayList<Board> getMyBoardList(PageInfo boardPi, int mNo) {
		return myDAO.getMyBoardList(sqlSession, boardPi, mNo);
	}

//	@Override
//	public Board findRefBoard(int replyNo) {
//		return myDAO.findRefBoard(sqlSession, replyNo);
//	}

	
	
	
	
	
	
	
	
	
	
	
}
