package project.spring.web.login;

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
public class LoginController {
	
	@Autowired
	MemberService memberService;
	
	@RequestMapping("/login.do")
	public ModelAndView loginDo(ModelAndView mav, HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("member");
		session.removeAttribute("memberType");
		mav.setViewName("login");
		return mav;
	}
	
	@RequestMapping("/googleLogin.do")
	public ModelAndView googleLoginDo(MemberVO vo, HttpServletRequest request, ModelAndView mav) {
		System.out.println("googleLoginDo 실행");
		HttpSession session = request.getSession();
		int emailCheck = memberService.checkEmail(vo);
		if(emailCheck == 1) {
			session.removeAttribute("member");
			session.setAttribute("member", memberService.getMember(vo));
			mav.setViewName("index");
		}else {
			session.removeAttribute("member");
			session.setAttribute("member", vo);
			mav.addObject("memberType", "g");
			mav.setViewName("signupWrite");
		}
		return mav;
	}
	
	@RequestMapping("/kakaoLogin.do")
	public ModelAndView kakaoLoginDo(ModelAndView mav) {
		System.out.println("kakaoLoginDo 실행");
		mav.setViewName("kakaoLogin");
		return mav;
	}
	
	@RequestMapping("/kakaoData.do")
	public ModelAndView kakaoDataDo(MemberVO vo, HttpServletRequest request, ModelAndView mav) {
		System.out.println("kakaoDataDo 실행");
		HttpSession session = request.getSession();
		int emailCheck = memberService.checkEmail(vo);
		if(emailCheck == 1) {
			session.removeAttribute("member");
			session.setAttribute("member", memberService.getMember(vo));
			mav.setViewName("index");
		}else {
			mav.addObject("memberType", "k");
			session.removeAttribute("member");
			session.setAttribute("member", vo);
			mav.setViewName("signupWrite");
		}
//		String string = "1993-07-12";
//        LocalDate date = LocalDate.parse(string, DateTimeFormatter.ISO_DATE);
//		vo.setBirthday(date);
//		System.out.println(vo.getBirthday());
		return mav;
	}
	
	@RequestMapping(value = "/emailLoginCheck1.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String emailLoginCheck1Do(ModelAndView mav, MemberVO vo) {
		String pattern = "(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])";
		int emailCheck = memberService.checkEmail(vo);
		if(!Pattern.matches(pattern, vo.getEmail())) {
			return "-1";
		}else if(vo.getPassword() == "") {
			return "-2";
		}else if(emailCheck == 0) {
			return "0";
		}else {
			MemberVO vo1 = memberService.getMember(vo);
			if(vo1.getMemberType().equals("k")) {
				return "1";
			}else if(vo1.getMemberType().equals("g")) {
				return "2";
			}else if(memberService.passwordCheck(vo) == 0){
				return "0";
			}else {
				return "3";
			}
		}
	}
	
	@RequestMapping("/emailLoginCheck2.do")
	public ModelAndView emailLoginCheck2Do(ModelAndView mav, MemberVO vo, String check) {
		mav.addObject("check", check);
		mav.setViewName("emailLoginCheck");
		return mav;
	}
	
	@RequestMapping("/loginEmailCheck.do")
	public ModelAndView loginEmailCheckDo(ModelAndView mav, MemberVO vo) {
		mav.setViewName("loginEmailCheck");
		return mav;
	}
	
	@RequestMapping("/loginSuccess.do")
	public ModelAndView loginSuccessDo(HttpServletRequest request, ModelAndView mav, MemberVO vo) {
		HttpSession session = request.getSession();
		MemberVO vo1 = memberService.getMember(vo);
		session.setAttribute("member", vo1);
		mav.setViewName("index");
		return mav;
	}
	
	@RequestMapping("/firstEvent01.do")
	public ModelAndView firstEvent01Do(ModelAndView mav) {
		mav.setViewName("firstEvent");
		return mav;
	}
}
