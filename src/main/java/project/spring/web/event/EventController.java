package project.spring.web.event;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import project.spring.web.member.MemberService;
import project.spring.web.member.MemberVO;

@Controller
public class EventController {
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	EventService eventService;
	
	@RequestMapping("event.do")
	public ModelAndView eventDo(ModelAndView mav) {
		mav.setViewName("event");
		return mav;
	}
	
	@RequestMapping("firstEvent.do")
	public ModelAndView firstEventDo(ModelAndView mav, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("member");
		if(mvo != null) {
			int memCode = mvo.getMemberCode();
			CouponVO cvo = new CouponVO();
			cvo.setUser_code(memCode);
			mav.addObject("userCode", memCode);
		}
		mav.setViewName("firstEvent");
		return mav;
	}
	
	@RequestMapping("secondEvent.do")
	public ModelAndView secondEventDo(ModelAndView mav) {
		mav.setViewName("secondEvent");
		return mav;
	}
	
	@RequestMapping("fourthEvent.do")
	public ModelAndView fourthEventDo(ModelAndView mav) {
		mav.setViewName("fourthEvent");
		return mav;
	}
	
	@RequestMapping("fifthEvent.do")
	public ModelAndView fifthEventDo(ModelAndView mav) {
		mav.setViewName("fifthEvent");
		return mav;
	}
	//신규가입쿠폰팩 한번에 받기 눌렀을때 실행되는 메서드
	@RequestMapping("coupon01.do")
	public ModelAndView coupon01Do(ModelAndView mav, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("member");
		int memCode = mvo.getMemberCode();
		CouponVO cvo = new CouponVO();
		cvo.setCoupon_pack(100);
		
		List<CouponVO> coupon = eventService.getCouponPack(cvo);
		//getCouponPack : SELECT * FROM coupon WHERE coupon_pack = #{coupon_pack}
		CouponVO cvo2 = new CouponVO();
		cvo2.setUser_code(memCode);
		List<CouponVO> userCoupon = eventService.getCoupon(cvo2);
		//getCoupon : SELECT * FROM user_coupon WHERE user_code = #{user_code}
		
		List<Integer> couponCode = new ArrayList<Integer>();
		for(int i = 0; i < userCoupon.size(); i++) {
			couponCode.add(userCoupon.get(i).getCoupon_code());
		}
		List<Integer> couponPack100 = new ArrayList<Integer>();
		couponPack100.add(1);couponPack100.add(2);couponPack100.add(3);couponPack100.add(4);
		couponPack100.add(5);couponPack100.add(6);
		if(couponCode.containsAll(couponPack100)) {
			mav.setViewName("downloadCouponModal");
		}else {
			List<CouponVO> addUserCoupon = new ArrayList<CouponVO>();
			for(int i = 0; i < coupon.size(); i++){
				int check = 0;
				for(int j = 0; j < userCoupon.size(); j++){
					if(coupon.get(i).getCoupon_code() != userCoupon.get(j).getCoupon_code()) {
						check++;
					};					
				};
				if(check == userCoupon.size()) {
					CouponVO vo1 = new CouponVO();
					vo1.setUser_code(memCode);
					vo1.setCoupon_code(coupon.get(i).getCoupon_code());
					addUserCoupon.add(vo1);
				};
			};	
			for(int i = 0; i < addUserCoupon.size(); i++){
				CouponVO vo = addUserCoupon.get(i);
				eventService.insertCoupon(vo);
			};		
			mav.setViewName("couponAvailable");		
		}
		return mav;
	}
	
