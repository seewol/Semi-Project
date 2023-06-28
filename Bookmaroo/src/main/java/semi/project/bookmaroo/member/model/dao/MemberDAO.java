package semi.project.bookmaroo.member.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import semi.project.bookmaroo.member.model.vo.KakaoInsertMember;
import semi.project.bookmaroo.member.model.vo.Member;

@Repository
public class MemberDAO {

	public int insertKakaoMember(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.insert("memberMapper.insertMember", member);
	}
	
	public Member findByKakaoId(SqlSessionTemplate sqlSession, long kakaoId) {
		return sqlSession.selectOne("memberMapper.findByKakaoId", kakaoId);
		
	}

	public Member login(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.selectOne("memberMapper.login", m);
		
	}

	public int kakaoAdd(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.kakaoAdd", m);
	}

	public int checkId(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("memberMapper.checkId", id);
	}

	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}

	public int findPwdCode(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.findPwdCode", m);
	}

	public int changePwd(SqlSessionTemplate sqlSession, Member findPwd) {
		return sqlSession.update("memberMapper.changePwd", findPwd);
	}

	public ArrayList<Member> findId(SqlSessionTemplate sqlSession, Member m) {
		return (ArrayList)sqlSession.selectList("memberMapper.findId", m);
	}

	public int deleteMember(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.update("memberMapper.deleteMember", id);
	}

	public int updatePwd(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updatePwd", m);
	}

	public int updatePhone(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updatePhone", m);
	}


	
	
}
