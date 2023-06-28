package semi.project.bookmaroo.board.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import semi.project.bookmaroo.board.model.service.BoardService;
import semi.project.bookmaroo.board.model.vo.Board;
import semi.project.bookmaroo.board.model.vo.Reply;
import semi.project.bookmaroo.board.model.vo.Review;
import semi.project.bookmaroo.book.model.vo.Book;
import semi.project.bookmaroo.common.Pagination;
import semi.project.bookmaroo.common.model.vo.PageInfo;
import semi.project.bookmaroo.member.model.exception.MemberException;
import semi.project.bookmaroo.member.model.vo.Member;


@Controller
public class BoardController {
	
	@Autowired
	private BoardService bService;

	@RequestMapping("Announcement.bo")
	public String getAnnouncementList(@RequestParam(value="page",required=false) Integer currentPage,
									  Model model) {
		
		if(currentPage == null) {
			currentPage = 1;
		}
		//공지사항 게시글을 가져올 것이기 때문에 매개인자로 보드타입 1을 넘김
		int listCount = bService.countBoardList(1);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
		
		ArrayList<Board> list = bService.getBoardList(pi,1);
		/*[boardNo=1045, memberNo=1000, writer=왕화이, boardTitle=제목23, boardContent=내용23,
		   boardUpdateDate=2023-05-14, boardViews=0, boardType=1]*/
		
		if(list != null) {
			model.addAttribute("pi", pi);
			model.addAttribute("boardList", list);
			return "Announcement";
		} else {
			throw new MemberException("공지사항 조회에 실패했습니다.");
		}
	}
	
	@RequestMapping("Inquiry.bo")
	public String getInquiryList(@RequestParam(value="page",required=false) Integer currentPage,
								 Model model, HttpSession session) {
		
		Member m = (Member)session.getAttribute("loginUser");
		
		if(currentPage == null) {
			currentPage = 1;
		}
		//공지사항 게시글을 가져올 것이기 때문에 매개인자로 보드타입 1을 넘김
		int listCount = bService.countBoardList(2);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
		
		ArrayList<Board> list = bService.getBoardList(pi,2);
		/*[boardNo=1045, memberNo=1000, writer=왕화이, boardTitle=제목23, boardContent=내용23,
		   boardUpdateDate=2023-05-14, boardViews=0, boardType=1]*/
		
		if(list != null) {
			model.addAttribute("pi", pi);
			model.addAttribute("boardList", list);
			if(m!=null) {
				String memberName = m.getMemName();
				model.addAttribute("memberName", memberName);
			}
			return "Inquiry";
		} else {
			throw new MemberException("문의사항 조회에 실패했습니다.");
		}
	}
	
	
	@RequestMapping("searchBoard.bo")
	public String searchBoard(@RequestParam(value="searchType",required = false) String searchType,
							  @RequestParam(value="search",required = false) String search,
							  @RequestParam(value="page",required=false) Integer currentPage,
							  @RequestParam("boardType") String boardType,
							  Model model) {
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("searchType", searchType.trim());
		map.put("search", search.trim());
		map.put("boardType", boardType);
		/*{search=zz, boardType=1, searchType=content}*/
		
		if(currentPage == null) {
			currentPage = 1;
		}
		
		int listCount = bService.countSearchList(map);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
		
		ArrayList<Board> list = bService.getSearchList(pi,map);
		
		if (list != null) {
			model.addAttribute("pi", pi);
			model.addAttribute("boardList", list);
			model.addAttribute("searchType", searchType);
			model.addAttribute("search", search);
			model.addAttribute("boardType", boardType);
			
			if(Integer.parseInt(boardType) == 1) {
				return "Announcement";
			} else {
				return "Inquiry";
			}
		} else {
			throw new MemberException("게시글 검색에 실패했습니다");
		}
	}

