package project.spring.web.searchdo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SearchDoController {
@RequestMapping("/searchdo.do")
public ModelAndView searchdoDo(ModelAndView mav) {
	mav.setViewName("search");
	return mav;
}
}