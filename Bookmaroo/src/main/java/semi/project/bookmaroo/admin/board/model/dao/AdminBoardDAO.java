package semi.project.bookmaroo.admin.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import semi.project.bookmaroo.admin.board.model.vo.Attachment;
import semi.project.bookmaroo.admin.board.model.vo.Popup;
import semi.project.bookmaroo.admin.book.model.vo.AdminBook;
import semi.project.bookmaroo.board.model.vo.Board;
import semi.project.bookmaroo.book.model.vo.Book;
import semi.project.bookmaroo.common.model.vo.PageInfo;
import semi.project.bookmaroo.member.model.vo.Member;

@Repository
public class AdminBoardDAO {

	public int getNoticeListCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) { //�������� �Խñ� ����Ʈ �̾ƿ���
		return sqlSession.selectOne("employeeMapper.getNoticeListCount", map);
	}

	public ArrayList<Board> selectNoticeList(SqlSessionTemplate sqlSession, PageInfo noticePi, HashMap<String, String> map) { //�������� �Խñ� ������ ó�� �� ����Ʈ �̾ƿ���
		// offset : �� �� �ǳ� �� �� ����.
		int offset = (noticePi.getCurrentPage() - 1) * noticePi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, noticePi.getBoardLimit());
		
		return (ArrayList)(sqlSession.selectList("employeeMapper.selectNoticeList", map, rowBounds));
	}

	public Board selectNoticeBoardList(SqlSessionTemplate sqlSession, int boardNo) { //�������� �󼼺���
		return sqlSession.selectOne("employeeMapper.selectNoticeBoardList", boardNo);
	}

	public int deleteNotice(SqlSessionTemplate sqlSession, int bNo) {
		return sqlSession.delete("employeeMapper.deleteNotice", bNo);
	}

	public int updateNotice(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.update("employeeMapper.updateNotice", b);
	}

	public int insertNotice(SqlSessionTemplate sqlSession, HashMap<String, String> datas) {
		return sqlSession.insert("employeeMapper.insertNotice", datas);
	}

	
	
	
	
	
	
	
	public int getUserListCount(SqlSessionTemplate sqlSession) { //�̿��� ���� ��� �̿����� ��ü ���� ���ϱ�
		return sqlSession.selectOne("employeeMapper.getUserListCount");
	}

	public ArrayList<Member> selectUserList(SqlSessionTemplate sqlSession, PageInfo pi) { //�̿��� �Խñ� ������ ó�� �� ����Ʈ �̾ƿ���
		//offset ����
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("employeeMapper.selectUserList", null, rowBounds);
	}

	public Member selectUserBoardList(SqlSessionTemplate sqlSession, int mNo) { //�̿��� �� ����
		return sqlSession.selectOne("employeeMapper.selectUserBoardList", mNo);
	}

	public int updateUser(SqlSessionTemplate sqlSession, HashMap<String, String> datas) {
		return sqlSession.update("employeeMapper.updateUser", datas);
	}

	public int getUserBookList(SqlSessionTemplate sqlSession, int userNo) { //�̿��� ������Ȳ ��������(��� ��������)
		return sqlSession.selectOne("employeeMapper.getUserBookList", userNo);
	}

	public ArrayList<AdminBook> getUserBookRentList(SqlSessionTemplate sqlSession, PageInfo pi, int userNo) { //�̿��� ������Ȳ (userNo�� ��� �� ��������)
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("employeeMapper.getUserBookRentList", userNo, rowBounds);
	}

	public int insertPopup(SqlSessionTemplate sqlSession, String popTitle) {
		return sqlSession.insert("employeeMapper.insertPopup", popTitle);
	}

	public int insertAttm(SqlSessionTemplate sqlSession, ArrayList<Attachment> list) {
		return sqlSession.insert("employeeMapper.insertAttm", list);
	}
	
	//��ü �˾� ���̺� �� �� ������ ����
	public int getPopupListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("employeeMapper.getPopupListCount");
	}

	public ArrayList<Popup> selectPopupList(SqlSessionTemplate sqlSession, PageInfo pi) {
		return (ArrayList)sqlSession.selectList("employeeMapper.selectPopupList", pi);
	}

	public ArrayList<Attachment> selectAttmList(SqlSessionTemplate sqlSession, PageInfo pi) {
		return (ArrayList)sqlSession.selectList("employeeMapper.selectAttmList", pi);
	}

	public int selectJoinListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("employeeMapper.selectJoinListCount");
	}

	public ArrayList<Attachment> selectJoinList(SqlSessionTemplate sqlSession, PageInfo pi) {
		return (ArrayList)sqlSession.selectList("employeeMapper.selectJoinList", pi);
	}

	public ArrayList<Attachment> selectJoinList(SqlSessionTemplate sqlSession, int pId) {
		return (ArrayList)sqlSession.selectList("employeeMapper.selectJoinListPopupAndAttm", pId);
	}

	public int getUserSearchListCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("employeeMapper.getUserSearchListCount", map);
	}

	public ArrayList<Member> getUserSearchList(SqlSessionTemplate sqlSession, PageInfo pi,HashMap<String, String> map) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("employeeMapper.getUserSearchList", map, rowBounds);
	}


	public int selectBookIsReturn(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("employeeMapper.selectBookIsReturn", userNo);
	}
	
	
	
}
