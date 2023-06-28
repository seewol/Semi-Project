package semi.project.bookmaroo.member.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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

import semi.project.bookmaroo.member.model.exception.MemberException;
import semi.project.bookmaroo.member.model.vo.Member;
import semi.project.bookmaroo.member.service.MemberService;

@SessionAttributes({"loginUser", "findPwd", "checkId"})
@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private BCryptPasswordEncoder bcrypt;
	
	// ● ● ● 일반 로그인
	@GetMapping("loginView.me")
	public String loginView() {
		return "member/login";
	}
	
	@PostMapping("login.me")
	public String login(@ModelAttribute Member m, Model model) {
		
		Member loginUser = mService.login(m);
		System.out.println("--- : " + loginUser);
		if(loginUser != null) {
			if(bcrypt.matches(m.getPassword(), loginUser.getPassword())) {
				model.addAttribute("loginUser", loginUser);
				if(loginUser.getIsAdmin() != 0) {
					return "redirect:semiHome.do";
				}else if(loginUser.getIsAdmin() == 0) {
					return "redirect:main.admin";
				}
			} else {
				throw new MemberException("로그인에 실패하였습니다.");
			}
		}
		throw new MemberException("회원 정보를 찾을 수 없습니다.");
	}
	
	
	// ● ● ● 로그아웃
	@GetMapping("logout.me")
	public String logout(SessionStatus session) {
		session.setComplete();
		return "redirect:/";
	}
	
	
	// ● ● ● 카카오 로그인
	@GetMapping("kakao")			// 1번 카카오톡에 사용자 코드 받기(jsp의 a태그 href에 경로 있음)
	public String kakaoLogin(@RequestParam(value = "code", required = false) String code, Model model) throws Throwable {

		// 1번
		System.out.println("code:" + code); // 코드 잘 받아오는지 체크
		
		// 2번				
		String access_Token = mService.getAccessToken(code);	// 가져온 code 값으로 AccessToken을 가져올 서비스 메소드 부르기
		System.out.println("###access_Token#### : " + access_Token);
		// 위의 access_Token 받는 걸 확인한 후에 밑에 진행
		
		// 3번
		Member member = mService.getUserInfo(access_Token);
		// ↑ MemberServiceImpl에 있던 findMember가 리턴되어 해당 member에 담김
		System.out.println("###member#### : " + member);
		
		if (member != null) {
			model.addAttribute("loginUser", member);
			System.out.println("addAttribute♡");
			if (member.getMemName() == null || member.getPhone() == null) {
				return "redirect:kakaoInsertView.me";
			} else {
				return "redirect:semiHome.do";
			}
		}
		return "redirect:semiHome.do";	// 만약 문제가 있다면 바로 홈으로 리턴
	}
	
	
	// ● ● ● 카카오 로그인 시 추가 정보 입력 페이지
	@GetMapping("kakaoInsertView.me")
	public String kakaoInsertView() {
		return "member/kakaoInsert";
	}
	
	@PostMapping("kakaoInsert.me")	// 받아올 정보 처리 (이름, 휴대폰번호)
	public String kakaoInsert(@RequestParam("memName") String name, @RequestParam("phone") String phone,
							  HttpSession session, Model model) {
		
//		System.out.println(kakaoMember);
		Member m = (Member)session.getAttribute("loginUser");
		m.setMemName(name);
		m.setPhone(phone);
		// loginUser와 m에 들어있는 값은 결국 동일해야 함
		
		int result = mService.kakaoAdd(m);
		
		if(result == 1) {				// 내 DB에 해당 kakaoId가 있는지 한 번 더 확인
			Member loginUser = mService.findByKakaoId(m.getKakaoId());	// id 넘겨서 멤버 객체 반환
			if(loginUser != null) {
				model.addAttribute("loginUser", loginUser);	// 바뀐 정보를 session에 업데이트!
				return "redirect:semiHome.do";
			} else {
				throw new MemberException("로그인에 실패하였습니다.");
			}
		} else {
			throw new MemberException("추가 정보 업데이트에 실패하였습니다.");
		}
	}
	
	
	// ● ● ● 회원가입
	
	@GetMapping("signUp.me")
	public String signUp() {
		return "member/signUp";
	}
	
	@PostMapping("insertMember.me")
	public String insertMember(@ModelAttribute Member m) {
		// 회원가입 됐을 경우 로그인되지 않고, 홈으로 이동
		
		String encodePwd = bcrypt.encode(m.getPassword());
//		System.out.println(encodePwd);
		m.setPassword(encodePwd);
		m.setLoginType("LOCAL");
		
		int result = mService.insertMember(m);
		
		if(result > 0) {
			return "redirect:semiHome.do";
		} else {
			throw new MemberException("회원가입에 실패하였습니다.");
		}
		
	}
	
	
	// ● ● ● 아이디 중복 확인
	@PostMapping("checkId.me")
	@ResponseBody
	public String checkId(@RequestParam("memId") String id) {
		int idCount = mService.checkId(id);
		
		String result = idCount == 0? "yes" : "no";
		// idCount의 개수 → 1 : 사용 불가, 0 : 사용 가능
		return result;
	}

	
	@PostMapping("pwdCheckId.me")
	@ResponseBody
	public String pwdCheckId(@RequestParam("memId") String id, Model model) {
		
		int idCount = mService.checkId(id);
		
		if(idCount == 1) {
			Member member = new Member();
			member.setMemId(id);
			
			model.addAttribute("checkId", mService.login(member));
			
			return "Y";
		}
		return "N";
	}
	
	
	// ● ● ● 비밀번호 찾기
	@GetMapping("findPwdForm.me")
	public String findPwdForm() {
		return "member/findPwd";
	}
	
	@PostMapping("findPwd.me")
	public String findPwd(@ModelAttribute Member m, Model model) {
		model.addAttribute("findPwd", m);
		return "member/findPwdCode";
	}
	
	@PostMapping("findPwdCode.me")
	public String findPwdCode(@ModelAttribute Member m, Model model, HttpSession session) {
		Member findPwd = (Member)session.getAttribute("findPwd");
		m.setMemId(findPwd.getMemId());
		
//		System.out.println(findPwd.toString());
//		System.out.println(m.toString());
		
		int result = mService.findPwdCode(m);
		
		if(result > 0) {
			return "member/changePwd";
		} else {
			throw new MemberException("일치하는 회원 정보가 없습니다.");
		}
	}
	
	
	// ● ● ● 비밀번호 찾기 후 재설정
	@PostMapping("changePwd.me")
	public String changePwd(@ModelAttribute Member m, Model model, HttpSession session) {
		// 1. 뷰에서 password 받아오기
		// 2. 받아온 password 암호화 해 주기
		String encode = bcrypt.encode(m.getPassword());
		
		// 3. 세션에 저장해놓은 findPwd에 뷰에서 입력받아온 password를 set
		Member findPwd = ((Member)session.getAttribute("findPwd"));
		findPwd.setPassword(encode);
		
		// 4. 그리고 그 findPwd를 그대로 서비스 - DAO - update
		int result = mService.changePwd(findPwd);
		
		if(result > 0) {
			Member loginUser = mService.login(new Member(m.getMemId(), encode));
			model.addAttribute("loginUser", loginUser);
			return "redirect:semiHome.do";
		} else {
			throw new MemberException("비밀번호 변경에 실패하였습니다.");
		}
	}
	
	
	// ● ● ● 아이디 찾기
	@GetMapping("findIdForm.me")
	public String findIdForm() {
		return "member/findId";
	}
	
	@PostMapping("findId.me")
	public String findId(@ModelAttribute Member m, Model model) {
		// 1. 뷰에서 이름, 휴대폰 번호 받아오기
		// 2. 받아온 정보들로 DB에서 조회해 받아오기 list 형식 (여러 개일 수 있으니)
		// 3. list에 담긴 값 확인 후, 뷰로 넘겨주기
		
		ArrayList<Member> findId = mService.findId(m);
		
		if(!findId.isEmpty()) {
			model.addAttribute("list", findId);
			return "member/findIdList";
		} else {
			throw new MemberException("아이디 목록 조회에 실패하였습니다.");
		}
	}
	
	
	// ● ● ● 내 정보 관리
	@GetMapping("myInfoForm.me")
	public String myInfoForm() {
		return "member/myInfo";
	}
	
	
	// ● ● ● 비밀번호 확인
	@RequestMapping(value="checkPwd.me", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String checkPwd(@RequestParam("password") String password, HttpSession session) {
		
		// 세션에서 loginUser 꺼내오기
		Member m = (Member)session.getAttribute("loginUser");
		
		// 입력받은 password를 세션에 있는 loginUser의 password와 비교하기
		String result = bcrypt.matches(password, m.getPassword()) == true ? "Y" : "N";
		
		JSONObject json = new JSONObject();
		json.put("result", result);
		
//		System.out.println(json.toString());
		
		return json.toString();
	}
	
	@RequestMapping("deleteMember.me")
	public String deleteMember(Model model, SessionStatus session) {
		String id = ((Member)model.getAttribute("loginUser")).getMemId();

		int result = mService.deleteMember(id);
		
		if(result > 0) {
			session.setComplete();
			return "redirect:loginView.me";
		} else {
			throw new MemberException("회원 탈퇴에 실패하였습니다.");
		}
	}
	
	@RequestMapping("updatePwdForm.me")
	public String updatePwdForm() {
		return "member/updatePwd";
	}
	
	@PostMapping(value="updatePwd.me", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String updatePwd(@RequestParam("newPassword") String newPwd, HttpSession session, Model model) {
		
//		System.out.println(newPwd);
		
		String encode = bcrypt.encode(newPwd);
		
		Member m = (Member)session.getAttribute("loginUser");
		m.setPassword(encode);
		
		int result = mService.updatePwd(m);
		
		JSONObject json = new JSONObject();
		json.put("result", result);
		
		if(result > 0) {				// login()로 Member 객체를 다시 한 번 가져옴
			Member loginUser = mService.login(new Member(m.getMemId(), encode));
			model.addAttribute("loginUser", loginUser);
			return json.toString();
		} else {
			throw new MemberException("비밀번호 변경에 실패하였습니다.");
		}
		
	}
	
	@GetMapping("updatePhoneForm.me")
	public String updatePhoneForm() {
		return "member/updatePhone";
	}
	
	@PostMapping(value="updatePhone.me", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String updatePhone(@RequestParam("phone") String phone, HttpSession session, Model model) {
		
		System.out.println(phone);
		
		Member m = (Member)session.getAttribute("loginUser");
		m.setPhone(phone);
		
		int result = mService.updatePhone(m);
		
		
		JSONObject json = new JSONObject();
		json.put("result", result);
		
		Member loginUser = null;
		
		if(result > 0) {
			if (m.getLoginType().equals("KAKAO")) {
				loginUser = mService.findByKakaoId(m.getKakaoId());
			} else {
				loginUser = mService.login(new Member(m.getMemId(), m.getPassword()));
			}
			model.addAttribute("loginUser", loginUser);
			return json.toString();
		} else {
			throw new MemberException("휴대폰 번호 변경에 실패하였습니다.");
		}
	}
	
}
