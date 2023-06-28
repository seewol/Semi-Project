package semi.project.bookmaroo.guide.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import semi.project.bookmaroo.common.model.vo.PageInfo;
import semi.project.bookmaroo.guide.model.vo.FAQ;

public interface GuideService {

	int getListCount();

	ArrayList<FAQ> selectFAQList(PageInfo pi);

	ArrayList<FAQ> selectFAQSearchList(PageInfo pi, HashMap map);

	int getSearchListCount(HashMap<String, String> map);

}
