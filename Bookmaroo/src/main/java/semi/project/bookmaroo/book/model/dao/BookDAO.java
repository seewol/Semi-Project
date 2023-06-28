package semi.project.bookmaroo.book.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import semi.project.bookmaroo.book.model.vo.Book;
import semi.project.bookmaroo.book.model.vo.BookCheck;
import semi.project.bookmaroo.common.model.vo.PageInfo;

@Repository
public class BookDAO {

	public int wishBookInsert(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.insert("bookMapper.wishBookInsert", map);
	}

	public ArrayList<Book> selectNewBookList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("bookMapper.selectNewBookList");
	}

	public ArrayList<Book> selectHotBookList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("bookMapper.selectHotBookList");
	}

	public int getSearchBookListCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("bookMapper.getSearchBookListCount", map);
	}

	public ArrayList<Book> searchBookList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, String> map) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("bookMapper.searchBookList", map, rowBounds);
	}

	public int rentalResult(SqlSessionTemplate sqlSession, HashMap<String, Integer> map) {
		int result1 = sqlSession.insert("bookMapper.insertRentalResult", map);
		int result2 = sqlSession.update("bookMapper.updateRentalResult", map);
		
		int result = 0;
		if(result1 > 0 && result2 >0) {
			result = 1;
		} 
		
		return result;
	}

	public int insertHeart(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.insert("bookMapper.insertHeart", map);
	}

	public ArrayList<String> heartList(SqlSessionTemplate sqlSession, int memberNumber) {
		return (ArrayList)sqlSession.selectList("bookMapper.heartList", memberNumber);
	}

	public int deleteHeart(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.delete("bookMapper.deleteHeart", map);
	}

	public ArrayList<Integer> rentalList(SqlSessionTemplate sqlSession, int memberNumber) {
		return (ArrayList)sqlSession.selectList("bookMapper.rentalList", memberNumber);
	}

	public int returnResult(SqlSessionTemplate sqlSession, HashMap<String, Integer> map) {
		int result1 = sqlSession.update("bookMapper.returnResultBD", map);
		int result2 = sqlSession.update("bookMapper.returnResultBC", map);
		
		int result = 0;
		if(result1 > 0 && result2 >0) {
			result = 1;
		} 
		
		return result;
	}

	public int getMyBookListCount(SqlSessionTemplate sqlSession, int mNo) {
		return sqlSession.selectOne("bookMapper.getMyBookListCount", mNo);
	}

	public ArrayList<BookCheck> myBookList(SqlSessionTemplate sqlSession, PageInfo pi, int mNo) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("bookMapper.myBookList", mNo, rowBounds);
	}

	public int checkIsRental(SqlSessionTemplate sqlSession, int memberNumber) {
		return sqlSession.selectOne("bookMapper.checkIsRental", memberNumber);
	}
	
	public int getMyHeartBookListCount(SqlSessionTemplate sqlSession, int mNo) {
		return sqlSession.selectOne("bookMapper.getMyHeartBookListCount", mNo);
	}

	public ArrayList<Book> myHeartBookList(SqlSessionTemplate sqlSession, PageInfo pi, int mNo) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("bookMapper.myHeartBookList", mNo, rowBounds);
	}
	
}
