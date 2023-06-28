package semi.project.bookmaroo.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import semi.project.bookmaroo.board.model.vo.Board;
import semi.project.bookmaroo.board.model.vo.Reply;
import semi.project.bookmaroo.board.model.vo.Review;
import semi.project.bookmaroo.book.model.vo.Book;
import semi.project.bookmaroo.common.model.vo.PageInfo;

@Repository
public class BoardDAO {

	public int countBoardList(SqlSessionTemplate sqlSession, int i) {
		return sqlSession.selectOne("boardMapper.countBoardList", i);
	}

	public ArrayList<Board> getBoardList(SqlSessionTemplate sqlSession, PageInfo pi, int i) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("boardMapper.getBoardList", i, rowBounds);
	}

	public int countSearchList(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("boardMapper.countSearchList", map);
	}

	public ArrayList<Board> getSearchList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, String> map) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("boardMapper.getSearchList", map, rowBounds);
	}

	public void increaseViewsCount(SqlSessionTemplate sqlSession, int boardNo) {
		sqlSession.update("boardMapper.increaseViewsCount", boardNo);
	}

	public Board selectBoard(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.selectOne("boardMapper.selectBoard", boardNo);
	}

	public int countReplyList(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.selectOne("boardMapper.countReplyList", boardNo);
	}

	public ArrayList<Reply> getReplyList(SqlSessionTemplate sqlSession, PageInfo pi, int boardNo) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("boardMapper.getReplyList", boardNo, rowBounds);
	}

	public int deletePost(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.delete("boardMapper.deletePost", boardNo);
	}

	public int insertReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("boardMapper.insertReply", r);
	}

	public Reply selectReplyForDelete(SqlSessionTemplate sqlSession, int rNo) {
		return sqlSession.selectOne("boardMapper.selectReplyForDelete", rNo);
	}

	public int deleteReply(SqlSessionTemplate sqlSession, int rNo) {
		return sqlSession.delete("boardMapper.deleteReply", rNo);
	}

	public int countReviewList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.countReviewList");
	}

	public ArrayList<Review> getReviewList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("boardMapper.getReviewList", null, rowBounds);
	}

	public ArrayList<Book> getMemberRentedBookList(SqlSessionTemplate sqlSession, int i) {
		return (ArrayList)sqlSession.selectList("boardMapper.getMemberRentedBookList", i);
	}

	public Book selectBook(SqlSessionTemplate sqlSession, String bookName) {
		return sqlSession.selectOne("boardMapper.selectBook", bookName);
	}

	public int findRentNum(SqlSessionTemplate sqlSession, String booktitle, int i) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("booktitle", booktitle);
		String mNo = Integer.toString(i);
		map.put("mNo", mNo);
		return sqlSession.selectOne("boardMapper.findRentNum", map);
	}

	public int insertReview(SqlSessionTemplate sqlSession, Review rev) {
		return sqlSession.insert("boardMapper.insertReview", rev);
	}

	public Review getReviewContent(SqlSessionTemplate sqlSession, int reviewNo) {
		return sqlSession.selectOne("boardMapper.getReviewContent", reviewNo);
	}

	public int deleteReview(SqlSessionTemplate sqlSession, int reviewNo) {
		return sqlSession.delete("boardMapper.deleteReview", reviewNo);
	}

	public int deleteReviewInDeleted(SqlSessionTemplate sqlSession, int reviewNo) {
		return sqlSession.delete("boardMapper.deleteReviewInDeleted", reviewNo);
	}

	public Book selectBookWithISBN(SqlSessionTemplate sqlSession, String rentBookISBN) {
		return sqlSession.selectOne("boardMapper.selectBookWithISBN", rentBookISBN);
	}

	public int reviewUpdate(SqlSessionTemplate sqlSession, Review rev) {
		return sqlSession.update("boardMapper.reviewUpdate", rev);
	}

	public int countSearchReviewList(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("boardMapper.countSearchReviewList", map);
	}

	public ArrayList<Review> getSearchReviewList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, String> map) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("boardMapper.getSearchReviewList", map, rowBounds);
	}

	public int insertInquiry(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("boardMapper.insertInquiry", b);
	}

	public int updateInquiry(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.update("boardMapper.updateInquiry", b);
	}

	public void increaseViewsCountForReview(SqlSessionTemplate sqlSession, int reviewNo) {
		sqlSession.update("boardMapper.increaseViewsCountForReview", reviewNo);
	}

	public Board selectBoardCK(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.selectOne("boardMapper.selectBoardCK", boardNo);
	}

	public int BoardViewUp(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("boardMapper.BoardViewUp", boardNo);
	}
	
	public Review selectReviewCK(SqlSessionTemplate sqlSession, int reviewNo) {
		return sqlSession.selectOne("boardMapper.selectReviewCK", reviewNo);
	}

	public int ReviewViewUp(SqlSessionTemplate sqlSession, int reviewNo) {
		return sqlSession.update("boardMapper.ReviewViewUp", reviewNo);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
