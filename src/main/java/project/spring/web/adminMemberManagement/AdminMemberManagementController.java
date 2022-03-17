package project.spring.web.adminMemberManagement;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminMemberManagementController {
	
	
	@RequestMapping("/memberManagement.mdo")
	public ModelAndView memberManagementDo(ModelAndView mav) {
		
		mav.setViewName("memberManagement");
		return mav;
	}
}
