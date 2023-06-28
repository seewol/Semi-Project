package semi.project.bookmaroo.book.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import semi.project.bookmaroo.book.model.dao.BookDAO;
import semi.project.bookmaroo.book.model.vo.Book;
import semi.project.bookmaroo.book.model.vo.BookCheck;
import semi.project.bookmaroo.common.model.vo.PageInfo;

@Service
public class BookServiceImpl implements BookService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private BookDAO bDAO;

	@Override
	public int wishBookInsert(HashMap<String, String> map) {
		return bDAO.wishBookInsert(sqlSession, map);
	}

	@Override
	public ArrayList<Book> selectNewBookList() {
		return bDAO.selectNewBookList(sqlSession);
	}

	@Override
	public ArrayList<Book> selectHotBookList() {
		return bDAO.selectHotBookList(sqlSession);
	}

	@Override
	public int getSearchBookListCount(HashMap<String, String> map) {
		return bDAO.getSearchBookListCount(sqlSession, map);
	}

	@Override
	public ArrayList<Book> searchBookList(PageInfo pi, HashMap<String, String> map) {
		return bDAO.searchBookList(sqlSession, pi, map);
	}

	@Override
	public int rentalResult(HashMap<String, Integer> map) {
		return bDAO.rentalResult(sqlSession, map);
	}

	@Override
	public int insertHeart(HashMap<String, String> map) {
		return bDAO.insertHeart(sqlSession, map);
	}

	@Override
	public ArrayList<String> heartList(int memberNumber) {
		return bDAO.heartList(sqlSession, memberNumber);
	}

	@Override
	public int deleteHeart(HashMap<String, String> map) {
		return bDAO.deleteHeart(sqlSession, map);
	}

	@Override
	public ArrayList<Integer> rentalList(int memberNumber) {
		return bDAO.rentalList(sqlSession, memberNumber);
	}

	@Override
	public int returnResult(HashMap<String, Integer> map) {
		return bDAO.returnResult(sqlSession, map);
	}

	@Override
	public int getMyBookListCount(int mNo) {
		return bDAO.getMyBookListCount(sqlSession, mNo);
	}

	@Override
	public ArrayList<BookCheck> myBookList(PageInfo pi, int mNo) {
		return bDAO.myBookList(sqlSession, pi, mNo);
	}

	@Override
	public int checkIsRental(int memberNumber) {
		return bDAO.checkIsRental(sqlSession, memberNumber);
	}
	
	@Override
	public int getMyHeartBookListCount(int mNo) {
		return bDAO.getMyHeartBookListCount(sqlSession, mNo);
	}

	@Override
	public ArrayList<Book> myHeartBookList(PageInfo pi, int mNo) {
		return bDAO.myHeartBookList(sqlSession, pi, mNo);
	}
	
}