	@RequestMapping("selectBoard.bo")
	public String selectBoard(@RequestParam("boardNo") int boardNo, //상세조회를 하기 위해 가져온 게시판넘버
			@RequestParam("writer") String writer, //상세조회를 하기 위해 가져온 작성자 이름
			@RequestParam(value="replyPage",required=false) Integer replyPage, //댓글에 대한 페이징 처리를 하기위한 replyNo  
			@RequestParam("page") int page, //목록을 눌렀을 때 뒤로 돌아가기 위한 페이지
			Model model, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		
		Member m = (Member)session.getAttribute("loginUser");
		
		Board b = bService.selectBoardCK(boardNo);
			System.out.println("상세보기에 보낼 Board b : " + b);
		
		Cookie[] cookies = request.getCookies();
		
		Cookie viewCookie = null; //뷰쿠키를 통해 비교할거임
		
		if (cookies != null && cookies.length > 0) 
        {
            for (int i = 0; i < cookies.length; i++)
            {
            	// Cookie의 name이 cookie + reviewNo와 일치하는 쿠키를 viewCookie에 넣어줌 
                if (cookies[i].getName().equals("cookie"+boardNo))
                { 
                    System.out.println("처음 쿠키가 생성한 뒤 들어옴.");
                    viewCookie = cookies[i];
                }
            }
        }
		
		if(b != null) { //--1번if문
			System.out.println("****- 해당 상세 게시판페이지로 넘어감");
//			model.addAttribute("board", b);
			
			if (viewCookie == null) { //--2번if문
				System.out.println("cookie 없음");
				
				Cookie newCookie = new Cookie("cookie"+boardNo, "|" + boardNo + "|");
				
				response.addCookie(newCookie);
				
				int result = bService.BoardViewUp(boardNo);
				b.setBoardViews(b.getBoardViews()+1);
				
				if(result>0) {
                    System.out.println("조회수 증가");
                }else {
                    System.out.println("조회수 증가 에러");
                }
				
			} //--2번if문끝
			
			else { //--2번if문에대한 else문
				
				System.out.println("cookie 있음");
				
				String value = viewCookie.getValue();
				
				System.out.println("cookie 값 : " + value);
				
			} //--2번if문에대한 else문끝
			
			Reply r = new Reply();
			int replyCount = bService.countReplyList(boardNo);
			if(replyPage == null) {
				replyPage = 1;
			}
			PageInfo pi = Pagination.getPageInfo(replyPage, replyCount, 10);
			ArrayList<Reply> replyList = bService.getReplyList(pi, boardNo);
			
			model.addAttribute("replyList", replyList);
			model.addAttribute("page", page);
			
			if (m != null){
				model.addAttribute("mNo", m.getMemNo());
				model.addAttribute("mName", m.getMemName());
			}
			
			model.addAttribute("board", b);
				System.out.println("리턴하기전 b : " + b);
			if(replyList.size()>0) {
				model.addAttribute("pi", pi);
			}
			return "Post";
			
		} //--1번if문끝
		
		else {
			throw new MemberException("게시글 상세조회에 실패했습니다");
		}
	}	
		
	@RequestMapping("deletePost.bo")
	public String deletePost(@RequestParam("boardNo") int boardNo) {
		Board b = bService.selectBoard(boardNo, false);
		int boardType = b.getBoardType();
		
		int result = bService.deletePost(boardNo);
		if(result>0) {
			if(boardType == 1) {
				return "redirect:Announcement.bo";
			} else if(boardType == 2) {
				return "redirect:Inquiry.bo";
			} else {
				throw new MemberException("게시글 삭제에 실패했습니다.");
			}
		} else {
			throw new MemberException("게시글 삭제에 실패했습니다");
		}
	}
	
