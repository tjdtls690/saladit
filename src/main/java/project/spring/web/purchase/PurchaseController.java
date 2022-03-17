package project.spring.web.purchase;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PurchaseController {
	
	@RequestMapping("/purchase.do")
	public ModelAndView purchaseDo(ModelAndView mav) {
		mav.setViewName("purchase");
		return mav;
	}
}
