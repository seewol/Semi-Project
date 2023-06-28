package semi.project.bookmaroo.myPage.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import semi.project.bookmaroo.board.model.vo.Board;
import semi.project.bookmaroo.board.model.vo.Reply;
import semi.project.bookmaroo.board.model.vo.Review;
import semi.project.bookmaroo.common.model.vo.PageInfo;

public interface MyPageService {

	int countMyReviewList(int mNo);

	ArrayList<Review> getMyReviewList(PageInfo reviewPi, int mNo);

	int countMyReplyList(int mNo);

	ArrayList<Reply> getMyReplyList(PageInfo replyPi, int mNo);

	int countMyBoardList(int mNo);

	ArrayList<Board> getMyBoardList(PageInfo boardPi, int mNo);

//	Board findRefBoard(int replyNo);


}
