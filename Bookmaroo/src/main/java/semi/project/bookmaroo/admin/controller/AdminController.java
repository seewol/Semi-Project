package semi.project.bookmaroo.admin.controller;


import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import semi.project.bookmaroo.admin.board.model.exception.MemberException;
import semi.project.bookmaroo.admin.board.model.vo.Attachment;
import semi.project.bookmaroo.admin.board.model.vo.Popup;
import semi.project.bookmaroo.admin.board.service.BoardService;
import semi.project.bookmaroo.admin.book.model.vo.AdminBook;
import semi.project.bookmaroo.admin.guide.model.service.GuideService;
import semi.project.bookmaroo.admin.model.service.AdminService;
import semi.project.bookmaroo.admin.model.vo.Books;
import semi.project.bookmaroo.admin.model.vo.Questions;
import semi.project.bookmaroo.admin.model.vo.Review;
import semi.project.bookmaroo.admin.model.vo.User;
import semi.project.bookmaroo.admin.model.vo.Wishes;
import semi.project.bookmaroo.board.model.vo.Board;
import semi.project.bookmaroo.common.Pagination;
import semi.project.bookmaroo.common.model.vo.PageInfo;
import semi.project.bookmaroo.guide.model.vo.FAQ;
import semi.project.bookmaroo.member.model.vo.Member;


@SessionAttributes("loginUser")
//게시글 선택 될 때마다 페이징 처리 된 게시글 뜸.
@Controller
public class AdminController {
	
	@Autowired
	private GuideService gService;
	
	@Autowired
	private BoardService bService;
	
	@Autowired
	private AdminService aService;
	
	
	
	
		//로그아웃
		// ● ● ● 로그아웃
		@GetMapping("adminLogout.admin")
		public String logout(SessionStatus session) {
			session.setComplete();
			return "redirect:/";
		}
	
	
	
	
	
		@RequestMapping("noticeManage.admin")//사이드 리스트에서 눌렀을 때
		public String noticeManageList(Model model, @RequestParam(value="page", required=false) Integer currentPage,
										@RequestParam(value="noticePage", required=false) Integer noticeCurrentPage,
										@RequestParam(value="noticeCategory", required=false) String noticeCategory,
										@RequestParam(value="noticeQuery", required=false) String noticeQuery) {
			
		if(noticeCurrentPage == null || noticeCurrentPage < 1) {
			noticeCurrentPage = 1;
		}
		
		//첫 화면에서 전체 검색 결과가 나오도록 
		if(noticeCategory == null || noticeCategory == "") {
			noticeCategory = "all";
		}
		if(noticeQuery == null) {
			noticeQuery = "";
		}
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("noticeCategory", noticeCategory);
		map.put("noticeQuery", noticeQuery);
		

		int listCount = bService.getNoticeListCount(map); //게시글 총 수
		
		PageInfo noticePi = Pagination.getPageInfo(noticeCurrentPage, listCount, 15); //가져온 공지사항 글 페이지 정보 가져옴
		
		ArrayList<Board> list = bService.selectNoticeList(noticePi, map); //페이지 처리를 위함.
		
		
		//관리자 페이지는 들어가자마자 목록이 보이므로 바로 페이지 처리를 함.(모든 관리자 카테고리 동일)
		// list1 = 공지사항 게시글 페이지 정보
			if(currentPage == null) {
				currentPage = 1;
			}
			
			
			
			if(list != null) {
				model.addAttribute("noticePi", noticePi);
				model.addAttribute("list", list);
				model.addAttribute("noticeQuery", noticeQuery);
				model.addAttribute("noticeCategory", noticeCategory);
				
				
				return "WEB-INF/views/employee/notification_manage"; 
			} else {
				
				throw new MemberException("공지사항 조회를 실패했습니다.");
			}

	}
		
		
		
		
		
		
		
	//=====================자주 묻는 질문FAQ=======================
	//질문 글 조회 -> 페이지 처리
	@RequestMapping("question.admin")
	public String userQuestionView(@RequestParam(value="page", required=false) Integer currentPage,
									Model model) {
		
		if(currentPage == null) {
			currentPage = 1;
		}
		
		int listCount = gService.getListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);//페이지 정보 받음~
		
