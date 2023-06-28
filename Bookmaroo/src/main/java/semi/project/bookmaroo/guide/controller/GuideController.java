package semi.project.bookmaroo.guide.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import semi.project.bookmaroo.common.Pagination;
import semi.project.bookmaroo.common.model.vo.PageInfo;
import semi.project.bookmaroo.guide.model.service.GuideService;
import semi.project.bookmaroo.guide.model.vo.FAQ;
import semi.project.bookmaroo.library.model.exception.LibraryException;

@Controller
public class GuideController {
	
	@Autowired
	private GuideService gService;
	
	@GetMapping("information.gui")
	public String information() {
		return "information";
	}
	
	@GetMapping("location.gui")
	public String location() {
		return "location";
	}
	
	@GetMapping("operationTime.gui")
	public String operationTime() {
		return "operationTime";
	}
	
	@GetMapping("libraryFAQ.gui")
	public String selectFAQList(@RequestParam(value="page", required=false) Integer currentPage, Model model) {
		
		if(currentPage == null) {
			currentPage = 1;
		}
		
		int listCount = gService.getListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
		
		ArrayList<FAQ> list = gService.selectFAQList(pi);
		
		if(list != null) {
			model.addAttribute("pi", pi);
			model.addAttribute("list", list);
			return "libraryFAQ";
		}else {
			throw new LibraryException("자주 묻는 질문을 조회할 수 없습니다.");
		}
		
	}
	
	@GetMapping("libraryFAQSearch.gui")
	public String libraryFAQSearch(@RequestParam(value="page", required=false) Integer currentPage, Model model, 
			@RequestParam("category") String category, @RequestParam("query") String query) {
		
		if(currentPage == null) {
			currentPage = 1;
		}
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("category", category);
		map.put("query", query);
		
		int listCount = gService.getSearchListCount(map);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
		
		ArrayList<FAQ> list = gService.selectFAQSearchList(pi, map);
		
		if(list != null) {
			model.addAttribute("pi", pi);
			model.addAttribute("list", list);
			model.addAttribute("category", category);
			model.addAttribute("query", query);
			
			return "libraryFAQ";
		}else {
			throw new LibraryException("자주 묻는 질문을 조회할 수 없습니다.");
		}
		
		
	}
	
}
