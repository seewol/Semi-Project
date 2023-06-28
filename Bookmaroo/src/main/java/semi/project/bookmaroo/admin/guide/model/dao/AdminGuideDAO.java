package semi.project.bookmaroo.admin.guide.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import semi.project.bookmaroo.common.model.vo.PageInfo;
import semi.project.bookmaroo.guide.model.vo.FAQ;

@Repository
public class AdminGuideDAO {

	public int getListCount(SqlSessionTemplate sqlSession) {//
		return sqlSession.selectOne("adminGuideMapper.getListCount");
	}

	public ArrayList<FAQ> selectFAQList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminGuideMapper.selectFAQList", "", rowBounds);
	}

	public ArrayList<FAQ> selectFAQSearchList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap map) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminGuideMapper.selectFAQSearchList", map, rowBounds);
	}

	public int getSearchListCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("adminGuideMapper.getSearchListCount", map);
	}

	public FAQ getFAQinfo(SqlSessionTemplate sqlSession, Integer faqNo) {
		return sqlSession.selectOne("adminGuideMapper.getFAQinfo", faqNo);
	}

	public int updateFAQinfo(SqlSessionTemplate sqlSession, FAQ faq) {
		return sqlSession.update("adminGuideMapper.updateFAQinfo", faq);
	}

	public int deleteFAQ(SqlSessionTemplate sqlSession, int faqNo) {
		return sqlSession.delete("adminGuideMapper.deleteFAQinfo", faqNo);
	}

	public int insertFAQinfo(SqlSessionTemplate sqlSession, HashMap<String, String> datas) {
		return sqlSession.insert("adminGuideMapper.insertFAQinfo", datas);
	} 

	
	
}