	@RequestMapping(value="insertReply.bo", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String insertReply(@ModelAttribute Reply r,
							  @RequestParam(value="replyPage",required=false) Integer replyPage) {
		
		if(replyPage == null) {
			replyPage = 1;
		}
		
		int result = bService.insertReply(r);
		if(result < 1) {
			throw new MemberException("댓글 작성에 실패하였습니다");
		}
		
		int replyCount = bService.countReplyList(r.getRefBoardNo());
		PageInfo pi = Pagination.getPageInfo(replyPage, replyCount, 10);
		
		ArrayList<Reply> list = bService.getReplyList(pi, r.getRefBoardNo()); 
		
		JSONArray jArr = new JSONArray();
		for(Reply reply : list) {
			JSONObject json = new JSONObject();
			json.put("replyWriter", reply.getReplyWriter());
			json.put("replyContent", reply.getReplyContent());
			json.put("replyUpdateDate", reply.getReplyUpdateDate());
			json.put("refBoardNo", reply.getRefBoardNo());
			json.put("replyNo", reply.getReplyNo());
			
			jArr.put(json);
		}
		
		return jArr.toString();
	}
	
		
	@RequestMapping("deleteReply.bo")
	public String deleteReply(@RequestParam("rNo") int rNo, @RequestParam("page") int page, Model model) {
		Reply r = bService.selectReplyForDelete(rNo);
		Board b = bService.selectBoard(r.getRefBoardNo(), false);
		
		int result = bService.deleteReply(rNo);
		if(result>0) {
			model.addAttribute("board", b);
			model.addAttribute("boardNo", b.getBoardNo());
			model.addAttribute("bType", b.getBoardType());
			model.addAttribute("writer", b.getWriter());
			model.addAttribute("page", page);
			return "redirect:selectBoard.bo";
		} else {
			throw new MemberException("댓글 삭제에 실패하였습니다");
		}
	}
	
	@RequestMapping("Review.bo")
	public String getReviewList(@RequestParam(value="page",required=false) Integer currentPage, Model model) {
		
		if(currentPage == null) {
			currentPage = 1;
		}
		
		int listCount = bService.countReviewList();
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 8);
		ArrayList<Review> list = bService.getReviewList(pi);
		
		if(list != null) {
			model.addAttribute("revList", list);
//			if(listCount > 8) {
				model.addAttribute("pi", pi);
//			}
			return "Review";
		} else {
			throw new MemberException("리뷰 조회에 실패하였습니다");
		}
	}
	
	
	@RequestMapping("PostingReview.bo")
	public String postingReview(HttpSession session, Model model) {
		
		Member m = (Member)session.getAttribute("loginUser");
		//이걸 통해 이 회원이 대출한 도서 목록 뽑아와야함
		ArrayList<Book> list = bService.getMemberRentedBookList(m.getMemNo());
		
		if(m != null) {
			model.addAttribute("list", list);
			model.addAttribute("loginUser", m);
			return "PostingReview";
		} else {
			throw new MemberException("리뷰 작성 요청에 실패하였습니다");
		}
	}
	
