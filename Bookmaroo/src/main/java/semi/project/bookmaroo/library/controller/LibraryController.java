package semi.project.bookmaroo.library.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import semi.project.bookmaroo.book.model.service.BookService;
import semi.project.bookmaroo.book.model.vo.Book;
import semi.project.bookmaroo.book.model.vo.BookCheck;
import semi.project.bookmaroo.common.Pagination;
import semi.project.bookmaroo.common.model.vo.PageInfo;
import semi.project.bookmaroo.library.model.exception.LibraryException;
import semi.project.bookmaroo.member.model.vo.Member;

@Controller
public class LibraryController {
	
	@Autowired
	private BookService bService;
	
	@GetMapping("searchBook.lib")
	public String searchBook(Model model) {
		
		ArrayList<Book> newList = bService.selectNewBookList();
		ArrayList<Book> hotList = bService.selectHotBookList();
	
		if(newList != null) {
			model.addAttribute("newList", newList);
		}
		
		if(hotList != null) {
			model.addAttribute("hotList", hotList);
		}
		
		return "searchBook";
	}
	
	@GetMapping("searchBookResult.lib")
	public String searchBookResult(Model model, HttpSession session,
			@RequestParam(value="page", required=false) Integer currentPage, 
			@RequestParam(value="category", required=false) String category, 
			@RequestParam(value="query", required=false) String query, 
			@RequestParam(value="order", required=false) String order, 
			@RequestParam(value="bookISBN", required=false) String bookISBN, 
			@RequestParam(value="heart", required=false) String heart) {
		
		ArrayList<String> heartList = new ArrayList<String>();
		ArrayList<Integer> rentalList = new ArrayList<Integer>();
		
		if(session.getAttribute("loginUser") == null) {
			model.addAttribute("login", "false");
		}
		
		if(session.getAttribute("loginUser") != null) {
			model.addAttribute("login", "true");
			int memberNumber = ((Member)session.getAttribute("loginUser")).getMemNo();
			String mNo = memberNumber + "";
			
			rentalList = bService.rentalList(memberNumber);
			
			if(bookISBN != null && heart != null) {
				if(heart.equals("heart")) {
					insertHeart(bookISBN, mNo);
				}else if(heart.equals("brokenHeart")){
					deleteHeart(bookISBN, mNo);
				}
			}
			
			heartList = bService.heartList(memberNumber);
			
			
			int check = bService.checkIsRental(memberNumber);
			
			if(((Member)session.getAttribute("loginUser")).getIsRental() <= check){
				model.addAttribute("message", "대여 가능 권수를 초과했습니다.");
			}
			
		}
		
		if(category == null) {
			category = "all";
		}
		if(order == null) {
			order = "asc";
		}
		if(query == null) {
			query = "";
		}
		
		if(currentPage == null || currentPage < 1) {
			currentPage = 1;
		}
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("category", category);
		map.put("query", query);
		map.put("order", order);
		
		int listCount = bService.getSearchBookListCount(map);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
		
		ArrayList<Book> list = bService.searchBookList(pi, map);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		model.addAttribute("category", category);
		model.addAttribute("query", query);
		model.addAttribute("order", order);
		model.addAttribute("heartList", heartList);
		model.addAttribute("rentalList", rentalList);
		
		return "searchBookResult";
	}
	
	public void insertHeart(String bookISBN, String memberNumber) {
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("memberNumber", memberNumber);
		map.put("bookISBN", bookISBN);
		
		bService.insertHeart(map);
		
	}
	
	public void deleteHeart(String bookISBN, String memberNumber) {
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("memberNumber", memberNumber);
		map.put("bookISBN", bookISBN);
		
		bService.deleteHeart(map);
		
	}
	
	
	@PostMapping("rentalBook.lib")
	public String rentalBook(
			@RequestParam("bookNumber") Integer bookNumber, 
			Model model, HttpSession session) {
		
		if(session.getAttribute("loginUser") == null) {
			model.addAttribute("message", "로그인이 필요한 서비스입니다.");
			return "errorPage";
		}
		
		Integer memberNumber = ((Member)session.getAttribute("loginUser")).getMemNo();
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("memberNumber", memberNumber);
		map.put("bookNumber", bookNumber);
		
		int result = bService.rentalResult(map);
		
		if(result > 0) {
			model.addAttribute("successMessage", "도서 대여 완료.");
			
			ArrayList<Book> newList = bService.selectNewBookList();
			ArrayList<Book> hotList = bService.selectHotBookList();
		
			if(newList != null) {
				model.addAttribute("newList", newList);
			}
			
			if(hotList != null) {
				model.addAttribute("hotList", hotList);
			}
			
			return "searchBook";
		}else {
			model.addAttribute("message", "도서 대여에 실패했습니다.");
			return "errorPage";
		}
	}
	
	@PostMapping("rentalResult.lib")
	public String rentalResult(
			@RequestParam("bookNumber") Integer bookNumber, 
			Model model, HttpSession session) {
		
		if(session.getAttribute("loginUser") == null) {
			model.addAttribute("message", "로그인이 필요한 서비스입니다.");
			return "errorPage";
		}
		
		Integer memberNumber = ((Member)session.getAttribute("loginUser")).getMemNo();
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("memberNumber", memberNumber);
		map.put("bookNumber", bookNumber);
		
		int result = bService.rentalResult(map);
		
		if(result > 0) {
			model.addAttribute("successMessage", "도서 대여 완료.");
			
			ArrayList<Book> newList = bService.selectNewBookList();
			ArrayList<Book> hotList = bService.selectHotBookList();
		
			if(newList != null) {
				model.addAttribute("newList", newList);
			}
			
			if(hotList != null) {
				model.addAttribute("hotList", hotList);
			}
			
			return "searchBook";
		}else {
			model.addAttribute("message", "도서 대여에 실패했습니다.");
			return "errorPage";
		}
		
	}
	
