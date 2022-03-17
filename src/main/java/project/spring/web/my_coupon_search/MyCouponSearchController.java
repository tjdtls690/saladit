package project.spring.web.my_coupon_search;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import project.spring.web.event.CouponVO;
import project.spring.web.event.EventService;
import project.spring.web.member.MemberVO;

@Controller
public class MyCouponSearchController {
	
	@Autowired
	EventService eventService;
	
	@RequestMapping("myCouponSearch.do")
	public ModelAndView myCouponSearchDo(ModelAndView mav, HttpServletRequest request) {
//		String couponName = request.getParameter("couponName");
//		System.out.println(couponName);
//		mav.addObject("couponName",couponName);
		
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("member");
		
		int user_code = mvo.getMemberCode();
		System.out.println(user_code);
		CouponVO cvo = new CouponVO();
		cvo.setUser_code(user_code);
		List<CouponVO> userCoupon = eventService.getCoupon(cvo);
		List<CouponVO> couponDetail = new ArrayList<CouponVO>();
		for(int i = 0; i < userCoupon.size(); i++) {
			int coupon_code = userCoupon.get(i).getCoupon_code();
			CouponVO cvo2 = new CouponVO();
			cvo2.setCoupon_code(coupon_code);
			couponDetail.add(eventService.getCouponDetail(cvo2));
		}
		mav.addObject("couponDetail",couponDetail);
		mav.setViewName("myCouponSearch");
		return mav;
	}
	
	@RequestMapping(value = "myCouponSearch2.do", method = RequestMethod.POST)
	public ModelAndView myCouponSearch2Do(ModelAndView mav, HttpServletRequest request) {
		String promoCode = request.getParameter("promoCode");
		System.out.println(promoCode);
		mav.addObject("promoCode",promoCode);
		
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("member");		
		
		int user_code = mvo.getMemberCode();
		System.out.println(user_code);
		
		CouponVO cvo = new CouponVO();
		cvo.setUser_code(user_code);
		
		List<CouponVO> userCoupon = eventService.getCoupon(cvo);
		List<CouponVO> couponDetail = new ArrayList<CouponVO>();
		for(int i = 0; i < userCoupon.size(); i++) {
			int coupon_code = userCoupon.get(i).getCoupon_code();
			CouponVO cvo2 = new CouponVO();
			cvo2.setCoupon_code(coupon_code);
			couponDetail.add(eventService.getCouponDetail(cvo2));
		}
		mav.addObject("couponDetail",couponDetail);
		mav.setViewName("myCouponSearch");
		
		return mav;
	}
}
