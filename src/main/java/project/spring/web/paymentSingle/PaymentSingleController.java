package project.spring.web.paymentSingle;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import project.spring.web.member.MemberVO;
import project.spring.web.member_zipcode.MemberZipcodeService;
import project.spring.web.member_zipcode.MemberZipcodeVO;

@Controller
public class PaymentSingleController {
	
	@Autowired
	MemberZipcodeService memberZipcodeService;
	@Autowired
	PaymentSingleService paymentSingleService;
	
	@RequestMapping("/paymentSingle.do")
	public ModelAndView paymentSingleDo(ModelAndView mav, @ModelAttribute(value="PaymentSingleListVO") PaymentSingleListVO list
			, PaymentSingleSideInfoVO vo) {
		mav.addObject("vo", vo);
		mav.addObject("list", list.getPaymentSingleList());
		mav.setViewName("paymentSingle");
		return mav;
	}
	
	@RequestMapping("/paymentArrow.do")
	public ModelAndView paymentArrowDo(ModelAndView mav, String check) {
		
		mav.addObject("check", check);
		mav.setViewName("paymentArrow");
		return mav;
	}
	
	@RequestMapping(value = "/getZipcode.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String getZipcodeDo(String deliveryZipcodeCode) {
		MemberZipcodeVO vo = new MemberZipcodeVO();
		vo.setMember_zipcode_code(Integer.parseInt(deliveryZipcodeCode));
		System.out.println(deliveryZipcodeCode);
		
		return memberZipcodeService.getZipcodeAll2(vo).getMember_zipcode();
	}
	
	@RequestMapping("/paymentEnterExitType.do")
	public ModelAndView paymentEnterExitTypeDo(ModelAndView mav, String check) {
		mav.setViewName("paymentEnterExitType");
		return mav;
	}
	
	@RequestMapping("/paymentCouponModal.do")
	public ModelAndView paymentCouponModalDo(ModelAndView mav, HttpServletRequest request, PaymentSingleCouponInfoVO vo) {
		HttpSession session = request.getSession();
		MemberVO vo1 = (MemberVO)session.getAttribute("member");
		vo.setUser_code(String.valueOf(vo1.getMemberCode()));
		List<PaymentSingleCouponInfoVO> list = paymentSingleService.getMyPaymentCoupon(vo);
		
		for(int i = 0; i < list.size(); i++) {
			System.out.println("?? : " + list.get(i).getCoupon_code());
		}
		mav.addObject("list", list);
		mav.setViewName("paymentCouponModal");
		return mav;
	}
}