	@RequestMapping(value="selectBook.bo", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String selectBook(@RequestParam("bookName") String bookName) {
		Book b = bService.selectBook(bookName);
		
		JSONObject json = new JSONObject();
		json.put("bookImage", b.getBookImage());
		json.put("bookISBN", b.getBookISBN());
		json.put("bookName", b.getBookName());
		json.put("author", b.getAuthor());
		json.put("gmName", b.getGmName());
		json.put("gsName", b.getGsName());
		json.put("publisher", b.getPublisher());
		
		return json.toString();
	}
	
	@RequestMapping("insertReview.bo")
	public String insertReview(@RequestParam("reviewTitle") String reviewTitle,
			@RequestParam("reviewContent") String reviewContent,
			@RequestParam("booktitle") String booktitle,
			@RequestParam("starRating") Integer starRating,
			@RequestParam("reviewBookISBN") String reviewBookISBN,
			HttpSession session) {
		
		/*세션에서 이름 받아와야함*/
		Member m = (Member)session.getAttribute("loginUser");
		
		Review rev = new Review();
		rev.setReviewTitle(reviewTitle);
		rev.setReviewContent(reviewContent);
		rev.setStarRating(starRating);
		rev.setMemberNo(m.getMemNo());
		rev.setReviewBookISBN(reviewBookISBN);
		
		//렌트넘버가죠오는험난한 여정
		int rentNo = bService.findRentNum(booktitle, m.getMemNo());
		
		rev.setRentNo(rentNo); 
		
		int result = bService.insertReview(rev);
		if(result>0) {
			return "redirect:Review.bo";
		} else {
			throw new MemberException("리뷰작성에 실패했습니다");
		}
		
	}
	
	@RequestMapping("reviewDetail.bo")
	public String getReviewContent(@RequestParam("reviewNo") int reviewNo,
								   @RequestParam("reviewerName") String reviewerName,
								   @RequestParam(value="page",required=false) int page,
								   @RequestParam(value="replyPage",required=false) Integer replyPage,
								   HttpSession session, HttpServletRequest request,
								   HttpServletResponse response, Model model) {
		
Member m = (Member)session.getAttribute("loginUser");
		
		Review rev = bService.selectReviewCK(reviewNo);
		System.out.println("(1.상세보기에 보낼 Review rev)-- " + rev);
		
		Cookie[] cookies = request.getCookies();
		Cookie viewCookie = null;
		
		if (cookies != null && cookies.length > 0) {
	        
            for (int i = 0; i < cookies.length; i++) {
            
                if (cookies[i].getName().equals("cookie"+reviewNo)) {
                 
                    System.out.println("처음 쿠키가 생성한 뒤 들어옴.");
                    viewCookie = cookies[i];
                }
            }
        }
		
		if(rev != null) {
			
			if (viewCookie == null) { 
				System.out.println("cookie 없음");
				
				Cookie newCookie = new Cookie("cookie"+reviewNo, "|" + reviewNo + "|");
				
				response.addCookie(newCookie);
				
				int result = bService.ReviewViewUp(reviewNo);
					rev.setReviewViews(rev.getReviewViews()+1);
				
				if(result>0) {
                    System.out.println("조회수 증가");
                }else {
                    System.out.println("조회수 증가 에러");
                }
				
			} else {
				
				System.out.println("cookie 있음");
				
				String value = viewCookie.getValue();
				
				System.out.println("cookie 값 : " + value);
				
			}
			
			Reply r = new Reply();
			int replyCount = bService.countReplyList(reviewNo);
			if(replyPage == null) {
				replyPage = 1;
			}
			
			PageInfo pi = Pagination.getPageInfo(replyPage, replyCount, 10);
			ArrayList<Reply> replyList = bService.getReplyList(pi, reviewNo);
			
			model.addAttribute("replyList", replyList);
			model.addAttribute("page", page);
			
			if (m != null){
				model.addAttribute("memberNo", m.getMemNo());
				model.addAttribute("mName", m.getMemName());
			}
			
			model.addAttribute("rev", rev);
			
			if(replyList.size()>0) {
				model.addAttribute("pi", pi);
			}
			return "ReviewDetail";
		} else {
			throw new MemberException("리뷰 상세조회에 실패했습니다");
		}
	}
	
	@RequestMapping("deleteReview.bo")
	public String deleteReview(@RequestParam("reviewNo") int reviewNo) {
		int result = bService.deleteReview(reviewNo);
		if(result>0) {
			int replyDeletedNum = bService.deleteReviewInDeleted(reviewNo);
			
			return "redirect:Review.bo";
		} else {
			throw new MemberException("리뷰 삭제에 실패하였습니다");
		}
		
		
	}
	
	@RequestMapping("updateReview.bo")
	public String updateReview(@RequestParam("reviewNo") int reviewNo,
			 				   HttpSession session, Model model) {
//		Review rev = bService.getReviewContent(reviewNo, false);
		
		
		Member m = (Member)session.getAttribute("loginUser");
		ArrayList<Book> bookList = bService.getMemberRentedBookList(m.getMemNo());
		
		Review rev = bService.getReviewContent(reviewNo, false);
		
		model.addAttribute("bookList", bookList);
		model.addAttribute("rev", rev);
		
		String rentBookISBN = rev.getReviewBookISBN();
		Book reviewBook = bService.selectBookWithISBN(rentBookISBN);
		
		model.addAttribute("reviewBook", reviewBook);
		
		if(bookList != null && rev != null) {
			return "editReview";
		} else {
			throw new MemberException("리뷰 수정에 실패하였습니다");
		}
		
	}
	
	
	@RequestMapping("reviewUpdate.bo")
	public String reviewUpdate(@ModelAttribute Review rev) {
		
		int result = bService.reviewUpdate(rev);
		
		if(result > 0) {
			return "redirect:Review.bo";
		} else {
			throw new MemberException("리뷰 수정에 실패하였습니다");
		}
	}
	
	
	@RequestMapping("deleteReviewReply.bo")
	public String deleteReviewReply(@RequestParam("rNo") int rNo, @RequestParam("page") int page,
									@RequestParam("reviewerName") String reviewerName, Model model) {
		
		
		Reply r = bService.selectReplyForDelete(rNo);
		//[replyNo=1122, memberNo=3, replyWriter=null, refBoardNo=1280, replyContent=6, replyUpdateDate=2023-05-18]
		int result = bService.deleteReply(rNo);
		
		model.addAttribute("reviewNo", r.getRefBoardNo());
		model.addAttribute("reviewerName", reviewerName);
		model.addAttribute("page", page);
		
		if(result>0) {
			return "redirect:reviewDetail.bo";
		} else {
			throw new MemberException("댓글 삭제에 실패했습니다");
		}
	}
	
	@RequestMapping("searchReview.bo")
	public String searchReview(@RequestParam(value="searchType",required = false) String searchType,
							   @RequestParam(value="search",required = false) String search,
							   @RequestParam(value="page",required=false) Integer currentPage,
							   Model model) {
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("searchType", searchType.trim());
		map.put("search", search.trim());
		
		if(currentPage == null) {
			currentPage = 1;
		}
		
		int listCount = bService.countSearchReviewList(map);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 8);
		
		ArrayList<Review> list = bService.getSearchReviewList(pi, map);
		
		if(list != null) {
			model.addAttribute("revList", list);
			model.addAttribute("pi", pi);
			model.addAttribute("searchType", searchType);
			model.addAttribute("search", search);
			return "Review";
		} else {
			throw new MemberException("리뷰 검색에 실패했습니다");
		}
		
	}
	
