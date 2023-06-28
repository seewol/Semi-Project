package semi.project.bookmaroo.member.service;

import java.util.ArrayList;

import semi.project.bookmaroo.member.model.vo.KakaoInsertMember;
import semi.project.bookmaroo.member.model.vo.Member;

public interface MemberService {
	
	String getAccessToken(String authorize_code) throws Throwable;
	
	public Member getUserInfo(String access_Token) throws Throwable;

	Member login(Member m);

	int kakaoAdd(Member m);

	Member findByKakaoId(long id);

	int checkId(String id);

	int insertMember(Member m);

	int findPwdCode(Member m);

	int changePwd(Member findPwd);

	ArrayList<Member> findId(Member m);

	int deleteMember(String id);

	int updatePwd(Member m);

	int updatePhone(Member m);

	
}
