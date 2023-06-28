package semi.project.bookmaroo.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import semi.project.bookmaroo.board.model.dao.BoardDAO;
import semi.project.bookmaroo.board.model.vo.Board;
import semi.project.bookmaroo.board.model.vo.Reply;
import semi.project.bookmaroo.board.model.vo.Review;
import semi.project.bookmaroo.book.model.vo.Book;
import semi.project.bookmaroo.common.model.vo.PageInfo;


@Service("bService")
public class BoardServiceImpl implements BoardService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private BoardDAO bDAO;

	@Override
	public int countBoardList(int i) {
		return bDAO.countBoardList(sqlSession, i);
	}

	@Override
	public ArrayList<Board> getBoardList(PageInfo pi, int i) {
		return bDAO.getBoardList(sqlSession, pi, i);
	}

	@Override
	public int countSearchList(HashMap<String, String> map) {
		return bDAO.countSearchList(sqlSession, map);
	}

	@Override
	public ArrayList<Board> getSearchList(PageInfo pi, HashMap<String, String> map) {
		return bDAO.getSearchList(sqlSession, pi, map);
	}

	@Override
	public Board selectBoard(int boardNo, boolean increaseViewsYn) {
		if(increaseViewsYn) {
			bDAO.increaseViewsCount(sqlSession, boardNo);
		}
		return bDAO.selectBoard(sqlSession, boardNo);
	}

	@Override
	public int countReplyList(int boardNo) {
		return bDAO.countReplyList(sqlSession, boardNo);
	}

	@Override
	public ArrayList<Reply> getReplyList(PageInfo pi, int boardNo) {
		return bDAO.getReplyList(sqlSession, pi, boardNo);
	}

	@Override
	public int deletePost(int boardNo) {
		return bDAO.deletePost(sqlSession, boardNo);
	}

	@Override
	public int insertReply(Reply r) {
		return bDAO.insertReply(sqlSession, r);
	}

	@Override
	public Reply selectReplyForDelete(int rNo) {
		return bDAO.selectReplyForDelete(sqlSession, rNo);
	}
	
	@Override
	public int deleteReply(int rNo) {
		return bDAO.deleteReply(sqlSession, rNo);
	}

	@Override
	public int countReviewList() {
		return bDAO.countReviewList(sqlSession);
	}

	@Override
	public ArrayList<Review> getReviewList(PageInfo pi) {
		return bDAO.getReviewList(sqlSession, pi);
	}

	@Override
	public ArrayList<Book> getMemberRentedBookList(int i) {
		return bDAO.getMemberRentedBookList(sqlSession, i);
	}

	@Override
	public Book selectBook(String bookName) {
		return bDAO.selectBook(sqlSession, bookName);
	}

	@Override
	public int findRentNum(String booktitle, int i) {
		return bDAO.findRentNum(sqlSession, booktitle, i);
	}

	@Override
	public int insertReview(Review rev) {
		return bDAO.insertReview(sqlSession, rev);
	}

	@Override
	public Review getReviewContent(int reviewNo, boolean increaseViewsYn) {
		if(increaseViewsYn) {
			bDAO.increaseViewsCountForReview(sqlSession, reviewNo);
		}
		return bDAO.getReviewContent(sqlSession, reviewNo);
	}

	@Override
	public int deleteReview(int reviewNo) {
		return bDAO.deleteReview(sqlSession, reviewNo);
	}

	@Override
	public int deleteReviewInDeleted(int reviewNo) {
		return bDAO.deleteReviewInDeleted(sqlSession, reviewNo);
	}

	@Override
	public Book selectBookWithISBN(String rentBookISBN) {
		return bDAO.selectBookWithISBN(sqlSession, rentBookISBN);
	}

	@Override
	public int reviewUpdate(Review rev) {
		return bDAO.reviewUpdate(sqlSession, rev);
	}

	@Override
	public int countSearchReviewList(HashMap<String, String> map) {
		return bDAO.countSearchReviewList(sqlSession, map);
	}

	@Override
	public ArrayList<Review> getSearchReviewList(PageInfo pi, HashMap<String, String> map) {
		return bDAO.getSearchReviewList(sqlSession, pi, map);
	}

	@Override
	public int insertInquiry(Board b) {
		return bDAO.insertInquiry(sqlSession, b);
	}

	@Override
	public int updateInquiry(Board b) {
		return bDAO.updateInquiry(sqlSession, b);
	}

	@Override
	public Board selectBoardCK(int boardNo) {
		return bDAO.selectBoardCK(sqlSession, boardNo);
	}

	@Override
	public int BoardViewUp(int boardNo) {
		return bDAO.BoardViewUp(sqlSession, boardNo);
	}
	
	@Override
	public Review selectReviewCK(int reviewNo) {
		return bDAO.selectReviewCK(sqlSession, reviewNo);
	}

	@Override
	public int ReviewViewUp(int reviewNo) {
		return bDAO.ReviewViewUp(sqlSession, reviewNo);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
