package project.spring.web.detail;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import project.spring.web.basket.BasketService;
import project.spring.web.basket.BasketVO;
import project.spring.web.mapping.MappingService;
import project.spring.web.mapping.MappingVO;
import project.spring.web.member.MemberVO;
import project.spring.web.modal.ModalService;
import project.spring.web.modal.ModalVO;
import project.spring.web.review.WriteReviewService;
import project.spring.web.tapPage.TapPageService;
import project.spring.web.tapPage.TapPageVO;
import project.spring.web.utill.Criteria;
import project.spring.web.utill.PageMaker;

@Controller
public class DetailController {
	// 각각 주입받을 Service

	@Autowired
	private DetailService detailService;
	@Autowired
	private TapPageService tapPageService;
	@Autowired
	private WriteReviewService writeReviewService;
	@Autowired
	private MappingService mappingService;
	@Autowired
	private ModalService modalService;
	@Autowired
	private BasketService BasketService;
	
	
	public DetailController() {
		System.out.println("detailController 실행");
	}
	

//	@RequestMapping(value = "/detail.do", method = RequestMethod.POST)
	@RequestMapping("/detail.do")
	public ModelAndView setDetail(HttpServletRequest request,ModelAndView mav, Criteria cri)throws Exception {
		String str = request.getParameter("itemCode01");
		int menuNum = Integer.parseInt(str);
		System.out.println("넘어온 Num의 값 :"+menuNum);
		String a = request.getParameter("tagMain01");
		int tagMain01 = Integer.parseInt(a);
		System.out.println("넘어온 tagMain01 값 : "+ tagMain01);
		String sub = request.getParameter("tagSub01");
		int tagSub01 = Integer.parseInt(sub);
		System.out.println("넘어온 tagSub01 값 : "+tagSub01);
		
		mav.addObject("tagSub",tagSub01);
		
		
		DetailVO VO1 = new DetailVO();
		
		//단품상품일때
		if(tagMain01 != 100 && tagMain01 != 600) {
			//단품상품일때 아이템 상품정보			
			System.out.println(" --단품 상세 정보-- ");
			VO1.setItem_code(menuNum);
			DetailVO itemNut = detailService.getItem(VO1);
			mav.addObject("detail", itemNut);
			if(itemNut.getItem_nut() != null) {
				StringTokenizer st = new StringTokenizer(itemNut.getItem_nut().replace(":;:", "\\"), "\\");
				List<String> nut = new ArrayList<String>();
				while(st.hasMoreTokens()) {
					String str1 = st.nextToken();
					nut.add(str1);
				}
				mav.addObject("itemNut", nut);
			}
			DetailVO itemInfo = detailService.getInfo(VO1);
			if(itemInfo != null) {
				if(itemInfo.getItem_info() != null) {
					StringTokenizer st1 = new StringTokenizer(itemInfo.getItem_info().replace(":;:", "\\"), "\\");
					List<String> info = new ArrayList<String>();
					while(st1.hasMoreTokens()) {
						info.add(st1.nextToken());
					}
					mav.addObject("detailInfo", info);
				}
			}
// 			상세이미지 보여주기
			DetailVO image = detailService.getItem(VO1);
			if(image != null) {
				if(image.getItem_info_image() != null) {
					StringTokenizer st1 = new StringTokenizer(image.getItem_info_image().replace(":;:", "\\"), "\\");
					List<String> showImage = new ArrayList<String>();
					while(st1.hasMoreTokens()) {
						showImage.add(st1.nextToken());
					}
					mav.addObject("showImage", showImage);
				}
			}
//			아이템 평균별점/게시글카운트
			TapPageVO VO2 = new TapPageVO();
			VO2.setItemCode(menuNum);
			mav.addObject("avgCount", tapPageService.getAvgCount(VO2));
			
//			이미지 슬라이드를 위한 tag_main으로 DB에서 랜덤으로 가져와서 리턴
			TapPageVO VO3 = new TapPageVO();

			VO3.setTagMain(tagMain01);
			List<TapPageVO> random = tapPageService.getRandom(VO3);
			mav.addObject("random",random);

//			리뷰보드( 각 품목 불러오기 )
			cri.setItem_code(menuNum);
		    List<Map<String,Object>> list = writeReviewService.selectBoardList(cri);
		    mav.addObject("boardList", list);
//			페이징 처리
			System.out.println("페이징 처리");
			PageMaker pageMaker = new PageMaker();
		    pageMaker.setCri(cri);
		    pageMaker.setItem_code(menuNum);
		    pageMaker.setTotalCount(writeReviewService.countBoardListTotal(pageMaker));
		    mav.addObject("pageMaker", pageMaker);
		    System.out.println("cri.getItem_code : "+cri.getItem_code());
		    System.out.println("");
		    System.out.println("totalcount 값 :" + pageMaker.getTotalCount());
			mav.setViewName("detail");
			return mav;
		}else if(tagMain01 == 600) {
//세트 상품일때

			System.out.println(" --구독/세트 상세 정보-- ");
			
        	DetailVO dvo = new DetailVO();
        	dvo.setItem_code(menuNum);
        	System.out.println("----> dvo.getItem_code(menuNum) :" + dvo.getItem_code());
        	mav.addObject("detail", detailService.getSubItem(dvo));
        	
        	// 세트 or 구독상품 상품정보 가져오기 필요한것들
			MappingVO mapVO = new MappingVO();
			mapVO.setSubscribe_code(menuNum); // Subscribe_code == item_code 가 됨.
			System.out.println("mapVO로 넘어갈 code값 :" +menuNum);
			List<MappingVO> aa = mappingService.getItemCodeList(mapVO);
			
// 			상세이미지 보여주기
			VO1.setItem_code(menuNum);
			DetailVO image = detailService.getSubItem(VO1);
			if(image != null) {
				if(image.getItem_info_image() != null) {
					StringTokenizer st1 = new StringTokenizer(image.getItem_info_image().replace(":;:", "\\"), "\\");
					List<String> showImage = new ArrayList<String>();
					while(st1.hasMoreTokens()) {
						showImage.add(st1.nextToken());
					}
					mav.addObject("showImage", showImage);
				}
			}
			
			// 영양 정보 고시
			List<DetailVO> itemcodes = new ArrayList<DetailVO>();
			
            for(MappingVO vo : aa) { // 12 15 19
            	//System.out.println("itemcodes 담는중");
            	dvo.setItem_code(vo.getItem_code());
            	itemcodes.add(detailService.getItem(dvo));
            }
            
            List<String> itemNut = new ArrayList<String>();
            for(DetailVO vo : itemcodes) {
            	if(vo.getItem_nut() == null) {
            		continue;
            	}
            	
            	StringTokenizer st = new StringTokenizer(vo.getItem_nut().replace(":;:", "\\"), "\\");
            	while(st.hasMoreTokens()) {
            		String str1 = st.nextToken();
            		if(!str1.contains("영양성분")) {
            			continue;
            		}
            		itemNut.add(str1);
            	}
            	
            }
            // 상품 정보 고시
            List<DetailVO> itemcodes2 = new ArrayList<DetailVO>();
            
            for(MappingVO vo2 : aa ) {
            	dvo.setItem_code(vo2.getItem_code());
            	itemcodes2.add(detailService.getInfo(dvo));
            }
            
            List<String> itemInfo = new ArrayList<String>();
            for(DetailVO vo : itemcodes2) {
            	if(vo == null) {
            		continue;
            	}
            	StringTokenizer st = new StringTokenizer(vo.getItem_info().replace(":;:", "\\"), "\\");
            	while(st.hasMoreTokens()) {
            		String str1 = st.nextToken();
            		if(!str1.contains("내용량")) {
            			continue;
            		}
            		itemInfo.add(str1);
            	}
            }
            mav.addObject("detailInfo2", itemInfo);
            
            mav.addObject("detailNut", itemNut);
            
//			이미지 슬라이드를 위한 tag_main으로 DB에서 랜덤으로 가져와서 리턴
			TapPageVO VO3 = new TapPageVO();

			VO3.setTagMain(tagMain01);
			List<TapPageVO> random = tapPageService.getRandom2(VO3);
			mav.addObject("random",random);
          
//			아이템 평균별점/게시글카운트
			TapPageVO VO2 = new TapPageVO();
			VO2.setItemCode(menuNum);
			mav.addObject("avgCount", tapPageService.getAvgCount(VO2));
//			리뷰보드( 각 품목 불러오기 )
			cri.setItem_code(menuNum);
		    List<Map<String,Object>> list = writeReviewService.selectBoardList(cri);
		    mav.addObject("boardList", list);
//			페이징 처리
			System.out.println("페이징 처리");
			PageMaker pageMaker = new PageMaker();
		    pageMaker.setCri(cri);
		    pageMaker.setItem_code(menuNum);
		    pageMaker.setTotalCount(writeReviewService.countBoardListTotal(pageMaker));
		    mav.addObject("pageMaker", pageMaker);
		    System.out.println("cri.getItem_code : "+cri.getItem_code());
		    System.out.println("");
		    System.out.println("totalcount 값 :" + pageMaker.getTotalCount());
			mav.setViewName("detail");
			return mav;
			
		}
		
		else {
// 구독 상품 일때
			System.out.println(" --구독/세트 상세 정보-- ");
			
			
        	DetailVO dvo = new DetailVO();
        	dvo.setItem_code(menuNum);
        	System.out.println("----> dvo.getItem_code(menuNum) :" + dvo.getItem_code());
        	mav.addObject("detail", detailService.getSubItem(dvo));
        	
        	// 세트 or 구독상품 상품정보 가져오기 필요한것들
			MappingVO mapVO = new MappingVO();
			mapVO.setSubscribe_code(menuNum); // Subscribe_code == item_code 가 됨.
			//System.out.println("mapVO로 넘어갈 code값 :" +menuNum);
			List<MappingVO> aa = mappingService.getItemCodeList(mapVO);
			
// 			상세이미지 보여주기
			VO1.setItem_code(menuNum);
			DetailVO image = detailService.getSubItem(VO1);
			System.out.println("null 체크");
			if(image != null) {
				System.out.println("image null 아님");
				if(image.getItem_info_image() != null) {
					System.out.println("image.getItem_info_image Null 아님");
					StringTokenizer st1 = new StringTokenizer(image.getItem_info_image().replace(":;:", "\\"), "\\");
					List<String> showImage = new ArrayList<String>();
					while(st1.hasMoreTokens()) {
						showImage.add(st1.nextToken());
					}
					mav.addObject("showImage", showImage);
				}
			}
			
			// 영양 정보 고시
			List<DetailVO> itemcodes = new ArrayList<DetailVO>();
			
            for(MappingVO vo : aa) { // 12 15 19
            	//System.out.println("itemcodes 담는중");
            	dvo.setItem_code(vo.getItem_code());
            	itemcodes.add(detailService.getItem(dvo));
            }
            
            List<String> itemNut = new ArrayList<String>();
            for(DetailVO vo : itemcodes) {
            	if(vo.getItem_nut() == null) {
            		continue;
            	}
            	
            	StringTokenizer st = new StringTokenizer(vo.getItem_nut().replace(":;:", "\\"), "\\");
            	while(st.hasMoreTokens()) {
            		String str1 = st.nextToken();
            		if(!str1.contains("영양성분")) {
            			continue;
            		}
            		itemNut.add(str1);
            	}
            	
            }
            // 상품 정보 고시
            List<DetailVO> itemcodes2 = new ArrayList<DetailVO>();
            
            for(MappingVO vo2 : aa ) {
            	dvo.setItem_code(vo2.getItem_code());
            	itemcodes2.add(detailService.getInfo(dvo));
            }
            
            List<String> itemInfo = new ArrayList<String>();
            for(DetailVO vo : itemcodes2) {
            	if(vo.getItem_info() == null) {
            		continue;
            	}
            	StringTokenizer st = new StringTokenizer(vo.getItem_info().replace(":;:", "\\"), "\\");
            	while(st.hasMoreTokens()) {
            		String str1 = st.nextToken();
            		if(!str1.contains("내용량")) {
            			continue;
            		}
            		itemInfo.add(str1);
            	}
            }
            mav.addObject("detailInfo2", itemInfo);
            
            mav.addObject("detailNut", itemNut);
//			이미지 슬라이드를 위한 tag_main으로 DB에서 랜덤으로 가져와서 리턴
			TapPageVO VO3 = new TapPageVO();

			VO3.setTagMain(tagMain01);
			List<TapPageVO> random = tapPageService.getRandom2(VO3);
			mav.addObject("random",random);
          
//			아이템 평균별점/게시글카운트
			TapPageVO VO2 = new TapPageVO();
			VO2.setItemCode(menuNum);
			mav.addObject("avgCount", tapPageService.getAvgCount(VO2));
//			리뷰보드( 각 품목 불러오기 )
			cri.setItem_code(menuNum);
		    List<Map<String,Object>> list = writeReviewService.selectBoardList(cri);
		    mav.addObject("boardList", list);
//			페이징 처리
			System.out.println("페이징 처리");
			PageMaker pageMaker = new PageMaker();
		    pageMaker.setCri(cri);
		    pageMaker.setItem_code(menuNum);
		    pageMaker.setTotalCount(writeReviewService.countBoardListTotal(pageMaker));
		    mav.addObject("pageMaker", pageMaker);
		    System.out.println("cri.getItem_code : "+cri.getItem_code());
		    System.out.println("");
		    System.out.println("totalcount 값 :" + pageMaker.getTotalCount());
			mav.setViewName("subscribeDetail");

			return mav;
		}

////		리뷰보드( 각 품목 불러오기 )
//		cri.setItem_code(menuNum);
//	    List<Map<String,Object>> list = writeReviewService.selectBoardList(cri);
//	    mav.addObject("boardList", list);
////		페이징 처리
//		System.out.println("페이징 처리");
//		PageMaker pageMaker = new PageMaker();
//	    pageMaker.setCri(cri);
//	    pageMaker.setItem_code(menuNum);
//	    pageMaker.setTotalCount(writeReviewService.countBoardListTotal(pageMaker));
//	    mav.addObject("pageMaker", pageMaker);
//	    System.out.println("cri.getItem_code : "+cri.getItem_code());
//	    System.out.println("");
//	    System.out.println("totalcount 값 :" + pageMaker.getTotalCount());
//		mav.setViewName("detail");
//		return mav;
	}


// 선택시 드롭다운 보여주기	
	@RequestMapping("/dropDown.do")
	public ModelAndView test2(HttpServletRequest request, ModelAndView mav) {
		String str = request.getParameter("codeNum");
		int menuNum = Integer.parseInt(str);
		//System.out.println("넘어온 code값 :" + menuNum);
		String str2 = request.getParameter("tagNum");
		int tagMain01 = Integer.parseInt(str2);
		System.out.println("넘어온 tag값 :" + tagMain01);

		
		if(tagMain01 != 100 && tagMain01 != 600) {// 단품 상세정보에서 넘어왔을때..
			System.out.println("단품 상세 정보로 넘어가기");
			DetailVO VO = new DetailVO();
			VO.setItem_code(menuNum);
			DetailVO ListItem = detailService.getItem(VO);
			mav.addObject("tagMain",tagMain01);
			mav.addObject("detail", ListItem);
			mav.setViewName("selectItem");
		
		}else if(tagMain01 == 600){ // 셋트 상품일때.
			System.out.println("세트 상세 정보로 넘어가기");
        	DetailVO dvo = new DetailVO();
        	dvo.setItem_code(menuNum);
        	System.out.println("----> dvo.getItem_code(menuNum) :" + dvo.getItem_code());
        	mav.addObject("detail", detailService.getSubItem(dvo));
			mav.setViewName("selectSet");
			
		}else if(tagMain01 == 100) { // 구독 상품일때.
			System.out.println("구독 상세 정보로 넘어가기");
			DetailVO dvo = new DetailVO();
        	dvo.setItem_code(menuNum);
        	System.out.println("----> dvo.getItem_code(menuNum) :" + dvo.getItem_code());
        	mav.addObject("detail", detailService.getSubItem(dvo));
			
			mav.setViewName("selectSub");
		}

		return mav;	
	}
// 드롭다운 리스트 클릭시 목록 찍기 ( 단품/세트 )
	@RequestMapping("/test3.do")
	public ModelAndView test3(HttpServletRequest request, ModelAndView mav) {
		String size = request.getParameter("size");
		String num = request.getParameter("price");
		int price = Integer.parseInt(num);
		String num2 = request.getParameter("price_sub");
		int price_sub = Integer.parseInt(num2);
		String name = request.getParameter("name");
		String getTest = request.getParameter("test");
		int test = Integer.parseInt(getTest);
		String num3 = request.getParameter("code");
		int itemCode = Integer.parseInt(num3);
		String num4 = request.getParameter("tag");
		int tagMain = Integer.parseInt(num4);
		String image = request.getParameter("image");
		String num5	= request.getParameter("tagSub");
		int tagSub = Integer.parseInt(num5);
		
		System.out.println(" 넘어온 size: "+size+" 넘어온 price :"+price+" 넘어온 price_sub : "
				+price_sub+" 넘어온 name : "+name+" 넘어온 code : "+itemCode+
				" 넘어온 tagMain : "+tagMain+" 넘어온 tagSub : "+tagSub+" 넘어온 imag : "+image);

		
		mav.addObject("test",test);
		mav.addObject("name",name);
		mav.addObject("price",price);
		mav.addObject("price_sub",price_sub);
		mav.addObject("size",size);
		mav.addObject("itemCode",itemCode);
		mav.addObject("tagMain",tagMain);
		mav.addObject("image",image);
		mav.addObject("tagSub",tagSub);
		mav.setViewName("selectedItem");
		return mav;		
	}
// 달력 보여주기	
	@RequestMapping("/calendar.do")
	public ModelAndView calendar(HttpServletRequest request,ModelAndView mav) {
		
		mav.setViewName("detailCal");
		return mav;	
	}
// 구독 상세명세서
	@RequestMapping("/selectedSub.do")
	public ModelAndView selectedSub(HttpServletRequest request,ModelAndView mav) {
		String name = request.getParameter("name");
		//System.out.println("넘어온 name 값 : "+name);
		
		String size = request.getParameter("size");
		//System.out.println("넘어온 size 값 : "+size);
		
		String week = request.getParameter("week");
		//System.out.println("넘어온 week 값 : "+week);
		
		String start2 = request.getParameter("start");
		//System.out.println("넘어온 start 값 : "+start2);
		String start = start2.substring(0,12);
		//System.out.println("자른 날짜 :"+start);
		
		char day = start2.charAt(start2.length()-3);
		//System.out.println("뽑은 char형 :"+day);
	    String day2 = Character.toString(day);
		
		mav.addObject("name",name);
		mav.addObject("size",size);
		mav.addObject("week",week);
		mav.addObject("start",start);
		mav.addObject("day",day2);
		mav.setViewName("selectedSub");
		return mav;		
	}

// 모달창
	@RequestMapping("/modal.do")
	public ModelAndView modal(HttpServletRequest request,ModelAndView mav) {

		String size = request.getParameter("size");
		//System.out.println("넘어온 size 값 : "+size);		
		String week = request.getParameter("week");
		//System.out.println("넘어온 week 값 : "+week);		
		String start = request.getParameter("start");
		//System.out.println("넘어온 start 값 : "+start); // 다보이게		
		String day = start.substring(0,12);
		//System.out.println("자른 날짜 :"+day); // 요일 안보이게		
		char aaa = start.charAt(start.length()-3);
	    String day3 = Character.toString(aaa); 
	    //System.out.println("뽑은 char형 :"+day3); // 요일만 보이게		
		String str = request.getParameter("price");
		int price = Integer.parseInt(str);
		System.out.println("넘어온 price 값 : "+price);		
		String getCode = request.getParameter("code");
		int code = Integer.parseInt(getCode);
		//System.out.println("넘어온 code 값 : "+code);		
		String getTag = request.getParameter("tag");
		int tagNum = Integer.parseInt(getTag);
		//System.out.println("넘어온 tag 값 : "+tagNum);
		
		ModalVO vo = new ModalVO();
		vo.setSubscribe_code(code);
		System.out.println("셋팅된 subscribe_code 값 : "+ vo.getSubscribe_code());
		List<ModalVO> modal = modalService.getModalList(vo);
		
		mav.addObject("size",size);
		mav.addObject("week",week);
		mav.addObject("start",start);
		mav.addObject("day",day);
		mav.addObject("day3",day3);
		mav.addObject("price",price);		
		mav.addObject("code",code);		
		
		mav.setViewName("detailSubModal");
		return mav;
	}
	
//  모달창내에서 리스트 클릭
//	@RequestMapping("/modalList.do")
//	public ModelAndView modalList(HttpServletRequest request,ModelAndView mav) {
//		System.out.println("모달리스트 크릭");
//		String getCode = request.getParameter("code");
//		int code = Integer.parseInt(getCode);
//		//System.out.println("넘어온 code 값 : "+code);		
//		String getTag = request.getParameter("tag");
//		int tagNum = Integer.parseInt(getTag);
//		//System.out.println("넘어온 tag 값 : "+tagNum);
//		
//	// 샐러드만 보여주게끔
//		if(code ==14 || code ==15 || code == 22 || code == 23 || code == 18 || code ==26 ) { 
//			System.out.println("샐러드일때");
//			ModalVO vo = new ModalVO();
//			vo.setSubscribe_code(code);
//			System.out.println("셋팅된 subscribe_code 값 : "+ vo.getSubscribe_code());
//			List<ModalVO> modal = modalService.getModalList(vo);
//			mav.addObject("modal",modal);
//			mav.setViewName("detailSubModalList");
//			
//		}
//		// 여러가지 보여줄거임
//		else if(code == 16 && code == 24 && code == 17 && code == 25) {
//		
//		}
//		// 샐러드 / 도시락 택
//		else if(code == 19 && code == 27 )	{
//			
//		}
//		// 샐러드 / 샌드위치
//		else if(code == 20 && code == 28) {
//			
//		}
//		// 도시락만 보여줄거임
//		else if(code == 21 && code == 29) {
//			
//		}
//		return mav;	
//	}

// 장바구니 모달
	@RequestMapping("/plzSelect.do")
	public ModelAndView plzSelect(ModelAndView mav) {
		
		mav.setViewName("detailPlzSelectModal");
		return mav;
	}

// 장바구니로 바꿔지는 테스트용 메서드.	
	@RequestMapping(value = "/test.do", method = RequestMethod.POST)
	public ModelAndView testDo(HttpServletRequest request, ModelAndView mav, String[] itemCode
			,String[] tagMain, String[] price, String[] priceSub, String[] itemName, String[] itemSize
			,String[] tagSub, String[] itemImage, String[] itemQuantity) {
		System.out.println("장바구니");
		
		String[] str1 = request.getParameterValues("itemCode");		// int
		int[] code = Arrays.stream(str1).mapToInt(Integer::parseInt).toArray();	
		String[] str2 = request.getParameterValues("tagMain");			// int
		int[] itemtagMain = Arrays.stream(str2).mapToInt(Integer::parseInt).toArray();
		String[] str5 = request.getParameterValues("price");
		int[] itemPrice = Arrays.stream(str5).mapToInt(Integer::parseInt).toArray();
		String[] str6 = request.getParameterValues("priceSub");
		int[] itemPriceSub = Arrays.stream(str6).mapToInt(Integer::parseInt).toArray();
		String[] name = request.getParameterValues("itemName");
		String[] size = request.getParameterValues("itemSize");		// m / l로 구분
		String[] str3 = request.getParameterValues("tagSub");		// int
		int[] itemTagSub = Arrays.stream(str3).mapToInt(Integer::parseInt).toArray();
		String[] image = request.getParameterValues("itemImage");
		String[] str4 = request.getParameterValues("itemQuantity");		// int
		int[] quantity = Arrays.stream(str4).mapToInt(Integer::parseInt).toArray();
		
		int[] subTotal = new int[itemCode.length];
		for(int i=0; i< itemCode.length; i++) {
			subTotal[i] = itemPrice[i] * quantity[i];
			//System.out.println("총가격 "+subTotal[i]);
		}
		
		// 세션으로 내 정보를 가져옴 
		HttpSession session = request.getSession();
		System.out.println(session.getAttribute("member"));
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		
		
		for(int i=0; i < itemCode.length; i++) {
			System.out.println(i+"회차 목록들");
			System.out.println(" 넘어온 size: "+itemSize[i]+" 넘어온 price :"+price[i]+" 넘어온 price_sub : "
					+priceSub[i]+" 넘어온 name : "+itemName[i]+" 넘어온 code : "+itemCode[i]+
					" 넘어온 tagMain : "+tagMain[i]+" 넘어온 tagSub : "+tagSub[i]+
					"넘어온 itemQuantity : "+itemQuantity[i]+" 넘어온 imag : "+itemImage[i]);
			System.out.println("------");
		}
		BasketVO vo = new BasketVO();
		for(int i =0; i < itemCode.length; i++) {
			vo.setItemImage(image[i]);
			vo.setItemName(name[i]);
			vo.setTagMain(itemtagMain[i]);
			vo.setTagSub(itemTagSub[i]);
			vo.setAmount(quantity[i]);
			vo.setPrice(itemPrice[i]);
			vo.setPriceSub(itemPriceSub[i]);
			vo.setUserCode(memberVO.getMemberCode());
			vo.setItemCode(code[i]);
			vo.setSubTotal(subTotal[i]); 
			vo.setItemSize(size[i]);
			BasketService.insertBasket(vo);
			
		}
		// 이제 Update만 하면된다.

		mav.setViewName("detailSuccessOrder");
		return mav;
	}
// 장바구니 넣기 클릭시 장바구니 아래 그림
	@RequestMapping(value="/addCart.do")
	public ModelAndView addCart(HttpServletRequest request, ModelAndView mav) {
		System.out.println("장바구니 모달");
		String image = request.getParameter("image");
		String name = request.getParameter("name");
		String size = request.getParameter("size");
		System.out.println("size 길이 : "+size.length());
		String size2;
		if(size.length()>2) {
			size2= "M";
		}else {
			size2= "L";
		}
		
		mav.addObject("size2",size2);
		mav.addObject("image",image);
		mav.addObject("name",name);
		mav.addObject("size",size);
		
		mav.setViewName("detailAddCart");
		return mav;
	}
	
// 주문하기 버튼 테스트용 메서드.
	@RequestMapping(value ="/testOrder.do")
	public ModelAndView testOrdaer(HttpServletRequest request, ModelAndView mav, String[] orderItemCode
			,String[] orderTagMain, String[] orderItemPrice, String[] orderItemPriceSub, String[] orderItemName
			,String[] orderItemSizeSummary  ,String[] orderItemTagSub, String[] orderItemImage, String[] orderQuantity) {
		System.out.println("주문하기 클릭했음");
		
		String[] str1 = request.getParameterValues("orderItemCode");		// int
		int[] code = new int[str1.length];
		code[0] = Integer.parseInt(str1[0]);
		String[] str2 = request.getParameterValues("orderTagMain");			// int		
		int[] tagMain = new int[str2.length];
		tagMain[0] = Integer.parseInt(str2[0]);
		String[] price = request.getParameterValues("orderItemPrice");
		String[] priceSub = request.getParameterValues("orderItemPriceSub");
		String[] name = request.getParameterValues("orderItemName");
		String[] size = request.getParameterValues("orderItemSizeSummary");		// m / l로 구분
		String[] str3 = request.getParameterValues("orderItemTagSub");		// int
		int[] tagSub = new int[str3.length];
		tagSub[0] = Integer.parseInt(str3[0]);
		String[] image = request.getParameterValues("orderItemImage");
		String[] str4 = request.getParameterValues("orderQuantity");		// int
		int[] quantity = new int[str4.length];
		quantity[0] = Integer.parseInt(str4[0]);

        //2개일때 형변환 처리
        if(str1[1]=="") { // 1개일때
        	code[1] = 0;
        	tagMain[1] = 0;
        	tagSub[1] = 0;
        	quantity[1] = 0;
        }else {
        	for(int i=0; i<code.length; i++) { // 2개일때
        		code[i] = Integer.parseInt(str1[i]);
        		tagMain[i] = Integer.parseInt(str2[i]);
        		tagSub[i] = Integer.parseInt(str3[i]);
        		quantity[i] = Integer.parseInt(str4[i]);
        	}
        }
		
// 넘어온 리스트가 1개일때와 2개일때 구분		
		if(code[1] == 0) { // 1개일때
			for(int i=0; i < 1; i++) {
				System.out.println("1개일때");
				System.out.println(" 넘어온 size: "+size[i]+" 넘어온 price :"+price[i]+" 넘어온 price_sub : "
						+priceSub[i]+" 넘어온 name : "+name[i]+" 넘어온 code : "+code[i]+
						" 넘어온 tagMain : "+tagMain[i]+" 넘어온 tagSub : "+tagSub[i]+
						"넘어온 itemQuantity : "+quantity[i]+" 넘어온 imag : "+image[i]);
				System.out.println("------");
			}
			
			
		}else { // 2개일때
			for(int i=0; i < code.length; i++) {
				System.out.println("2개일때");
				System.out.println(" 넘어온 size: "+size[i]+" 넘어온 price :"+price[i]+" 넘어온 price_sub : "
						+priceSub[i]+" 넘어온 name : "+name[i]+" 넘어온 code : "+code[i]+
						" 넘어온 tagMain : "+tagMain[i]+" 넘어온 tagSub : "+tagSub[i]+
						"넘어온 itemQuantity : "+quantity[i]+" 넘어온 imag : "+image[i]);
				System.out.println("------");
			}
			
		}

		mav.addObject("test",price);
		mav.setViewName("test");
		return mav;
	}
	
	


}
