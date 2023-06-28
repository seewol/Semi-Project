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
	
	// �� �� �� �Ϲ� �α���
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
				throw new MemberException("�α��ο� �����Ͽ����ϴ�.");
			}
		}
		throw new MemberException("ȸ�� ������ ã�� �� �����ϴ�.");
	}
	
	
	// �� �� �� �α׾ƿ�
	@GetMapping("logout.me")
	public String logout(SessionStatus session) {
		session.setComplete();
		return "redirect:/";
	}
	
	
	// �� �� �� īī�� �α���
	@GetMapping("kakao")			// 1�� īī���忡 ����� �ڵ� �ޱ�(jsp�� a�±� href�� ��� ����)
	public String kakaoLogin(@RequestParam(value = "code", required = false) String code, Model model) throws Throwable {

		// 1��
		System.out.println("code:" + code); // �ڵ� �� �޾ƿ����� üũ
		
		// 2��				
		String access_Token = mService.getAccessToken(code);	// ������ code ������ AccessToken�� ������ ���� �޼ҵ� �θ���
		System.out.println("###access_Token#### : " + access_Token);
		// ���� access_Token �޴� �� Ȯ���� �Ŀ� �ؿ� ����
		
		// 3��
		Member member = mService.getUserInfo(access_Token);
		// �� MemberServiceImpl�� �ִ� findMember�� ���ϵǾ� �ش� member�� ���
		System.out.println("###member#### : " + member);
		
		if (member != null) {
			model.addAttribute("loginUser", member);
			System.out.println("addAttribute��");
			if (member.getMemName() == null || member.getPhone() == null) {
				return "redirect:kakaoInsertView.me";
			} else {
				return "redirect:semiHome.do";
			}
		}
		return "redirect:semiHome.do";	// ���� ������ �ִٸ� �ٷ� Ȩ���� ����
	}
	
	
	// �� �� �� īī�� �α��� �� �߰� ���� �Է� ������
	@GetMapping("kakaoInsertView.me")
	public String kakaoInsertView() {
		return "member/kakaoInsert";
	}
	
	@PostMapping("kakaoInsert.me")	// �޾ƿ� ���� ó�� (�̸�, �޴�����ȣ)
	public String kakaoInsert(@RequestParam("memName") String name, @RequestParam("phone") String phone,
							  HttpSession session, Model model) {
		
//		System.out.println(kakaoMember);
		Member m = (Member)session.getAttribute("loginUser");
		m.setMemName(name);
		m.setPhone(phone);
		// loginUser�� m�� ����ִ� ���� �ᱹ �����ؾ� ��
		
		int result = mService.kakaoAdd(m);
		
		if(result == 1) {				// �� DB�� �ش� kakaoId�� �ִ��� �� �� �� Ȯ��
			Member loginUser = mService.findByKakaoId(m.getKakaoId());	// id �Ѱܼ� ��� ��ü ��ȯ
			if(loginUser != null) {
				model.addAttribute("loginUser", loginUser);	// �ٲ� ������ session�� ������Ʈ!
				return "redirect:semiHome.do";
			} else {
				throw new MemberException("�α��ο� �����Ͽ����ϴ�.");
			}
		} else {
			throw new MemberException("�߰� ���� ������Ʈ�� �����Ͽ����ϴ�.");
		}
	}
	
	
	// �� �� �� ȸ������
	
	@GetMapping("signUp.me")
	public String signUp() {
		return "member/signUp";
	}
	
	@PostMapping("insertMember.me")
	public String insertMember(@ModelAttribute Member m) {
		// ȸ������ ���� ��� �α��ε��� �ʰ�, Ȩ���� �̵�
		
		String encodePwd = bcrypt.encode(m.getPassword());
//		System.out.println(encodePwd);
		m.setPassword(encodePwd);
		m.setLoginType("LOCAL");
		
		int result = mService.insertMember(m);
		
		if(result > 0) {
			return "redirect:semiHome.do";
		} else {
			throw new MemberException("ȸ�����Կ� �����Ͽ����ϴ�.");
		}
		
	}
	
	
	// �� �� �� ���̵� �ߺ� Ȯ��
	@PostMapping("checkId.me")
	@ResponseBody
	public String checkId(@RequestParam("memId") String id) {
		int idCount = mService.checkId(id);
		
		String result = idCount == 0? "yes" : "no";
		// idCount�� ���� �� 1 : ��� �Ұ�, 0 : ��� ����
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
	
	
	// �� �� �� ��й�ȣ ã��
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
			throw new MemberException("��ġ�ϴ� ȸ�� ������ �����ϴ�.");
		}
	}
	
	
	// �� �� �� ��й�ȣ ã�� �� �缳��
	@PostMapping("changePwd.me")
	public String changePwd(@ModelAttribute Member m, Model model, HttpSession session) {
		// 1. �信�� password �޾ƿ���
		// 2. �޾ƿ� password ��ȣȭ �� �ֱ�
		String encode = bcrypt.encode(m.getPassword());
		
		// 3. ���ǿ� �����س��� findPwd�� �信�� �Է¹޾ƿ� password�� set
		Member findPwd = ((Member)session.getAttribute("findPwd"));
		findPwd.setPassword(encode);
		
		// 4. �׸��� �� findPwd�� �״�� ���� - DAO - update
		int result = mService.changePwd(findPwd);
		
		if(result > 0) {
			Member loginUser = mService.login(new Member(m.getMemId(), encode));
			model.addAttribute("loginUser", loginUser);
			return "redirect:semiHome.do";
		} else {
			throw new MemberException("��й�ȣ ���濡 �����Ͽ����ϴ�.");
		}
	}
	
	
	// �� �� �� ���̵� ã��
	@GetMapping("findIdForm.me")
	public String findIdForm() {
		return "member/findId";
	}
	
	@PostMapping("findId.me")
	public String findId(@ModelAttribute Member m, Model model) {
		// 1. �信�� �̸�, �޴��� ��ȣ �޾ƿ���
		// 2. �޾ƿ� ������� DB���� ��ȸ�� �޾ƿ��� list ���� (���� ���� �� ������)
		// 3. list�� ��� �� Ȯ�� ��, ��� �Ѱ��ֱ�
		
		ArrayList<Member> findId = mService.findId(m);
		
		if(!findId.isEmpty()) {
			model.addAttribute("list", findId);
			return "member/findIdList";
		} else {
			throw new MemberException("���̵� ��� ��ȸ�� �����Ͽ����ϴ�.");
		}
	}
	
	
	// �� �� �� �� ���� ����
	@GetMapping("myInfoForm.me")
	public String myInfoForm() {
		return "member/myInfo";
	}
	
	
	// �� �� �� ��й�ȣ Ȯ��
	@RequestMapping(value="checkPwd.me", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String checkPwd(@RequestParam("password") String password, HttpSession session) {
		
		// ���ǿ��� loginUser ��������
		Member m = (Member)session.getAttribute("loginUser");
		
		// �Է¹��� password�� ���ǿ� �ִ� loginUser�� password�� ���ϱ�
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
			throw new MemberException("ȸ�� Ż�� �����Ͽ����ϴ�.");
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
		
		if(result > 0) {				// login()�� Member ��ü�� �ٽ� �� �� ������
			Member loginUser = mService.login(new Member(m.getMemId(), encode));
			model.addAttribute("loginUser", loginUser);
			return json.toString();
		} else {
			throw new MemberException("��й�ȣ ���濡 �����Ͽ����ϴ�.");
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
			throw new MemberException("�޴��� ��ȣ ���濡 �����Ͽ����ϴ�.");
		}
	}
	
}
