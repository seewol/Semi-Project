package semi.project.bookmaroo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
	@RequestMapping(value = "semiHome.do", method = RequestMethod.GET)
	public String home() {
		
		return "index";
	}
	
	@RequestMapping("main.admin")
	public String main() {
		
		return "/WEB-INF/views/employee/main";
	}
	
}
