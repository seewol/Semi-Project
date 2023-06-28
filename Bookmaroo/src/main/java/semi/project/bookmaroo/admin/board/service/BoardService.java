package semi.project.bookmaroo.admin.board.service;

import java.util.ArrayList;
import java.util.HashMap;

import semi.project.bookmaroo.admin.board.model.vo.Attachment;
import semi.project.bookmaroo.admin.board.model.vo.Popup;
import semi.project.bookmaroo.admin.book.model.vo.AdminBook;
import semi.project.bookmaroo.board.model.vo.Board;
import semi.project.bookmaroo.common.model.vo.PageInfo;
import semi.project.bookmaroo.member.model.vo.Member;


public interface BoardService {

	int getNoticeListCount(HashMap<String, String> map); 

	ArrayList<Board> selectNoticeList(PageInfo noticePi, HashMap<String, String> map); 

	Board selectNoticeBoardList(int boardNo); 

	int deleteNotice(int bNo);

	int updateNotice(Board b);

	int insertNotice(HashMap<String, String> datas);

	int getUserListCount(); 

	ArrayList<Member> selectUserList(PageInfo pi); 

	Member selectUserBoardList(int userNo);

	int updateUser(HashMap<String, String> datas);

	int getUserBookList(int userNo);

	ArrayList<AdminBook> getUserBookRentList(PageInfo pi, int userNo); 

	int insertPopup(String popTitle);

	int insertAttm(ArrayList<Attachment> list);

	int getPopupListCount();

	ArrayList<Popup> selectPopupList(PageInfo pi);

	ArrayList<Attachment> selectAttmList(PageInfo pi);

	int selectJoinListCount();

	ArrayList<Attachment> selectJoinList(PageInfo pi);

	ArrayList<Attachment> selectJoinList(int pId);

	int getUserSearchListCount(HashMap<String, String> map);

	ArrayList<Member> selectUserSearchList(PageInfo pi, HashMap<String, String> map);

	int selectBookIsReturn(int userNo);



	
}
