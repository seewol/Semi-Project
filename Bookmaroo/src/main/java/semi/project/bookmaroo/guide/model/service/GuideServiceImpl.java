package semi.project.bookmaroo.guide.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import semi.project.bookmaroo.common.model.vo.PageInfo;
import semi.project.bookmaroo.guide.model.dao.GuideDAO;
import semi.project.bookmaroo.guide.model.vo.FAQ;

@Service
public class GuideServiceImpl implements GuideService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private GuideDAO gDAO;
	
	@Override
	public int getListCount() {
		return gDAO.getListCount(sqlSession);
	}

	@Override
	public ArrayList<FAQ> selectFAQList(PageInfo pi) {
		return gDAO.selectFAQList(sqlSession, pi);
	}

	@Override
	public ArrayList<FAQ> selectFAQSearchList(PageInfo pi, HashMap map) {
		return gDAO.selectFAQSearchList(sqlSession, pi, map);
	}

	@Override
	public int getSearchListCount(HashMap<String, String> map) {
		return gDAO.getSearchListCount(sqlSession, map);
	}
}
