package project.spring.web.order;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import project.spring.web.detail.DetailService;
import project.spring.web.detail.DetailVO;
import project.spring.web.member.MemberVO;
import project.spring.web.member_zipcode.MemberZipcodeService;
import project.spring.web.member_zipcode.MemberZipcodeVO;

@Controller
public class OrderController {
	
	@Autowired
	OrderService orderService;
	@Autowired
	MemberZipcodeService memberZipcodeService;
	@Autowired
	DetailService detailService;
	
	@RequestMapping("/order.do")
	public ModelAndView orderDo(ModelAndView mav, HttpServletRequest request, String[] orderTagMain, String[] orderItemCode
			, String[] orderQuantity, String[] orderItemSizeSummary) {
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO)session.getAttribute("member");
		if(vo == null) {
			mav.setViewName("login");
		}else {
			MemberZipcodeVO tmp = new MemberZipcodeVO();
			tmp.setMember_code(vo.getMemberCode());
			tmp.setMember_delivery_type(0);
			List<MemberZipcodeVO> list = memberZipcodeService.getZipcodeAll(tmp);
			List<String> orderItemSize = new ArrayList<String>();
			List<DetailVO> orderItem = new ArrayList<DetailVO>();
			List<String> orderItemSizePrice = new ArrayList<String>();
			List<String> orderItemSizePriceSub = new ArrayList<String>();
			int realQuantity = 0;
			int realPrice = 0;
			int realPriceSub = 0;
			int oldPrice = 0;
			
			if(orderItemSizeSummary != null) {
				for(int i = 0; i < orderItemSizeSummary.length; i++) {
					DetailVO tmpVO = new DetailVO();
					tmpVO.setItem_code(Integer.parseInt(orderItemCode[i]));
					if(orderTagMain[i].equals("100") || orderTagMain[i].equals("600")) {
						orderItem.add(detailService.getSubItem(tmpVO));
					}else {
						orderItem.add(detailService.getItem(tmpVO));
					}
					System.out.println("장바구니에서 넘어온 아이템 코드 " + i + "번째 : " + orderItemCode[i]);
					System.out.println("장바구니에서 넘어온 아이템 수량 " + i + "번째 : " + orderQuantity[i]);
					System.out.println("장바구니에서 넘어온 아이템 사이즈 요약 " + i + "번째 : " + orderItemSizeSummary[i]);
				}
				
				for(int i = 0; i < orderItemSizeSummary.length; i++) {
					if(orderItemSizeSummary[i].equals("m")){
						orderItemSizePrice.add(orderItem.get(i).getItem_price_m().replace(",", ""));
						orderItemSizePriceSub.add(orderItem.get(i).getItem_price_m_sub().replace(",", ""));
					}else {
						orderItemSizePrice.add(orderItem.get(i).getItem_price_l().replace(",", ""));
						orderItemSizePriceSub.add(orderItem.get(i).getItem_price_l_sub().replace(",", ""));
					}
				}
				
				for(int i = 0; i < orderItemSizePriceSub.size(); i++) {
				}
				
				
				for(int i = 0; i < orderItemSizeSummary.length; i++) {
					if(orderTagMain[i].equals("400") || orderTagMain[i].equals("700") || orderTagMain[i].equals("800")) {
						if(orderItemSizeSummary[i].equals("m")) {
							orderItemSize.add("1개");
						}else {
							orderItemSize.add("1묶음");
						}
					}else {
						if(orderItemSizeSummary[i].equals("m")) {
							orderItemSize.add("미디움 (M)");
						}else {
							orderItemSize.add("라지 (L)");
						}
					}
					realQuantity += Integer.parseInt(orderQuantity[i]);
					realPrice += ((Integer.parseInt(orderItemSizePrice.get(i)) * Integer.parseInt(orderQuantity[i])) + Integer.parseInt(orderQuantity[i]) * 100);
					
					if(!orderItemSizePriceSub.get(i).equals("")) {
						realPriceSub += ((Integer.parseInt(orderItemSizePriceSub.get(i)) * Integer.parseInt(orderQuantity[i])) - (Integer.parseInt(orderItemSizePrice.get(i)) * Integer.parseInt(orderQuantity[i])));
					}
					oldPrice += Integer.parseInt(orderItemSizePrice.get(i));
				}
			}
			
			
			mav.addObject("oldPrice", oldPrice);
			mav.addObject("realPrice", realPrice);
			mav.addObject("realPriceSub", realPriceSub);
			mav.addObject("realQuantity", realQuantity);
			mav.addObject("orderItem", orderItem);
			mav.addObject("orderItemSizePriceSub", orderItemSizePriceSub);
			mav.addObject("orderItemSizePrice", orderItemSizePrice);
			mav.addObject("orderTagMain", orderTagMain);
			mav.addObject("orderItemCode", orderItemCode);
			mav.addObject("orderQuantity", orderQuantity);
			mav.addObject("orderItemSize", orderItemSize);
			mav.addObject("orderItemSizeSummary", orderItemSizeSummary);
			mav.addObject("list", list);
			mav.setViewName("order");
		}
		return mav;
	}
	
	@RequestMapping("/orderModal.do")
	public ModelAndView orderModalDo(ModelAndView mav, DetailVO vo) {
		mav.addObject("itemInfo", orderService.getitemInfo(vo));
		mav.setViewName("orderModal");
		return mav;
	}
	
	@RequestMapping("/orderShippingAddressExplainModal.do")
	public ModelAndView orderShippingAddressExplainModalDo(ModelAndView mav) {
		mav.setViewName("orderShippingAddressExplainModal");
		return mav;
	}
	
	@RequestMapping("/orderModalAjax.do")
	public ModelAndView orderModalAjaxDo(ModelAndView mav, DetailVO vo) {
		mav.addObject("itemInfo", orderService.getitemInfo(vo));
		mav.setViewName("orderModalAjax");
		return mav;
	}
	
	@RequestMapping("/orderDropDown.do")
	public ModelAndView orderDropDownDo(ModelAndView mav, DetailVO vo) {
		DetailVO vo1 = orderService.getitemInfoOne(vo);
		mav.addObject("item", vo1);
		mav.setViewName("orderDropDown");
		return mav;
	}
	
	@RequestMapping("/orderSaveTmp.do")
	public ModelAndView orderSaveTmpDo(ModelAndView mav, DetailVO vo, String itemSize, String itemPrice, String itemSizeSummary
				, String itemPriceSub) {
		
		mav.addObject("itemSizeSummary", itemSizeSummary);
		mav.addObject("itemPrice", itemPrice);
		mav.addObject("itemSize", itemSize);
		mav.addObject("itemPriceSub", itemPriceSub);
		mav.addObject("itemInfo", vo);
		mav.setViewName("orderSaveTmp");
		return mav;
	}
	
	@RequestMapping(value = "/calculate.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String calculateDo(DetailVO vo, String latelyPrice, String price) {
		
		int price1 = Integer.parseInt(price.replace(",", ""));
		int oldPrice1 = Integer.parseInt(latelyPrice);
		vo.setItem_price_m(price1 + oldPrice1);
		return vo.getItem_price_m();
	}
	
	@RequestMapping("/orderSaveSuccess.do")
	public ModelAndView orderSaveSuccessDo(ModelAndView mav) {
		mav.setViewName("orderSaveSuccess");
		return mav;
	}
	
	@RequestMapping("/orderSaveFail.do")
	public ModelAndView orderSaveFailDo(ModelAndView mav) {
		mav.setViewName("orderSaveFail");
		return mav;
	}
	
	@RequestMapping("/confirmIconChange1.do")
	public ModelAndView confirmIconChange1Do(ModelAndView mav) {
		mav.setViewName("confirmIconChange1");
		return mav;
	}
	
	@RequestMapping("/confirmIconChange2.do")
	public ModelAndView confirmIconChange2Do(ModelAndView mav) {
		mav.setViewName("confirmIconChange2");
		return mav;
	}
	
	@RequestMapping("/orderHiddenSavePresentation.do")
	public ModelAndView orderHiddenSavePresentationDo(ModelAndView mav, String[] saveItemCode, String[] saveTagMain, String[] savePrice
			, String[] saveItemName, String[] saveItemSize, String[] saveitemSizeSummary, String[] saveitemQuantity, String[] savePriceSub
			, String[] saveDisposable) {
		mav.addObject("saveItemCode", saveItemCode);
		mav.addObject("saveTagMain", saveTagMain);
		mav.addObject("savePrice", savePrice);
		mav.addObject("savePriceSub", savePriceSub);
		mav.addObject("saveItemName", saveItemName);
		mav.addObject("saveItemSize", saveItemSize);
		mav.addObject("saveitemSizeSummary", saveitemSizeSummary);
		mav.addObject("saveitemQuantity", saveitemQuantity);
		mav.addObject("saveDisposable", saveDisposable);
		mav.setViewName("orderHiddenSavePresentation");
		return mav;
	}
	
	@RequestMapping("/orderSaveComplete.do")
	public ModelAndView orderSaveCompleteDo(ModelAndView mav, String[] saveItemCode, String[] saveTagMain, String[] savePrice
			, String[] saveItemName, String[] saveItemSize, String[] saveitemSizeSummary, String[] saveitemQuantity, String[] savePriceSub
			, String[] saveDisposable) {
		
		mav.addObject("saveItemCode", saveItemCode);
		mav.addObject("saveTagMain", saveTagMain);
		mav.addObject("savePrice", savePrice);
		mav.addObject("savePriceSub", savePriceSub);
		mav.addObject("saveItemName", saveItemName);
		mav.addObject("saveItemSize", saveItemSize);
		mav.addObject("saveitemSizeSummary", saveitemSizeSummary);
		mav.addObject("saveitemQuantity", saveitemQuantity);
		mav.addObject("saveDisposable", saveDisposable);
		mav.setViewName("orderSaveComplete");
		return mav;
	}
	
	@RequestMapping("/orderMinPrice.do")
	public ModelAndView orderMinPriceDo(ModelAndView mav, String remainPrice) {
		mav.addObject("remainPrice", remainPrice);
		mav.setViewName("orderMinPrice");
		return mav;
	}
	
	@RequestMapping("/orderMinPriceDelivery.do")
	public ModelAndView orderMinPriceDeliveryDo(ModelAndView mav, String remainPrice) {
		mav.addObject("remainPrice", remainPrice);
		mav.setViewName("orderMinPriceDelivery");
		return mav;
	}
	
	@RequestMapping("/orderDeleteCheckModal.do")
	public ModelAndView orderDeleteCheckModalDo(ModelAndView mav) {
		mav.setViewName("orderDeleteCheckModal");
		return mav;
	}
	
	@RequestMapping("/orderAllDeleteCheckModal.do")
	public ModelAndView orderAllDeleteCheckModalDo(ModelAndView mav) {
		mav.setViewName("orderAllDeleteCheckModal");
		return mav;
	}
	
	@RequestMapping("/orderAllDeletePaging.do")
	public ModelAndView orderAllDeletePagingDo(ModelAndView mav) {
		mav.setViewName("orderAllDeletePaging");
		return mav;
	}
	
	@RequestMapping("/orderDateCalendar.do")
	public ModelAndView orderDateCalendarDo(ModelAndView mav, String year, String month, String day, String getDay) {
		System.out.println(Integer.parseInt(month));
		String[] dateNum;
		if(Integer.parseInt(month) == 1 || Integer.parseInt(month) == 3 || Integer.parseInt(month) == 5 || Integer.parseInt(month) == 7
				 || Integer.parseInt(month) == 8 || Integer.parseInt(month) == 10 || Integer.parseInt(month) == 12) {
			dateNum = new String[38];
		}else if(Integer.parseInt(month) == 2) {
			if(Integer.parseInt(year) % 4 == 0){
	            if(Integer.parseInt(year) % 400 != 0 && Integer.parseInt(year) % 100 == 0) {
	            	dateNum = new String[35];
	            }else {
	            	dateNum = new String[36];
	            }
	        }else {
	        	dateNum = new String[35];
	        }
		}else {
			dateNum = new String[37];
		}
		int getDayNum = Integer.parseInt(getDay);
		String[] getD = new String[getDayNum];
		int mon = Integer.parseInt(month);
		
		mav.addObject("remainSu", getDayNum);
		mav.addObject("remainCheck", getD);
		mav.addObject("year", year);
		mav.addObject("check", day);
		mav.addObject("month", mon);
		mav.addObject("list", dateNum);
		mav.setViewName("orderDateCalendar");
		return mav;
	}
	
	@RequestMapping("/orderSelectPopover.do")
	public ModelAndView orderSelectPopoverDo(ModelAndView mav, String year, String month, String currentCheckYear, String currentCheckMonth
			, String realCheck, String solidCheckYear, String solidCheckMonth) {
		String[] list = new String[12];
		int check = 0;
		if(Integer.parseInt(currentCheckYear) < Integer.parseInt(solidCheckYear)) {
			check = 1;
		}else if(Integer.parseInt(currentCheckYear) > Integer.parseInt(solidCheckYear)) {
			if(realCheck.equals("0")) {
				currentCheckMonth = "-1";
			}
			check = 2;
		}else {
			check = 3;
		}
		
		mav.addObject("solidCheckYear", solidCheckYear);
		mav.addObject("solidCheckMonth", solidCheckMonth);
		mav.addObject("check", check);
		mav.addObject("list", list);
		mav.addObject("month", currentCheckMonth);
		mav.addObject("year", currentCheckYear);
		mav.setViewName("orderSelectPopover");
		return mav;
	}
	
	@RequestMapping("/orderSelectPopover2.do")
	public ModelAndView orderSelectPopover2Do(ModelAndView mav, String year, String currentCheckYear, String solidCheckYear, String realCheck) {
		String[] list = new String[12];
		int currentYear = Integer.parseInt(currentCheckYear);
		currentYear -= currentYear % 12;
		int check = 0;
		if(Integer.parseInt(solidCheckYear) > currentYear && Integer.parseInt(solidCheckYear) < currentYear + 12) {
			check = 3;
		}else if(Integer.parseInt(solidCheckYear) < currentYear) {
			check = 2;
		}else {
			check = 1;
		}
		
		mav.addObject("check", check);
		mav.addObject("currentYear", currentYear);
		mav.addObject("solidCheckYear", solidCheckYear);
		mav.addObject("list", list);
		mav.addObject("year", currentCheckYear);
		mav.setViewName("orderSelectPopover2");
		return mav;
	}
	
	
	@RequestMapping("/orderZipCodeSelectModal.do")
	public ModelAndView orderZipCodeSelectModalDo(HttpServletRequest request, ModelAndView mav, MemberZipcodeVO vo) {
		// 여기에 해당 회원 고유코드에 매핑된 주소가 있으면 가져와서 리스트로 박기
		HttpSession session = request.getSession();
		MemberVO tmp = (MemberVO)session.getAttribute("member");
		vo.setMember_code(tmp.getMemberCode());
		
		List<MemberZipcodeVO> list = memberZipcodeService.getZipcodeAll(vo);
		mav.addObject("list", list);
		mav.setViewName("orderZipCodeSelectModal");
		return mav;
	}
	
	
	@RequestMapping("/orderZipCodeSelectModalDetail.do")
	public ModelAndView orderZipCodeSelectModalDetailDo(HttpServletRequest request, ModelAndView mav, MemberZipcodeVO vo) {
		// 여기에 해당 회원 고유코드에 매핑된 주소가 있으면 가져와서 리스트로 박기
		HttpSession session = request.getSession();
		MemberVO tmp = (MemberVO)session.getAttribute("member");
		vo.setMember_code(tmp.getMemberCode());
		
		List<MemberZipcodeVO> list = memberZipcodeService.getZipcodeAll(vo);
		mav.addObject("list", list);
		mav.setViewName("orderZipCodeSelectModalDetail");
		return mav;
	}
	
	
	@RequestMapping("/orderKakaoAddressContainer.do")
	public ModelAndView orderKakaoAddressContainerDo(ModelAndView mav) {
		mav.setViewName("orderKakaoAddressContainer");
		return mav;
	}
	
	
	@RequestMapping("/orderKakaoAddressSelectFinal.do")
	public ModelAndView orderKakaoAddressSelectFinalDo(ModelAndView mav, String addr, String zonecode) {
		
		mav.addObject("addr", addr);
		mav.addObject("zonecode", zonecode);
		mav.setViewName("orderKakaoAddressSelectFinal");
		return mav;
	}
	
	@RequestMapping("/orderBesongjiRegistrationCompleteCheckModal.do")
	public ModelAndView orderBesongjiRegistrationCompleteCheckModalDo(ModelAndView mav) {
		mav.setViewName("orderBesongjiRegistrationCompleteCheckModal");
		return mav;
	}
	
	@RequestMapping(value = "/orderDeliveryTypeCheck.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String orderDeliveryTypeCheckDo(String addr, String deliveryType) {
		if(deliveryType.equals("0")) {
			if(!addr.contains("서울") && !addr.contains("경기") && !addr.contains("인천")) {
				return "0";
			}
			return "1";
		}else {
			return "1";
		}
	}
	
	@RequestMapping("/orderMorningDeliveryExcept.do")
	public ModelAndView orderMorningDeliveryExceptDo(ModelAndView mav) {
		mav.setViewName("orderMorningDeliveryExcept");
		return mav;
	}
	
	@RequestMapping("/orderMorningBesongji.do")
	public ModelAndView orderMorningBesongjiDo(HttpServletRequest request, ModelAndView mav) {
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO)session.getAttribute("member");
		MemberZipcodeVO tmp = new MemberZipcodeVO();
		tmp.setMember_code(vo.getMemberCode());
		tmp.setMember_delivery_type(0);
		List<MemberZipcodeVO> list = memberZipcodeService.getZipcodeAll(tmp);
		
		mav.addObject("list", list);
		mav.setViewName("orderMorningBesongji");
		return mav;
	}
	
	@RequestMapping("/orderParcelBesongji.do")
	public ModelAndView orderParcelBesongjiDo(HttpServletRequest request, ModelAndView mav) {
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO)session.getAttribute("member");
		MemberZipcodeVO tmp = new MemberZipcodeVO();
		tmp.setMember_code(vo.getMemberCode());
		tmp.setMember_delivery_type(1);
		List<MemberZipcodeVO> list = memberZipcodeService.getZipcodeAll(tmp);
		
		mav.addObject("list", list);
		mav.setViewName("orderParcelBesongji");
		return mav;
	}
	
	@RequestMapping(value = "/orderDeliveryDefaultSelect.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String orderDeliveryDefaultSelectDo(MemberZipcodeVO vo) {
		MemberZipcodeVO vo1 = memberZipcodeService.getZipcodeAll2(vo);
		List<MemberZipcodeVO> list = memberZipcodeService.getZipcodeAll(vo1);
		for(int i = 0; i < list.size(); i++) {
			if(list.get(i).getMember_default_address().equals("y")) {
				list.get(i).setMember_default_address("n");
				memberZipcodeService.updateZipcodeDefaultAddress(list.get(i));
				vo1.setMember_default_address("y");
				memberZipcodeService.updateZipcodeDefaultAddress(vo1);
				break;
			}
		}
		return null;
	}
	
	@RequestMapping("/orderDefaultDeliveryCheckModal.do")
	public ModelAndView orderDefaultDeliveryCheckModalDo(ModelAndView mav) {
		mav.setViewName("orderDefaultDeliveryCheckModal");
		return mav;
	}
	
	@RequestMapping("/orderCommonBesongji.do")
	public ModelAndView orderCommonBesongjiDo(ModelAndView mav, MemberZipcodeVO vo) {
		MemberZipcodeVO vo1 = memberZipcodeService.getZipcodeAll2(vo);
		mav.addObject("memberZipcode", vo1);
		mav.setViewName("orderCommonBesongji");
		return mav;
	}
}
