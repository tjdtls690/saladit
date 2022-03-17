package project.spring.web.member_zipcode;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import project.spring.web.member.MemberVO;

@Controller
public class MemberZipcodeConrtoller {
	
	@Autowired
	MemberZipcodeService memberZipcodeService;
	
	@RequestMapping(value = "/memberZipcodeRegistration.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String memberZipcodeRegistrationDo(HttpServletRequest request, MemberZipcodeVO vo) {
		HttpSession session = request.getSession();
		MemberVO vo1 = (MemberVO)session.getAttribute("member");
		vo.setMember_code(vo1.getMemberCode());
		
		int check = memberZipcodeService.getZipcodeAmount(vo);
		if(check == 0) {
			vo.setMember_default_address("y");
			memberZipcodeService.insertZipcode(vo);
		}else {
			if(vo.getMember_default_address().equals("y")) {
				// 기본 배송지 설정을 했으면 for문 돌려서 기본설정인 주소지 찾아서 
				// 기본주소지 설정 없애고 새로운 기본 주소지 인설트
				List<MemberZipcodeVO> list1 = memberZipcodeService.getZipcodeAll(vo);
				int check1 = 0;
				for(int i = 0; i < list1.size(); i++) {
					if(list1.get(i).getMember_default_address().equals("y")) {
						list1.get(i).setMember_default_address("n");
						memberZipcodeService.updateZipcodeDefaultAddress(list1.get(i));
						memberZipcodeService.insertZipcode(vo);
						check1++;
						break;
					}
				}
				if(check1 == 0) {
					memberZipcodeService.insertZipcode(vo);
				}
			}else {
				memberZipcodeService.insertZipcode(vo);
			}
		}
		return null;
	}
}
