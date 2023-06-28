package semi.project.bookmaroo.book.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import semi.project.bookmaroo.book.model.vo.Book;
import semi.project.bookmaroo.book.model.vo.BookCheck;
import semi.project.bookmaroo.common.model.vo.PageInfo;

public interface BookService {

	int wishBookInsert(HashMap<String, String> map);

	ArrayList<Book> selectNewBookList();

	ArrayList<Book> selectHotBookList();

	int getSearchBookListCount(HashMap<String, String> map);

	ArrayList<Book> searchBookList(PageInfo pi, HashMap<String, String> map);

	int rentalResult(HashMap<String, Integer> map);

	int insertHeart(HashMap<String, String> map);

	ArrayList<String> heartList(int memberNumber);

	int deleteHeart(HashMap<String, String> map);

	ArrayList<Integer> rentalList(int memberNumber);

	int returnResult(HashMap<String, Integer> map);

	int getMyBookListCount(int mNo);

	ArrayList<BookCheck> myBookList(PageInfo pi, int mNo);

	int checkIsRental(int memberNumber);
	
	int getMyHeartBookListCount(int mNo);

	ArrayList<Book> myHeartBookList(PageInfo pi, int mNo);
	
}
