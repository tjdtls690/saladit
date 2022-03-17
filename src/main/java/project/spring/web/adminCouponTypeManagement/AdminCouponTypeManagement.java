package project.spring.web.adminCouponTypeManagement;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import project.spring.web.event.CouponVO;
import project.spring.web.event.EventService;
import project.spring.web.member.MemberService;
import project.spring.web.member.MemberVO;

@Controller
public class AdminCouponTypeManagement {
	
	@Autowired
	EventService eventService;
	
	@Autowired
	MemberService memberService;
	
	@RequestMapping("/adminCouponTypeManagement.mdo")
	public ModelAndView adminCouponTypeManagementDo(ModelAndView mav) {
		
		CouponVO cvo = new CouponVO();
		List<CouponVO> coupon = eventService.getAllCoupon(cvo);
		mav.addObject("coupon", coupon);
		mav.setViewName("couponTypeManagement");
		return mav;
	}
	
	@RequestMapping("/userCouponManage.mdo")
	public ModelAndView userCouponManageDo(ModelAndView mav) {
		
		CouponVO cvo = new CouponVO();
		List<CouponVO> userCoupon = eventService.getUserCoupon(cvo);
//		SELECT a.user_code, b.*
//		FROM user_coupon a LEFT JOIN coupon b 
//		ON a.coupon_code = b.coupon_code
//		ORDER BY a.user_code ASC

		MemberVO mvo = new MemberVO();
		List<MemberVO> allMember = memberService.getAllMember(mvo);
//		SELECT * FROM member
		
		List<String> memberEmail = new ArrayList<String>();
		
		for(int j = 0; j < allMember.size(); j++) {
			for (int i = 0; i < userCoupon.size(); i++) {
				int userCode = userCoupon.get(i).getUser_code();
				//i번째 유저의 유저쿠폰테이블에서의 유저코드
				if(userCode == allMember.get(j).getMemberCode()) {
					MemberVO mvo2 = new MemberVO();
					mvo2.setMemberCode(userCode);
					MemberVO member = memberService.getMemberEmail(mvo2);
//					SELECT * FROM member WHERE member_code = #{memberCode}
					memberEmail.add(member.getEmail());
				}
			}
		}
		mav.addObject("coupon", userCoupon);
		mav.addObject("memberEmail",memberEmail);
		mav.setViewName("userCouponManage");
		return mav;
	}
}
