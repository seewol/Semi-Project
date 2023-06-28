package semi.project.bookmaroo.guide.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import semi.project.bookmaroo.common.model.vo.PageInfo;
import semi.project.bookmaroo.guide.model.vo.FAQ;

@Repository
public class GuideDAO {

	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("guideMapper.getListCount");
	}

	public ArrayList<FAQ> selectFAQList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("guideMapper.selectFAQList", "", rowBounds);
	}

	public ArrayList<FAQ> selectFAQSearchList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap map) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("guideMapper.selectFAQSearchList", map, rowBounds);
	}

	public int getSearchListCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("guideMapper.getSearchListCount", map);
	}
	
}
