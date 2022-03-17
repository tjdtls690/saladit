package project.spring.web.my_member_modify;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MyMemberModifyController {
	
	
	@RequestMapping("/myMemberModify.do")
	public ModelAndView myMemberModifyDo(ModelAndView mav) {
		mav.setViewName("myMemberModify");
		return mav;
	}
}
