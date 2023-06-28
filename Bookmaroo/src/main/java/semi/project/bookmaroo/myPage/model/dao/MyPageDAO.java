package semi.project.bookmaroo.myPage.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import semi.project.bookmaroo.board.model.vo.Board;
import semi.project.bookmaroo.board.model.vo.Reply;
import semi.project.bookmaroo.board.model.vo.Review;
import semi.project.bookmaroo.common.model.vo.PageInfo;

@Repository
public class MyPageDAO {

	public int countMyReviewList(SqlSessionTemplate sqlSession, int mNo) {
		return sqlSession.selectOne("myPageMapper.countMyReviewList", mNo);
	}

	public ArrayList<Review> getMyReviewList(SqlSessionTemplate sqlSession, PageInfo reviewPi, int mNo) {
		int offset = (reviewPi.getCurrentPage()-1)*reviewPi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, reviewPi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("myPageMapper.getMyReviewList", mNo, rowBounds);
	}

	public int countMyReplyList(SqlSessionTemplate sqlSession, int mNo) {
		return sqlSession.selectOne("myPageMapper.countMyReplyList", mNo);
	}

	public ArrayList<Reply> getMyReplyList(SqlSessionTemplate sqlSession, PageInfo replyPi, int mNo) {
		int offset = (replyPi.getCurrentPage()-1)*replyPi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, replyPi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("myPageMapper.getMyReplyList", mNo, rowBounds);
	}

	public int countMyBoardList(SqlSessionTemplate sqlSession, int mNo) {
		return sqlSession.selectOne("myPageMapper.countMyBoardList", mNo);
	}

	public ArrayList<Board> getMyBoardList(SqlSessionTemplate sqlSession, PageInfo boardPi, int mNo) {
		int offset = (boardPi.getCurrentPage()-1)*boardPi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, boardPi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("myPageMapper.getMyBoardList", mNo, rowBounds);
	}

//	public Board findRefBoard(SqlSessionTemplate sqlSession, int replyNo) {
//		return sqlSession.selectOne("myPageMapper.findRefBoard", replyNo);
//	}

}
