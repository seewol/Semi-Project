package semi.project.bookmaroo.admin.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import semi.project.bookmaroo.admin.model.vo.Books;
import semi.project.bookmaroo.admin.model.vo.Review;
import semi.project.bookmaroo.admin.model.vo.User;
import semi.project.bookmaroo.admin.model.vo.Wishes;
import semi.project.bookmaroo.common.model.vo.PageInfo;

@Repository
public class AdminDAO {

	public int insertMember(SqlSessionTemplate sqlSession, Books b) {
		return sqlSession.insert("adminMapper.insertBook", b);
	}

	public ArrayList<Books> selectBook(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectBook", "", rowBounds);
	}

	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.getListCount");
	}

	public ArrayList<Books> searchBook(SqlSessionTemplate sqlSession, String keyword, String type) {
		return (ArrayList)sqlSession.selectList("adminMapper.searchBook" + type, keyword);
	}

	public void updateBook(SqlSessionTemplate sqlSession, Books b) {
		sqlSession.update("adminMapper.updateBook", b);
	}

	public void deleteBook(SqlSessionTemplate sqlSession, String isbn) {
		sqlSession.update("adminMapper.deleteBook", isbn);
	}

	public ArrayList<Review> searchReview(SqlSessionTemplate sqlSession, String keyword, String type) {
		return (ArrayList)sqlSession.selectList("adminMapper.search" + type, keyword);
	}

	public int deleteReview(SqlSessionTemplate sqlSession, String reviewNo) {
		return sqlSession.delete("adminMapper.deleteReview", reviewNo);
	}

	public int updateUser(SqlSessionTemplate sqlSession, String type, User u) {
		return sqlSession.update("adminMapper.updateUser" + type, u);
	}

	public ArrayList<User> searchUser(SqlSessionTemplate sqlSession, String keyword, String type) {
		return (ArrayList)sqlSession.selectList("adminMapper.searchUser" + type, keyword);
	}

	public int insertBookDetail(SqlSessionTemplate sqlSession, String isbn) {
		return sqlSession.insert("adminMapper.insertBookDetail", isbn);
	}

	public ArrayList<Wishes> searchWish(SqlSessionTemplate sqlSession, String keyword, String type) {
		return (ArrayList)sqlSession.selectList("adminMapper.searchWish" + type, keyword);
	}

	public int deleteWish(SqlSessionTemplate sqlSession, String keyword) {
		return sqlSession.delete("adminMapper.deleteWish", keyword);
	}
}
