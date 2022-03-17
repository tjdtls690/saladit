package project.spring.web.paymentComplete;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PaymentCompleteController {
	
	
	@RequestMapping("/paymentComplete.do")
	public ModelAndView paymentCompleteDo(ModelAndView mav) {
		mav.setViewName("paymentComplete");
		return mav;
	}
}
