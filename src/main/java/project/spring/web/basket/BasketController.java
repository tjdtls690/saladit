package project.spring.web.basket;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import project.spring.web.member.MemberVO;

@Controller
public class BasketController {
	
	@Autowired
	private BasketService basketService;
	
	@RequestMapping("/basket.do")
	public ModelAndView basketDo(HttpServletRequest request, ModelAndView mav) {
		
		HttpSession session = request.getSession();
		MemberVO vo3 = (MemberVO)session.getAttribute("member");
		if(vo3 == null) {
			mav.setViewName("login");
		}else {
			MemberVO vo = (MemberVO)session.getAttribute("member");
			int userCode = vo.getMemberCode();
			
			BasketVO vo2 = new BasketVO();
			vo2.setUserCode(userCode);
			List<BasketVO> BasketList = basketService.getBasketList(vo2);
			mav.addObject("Basket", BasketList);
			mav.setViewName("basket");
		}
		return mav;
	}	
	
	@RequestMapping("/deskMinus.do")
	@ResponseBody
	public ModelAndView deskMinus(HttpServletRequest request, ModelAndView mav) {
		String temp = request.getParameter("amt");
		int amt = Integer.parseInt(temp)- 1;
		System.out.println("amt의 값 :" + amt);
		
		String str = request.getParameter("price");
		int price = Integer.parseInt(str);
		int subtotal = amt * price;
		
		String str2 = request.getParameter("itemCode");
		int itemCode = Integer.parseInt(str2);
		System.out.println("itemCode : " + itemCode);
		
		String str3 = request.getParameter("memberCode");
		int userCode = Integer.parseInt(str3);
		System.out.println("userCode : " + userCode);
		
		BasketVO vo = new BasketVO();
		vo.setAmount(amt);
		vo.setUserCode(userCode);
		vo.setItemCode(itemCode);
		vo.setSubTotal(subtotal);
		basketService.getBasketChangeList(vo);
		
		List<BasketVO> basketChangeList = basketService.getBasketList(vo);
		System.out.println(basketChangeList.get(0).getItemName());
		
		mav.addObject("Basket",basketChangeList);
		mav.setViewName("basketDesk");
		return mav;
	}
	
	@RequestMapping("/deskPlus.do")
	@ResponseBody
	public ModelAndView deskPlus(HttpServletRequest request, ModelAndView mav) {
		String temp = request.getParameter("amt");
		int amt = Integer.parseInt(temp) + 1;
		System.out.println("amt의 값 :" + amt);
		
		String str = request.getParameter("price");
		int price = Integer.parseInt(str);
		int subtotal = amt * price;
		
		String str2 = request.getParameter("itemCode");
		int itemCode = Integer.parseInt(str2);
		System.out.println("itemCode : " + itemCode);
		
		String str3 = request.getParameter("memberCode");
		int userCode = Integer.parseInt(str3);
		System.out.println("userCode : " + userCode);
		
		BasketVO vo = new BasketVO();
		vo.setAmount(amt);
		vo.setUserCode(userCode);
		vo.setItemCode(itemCode);
		vo.setSubTotal(subtotal);
		basketService.getBasketChangeList(vo);
		
		List<BasketVO> basketChangeList = basketService.getBasketList(vo);
		
		mav.addObject("Basket",basketChangeList);
		mav.setViewName("basketDesk");
		return mav;
	}
	
	@RequestMapping("/mobileMinus.do")
	@ResponseBody
	public ModelAndView mobileMinus(HttpServletRequest request, ModelAndView mav) {
		String temp = request.getParameter("amt");
		int amt = Integer.parseInt(temp)- 1;
		System.out.println("amt의 값 :" + amt);
		
		String str = request.getParameter("price");
		int price = Integer.parseInt(str);
		int subtotal = amt * price;
		
		String str2 = request.getParameter("itemCode");
		int itemCode = Integer.parseInt(str2);
		System.out.println("itemCode : " + itemCode);
		
		String str3 = request.getParameter("memberCode");
		int userCode = Integer.parseInt(str3);
		System.out.println("userCode : " + userCode);
		
		BasketVO vo = new BasketVO();
		vo.setAmount(amt);
		vo.setUserCode(userCode);
		vo.setItemCode(itemCode);
		vo.setSubTotal(subtotal);
		basketService.getBasketChangeList(vo);
		
		List<BasketVO> basketChangeList = basketService.getBasketList(vo);
		System.out.println(basketChangeList.get(0).getItemName());
		
		mav.addObject("Basket",basketChangeList);
		mav.setViewName("basketMobile");
		return mav;
	}
	
	@RequestMapping("/mobilePlus.do")
	@ResponseBody
	public ModelAndView mobilePlus(HttpServletRequest request, ModelAndView mav) {
		String temp = request.getParameter("amt");
		int amt = Integer.parseInt(temp) + 1;
		System.out.println("amt의 값 :" + amt);
		
		String str = request.getParameter("price");
		int price = Integer.parseInt(str);
		int subtotal = amt * price;
		
		String str2 = request.getParameter("itemCode");
		int itemCode = Integer.parseInt(str2);
		System.out.println("itemCode : " + itemCode);
		
		String str3 = request.getParameter("memberCode");
		int userCode = Integer.parseInt(str3);
		System.out.println("userCode : " + userCode);

		
		BasketVO vo = new BasketVO();
		vo.setAmount(amt);
		vo.setUserCode(userCode);
		vo.setItemCode(itemCode);
		vo.setSubTotal(subtotal);
		basketService.getBasketChangeList(vo);
		
		List<BasketVO> basketChangeList = basketService.getBasketList(vo);
		System.out.println(basketChangeList.get(0).getItemName());
		
		mav.addObject("Basket",basketChangeList);
		mav.setViewName("basketMobile");
		return mav;
	}

	@RequestMapping("/basketSelectDelete.do")
	public ModelAndView basketSelectDelete(HttpServletRequest request, ModelAndView mav, String[] newDeleteItemCode, String[] newDeleteItemSize) {
		
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO)session.getAttribute("member");
		int userCode = mvo.getMemberCode();
		
		List<String> list1 = new ArrayList<>();
		List<String> list2 = new ArrayList<>();
		
		for(int i=0; i < newDeleteItemCode.length; i++) {
			System.out.println(newDeleteItemCode[i]);
			BasketVO vo = new BasketVO();
			list1.add(newDeleteItemCode[i]);
			int f = Integer.parseInt(list1.get(i));
			list2.add(newDeleteItemSize[i]);
			String s = list2.get(i);
			vo.setUserCode(userCode);
			vo.setItemCode(f);
			vo.setItemSize(s);
			basketService.deleteBasketList(vo);
		}

		BasketVO vo2 = new BasketVO();
		vo2.setUserCode(userCode);
		List<BasketVO> BasketList = basketService.getBasketList(vo2);
		mav.addObject("Basket", BasketList);
		mav.setViewName("basket");
		return mav;
	}
	


}
