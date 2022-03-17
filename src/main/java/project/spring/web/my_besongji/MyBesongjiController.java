package project.spring.web.my_besongji;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MyBesongjiController {
	
	
	@RequestMapping("/myBesongji.do")
	public ModelAndView myBesongjiDo(ModelAndView mav) {
		mav.setViewName("myBesongji");
		return mav;
	}
}
