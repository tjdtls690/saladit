package project.spring.web.my_pay_info;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MyPayInfoController {
	
	
	@RequestMapping("myPayInfo.do")
	public ModelAndView myPayInfoDo(ModelAndView mav) {
		mav.setViewName("myPayInfo");
		return mav;
	}
}