	@RequestMapping("postingInquiry.bo")
	public String postingInquiry() {
		return "PostingInquiry";
	}
	
	
	@RequestMapping("insertInquiry.bo")
	public String postingInquiry(@ModelAttribute Board b, HttpSession session) {
		Member m = (Member)session.getAttribute("loginUser");
		b.setMemberNo(m.getMemNo());
		b.setWriter(m.getMemName());
		
		int result = bService.insertInquiry(b);
		
		if(result>0) {
			return "redirect:Inquiry.bo";
		} else {
			throw new MemberException("문의 작성에 실패했습니다");
		}
	}
	
	@RequestMapping("editInquiry.bo")
	public String editInquiry(@ModelAttribute Board b, Model model) {
		
		model.addAttribute("b", b);
		
		return "editInquiry";
	}
	
	
	@RequestMapping("updateInquiry.bo")
	public String updateInquiry(@ModelAttribute Board b) {
		
		int result = bService.updateInquiry(b);
		if(result>0) {
			return "redirect:Inquiry.bo";
		} else {
			throw new MemberException("문의 수정에 실패했습니다");
		}
	}
	
	
	@RequestMapping("programme.bo")
	public String programme() {
		return "programme";
	}
	
	
	@RequestMapping("deleteRevReply.bo")
	public String deleteReviewReply(@RequestParam("rNo") int rNo, @RequestParam("page") int page, Model model) {
		Reply r = bService.selectReplyForDelete(rNo);
		Review rev = bService.getReviewContent(r.getRefBoardNo(), false);
		
		int result = bService.deleteReply(rNo);
		if(result>0) {
			model.addAttribute("rev", rev);
			model.addAttribute("reviewNo", rev.getReviewNo());
			model.addAttribute("page", page);
			model.addAttribute("reviewerName", rev.getReviewerName());
			return "redirect:reviewDetail.bo";
		} else {
			throw new MemberException("댓글 삭제에 실패하였습니다");
		}
	}

	
	
	
	
	
	
	
	
	
	
	
}