	//모든쿠폰 낱개로 눌렀을때 실행되는 메서드
	@RequestMapping(value = "coupon02.do", method = RequestMethod.POST)
	public ModelAndView coupon02Do(ModelAndView mav, HttpServletRequest request) {
		CouponVO cvo = new CouponVO();
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("member");
		int memCode = mvo.getMemberCode();
		String b = request.getParameter("coupon_code");
		int coupon_code = Integer.parseInt(b);
		System.out.println(memCode);
		System.out.println(coupon_code);
		cvo.setUser_code(memCode);
		
		List<CouponVO> coupon = eventService.getCoupon(cvo);
		//getCoupon : SELECT * FROM user_coupon WHERE user_code = #{user_code}
		
		if(coupon.isEmpty()) {
			CouponVO cvo2 = new CouponVO();
			cvo2.setCoupon_code(coupon_code);
			cvo2.setUser_code(memCode);
			eventService.insertCoupon(cvo2);
			mav.setViewName("couponAvailable");
		} else {
			List<Integer> couponCode = new ArrayList<Integer>();
			for(int i = 0; i < coupon.size(); i++) {
				couponCode.add(coupon.get(i).getCoupon_code());
			}
			if(couponCode.contains(coupon_code)) {
				mav.setViewName("downloadCouponModal");
			} else {
				CouponVO cvo2 = new CouponVO();
				cvo2.setCoupon_code(coupon_code);
				cvo2.setUser_code(memCode);
				eventService.insertCoupon(cvo2);
				mav.setViewName("couponAvailable");
			}
		}
		
		return mav;
	}
	//1만원 쿠폰팩 모두받기 버튼 눌렀을때 실행되는 메서드
	@RequestMapping("coupon04.do")
	public ModelAndView coupon04Do(ModelAndView mav, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("member");
		int memCode = mvo.getMemberCode();
		CouponVO cvo = new CouponVO();
		cvo.setCoupon_pack(200);
		
		List<CouponVO> coupon = eventService.getCouponPack(cvo);
		//getCouponPack : SELECT * FROM coupon WHERE coupon_pack = #{coupon_pack}
		CouponVO cvo2 = new CouponVO();
		cvo2.setUser_code(memCode);
		List<CouponVO> userCoupon = eventService.getCoupon(cvo2);
		//getCoupon : SELECT * FROM user_coupon WHERE user_code = #{user_code}
		List<Integer> couponCode = new ArrayList<Integer>();
		for(int i = 0; i < userCoupon.size(); i++) {
			couponCode.add(userCoupon.get(i).getCoupon_code());
		}
		List<Integer> couponPack100 = new ArrayList<Integer>();
		couponPack100.add(7);couponPack100.add(8);couponPack100.add(9);couponPack100.add(10);
		if(couponCode.containsAll(couponPack100)) {
			mav.setViewName("downloadCouponModal");
		}else {
			List<CouponVO> addUserCoupon = new ArrayList<CouponVO>();
			for(int i = 0; i < coupon.size(); i++){
				int check = 0;
				for(int j = 0; j < userCoupon.size(); j++){
					if(coupon.get(i).getCoupon_code() != userCoupon.get(j).getCoupon_code()) {
						check++;
					};					
				};
				if(check == userCoupon.size()) {
					CouponVO vo1 = new CouponVO();
					vo1.setUser_code(memCode);
					vo1.setCoupon_code(coupon.get(i).getCoupon_code());
					addUserCoupon.add(vo1);
				};
			};	
			for(int i = 0; i < addUserCoupon.size(); i++){
				CouponVO vo = addUserCoupon.get(i);
				eventService.insertCoupon(vo);
			};		
			mav.setViewName("couponAvailable");		
		}
		return mav;
	}
	//배송방법별 쿠폰팩 낱개 클릭했을때 실행되는 메서드
	@RequestMapping(value = "coupon05.do", method = RequestMethod.POST)
	public ModelAndView coupon05Do(ModelAndView mav, HttpServletRequest request) {
		CouponVO cvo = new CouponVO();
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("member");
		int memCode = mvo.getMemberCode();
		String b = request.getParameter("coupon_code");
		int coupon_code = Integer.parseInt(b);
		System.out.println(memCode);
		System.out.println(coupon_code);
		cvo.setUser_code(memCode);
		
		List<CouponVO> coupon = eventService.getCoupon(cvo);
		//getCoupon : SELECT * FROM user_coupon WHERE user_code = #{user_code}
		
		if(coupon.isEmpty()) {
			CouponVO cvo2 = new CouponVO();
			cvo2.setCoupon_code(coupon_code);
			cvo2.setUser_code(memCode);
			eventService.insertCoupon(cvo2);
			mav.setViewName("couponAvailable");
		} else {
			List<Integer> couponCode = new ArrayList<Integer>();
			for(int i = 0; i < coupon.size(); i++) {
				couponCode.add(coupon.get(i).getCoupon_code());
			}
			if(couponCode.contains(coupon_code)) {
				mav.setViewName("downloadCouponModal");
			} else {
				CouponVO cvo2 = new CouponVO();
				cvo2.setCoupon_code(coupon_code);
				cvo2.setUser_code(memCode);
				eventService.insertCoupon(cvo2);
				mav.setViewName("couponAvailable");
			}
		}
		return mav;
	}
	//배송방법별 쿠폰팩 모두받기 클릭했을 때 실행되는 메서드
	@RequestMapping("coupon06.do")
	public ModelAndView coupon06Do(ModelAndView mav, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("member");
		int memCode = mvo.getMemberCode();
		CouponVO cvo = new CouponVO();
		cvo.setCoupon_pack(300);
		
		List<CouponVO> coupon = eventService.getCouponPack(cvo);
		//getCouponPack : SELECT * FROM coupon WHERE coupon_pack = #{coupon_pack}
		CouponVO cvo2 = new CouponVO();
		cvo2.setUser_code(memCode);
		List<CouponVO> userCoupon = eventService.getCoupon(cvo2);
		//getCoupon : SELECT * FROM user_coupon WHERE user_code = #{user_code}
		List<Integer> couponCode = new ArrayList<Integer>();
		for(int i = 0; i < userCoupon.size(); i++) {
			couponCode.add(userCoupon.get(i).getCoupon_code());
		}
		List<Integer> couponPack300 = new ArrayList<Integer>();
		couponPack300.add(11);couponPack300.add(12);
		if(couponCode.containsAll(couponPack300)) {
			mav.setViewName("downloadCouponModal");
		}else {
			List<CouponVO> addUserCoupon = new ArrayList<CouponVO>();
			for(int i = 0; i < coupon.size(); i++){
				int check = 0;
				for(int j = 0; j < userCoupon.size(); j++){
					if(coupon.get(i).getCoupon_code() != userCoupon.get(j).getCoupon_code()) {
						check++;
					};					
				};
				if(check == userCoupon.size()) {
					CouponVO vo1 = new CouponVO();
					vo1.setUser_code(memCode);
					vo1.setCoupon_code(coupon.get(i).getCoupon_code());
					addUserCoupon.add(vo1);
				};
			};	
			for(int i = 0; i < addUserCoupon.size(); i++){
				CouponVO vo = addUserCoupon.get(i);
				eventService.insertCoupon(vo);
			};		
			mav.setViewName("couponAvailable");		
		}
		return mav;
	}
	//쿠폰 조회 페이지에서 정기구독 할인 쿠폰 등록 눌렀을 때!
	@RequestMapping("subscribeCoupon.do")
	public ModelAndView subscribeCouponDo(ModelAndView mav, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("member");
		int memCode = mvo.getMemberCode();
		CouponVO cvo = new CouponVO();
		cvo.setUser_code(memCode);
		
		String couponName = request.getParameter("couponName");
		System.out.println("쿠폰이름 : "+couponName);
		String salad = "신선하게샐러드구독";
		
		if(couponName.equals(salad)) {
			List<CouponVO> userCoupon = eventService.getCoupon(cvo);
			//getCoupon : SELECT * FROM user_coupon WHERE user_code = #{user_code}
			List<Integer> couponCode = new ArrayList<Integer>();
			for(int i = 0; i < userCoupon.size(); i++) {
				couponCode.add(userCoupon.get(i).getCoupon_code());
			}
			if(couponCode.contains(13)) {
				mav.setViewName("downloadCouponModal");
			} else {
				CouponVO cvo2 = new CouponVO();
				cvo2.setCoupon_code(13);
				cvo2.setUser_code(memCode);
				eventService.insertCoupon(cvo2);
				mav.setViewName("couponAvailable");
			}
		}else {
			mav.setViewName("couponCodeConfirm");
		}
		return mav;
	}
}
