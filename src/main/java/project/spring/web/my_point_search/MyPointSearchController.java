package project.spring.web.my_point_search;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MyPointSearchController {
	
	
	
	@RequestMapping("myPointSearch.do")
	public ModelAndView myPointSearchDo(ModelAndView mav) {
		mav.setViewName("myPointSearch");
		return mav;
	}
}
