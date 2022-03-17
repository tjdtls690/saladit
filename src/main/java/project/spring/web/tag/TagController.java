package project.spring.web.tag;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import project.spring.web.tapPage.TapPageService;
import project.spring.web.tapPage.TapPageVO;

@Controller
public class TagController {
	
	@Autowired
	TapPageService tapPageService;
	
	@RequestMapping("/tag.do")
	public ModelAndView tagDo(HttpServletRequest request, TapPageVO vo, ModelAndView mav) {
		String tmp = request.getParameter("tagNum");
		int tagNum = Integer.parseInt(tmp);
		vo.setTagMain(tagNum);
		List<TapPageVO> itemInfo = tapPageService.getItemInfo(vo);
		mav.addObject("itemInfo", itemInfo);
		mav.setViewName("tag");
		return mav;
	}
}
