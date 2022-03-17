package project.spring.web.my_review_search;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MyReviewSearchController {
	
	
	@RequestMapping("/myReviewSearch.do")
	public ModelAndView myReviewSearchDo(ModelAndView mav) {
		mav.setViewName("myReviewSearch");
		return mav;
	}
}