	@PostMapping("returnBook.lib")
	public String returnBook(
			@RequestParam("bookNumber") Integer bookNumber, 
			@RequestParam("place") String place,
			@RequestParam(value="page", required=false) Integer currentPage,
			Model model, HttpSession session) {
		
		if(session.getAttribute("loginUser") == null) {
			model.addAttribute("message", "로그인이 필요한 서비스입니다.");
			return "errorPage";
		}
		
		Integer memberNumber = ((Member)session.getAttribute("loginUser")).getMemNo();
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("memberNumber", memberNumber);
		map.put("bookNumber", bookNumber);
		
		int result = bService.returnResult(map);
		
		if(result > 0) {
			model.addAttribute("successMessage", "도서 반납 완료.");
			
			ArrayList<Book> newList = bService.selectNewBookList();
			ArrayList<Book> hotList = bService.selectHotBookList();
		
			if(newList != null) {
				model.addAttribute("newList", newList);
			}
			
			if(hotList != null) {
				model.addAttribute("hotList", hotList);
			}
			
			if(place.equals("myBooks")) {
				
				if(currentPage == null) {
					currentPage = 1;
				}
				
				int listCount = bService.getMyBookListCount(memberNumber);
				
				PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5);
				
				ArrayList<BookCheck> list = bService.myBookList(pi, memberNumber);
				
				if(list != null) {
					model.addAttribute("pi", pi);
					model.addAttribute("list", list);
				}
				
				return "myBooks";
			}else if(place.equals("searchBookResult")){
				return "searchBook";
			}else {
				return "searchBook";
			}
		}else {
			model.addAttribute("message", "도서 반납에 실패했습니다.");
			return "errorPage";
		}
	}
	
	@GetMapping("wishBook.lib")
	public String wishBook(HttpSession session, Model model) {
		if(session.getAttribute("loginUser") == null) {
			model.addAttribute("loginMessage", "로그인이 필요한 서비스입니다.");
		}
		return "wishBook";
	}
	
	@PostMapping("wishBookInsert.lib")
	public String wishBookInsert(Model model, HttpSession session,
			@ModelAttribute Book b, @RequestParam("date") String date,
			@RequestParam(value="price", required=false) String price, 
			@RequestParam(value="etc", required=false) String etc) {
		
		if(session.getAttribute("loginUser") == null) {
			model.addAttribute("loginMessage", "로그인이 필요한 서비스입니다.");
			return "wishBook";
		}	
		
		int mNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		String memberNumber = mNo + "";
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("mNo", memberNumber);
		map.put("title", b.getBookName());
		map.put("author", b.getAuthor());
		map.put("publisher", b.getPublisher());
		map.put("price", price);
		map.put("etc", etc);
		map.put("date", date);
		
		int result = bService.wishBookInsert(map);
		if(result > 0) {
			model.addAttribute("successMessage", "희망도서 신청이 완료되었습니다.");
			return "wishBook";
		}else {
			model.addAttribute("message", "희망도서 신청에 실패했습니다.");
			return "errorPage";
		}
	}
	
	@GetMapping("myBooks.lib")
	public String myBooks(HttpSession session, Model model, 
			@RequestParam(value="page", required=false) Integer currentPage) {
		
		if(session.getAttribute("loginUser") == null) {
			model.addAttribute("message", "로그인이 필요한 서비스입니다.");
			return "errorPage";
		}
		
		if(currentPage == null) {
			currentPage = 1;
		}
		
		int mNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		
		int listCount = bService.getMyBookListCount(mNo);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5);
		
		ArrayList<BookCheck> list = bService.myBookList(pi, mNo);
		
		if(list != null) {
			model.addAttribute("pi", pi);
			model.addAttribute("list", list);
		}
		
		return "myBooks";
	
	}
		
	@GetMapping("myHeartBooks.lib")
	public String myHeartBooks(HttpSession session, Model model,
		@RequestParam(value="page", required=false) Integer currentPage,
		@RequestParam(value="bookISBN", required=false) String bookISBN, 
		@RequestParam(value="heart", required=false) String heart) {
		
		if(session.getAttribute("loginUser") == null) {
			model.addAttribute("message", "로그인이 필요한 서비스입니다.");
			return "errorPage";
		}
		
		int mNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		String mNoStr = mNo + "";
		
		if(bookISBN != null && heart != null) {
			if(heart.equals("heart")) {
				insertHeart(bookISBN, mNoStr);
			}else if(heart.equals("brokenHeart")){
				deleteHeart(bookISBN, mNoStr);
			}
		}
		
		ArrayList<String> heartList = new ArrayList<String>();
		heartList = bService.heartList(mNo);
		
		if(currentPage == null) {
			currentPage = 1;
		}
		
		int listCount = bService.getMyHeartBookListCount(mNo);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5);
		
		ArrayList<Book> list = bService.myHeartBookList(pi, mNo);
		
		if(list != null) {
			model.addAttribute("pi", pi);
			model.addAttribute("list", list);
			model.addAttribute("heartList", heartList);
		}
		
		return "myHeartBooks";
	}
	
	
}
