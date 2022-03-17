package project.spring.web.my_pay_detail_info;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MyPayDetailInfoController {
	
	@RequestMapping("myPayDetailInfo.do")
	public ModelAndView myPayDetailDo(ModelAndView mav) {
		mav.setViewName("myPayDetailInfo");
		return mav;
	}
}
