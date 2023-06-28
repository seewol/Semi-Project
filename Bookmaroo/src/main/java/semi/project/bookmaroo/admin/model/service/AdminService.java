package semi.project.bookmaroo.admin.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import semi.project.bookmaroo.admin.model.dao.AdminDAO;
import semi.project.bookmaroo.admin.model.vo.Books;
import semi.project.bookmaroo.admin.model.vo.Review;
import semi.project.bookmaroo.admin.model.vo.User;
import semi.project.bookmaroo.admin.model.vo.Wishes;
import semi.project.bookmaroo.common.model.vo.PageInfo;

@Service
public class AdminService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private AdminDAO aDAO;
	
	public int insertBook(Books b) {
		return aDAO.insertMember(sqlSession, b);
	}
	
	public int getListCount() {
		return aDAO.getListCount(sqlSession);
	}

	public ArrayList<Books> selectBook(PageInfo pi) {
		return aDAO.selectBook(sqlSession, pi);
	}

	public ArrayList<Books> searchBook(String keyword, String type) {
		return aDAO.searchBook(sqlSession, keyword, type);
	}

	public void updateBook(Books b) {
		aDAO.updateBook(sqlSession, b);
	}

	public void deleteBook(String isbn) {
		aDAO.deleteBook(sqlSession, isbn);
	}

	public ArrayList<Review> searchReview(String keyword, String type) {
		return aDAO.searchReview(sqlSession, keyword, type);
	}

	public int deleteReview(String reviewNo) {
		return aDAO.deleteReview(sqlSession, reviewNo);
	}

	public int updateUser(User u, String type) {
		return aDAO.updateUser(sqlSession, type, u);
	}

	public ArrayList<User> searchUser(String keyword, String type) {
		return aDAO.searchUser(sqlSession, keyword, type);
	}

	public int insertBookDetail(String isbn) {
		return aDAO.insertBookDetail(sqlSession, isbn);
	}

	public ArrayList<Wishes> searchWish(String keyword, String type) {
		return aDAO.searchWish(sqlSession, keyword, type);
	}

	public int deleteWish(String keyword) {
		return aDAO.deleteWish(sqlSession, keyword);
	}

}
