package project.spring.web.my_delivery;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MyDeliveryController {
	
	
	@RequestMapping("myDelivery.do")
	public ModelAndView myDeliveryDo(ModelAndView mav) {
		mav.setViewName("myDelivery");
		return mav;
	}
}
