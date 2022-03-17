package project.spring.web.signup;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import project.spring.web.member.MemberService;
import project.spring.web.member.MemberVO;

@Controller
public class SignUpController {
	
	@Autowired
	MemberService memberService;
	
	@RequestMapping("/signup.do")
	public ModelAndView signUpDo(ModelAndView mav, HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("memberType");
		session.removeAttribute("member");
		mav.setViewName("signup");
		return mav;
	}
	
	@RequestMapping("/signupWrite.do")
	public ModelAndView signupWriteDo(ModelAndView mav, HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("member");
		mav.addObject("memberType", "e");
		mav.setViewName("signupWrite");
		return mav;
	}
	
	@RequestMapping("/emailCheck.do")
	public ModelAndView emailCheckDo(ModelAndView mav, MemberVO vo) {
		String pattern = "(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])";
		
		int check = memberService.checkEmail(vo);
		if(check >= 1) {
			MemberVO vo1 = memberService.getMember(vo);
			if(vo1.getMemberType().equals("k")) {
				mav.addObject("check", 2);
			}else if(vo1.getMemberType().equals("g")) {
				mav.addObject("check", 3);
			}else {
				mav.addObject("check", 4);
			}
		}else if(Pattern.matches(pattern, vo.getEmail())) {
			mav.addObject("check", 1);
		} else {
			mav.addObject("check", 0);
		}
		mav.setViewName("emailCheck");
		return mav;
	}
	
	@RequestMapping(value = "/phoneBeforeCheck.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String phoneBeforeCheckDo(MemberVO vo) {
		String regExp = "^01(?:0|1|[6-9])(\\d{3}|\\d{4})(\\d{4})$";
		int check = memberService.checkPhone(vo);
		if(check >= 1) return "0";
		else if(vo.getPhone().matches(regExp) == true) return "1";
		else return "0";
	}
	
	@RequestMapping("/phoneCheckFail.do")
	public ModelAndView phoneCheckFailDo(ModelAndView mav, MemberVO vo) {
		MemberVO vo1 = memberService.getMemberPhone(vo);
		if(vo1 == null) {
			mav.addObject("check", 0);
		}else if(vo1.getMemberType().equals("k")) {
			mav.addObject("check", 1);
		}else if(vo1.getMemberType().equals("g")) {
			mav.addObject("check", 2);
		}else {
			mav.addObject("check", 3);
		}
		mav.setViewName("phoneCheckFail");
		return mav;
	}
	
	@RequestMapping("/phoneCheck.do")
	public ModelAndView phoneCheckDo(ModelAndView mav, String phone) {
		mav.addObject("phone", phone);
		mav.setViewName("phoneCheck");
		return mav;
	}
	
	@RequestMapping("/checkBox.do")
	public ModelAndView checkBoxDo(ModelAndView mav) {
		mav.setViewName("checkBox");
		return mav;
	}
	
	@RequestMapping("/detailModal01.do")
	public ModelAndView detailModal01Do(ModelAndView mav) {
		mav.setViewName("detailModal01");
		return mav;
	}
	
	@RequestMapping("/detailModal02.do")
	public ModelAndView detailModal02Do(ModelAndView mav) {
		mav.setViewName("detailModal02");
		return mav;
	}
	
	@RequestMapping(value = "/certificationCheck.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String certificationCheckDo(HttpServletRequest request, String certification) {
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO)session.getAttribute("member");
		int certificationNum = Integer.parseInt(certification);
		
		if(certificationNum == vo.getSmsCheck()) return "1";
		else return "0";
	}
	
	@RequestMapping("/emailFinalCheck.do")
	public ModelAndView emailFinalCheckDo(ModelAndView mav, String email) {
		String pattern = "(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])";
		System.out.println(email);
		if(Pattern.matches(pattern, email)) {
			mav.addObject("check", 1);
		} else {
			mav.addObject("check", 0);
		}
		mav.setViewName("emailFinalCheck");
		return mav;
	}
	
	@RequestMapping("/passwordFinalCheck.do")
	public ModelAndView passwordFinalCheckDo(ModelAndView mav) {
		mav.setViewName("passwordFinalCheck");
		return mav;
	}
	
	@RequestMapping("/passwordReFinalCheck.do")
	public ModelAndView passwordReFinalCheckDo(ModelAndView mav) {
		mav.setViewName("passwordReFinalCheck");
		return mav;
	}
	
	@RequestMapping("/nameFinalCheck.do")
	public ModelAndView nameFinalCheckDo(ModelAndView mav, String nameCheck) {
		System.out.println(nameCheck);
		mav.addObject("nameCheck", nameCheck);
		mav.setViewName("nameFinalCheck");
		return mav;
	}
	
	@RequestMapping("/phoneFirstCheck.do")
	public ModelAndView phoneFirstCheckDo(ModelAndView mav) {
		mav.setViewName("phoneFirstCheck");
		return mav;
	}
	
	@RequestMapping("/phoneLastCheck.do")
	public ModelAndView phoneLastCheckDo(ModelAndView mav) {
		mav.setViewName("phoneLastCheck");
		return mav;
	}
	
	@RequestMapping("/termsCheck.do")
	public ModelAndView termsCheckDo(ModelAndView mav) {
		mav.setViewName("termsCheck");
		return mav;
	}
	
	@RequestMapping("/signupSuccess.do")
	public ModelAndView signupSuccessDo(ModelAndView mav, MemberVO vo, HttpServletRequest request) {
		HttpSession session = request.getSession();
		System.out.println("signupSuccessDo() 메서드 실행");
		if(vo.getBirthdayTmp().equals("0000-00-00")) {
			vo.setBirthday(null);
		}else {
			String string = vo.getBirthdayTmp();
	        vo.setBirthday(LocalDate.parse(string, DateTimeFormatter.ISO_DATE));
		}
		memberService.insertMember(vo);
		session.setAttribute("member", memberService.getMember(vo));
		mav.setViewName("signupSuccess");
		return mav;
	}
}
