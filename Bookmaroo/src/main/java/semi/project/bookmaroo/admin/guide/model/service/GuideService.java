package semi.project.bookmaroo.admin.guide.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import semi.project.bookmaroo.common.model.vo.PageInfo;
import semi.project.bookmaroo.guide.model.vo.FAQ;

public interface GuideService {

	int getListCount();//

	ArrayList<FAQ> selectFAQList(PageInfo pi);

	ArrayList<FAQ> selectFAQSearchList(PageInfo pi, HashMap map);

	int getSearchListCount(HashMap<String, String> map);

	FAQ getFAQinfo(Integer faqNo);

	int updateFAQinfo(FAQ faq);

	int deleteFAQinfo(int faqNo);

	int insertFAQinfo(HashMap<String, String> datas);
	
	
}
