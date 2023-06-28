package semi.project.bookmaroo.admin.guide.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import semi.project.bookmaroo.admin.guide.model.dao.AdminGuideDAO;
import semi.project.bookmaroo.common.model.vo.PageInfo;
import semi.project.bookmaroo.guide.model.vo.FAQ;

@Service
public class AdminGuideServiceImpl implements GuideService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private AdminGuideDAO gDAO;
	
	@Override
	public int getListCount() { //
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

	@Override
	public FAQ getFAQinfo(Integer faqNo) {
		return gDAO.getFAQinfo(sqlSession, faqNo);
	}

	@Override
	public int updateFAQinfo(FAQ faq) {
		return gDAO.updateFAQinfo(sqlSession, faq);
	}

	@Override
	public int deleteFAQinfo(int faqNo) {
		return gDAO.deleteFAQ(sqlSession, faqNo);
	}

	@Override
	public int insertFAQinfo(HashMap<String, String> datas) {
		return gDAO.insertFAQinfo(sqlSession, datas);
	}



}
