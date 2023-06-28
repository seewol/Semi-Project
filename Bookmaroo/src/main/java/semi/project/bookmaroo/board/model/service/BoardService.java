package semi.project.bookmaroo.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import semi.project.bookmaroo.board.model.vo.Board;
import semi.project.bookmaroo.board.model.vo.Reply;
import semi.project.bookmaroo.board.model.vo.Review;
import semi.project.bookmaroo.book.model.vo.Book;
import semi.project.bookmaroo.common.model.vo.PageInfo;

public interface BoardService {

	int countBoardList(int i);

	ArrayList<Board> getBoardList(PageInfo pi, int i);

	int countSearchList(HashMap<String, String> map);

	ArrayList<Board> getSearchList(PageInfo pi, HashMap<String, String> map);

	Board selectBoard(int boardNo, boolean increaseViewsYn);

	int countReplyList(int boardNo);

	ArrayList<Reply> getReplyList(PageInfo pi, int boardNo);

	int deletePost(int boardNo);

	int insertReply(Reply r);

	Reply selectReplyForDelete(int rNo);

	int deleteReply(int rNo);

	int countReviewList();

	ArrayList<Review> getReviewList(PageInfo pi);

	ArrayList<Book> getMemberRentedBookList(int i);

	Book selectBook(String bookName);

	int findRentNum(String booktitle, int i);

	int insertReview(Review rev);

	Review getReviewContent(int reviewNo, boolean increaseViewsYn);

	int deleteReview(int reviewNo);

	int deleteReviewInDeleted(int reviewNo);

	Book selectBookWithISBN(String rentBookISBN);

	int reviewUpdate(Review rev);

	int countSearchReviewList(HashMap<String, String> map);

	ArrayList<Review> getSearchReviewList(PageInfo pi, HashMap<String, String> map);

	int insertInquiry(Board b);

	int updateInquiry(Board b);

	Board selectBoardCK(int boardNo);

	int BoardViewUp(int boardNo);

	Review selectReviewCK(int reviewNo);

	int ReviewViewUp(int reviewNo);
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
