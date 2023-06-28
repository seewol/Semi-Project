package semi.project.bookmaroo.admin.board.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import semi.project.bookmaroo.admin.board.model.dao.AdminBoardDAO;
import semi.project.bookmaroo.admin.board.model.vo.Attachment;
import semi.project.bookmaroo.admin.board.model.vo.Popup;
import semi.project.bookmaroo.admin.book.model.vo.AdminBook;
import semi.project.bookmaroo.board.model.vo.Board;
import semi.project.bookmaroo.common.model.vo.PageInfo;
import semi.project.bookmaroo.member.model.vo.Member;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private AdminBoardDAO bDAO;

	@Override
	public int getNoticeListCount(HashMap<String, String> map) {
		return bDAO.getNoticeListCount(sqlSession, map);
	}

	@Override
	public ArrayList<Board> selectNoticeList(PageInfo noticePi, HashMap<String, String> map) {
		return bDAO.selectNoticeList(sqlSession, noticePi, map);
	}

	@Override
	public Board selectNoticeBoardList(int boardNo) {
		return bDAO.selectNoticeBoardList(sqlSession, boardNo);
	}

	@Override
	public int deleteNotice(int bNo) {
		return bDAO.deleteNotice(sqlSession, bNo);
	}

	@Override
	public int updateNotice(Board b) {
		return bDAO.updateNotice(sqlSession, b);
	}

	@Override
	public int insertNotice(HashMap<String, String> datas) {
		return bDAO.insertNotice(sqlSession, datas);
	}

	@Override
	public int getUserListCount() {
		return bDAO.getUserListCount(sqlSession);
	}

	@Override
	public ArrayList<Member> selectUserList(PageInfo pi) {
		return bDAO.selectUserList(sqlSession, pi);
	}

	@Override
	public Member selectUserBoardList(int userNo) {
		return bDAO.selectUserBoardList(sqlSession, userNo);
	}

	@Override
	public int updateUser(HashMap<String, String> datas) {
		return bDAO.updateUser(sqlSession, datas);
	}

	@Override
	public int getUserBookList(int userNo) {
		return bDAO.getUserBookList(sqlSession, userNo);
	}

	@Override
	public ArrayList<AdminBook> getUserBookRentList(PageInfo pi, int userNo) {
		return bDAO.getUserBookRentList(sqlSession, pi, userNo);
	}



	@Override
	public int insertPopup(String popTitle) {
		return bDAO.insertPopup(sqlSession, popTitle);
	}

	@Override
	public int insertAttm(ArrayList<Attachment> list) {
		return bDAO.insertAttm(sqlSession, list);
	}

	
	@Override
	public int getPopupListCount() {
		return bDAO.getPopupListCount(sqlSession);
	}
	
	
	@Override
	public ArrayList<Popup> selectPopupList(PageInfo pi) {
		return bDAO.selectPopupList(sqlSession, pi);
	}

	@Override
	public ArrayList<Attachment> selectAttmList(PageInfo pi) {
		return bDAO.selectAttmList(sqlSession, pi);
	}

	@Override
	public int selectJoinListCount() {
		return bDAO.selectJoinListCount(sqlSession);
	}

	@Override
	public ArrayList<Attachment> selectJoinList(PageInfo pi) {
		return bDAO.selectJoinList(sqlSession, pi);
	}

	@Override
	public ArrayList<Attachment> selectJoinList(int pId) {
		return bDAO.selectJoinList(sqlSession, pId);
	}

	@Override
	public int getUserSearchListCount(HashMap<String, String> map) {
		return bDAO.getUserSearchListCount(sqlSession, map);
	}

	@Override
	public ArrayList<Member> selectUserSearchList(PageInfo pi, HashMap<String, String> map) {
		return bDAO.getUserSearchList(sqlSession, pi, map);
	}

	@Override
	public int selectBookIsReturn(int userNo) {
		return bDAO.selectBookIsReturn(sqlSession, userNo);
	}

	
}


	