		ArrayList<FAQ> list = gService.selectFAQList(pi);
		
		if(list != null) {
			model.addAttribute("pi", pi);
			model.addAttribute("list", list);
			return "WEB-INF/views/employee/user_question";
		} else {
			throw new MemberException("자주 묻는 질문을 조회할 수 없습니다.");
		}
		
	}
	

	//질문 글 조회 검색조회
	@GetMapping("FAQSearch.admin")
	public String FAQSearch(
			@RequestParam(value="page", required=false) Integer currentPage, Model model, 
			@RequestParam(value="selectCategory", required=false) String category, 
			@RequestParam(value="query", required=false) String query) {
		
		if(currentPage == null) {
			currentPage = 1;
		}
		if(query == null) {
			query = "";
		}
		if(category == null) {
			category = "all";
		}
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("category", category);
		map.put("query", query);
		
		int listCount = gService.getSearchListCount(map);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
		
		ArrayList<FAQ> list = gService.selectFAQSearchList(pi, map);
		
		
		
		if(list != null) {
			model.addAttribute("pi", pi);
			model.addAttribute("list", list);
			model.addAttribute("selectCategory", category);
			model.addAttribute("query", query);
			
			return "WEB-INF/views/employee/user_question";
		} else {
			throw new MemberException("자주 묻는 질문을 조회할 수 없습니다.");
		}
		
		
	}
	
	//FAQ 수정
	@GetMapping("FAQupdate.admin")
	public String updateFAQ(@RequestParam(value="page", required=false) Integer currentPage,
							@RequestParam(value="faqNo", required=false) Integer faqNo, Model model ) {
		//글번호 이용해서 FAQ정보 받아오기
		FAQ f = gService.getFAQinfo(faqNo);
		
		if(f != null) {
			model.addAttribute("page", currentPage);
			model.addAttribute("faq", f);
			
			return "WEB-INF/views/employee/faq_admin";
		} else {
			throw new MemberException("FAQ 수정 목록 조회를 실패했어요.");
		}
			
	}
	
	
	//FAQ 수정완료
	@PostMapping(value="FAQupdateSubmit.admin", produces="text/plain;charset=UTF-8")
	public String updateFAQSubmit(@ModelAttribute FAQ faq,
								  Model model,
								  @RequestParam(value="page", required=false) Integer currentPage) {

		int result = gService.updateFAQinfo(faq);
		
		
		
		if(result > 0) {
			model.addAttribute("page", currentPage);
			
			return "redirect:FAQSearch.admin";
		} else {
			throw new MemberException("FAQ 수정을 실패했어요.");
		}
		
		
	}

	
	//FAQ 삭제하기
	@RequestMapping("FAQdelete.admin")
	public String deleteFAQ(@RequestParam("faqNo") int faqNo,
							@RequestParam(value="page", required=false) Integer page,
							Model model) {
		
		int result = gService.deleteFAQinfo(faqNo);
		
		
		if(result > 0) {
			model.addAttribute("page", page);
			return "redirect:question.admin";
		} else {
			throw new MemberException("FAQ 삭제를 실패했습니다.");
		} 
	}
	

	//FAQ 신규 등록
	//등록 페이지로 넘어가기
	@RequestMapping("FAQinsert.admin")
	public String insertFAQ() {
		return "WEB-INF/views/employee/faqInsert_admin";
	}
	
	
	//FAQ 데이터 입력받아서 진짜로 DB에 등록하기
	@RequestMapping("FAQinsertNew.admin")
	public String insertFAQ(@RequestParam("faqAnswer") String faqAnswer,
							@RequestParam("faqQuestion") String faqQuestion, 
							HttpSession session) {
		
		
		Member m = (Member)(session.getAttribute("loginUser"));
		
		String mNo = String.valueOf(m.getMemNo());
		
		HashMap<String, String> datas = new HashMap<String, String>();
		
		datas.put("mNo", mNo);
		datas.put("faqAnswer", faqAnswer);
		datas.put("faqQuestion", faqQuestion);
		
		int result = gService.insertFAQinfo(datas);

		if(result > 0) {
			return "redirect:question.admin";
			
		} else {
			throw new MemberException("FAQ 작성에 실패했습니다.");
		}
	}
		


	
	
	
	
	
	

	//==========================================================

	

	//상세 조회 (공지사항,이용자) 주소 요청 시 : .adminBoard
	@RequestMapping("notice.admin")
	public String noticeAdminBoard(@RequestParam("boardNo") int boardNo, Model model,
										@RequestParam(value="noticePage", required=false) Integer noticeCurrentPage,
										@RequestParam(value="noticeCategory", required=false) String noticeCategory,
										@RequestParam(value="noticeQuery", required=false) String noticeQuery) {
									
		//공지사항 페이지에서 눌렀던 게시글의 정보를 가져와서 게시글 화면에 뿌릴 것
		Board board = bService.selectNoticeBoardList(boardNo);
		
		if(board != null) {
			model.addAttribute("boardNo", boardNo);
			model.addAttribute("b", board);
			model.addAttribute("noticePage", noticeCurrentPage);
			model.addAttribute("noticeCategory",noticeCategory);
			model.addAttribute("noticeQuery", noticeQuery);
			
			return "WEB-INF/views/employee/admin_noticeBoardList";
		} else {
			throw new MemberException("상세조회 실패입니다...ㅜㅜ");
		}
		
		
	}
	
	
	
	//공지사항 글 수정으로 넘어가기
	@RequestMapping("update.admin")
	public String updateAdminBoard(@ModelAttribute Board board, @RequestParam(value="noticePage", required=false) Integer noticePage, Model model) {

		if(board != null) {
			model.addAttribute("board", board);
			model.addAttribute("noticePage", noticePage);
			
			return "WEB-INF/views/employee/updateNotice";
		} else {
			throw new MemberException("수정으로 넘어가지 못했습니다.");
		}
	}
	
	
	
	
	
	//공지사항 글 수정하기
	@RequestMapping("updateNotice.admin")
	public String updateNotice(@ModelAttribute Board b, @RequestParam("boardNo") int boardNo,
							   @RequestParam("noticePage") int noticePage, Model model) {
		
		int result = bService.updateNotice(b);

		if(result > 0) {
			model.addAttribute("noticePage", noticePage);
			model.addAttribute("boardNo", boardNo);
			
//			return "WEB-INF/views/employee/admin_noticeBoardList";
			return "redirect:noticeManage.admin";
		} else {
			throw new MemberException("수정에 실패했습니다.");
		}
	}
	
	
	
	
	
	//공지사항 작성하기 //추후 수정 필요 관리자 로그인 세션이 있을 때
	@PostMapping(value="insertNotice.admin", produces="text/plain;charset=UTF-8")
	public String insertNotice(@RequestParam("boardTitle") String boardTitle,
								@RequestParam("boardContent") String boardContent, HttpSession session , Model model) {
		
		Member m = (Member)(session.getAttribute("loginUser"));
		
		String mNo = String.valueOf(m.getMemNo());
		
		HashMap<String, String> datas = new HashMap<String, String>();
		
		datas.put("id", mNo);
		datas.put("boardTitle", boardTitle);
		datas.put("boardContent", boardContent);

		int result = bService.insertNotice(datas);
		
		if(result > 0) {
			
			return "redirect:noticeManage.admin";
		} else {
			throw new MemberException("작성에 실패했습니다.");
		}
	}
	
	
	
	
	
	
	//공지사항 글 삭제
	@GetMapping("deleteNotice.admin")
	public String deleteNotice(@RequestParam("boardNo") int boardNo, 
							   @RequestParam(value="noticePage", required=false) Integer noticePage, Model model) {
		
		int result = bService.deleteNotice(boardNo);

		if(result > 0) {
			model.addAttribute("noticePage", noticePage);
			return "redirect:noticeManage.admin";
		} else {
			throw new MemberException("게시글을 지우지 못했습니다.");
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
	
	//===================================이용자 관리===========================================
	
	//먼저 페이징 처리 필요
	@RequestMapping("userManage.admin")
	public String userManageView(@RequestParam(value="page", required=false) Integer currentPage,
								 Model model) {
		
		if(currentPage == null) {
			currentPage = 1;
		}
		
		int listCount = bService.getUserListCount(); //이용자 전체 수 구하기
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
		
		//이용자 뽑아오기 (페이징 처리)
		ArrayList<Member> list = bService.selectUserList(pi);
		
		//카카오 ID가 오버플로우 에러 뜸. 형변환을 해주어야 할 것 같다.
//		String kakaoId = "";
//		for(Member member : list) {
//			Integer.toString(member.getKakaoId());
//		}
		
		if(list != null) {
			model.addAttribute("pi", pi);
			model.addAttribute("list", list);
			
			return "WEB-INF/views/employee/user_manage";
		} else {
			throw new MemberException("이용자 조회를 실패했어요.");
		}
	
	}
	

	
	
	//이용자 목록을 눌러서 상세보기를 확인하는 코드
	//선택한 이용자의 정보를 받아 상세보기 화면에 뿌린다.
	//회원번호 넘겨받아서 뿌림, 회원에 맞는 도서정보 넘겨받아서 뿌림
	//넘어온 이용자의 번호를 상세보기 화면의 인풋에 대입
	@RequestMapping("user.admin")
	public String userAdminBoard(@RequestParam("userNo") int userNo,
								 @RequestParam(value="bookPage", required=false) Integer bookPage,
								 @RequestParam("page") int page,
								 Model model) {
		
		Member m = bService.selectUserBoardList(userNo); //사용자의 회원번호를 이용해 사용자 정보 다 받을 것
		
		//이용자마다 얼마나 도서를 대출했는지 보여주는 페이징처리 하기
		if(bookPage == null) {
			bookPage = 1;
		}
		
		//일단 이용자 도서 대출 정보를 모두 가져온다.
		int listCount = bService.getUserBookList(userNo);// 
		
		System.out.println(listCount);
		
		//페이징 처리임. 게시글 1개씩만 보이도록 한다.
		PageInfo pi = Pagination.getPageInfo(bookPage, listCount, 1);
		
		ArrayList<AdminBook> bList = bService.getUserBookRentList(pi, userNo);
		
		//반납 안한 책이 한 권이라도 있다면 계정 비활성화 불가능.
				int returnResult = bService.selectBookIsReturn(userNo);
				
				System.out.println(returnResult + "132");
				
				if(bList != null) {
					model.addAttribute("m", m);
					model.addAttribute("page", page);
					model.addAttribute("bList", bList);
					model.addAttribute("bookPage", pi);
					model.addAttribute("returnResult", returnResult);
					
					return "WEB-INF/views/employee/admin_userBoardList";
				} else {
					throw new MemberException("에러 발생");
				}
				
				
			}
		

		
		
		
	
	
	
	//이용자 계정 업데이트 하는 법
	@RequestMapping("updateUser.admin")
	public String updateUser(@RequestParam("userNo") int userNo, @RequestParam(value="page", required=false) Integer page, Model model, Member m) {
		

		m = bService.selectUserBoardList(userNo);
		
		
		String value = m.getMemStatus().equals("Y") ? "N" : "Y";
		
		
		//만약 userNo과 일치하는 행의 m_status가 'Y'라면 'N'으로 //value는 m_status 항상 반대값이 나온다.
		//만약 userNo과 일치하는 행의 m_status가 'N'이라면 'Y'로 //value는 m_status 항상 반대값이 나온다.
		
		
		HashMap<String, String> datas = new HashMap<String, String>();
		
		datas.put("userNo", Integer.toString(userNo));
		datas.put("value", value);
		
		//업데이트를 위해 멤버 정보랑 memStatus 값 전달
		int result = bService.updateUser(datas);
		
		if(result > 0) {
			model.addAttribute("page", page);
			return "redirect:userManage.admin";
		} else {
			throw new MemberException("계정 정보 변경을 실패했어요.");
		}
		
	}
	
	@GetMapping("userSearch.admin")
	public String userSearch(
			@RequestParam(value="page", required=false) Integer currentPage, Model model, 
			@RequestParam(value="selectCategory", required=false) String category, 
			@RequestParam(value="query", required=false) String query) {
		
		if(currentPage == null) {
			currentPage = 1;
		}
		if(query == null) {
			query = "";
		}
		if(category == null) {
			category = "all";
		}
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("category", category);
		map.put("query", query);
		
		int listCount = bService.getUserSearchListCount(map);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
		
		ArrayList<Member> list = bService.selectUserSearchList(pi, map);
		
		
		
		if(list != null) {
			model.addAttribute("pi", pi);
			model.addAttribute("list", list);
			model.addAttribute("category", category);
			model.addAttribute("query", query);
			
			return "WEB-INF/views/employee/user_manage";
		} else {
			throw new MemberException("유저를 조회할 수 없습니다.");
		}
		
	}
	
//===============================================팝업 작업====================================================	
	
	//교육/문화프로그램 -> 팝업
	@RequestMapping("popupManage.admin")
	public String popupManageView() {
				
			return "WEB-INF/views/employee/popup_manage";
			
		}
	
	@RequestMapping("popupList")
	public String popupList(@RequestParam(value="page", required=false) Integer page, Model model) {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		//popup 테이블 file_attm 테이블 조인한 결과 리스트 뽑기
		int joinListCount = bService.selectJoinListCount();
		
		//popup 테이블 file_attm 테이블 조인한 리스트 페이지 처리
		PageInfo pi2 = Pagination.getPageInfo(currentPage, joinListCount, 3);
		
		
		
		//페이징 된 결과 받아오기
		ArrayList<Attachment> joinList = bService.selectJoinList(pi2);
		
		
		
		if(joinList != null) {
			model.addAttribute("pi", pi2);
			model.addAttribute("joinList", joinList);
			
			return "WEB-INF/views/employee/popupList_admin";
		} else {
			throw new MemberException("게시글 조회 실패!");
		}
		
		
	}
	
	
	
	

	@PostMapping("insertPopup.admin")
	public String insertPopup(@ModelAttribute Popup p, HttpServletRequest request,
							 @RequestParam("file") ArrayList<MultipartFile> files) {
//		String id = ((Member)request.getSession().getAttribute("loginUser")).getMemId();
//		p.setMemberNo(id);

		//뷰에서 입력 받은 게시글 제목
		String popTitle = p.getPopTitle();
		
		//회원 아이디
		p.setMemberNo(1005);
		
		//멀티파트 타입 객체를 그대로 활용하긴 어려우니 어레이 리스트레 담을 것임.
		ArrayList<Attachment> list = new ArrayList<>();
		for(int i = 0; i < files.size(); i++) {
			MultipartFile upload = files.get(i);
			//if(upload.getOriginalFilename().equals("")) {
			if(upload != null && !upload.isEmpty()) {	
				String[] returnArr = saveFile(upload, request);
				if(returnArr[1] != null) {
					Attachment a = new Attachment();
					a.setFileUrl(returnArr[0]);
					a.setFileName(upload.getOriginalFilename());
					a.setFileRename(returnArr[1]);
					a.setFileType(returnArr[2]); //파일 타입 추가했습니다.
					
					list.add(a);
				}
			}
		}
		//수업 때는 attmLevel로 썸네일 이미지를 결정 지었었는데 지금은 필요 없음.
		//여기서는 첨부파일이 어떤 게시판에 쓰일지 숫자 넣음. 교육/문화프로그램 게시판은 3을 넣자.
		for(int i = 0; i < list.size(); i++) {
			Attachment a = list.get(i);
			a.setFileClassify(3);
		}
		//DB에 넣을 것인데 FILE_ATTM 테이블에 넣을 것이다.
		//수업에서는 일반게시판인지 첨부파일 게시판인지 나눠줬고 테이블 두개에 삽입함
		//세미프로젝트 때는 No. 이제 DB에 보내주기
		
		//1)팝업 테이블에는 제목이 들어가야 하고 
		//2)첨부테이블에는 첨부파일 정보가 들어간다.
		int result1 = 0;
		int result2 = 0;
		if(!list.isEmpty() && !popTitle.equals("")) {
			//위에서 얻은 popTitle을 popup테이블에 insert.
			result1 = bService.insertPopup(popTitle);
			result2 = bService.insertAttm(list);
		}
		
		//값이 제대로 들어 갔다면 첨부파일 상세 조회로 들어가자~
		if(result1 + result2 == list.size()+1) {
			return "WEB-INF/views/employee/popupList";
		} else {
			for(Attachment a : list) {
				deleteFile(a.getFileRename(), request); //사용자 정의 메소드 생성
			}
			throw new MemberException("첨부파일 삭제를 실패했습니다.");
		}

	}
	

	//저장 메소드 생성 (로그인 연결하면 이것을 사용하기)
	//게시글 수정 시, 파일이 새로 추가 된다면 그 추가된 파일도 이름 또 변경해야 하고 똑같이 옮겨줘야 하기 때문에
	//파일 rename 하면서, DB저장소에 경로 저장하기 위해서 저장 메소드(saveFile)를 따로 만들어 사용
	//파일 저장소 지정
	public String[] saveFile(MultipartFile file, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\uploadFiles";
		File folder = new File(savePath);
		if(!folder.exists()) {
			folder.mkdirs();
		}
		//파일 이름 변경 형식 지정
		SimpleDateFormat sdf = new SimpleDateFormat("yyyMMddHHmmssSSS");
		int ranNum = (int)(Math.random()*100000);
		String renameFileName = sdf.format(new Date(System.currentTimeMillis())) + ranNum //여기서 JPG나 PNG만 받도록 조건을 걸어줄 수 있지 않을까?
								+ file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
		
		//DB에 전달할 파일타입
		String fileType = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
		
		//확장자 조건 걸어놓음 그냥 input에서 accept 사용 하면 됨.
//		if(!fileType.equals(".jpg") || !fileType.equals(".png" ) || !fileType.equals(".JPG") || !fileType.equals(".PNG")) {
			// 변경된 이름의 파일을 저장
			String renamePath = folder + "\\" + renameFileName;
			try {
				file.transferTo(new File(renamePath));//파일소에 파일이 저장된다. DB에는 경로도 저장이 되어야 함.
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			String[] returnArr = new String[3];
			returnArr[0] = savePath;
			returnArr[1] = renameFileName;
			//여기 쯤에서 fileType도 전달해주면 될 것 같다.
			returnArr[2] =  fileType;
			return returnArr;
			

	}

	
	//사용자 정의 삭제 메소드
	public void deleteFile(String fileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\uploadFiles";
		
		File f = new File(savePath + "\\" + fileName);
		if(f.exists()) {
			f.delete();
		}
	}
	
	
	
	
	
	
	
	
	
	
	
// 호진님
	
	@RequestMapping("bookManage")
	public String bookManage() {
		return "/WEB-INF/views/employee/book_manage";
	}
	
	@RequestMapping("adminManage")
	public String userManage() {
		return "/WEB-INF/views/employee/admin_manage";
	}
	
	@RequestMapping("userReview")
	public String userReview() {
		return "/WEB-INF/views/employee/user_review";
	}
	
	@RequestMapping("questionManage")
	public String userQuestion() {
		return "/WEB-INF/views/employee/question_manage";
	}
	
	@RequestMapping("insertBook.admin")
	public void insertBook(@ModelAttribute Books b) {
		int result = aService.insertBook(b);
		
		if(result > 0) {
			int result2 = aService.insertBookDetail(b.getIsbn());
		} else {
			
		}
	}
	
	@RequestMapping(value="searchBook", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String searchBook(String keyword, String type) {
		
		switch(type) {
		case "title": type = "Title"; break;
		case "authors": type = "Authors"; break;
		case "isbn": type = "Isbn"; break;
		case "status": type = "Status"; break;
		}

		ArrayList<Books> bArr = aService.searchBook(keyword, type);
		
		JSONArray ja = new JSONArray();
		for(Books b : bArr) {
			JSONObject jo = new JSONObject();
			
			String isbn = (b.getIsbn() != null) ? b.getIsbn() : "";
			String title = (b.getTitle() != null) ? b.getTitle() : ""; 
			String authors = (b.getAuthors() != null) ? b.getAuthors() : ""; 
			String publisher = (b.getPublisher() != null) ? b.getPublisher() : ""; 
			String datetime = (b.getDatetime() != null) ? b.getDatetime() : ""; 
			String contents = (b.getContents() != null) ? b.getContents() : ""; 
			String status = (b.getIsRental() != null) ? b.getIsRental() : ""; 
			String thumbnail = (b.getThumbnail() != null) ? b.getThumbnail() : ""; 
			String gmCode = (b.getGmCode() != null) ? b.getGmCode() : ""; 
			
			jo.put("isbn", isbn);
			jo.put("title", title);
			jo.put("authors", authors);
			jo.put("publisher", publisher);
			jo.put("datetime", datetime);
			jo.put("contents", contents);
			jo.put("isRental", status);
			jo.put("thumbnail", thumbnail);
			jo.put("gmCode", gmCode);
			
			ja.put(jo);
		}
		
		return ja.toString();
	}
	
	@RequestMapping(value="updateBook", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String updateBook(HttpServletRequest req) {
		Books b = new Books();
		String[] arrStr = req.getParameterValues("book");
		
		b.setIsbn(arrStr[0]);
		b.setTitle(arrStr[1]);
		b.setAuthors(arrStr[2]);
		b.setPublisher(arrStr[3]);
		b.setDatetime(arrStr[4]);
		b.setGmCode(arrStr[5]);
		b.setIsRental(arrStr[6]);
		b.setContents(arrStr[7]);
		b.setThumbnail(arrStr[8]);
		
		aService.updateBook(b);
		
		return b.getIsbn();
	}
	
	@RequestMapping(value="deleteBook", produces="application/json; charset=UTF-8")
	@ResponseBody
	public void deleteBook(HttpServletRequest req) {
		String isbn = req.getParameter("isbn");
		
		aService.deleteBook(isbn);
	}
	
	@RequestMapping(value="insertBook", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String insertBook(HttpServletRequest req) {
		Books b = new Books();
		String[] arrStr = req.getParameterValues("book");
		
		b.setIsbn(arrStr[0]);
		b.setTitle(arrStr[1]);
		b.setAuthors(arrStr[2]);
		b.setPublisher(arrStr[3]);
		b.setDatetime(arrStr[4]);
		b.setGmCode(arrStr[5]);
		b.setContents(arrStr[6]);
		b.setThumbnail(arrStr[7]);
		
		int result = aService.insertBook(b);
		
		if(result > 0) {
			aService.insertBookDetail(b.getIsbn());
		}
		
		return b.getIsbn();
	}
	
	@RequestMapping(value="searchReview", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String searchReview(String keyword, String type) {
		
		ArrayList<Review> bArr = aService.searchReview(keyword, type);
		
		JSONArray ja = new JSONArray();
		for(Review b : bArr) {
			JSONObject jo = new JSONObject();
			
			String reviewNo = (b.getReviewNo() != null) ? b.getReviewNo() : "";
			String reviewTitle = (b.getReviewTitle() != null) ? b.getReviewTitle() : ""; 
			String reviewContent = (b.getReviewContent() != null) ? b.getReviewContent() : ""; 
			String reviewUpdateDate = (b.getReviewUpdateDate() != null) ? b.getReviewUpdateDate() : ""; 
			String reviewViews = (b.getReviewViews() != null) ? b.getReviewViews() : ""; 
			String starRating = (b.getStarRating() != null) ? b.getStarRating() : ""; 
			String reviewBookIsbn = (b.getReviewBookIsbn() != null) ? b.getReviewBookIsbn() : ""; 
			String memberId = (b.getMemberId() != null) ? b.getMemberId() : ""; 
			
			jo.put("reviewNo", reviewNo);
			jo.put("reviewTitle", reviewTitle);
			jo.put("reviewContent", reviewContent);
			jo.put("reviewUpdateDate", reviewUpdateDate);
			jo.put("reviewViews", reviewViews);
			jo.put("starRating", starRating);
			jo.put("reviewBookIsbn", reviewBookIsbn);
			jo.put("memberId", memberId);
			
			ja.put(jo);
		}
		
		return ja.toString();
	}
	
	@RequestMapping(value="deleteReview", produces="application/json; charset=UTF-8")
	@ResponseBody
	public void deleteReview(HttpServletRequest req) {
		String reviewNo = req.getParameter("reviewNo");
		
		int result = aService.deleteReview(reviewNo);
	}
	
	@RequestMapping(value="searchUser", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String searchUser(String keyword, String type) {
		
		ArrayList<User> uArr = aService.searchUser(keyword, type);
		
		JSONArray ja = new JSONArray();
		for(User b : uArr) {
			JSONObject jo = new JSONObject();
			
			String memberNo = (b.getMemberNo() != null) ? b.getMemberNo() : "";
			String memberId = (b.getMemberId() != null) ? b.getMemberId() : ""; 
			String password = (b.getPassword() != null) ? b.getPassword() : ""; 
			String memberName = (b.getMemberName() != null) ? b.getMemberName() : ""; 
			String phone = (b.getPhone() != null) ? b.getPhone() : ""; 
			String enrollDate = (b.getEnrollDate() != null) ? b.getEnrollDate() : ""; 
			String isRental = (b.getIsRental() != null) ? b.getIsRental() : ""; 
			String isAdmin = (b.getIsAdmin() != null) ? b.getIsAdmin() : "";
			String loginType = (b.getLoginType() != null) ? b.getLoginType() : "";
			String kakaoId = (b.getKakaoId() != null) ? b.getKakaoId() : "";
			String memberStatus = (b.getMemberStatus() != null) ? b.getMemberStatus() : "";
			
			jo.put("memberNo", memberNo);
			jo.put("memberId", memberId);
			jo.put("password", password);
			jo.put("memberName", memberName);
			jo.put("phone", phone);
			jo.put("enrollDate", enrollDate);
			jo.put("isRental", isRental);
			jo.put("isAdmin", isAdmin);
			jo.put("loginType", loginType);
			jo.put("kakaoId", kakaoId);
			jo.put("memberStatus", memberStatus);
			
			ja.put(jo);
		}
		
		return ja.toString();
	}
	
	@RequestMapping(value="updateUser1", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String updateUser(HttpServletRequest req) {
		User u = new User();
		String keyword = req.getParameter("keyword");
		String type = req.getParameter("type");

		u.setMemberNo(keyword);
		
		int result = aService.updateUser(u, type);
		
		return u.getIsAdmin();
	}
	
	@RequestMapping(value="searchWish", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String searchWish(String keyword, String type) {
		
		ArrayList<Wishes> wArr = aService.searchWish(keyword, type);
		
		JSONArray ja = new JSONArray();
		for(Wishes b : wArr) {
			JSONObject jo = new JSONObject();
			
			String wishNo = (b.getWishNo() != null) ? b.getWishNo() : "";
			String memberNo = (b.getMemberNo() != null) ? b.getMemberNo() : ""; 
			String wishTitle = (b.getWishTitle() != null) ? b.getWishTitle() : ""; 
			String wishAuthor = (b.getWishAuthor() != null) ? b.getWishAuthor() : ""; 
			String wishPublisher = (b.getWishPublisher() != null) ? b.getWishPublisher() : ""; 
			String wishPrice = (b.getWishPrice() != null) ? b.getWishPrice() : ""; 
			String wishEtc = (b.getWishEtc() != null) ? b.getWishEtc() : ""; 
			String wishPublication = (b.getWishPublication() != null) ? b.getWishPublication() : "";
			String memberId = (b.getMemberId() != null) ? b.getMemberId() : "";

			jo.put("wishNo", wishNo);
			jo.put("memberNo", memberNo);
			jo.put("wishTitle", wishTitle);
			jo.put("wishAuthor", wishAuthor);
			jo.put("wishPublisher", wishPublisher);
			jo.put("wishPrice", wishPrice);
			jo.put("wishEtc", wishEtc);
			jo.put("wishPublication", wishPublication);
			jo.put("memberId", memberId);
			
			ja.put(jo);
		}
		
		return ja.toString();
	}
	
	@RequestMapping(value="deleteWish", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String deleteWish(HttpServletRequest req) {
		String keyword = req.getParameter("keyword");
		
		int result = aService.deleteWish(keyword);
		
		return "" + result;
	}
}

