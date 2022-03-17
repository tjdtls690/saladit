package project.spring.web.side_menu;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import project.spring.web.member.MemberVO;

@Controller
public class SideMenuController {
	
	@RequestMapping("/sideMune.do")
	public ModelAndView sideMunuDo(ModelAndView mav, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO)session.getAttribute("member");
		if(vo == null) {
			mav.addObject("check", 0);
		}else {
			mav.addObject("check", 1);
			mav.addObject("member", vo);
		}
		mav.setViewName("sideMenu");
		return mav;
	}
}
