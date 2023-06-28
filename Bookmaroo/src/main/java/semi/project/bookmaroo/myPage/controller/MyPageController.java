package semi.project.bookmaroo.myPage.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import semi.project.bookmaroo.board.model.service.BoardService;
import semi.project.bookmaroo.board.model.vo.Board;
import semi.project.bookmaroo.board.model.vo.Reply;
import semi.project.bookmaroo.board.model.vo.Review;
import semi.project.bookmaroo.common.Pagination;
import semi.project.bookmaroo.common.model.vo.PageInfo;
import semi.project.bookmaroo.member.model.exception.MemberException;
import semi.project.bookmaroo.member.model.vo.Member;
import semi.project.bookmaroo.myPage.model.service.MyPageService;

@Controller
public class MyPageController {
	
	@Autowired 
	private MyPageService myService;
	
	@Autowired
	private BoardService bService;
	
	@RequestMapping("main.myPage")
	public String myInfo() {
		return "MyPage";
	}
	
	
	
	
	
	@RequestMapping("writingHistory.myPage")
	public String writingHistory(HttpSession session, Model model,
			@RequestParam(value="reviewPage",required=false) Integer reviewPage,
			@RequestParam(value="replyPage",required=false) Integer replyPage,
			@RequestParam(value="boardPage",required=false) Integer boardPage) {
		
		Member m = (Member)session.getAttribute("loginUser");
		//Member(mNo=3, mId=null, password=null, mName=�솗�솕�씠, phone=01056787924, enrollDate=2023-05-18, isRental=0, isAdmin=0, loginType=KAKAO, kakaoId=2795064328, mStatus=Y)
		if(reviewPage == null) {
			reviewPage = 1;
		}
		if(replyPage == null) {
			replyPage = 1;
		}
		if(boardPage == null) {
			boardPage = 1;
		}
		
		int mNo = m.getMemNo();
		
		//1. �옉�꽦�븳 由щ럭 �솗�씤
		int myReviewListCount = myService.countMyReviewList(mNo);
		PageInfo reviewPi = Pagination.getPageInfo(reviewPage, myReviewListCount, 5);
		ArrayList<Review> myReviewList = myService.getMyReviewList(reviewPi, mNo);
		
//		System.out.println("珥� 由щ럭 �닔");
//		System.out.println(myReviewListCount);
//		System.out.println("由щ럭由ъ뒪�듃");
//		System.out.println(myReviewList);
		
		int i = 1;
		for(Review rr : myReviewList) {
//			System.out.println("(" + i + ") -- " + rr);
			i++;
		}
//		System.out.println("*****************************");
		
		model.addAttribute("myReviewList", myReviewList);
		model.addAttribute("reviewPi", reviewPi);
		
		//2. �옉�꽦�븳 �뙎湲� �솗�씤
		int myReplyListCount = myService.countMyReplyList(mNo);
		PageInfo replyPi = Pagination.getPageInfo(replyPage, myReplyListCount, 5);
		ArrayList<Reply> myReplyList = myService.getMyReplyList(replyPi, mNo);
		
		
//		System.out.println("珥� �뙎湲� �닔");
//		System.out.println(myReplyListCount);
//		System.out.println("�뙎湲�由ъ뒪�듃");
//		System.out.println(myReplyList);
//		System.out.println("*****************************");
		
		model.addAttribute("myReplyList", myReplyList);
		model.addAttribute("replyPi", replyPi);
		
		//3. �옉�꽦�븳 臾몄쓽�궗�빆 �솗�씤
		int myBoardListCount = myService.countMyBoardList(mNo);
		PageInfo boardPi = Pagination.getPageInfo(boardPage, myBoardListCount, 5);
		ArrayList<Board> myBoardList = myService.getMyBoardList(boardPi, mNo);
		
		
//		System.out.println("珥� 臾몄쓽湲� �닔");
//		System.out.println(myBoardListCount);
//		System.out.println("臾몄쓽湲�由ъ뒪�듃");
//		System.out.println(myBoardList);
		
		model.addAttribute("myBoardList", myBoardList);
		model.addAttribute("boardPi", boardPi);
		
		if(m!=null) {
			return "writingHistory";
		} else {
			throw new MemberException("ERROR");
		}
		
	}
	
	
//	@RequestMapping("replyHref.myPage")
//	public String replyHref(@RequestParam("replyNo") int replyNo) {
//		
//		Board b = myService.findRefBoard(replyNo);
//		
//		
//		
//		
//		return null;
//	}
	
	
	@RequestMapping(value="reviewPage.myPage", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String reviewPage(@RequestParam("reviewPage") String reviewPage,
							 @RequestParam(value="currentPage",required=false) Integer currentPage,
							 HttpSession session) {
		
		Member m = (Member)session.getAttribute("loginUser");
		int mNo = m.getMemNo();
		
		if(currentPage == null) {
			currentPage = 1;
		}
		
		if(reviewPage.equals("짬")) {
			reviewPage = Integer.toString(currentPage-1);
		} else if(reviewPage.equals("쨩")) {
			reviewPage = Integer.toString(currentPage+1);
		}
		//�뿬湲곌퉴吏� reviewPage�젙�쓽 �셿猷�
		
		int myReviewListCount = myService.countMyReviewList(mNo);
//		System.out.println("(�궡媛��벖 由щ럭 �닔) -- " + myReviewListCount);
		
		PageInfo reviewPi = Pagination.getPageInfo(Integer.parseInt(reviewPage), myReviewListCount, 5);
		ArrayList<Review> myReviewList = myService.getMyReviewList(reviewPi, mNo);
//		System.out.println("(�겢由��븳 �럹�씠吏��뿉�꽌 �궡媛� �끂異� �떆�궗 �뙎湲��뱾) -- " + myReviewList);
		
		JSONArray jArr = new JSONArray();
		for(Review rev : myReviewList) {
			JSONObject json = new JSONObject();
			json.put("reviewNo", rev.getReviewNo());
			json.put("memberNo", rev.getMemberNo());
			json.put("reviewerName", rev.getReviewerName());
			json.put("rentNo", rev.getRentNo());
			json.put("bookName", rev.getBookName());
			json.put("bookImage", rev.getBookImage());
			json.put("reviewTitle", rev.getReviewTitle());
			json.put("reviewContent", rev.getReviewContent());
			json.put("reviewUpdateDate", rev.getReviewUpdateDate());
			json.put("reviewViews", rev.getReviewViews());
			json.put("starRating", rev.getStarRating());
			json.put("reviewBookISBN", rev.getReviewBookISBN());
			
			jArr.put(json);
		}
		
		return jArr.toString();
	}
	
	
	@RequestMapping("myReview.myPage")
	public String myReview(HttpSession session, Model model,
			@RequestParam(value="page",required=false) Integer currentPage) {
		
		if(currentPage == null) {
			currentPage = 1;
		}
		
		Member m = (Member)session.getAttribute("loginUser");
		int mNo = m.getMemNo();
		int myReviewListCount = myService.countMyReviewList(mNo);
		PageInfo pi = Pagination.getPageInfo(currentPage, myReviewListCount, 10);
		ArrayList<Review> myReviewList = myService.getMyReviewList(pi, mNo);
		
		if(myReviewList != null) {
			model.addAttribute("pi", pi);
			model.addAttribute("reviewList", myReviewList);
			return "myReview";
		} else {
			throw new MemberException("由щ럭 議고쉶�뿉 �떎�뙣�븯���뒿�땲�떎");
		}
	}
	
	@RequestMapping("myReply.myPage")
	public String myReply(HttpSession session, Model model,
			@RequestParam(value="page",required=false) Integer currentPage) {
		
		if(currentPage == null) {
			currentPage = 1;
		}
		
		Member m = (Member)session.getAttribute("loginUser");
		int mNo = m.getMemNo();
		int myReplyListCount = myService.countMyReplyList(mNo);
		PageInfo pi = Pagination.getPageInfo(currentPage, myReplyListCount, 10);
		ArrayList<Reply> myReplyList = myService.getMyReplyList(pi, mNo);
		
		if(myReplyList != null) {
			model.addAttribute("pi", pi);
			model.addAttribute("replyList", myReplyList);
			return "myReply";
		} else {
			throw new MemberException("�뙎湲� 議고쉶�뿉 �떎�뙣�븯���뒿�땲�떎");
		}
	}
	
	
	@RequestMapping("myBoard.myPage")
	public String myBoard(HttpSession session, Model model,
			@RequestParam(value="page",required=false) Integer currentPage) {
		
		if(currentPage == null) {
			currentPage = 1;
		}
		
		Member m = (Member)session.getAttribute("loginUser");
		int mNo = m.getMemNo();
		int myBoardListCount = myService.countMyBoardList(mNo);
		PageInfo pi = Pagination.getPageInfo(currentPage, myBoardListCount, 10);
		ArrayList<Board> myBoardList = myService.getMyBoardList(pi, mNo);
		
		if(myBoardList != null) {
			model.addAttribute("pi", pi);
			model.addAttribute("BoardList", myBoardList);
			return "myBoard";
		} else {
			throw new MemberException("�뙎湲� 議고쉶�뿉 �떎�뙣�븯���뒿�땲�떎");
		}
	}
	
	
}
