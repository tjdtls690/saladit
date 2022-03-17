<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<c:set var="path" value="${pageContext.request.contextPath}/resources/detail"/>
<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <!-- for slide -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
   <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>   
   <!-- Bootstrap CSS -->
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
   <link rel="stylesheet" href="${path }/style.css">
   <link rel="stylesheet" href="${path }/hmm2.css">
   <link rel="stylesheet" href="${path }/style2.css?ver=2">
   <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
   <script type="text/javascript">
   

	 
$(function() { 
// 헤더 패딩
         var lastScrollTop = 0,
         delta = 100;
         $(window).scroll(function(event){
         var st = $(this).scrollTop();
         if(Math.abs(lastScrollTop - st) > delta) return;
         if((st > lastScrollTop) && (lastScrollTop > 0)){
        	 if(window.innerWidth > 1023){
               $(".header").css("top","-130px");
        	 }else{
        		 $(".header").css("top","0px");
        	 }
         }else{
            $(".header").css("top","0px");
         }
         lastScrollTop = st;
       	});
         
// 이미지 슬라이드 아이템 클릭시 상세페이지로 이동         
         $(document).on('click', '.swiper-slide', function(){ 
     		var f = document.paging;
     		var code = $(this).children('#itemCode').attr('value');
     		var tag = $(this).children('#tagMain').attr('value');
     		f.tagMain01.value = tag;
     		f.itemCode01.value = code;
     		alert(code);
     		f.action="detail.do"; 
     		f.method="post";
     		f.submit();
     	})
         
// 영양 정보 고시 숨기기       
		$('.menu-info-content-wrap').hide();  
     	$(document).on('click','#nutrition-info',function(){  
    		alert("영양 정보 숨기기");
    	    if($("#item_nut_show").css("display") == "none"){   
    	        $('#item_nut_show').show(); 
    	    } else {  
    	        $('#item_nut_show').hide();  
    	    }  
    	}); 
     	
// 상품 정보 고시 숨기기
     	$(document).on('click','#product-info',function(){  
    		alert("상품 정보 숨기기");
    	    if($("#item_info_show").css("display") == "none"){   
    	        $('#item_info_show').show(); 
    	    } else {  
    	        $('#item_info_show').hide();  
    	    }  
    	});
    	
// 장바구니 담기
		$(document).on('click','#mobCart',function(){
			var p = document.passNum;
			var code = $(this).children('#itemCode').attr('value');
			var tag = $(this).children('#tagMain').attr('value');
			alert("code의 값 :" +code);
			p.itemCode.value = code;
			p.tagMain.value = tag;
			p.action="test.do";
			p.method="post";
			p.submit();
		})

// 리뷰, faq 클릭 이벤트
      $(function(){
          $('.review-item').on('click', function(){
	            $(this).children('.review-item__head').toggleClass("border-bottom-desktop-show");
	            $(this).children('.review-desktop-toggle').toggleClass("review-hide");
          });
          
          $('.menu-info-table-wrap').on('click',function(){
              $(this).children('.menu-info-table-opener').toggleClass("border-bottom-desktop-show");
              $(this).children('.menu-info-table-content-wrap').toggleClass("review-hide");
           });
       });
       
// 페이징 처리
		$(document).on('clik','',function(){

			
		})
		
// 사이즈 선택
		$(document).on('click','.form-radio-input',function(){
			var size = $(this).val();
			$('.setSize').val(size);
			// 미디움 클릭시 Medium / 라지 클릭시 Large 를 셋팅해줌.			
		});

// 드롭 다운
		$(document).on('click','.dropdown-btn-flex-wrap',function(event){	
			var code =$('#mobCart').children('#itemCode').attr('value');			
			var tag = $('#mobCart').children('#tagMain').attr('value');
			var str ="";
			if($('.dropdown-btn-flex-wrap').hasClass('dropdown-open')){
				$('ul').remove('.toggle-drop-down');
			}else{
				$.ajax({
					url : 'dropDown.do',
					type : 'post',
					datatype : 'html',
					data : {
						"codeNum" : code ,
						"tagNum"  : tag
					},
					success : function(htmlOut){
						str += "<ul data-v-5b7f52e9='' class='toggle-drop-down'>";
						str += htmlOut;
						str += "</ul>";
						$('.dropdown-btn').append(str);
																			
					}
				}); // ajax 끝								
			} //else 끝
			$('.dropdown-btn-flex-wrap').toggleClass('dropdown-open');
		}); // 드롭 다운 끝
		
// 드롭 다운 아이템 클릭
		$(document).on('click','.detail-name-and-badge',function(){
			var week = $(this).text();
			var selectedWeek = Number(week.replace('주', '').replace(',', ''));
			$('.setWeek').val(selectedWeek);
			// 선택한 주를 숫자로 표시.
			
			// M 가격 
			var subPriceM = $('.subPrcieM').val(); 
			subPriceM = Number(subPriceM.replace('원', '').replace(',', ''));
			// L 가격 
			var subPriceL = $('.subPrcieL').val(); 
			subPriceL = Number(subPriceL.replace('원', '').replace(',', ''));
			// 사이즈 불러오기
			var size = $('.setSize').val();

	//미디움 클릭후 가격 셋팅		
			if(size =='Medium'){ 			
				alert("미디움일때");
				$('.setPrice').val(subPriceM);
				var setPrice = $('.setPrice').val();
				var totalPrice = setPrice*selectedWeek;
				$('.setTotal').val(totalPrice);
			
				alert("주당 가격 : "+setPrice+" 몇주 : "+selectedWeek+" 총 합계 : "+totalPrice);
			
	// 라지 클릭후 가격 셋팅					
			}else if(size =="Large"){							
				alert("라지일때");
				$('.setPrice').val(subPriceL);
				var setPrice = $('.setPrice').val();
				var totalPrice = setPrice*selectedWeek;
				$('.setTotal').val(totalPrice);
				
				alert("주당 가격 : "+setPrice+" 몇주 : "+selectedWeek+" 총 합계 : "+totalPrice);
				
			}else{
				alert("사이즈를 먼저 선택해주세요");
			}
			

			
			// 클릭시 드롭 다운 아이템 사라짐
			$('ul').detach('.toggle-drop-down');						
//			$('.dropdown-btn-flex-wrap').toggleClass('dropdown-open');
			
			// 날짜 선택 기능 On
			$('.date-picker-input').removeAttr('disabled');
			
		}); // 드롭 다운 아이템 끝

// 날짜 선택 클릭 시
		$(document).on('click','.v-date-custom',function(){
			
			// css 변경을 원본 홈피와 그대로 하겠다.
			$(".vc-popover-content-wrapper").css({
				'position': 'absolute',
				'transform': 'translate3d(0px, -279px, 0px)', 
				'top': '0px', 
				'left': '0px', 
				'will-change': 'transform'
			    });
			
			var test = "test";
			
			if($('.vc-popover-content-wrapper').hasClass('is-interactive')){
				$('div').detach('.vc-popover-content-wrapper:eq(1)'); // 이름이 같아서 2번째인 달력을 detach
				$('.vc-popover-content-wrapper').removeAttr('style'); //스타일을 다지워줌
			}else{	
				alert("없음");
				$.ajax({
					url : 'calendar.do',
					type : 'post',
					datatype : 'html',
					data : {
						"test" : test
					},
					success : function(htmlOut){
						alert("success");
						$('.v-date-custom').append(htmlOut);
						
					}
				}); // ajax 끝		
				
			} // if문 끝
			$('.vc-text-gray-400').attr("disabled", disabled);
			$('.vc-popover-content-wrapper').toggleClass('is-interactive');
			
		});// 날짜 선택 클릭 끝

// 날짜 선택
		$(document).on('click','.vc-day-content.vc-focusable',function(){
			alert("날짜 클릭");
			//이름
			var name = $('.menu__name').text();
//			alert("name : "+name);
			//사이즈
			var size = $('.setSize').val();
//			alert("size : "+size);
			//몇주
			var week = $('.setWeek').val();
//			alert("week : "+week);
			//날짜
			var setDate = $(this).attr('aria-label');
			$('.startDate').val(setDate);
			var start = $('.startDate').val();
//			alert("setDate : "+setDate);
			
			$.ajax({
				url : 'selectedSub.do',
				type : 'post',
				datatype : 'html',
				data :{
					"name" : name,
					"size" : size,
					"week" : week,
					"start": start
				},
				success : function(htmlOut){
					alert("성공!");
					$('.menu__select-size').append(htmlOut);
					
					
				}// success 끝
				
			});// ajax 끝

	// disable
			// 사품금액 표기까지 같이묶여져서 다 토글클래스때리고 상품금액은 다시해서 disabled를 막았다.
			$('.menu__label').toggleClass('disabled-style');
			$('.menu__label.menu__price-label').toggleClass('disabled-style');
			// M / L 버튼 disabled
			$('.row--v-center.radio-label').toggleClass('disabled-style');
			$('.form-radio').toggleClass('form-radio--disabled');
			$('.radio-side-text').toggleClass('disabled-style');
			// 원하는주 disable
			$('.dropdown-btn-flex-wrap').toggleClass('disabled');
			// 달력 disabled
			
		
		});
		
// 구독 상세명서 삭제 버튼		
		$(document).on('click','.selected-detail__close',function(){
			alert("삭제버튼");
			$('.selected-detail-wrap').detach();
		// 현재 저장되어있는 값 초기화.
			var nothing ="";
			$('.setPrice').val(nothing);
			$('.setSize').val(nothing);
			$('.setTotal').val(nothing);
			$('.startDate').val(nothing);
		
			
		})
		
// 식단확인 및 변경 클릭
		$(document).on('click','.selected-detail__btn',function(){
			alert("식단변경");
			var test ="";
			$.ajax({
				url : 'modal.do',
				type : 'post',
				datatype : 'html',
				data :{
					'test' : test
				},
				success : function(htmlOut){
					alert("ajax들어옴");
					$('.menu').append(htmlOut);
					alert("성공!");
				}
			}); // ajax 끝
			
		})

		
		
			
// 상품 이미지 더보기
		$(document).on('click','.more-btn',function(){
			$(this).prev().children().toggleClass('img-wrapper');
					
		});
		
		
 }); //function 끝



    </script>

<!--     for slide   -->
    <style type="text/css">

	.swiper-container {
		height:420px;
	
	}
	.swiper-slide {
		text-align:center;
		display:flex; /* 내용을 중앙정렬 하기위해 flex 사용 */
		align-items:center; /* 위아래 기준 중앙정렬 */
		justify-content:center; /* 좌우 기준 중앙정렬 */
	}
	.swiper-slide img {
		box-shadow:0 0 5px #555;
		max-width:100%; /* 이미지 최대너비를 제한, 슬라이드에 이미지가 여러개가 보여질때 필요 */
		/* 이 예제에서 필요해서 설정했습니다. 상황에따라 다를 수 있습니다. */
	}

	</style>
	
    <title>Saladit!</title>
</head>
<body>
    <div id="container">
        <header id="header-area" class="header" data-v-30697495 data-v-0f5971ec>
            <div class="header-banner-wrap" data-v-30697495><!----></div> 
            <div id="header__body" class="header__body" data-v-30697495>
               <div class="header__top" data-v-30697495>
                  <a href="/info" class="header__top-left" data-v-30697495></a> 
                  <div class="header__top-right" data-v-30697495>
                     <a href="/mypage/orders" data-v-30697495>이예지 <span data-v-30697495>님</span></a> 
                     <span data-v-30697495>1:1문의</span>
                     <a href="https://forms.gle/92o1ctx6U4CYe2yF9" target="_blank" data-v-30697495>B2B 신청</a>
                  </div>
               </div> <!---->
               <div class="header__logo" data-v-30697495>
                  <a href="#">
                     <!--<img id="logoim" src="images/logo.PNG" width="200px">-->
                  </a> <!---->
               </div>
<!--                input hidden 태그 -->
<!--                input hidden 태그 -->
<!--                input hidden 태그 -->
				<input type="hidden" class="setPrice" value="">
				<input type="hidden" class="setSize" value="">
				<input type="hidden" class="setTotal" value="">
				<input type="hidden" class="startDate" value="">
				<input type="hidden" class="setWeek" value="">
			
<!--                input hidden 태그 -->
<!--                input hidden 태그 -->
<!--                input hidden 태그 -->				
               <nav class="header__menus" data-v-30697495>
                  <div data-v-30697495>
                     <div class="dropdown" data-v-30697495>
                        <span class="item" data-v-30697495>
                           <img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/Icon_Hamberger_Gray%403x.png"  class="search-logo-img" style="width:24px;height:24px;" data-v-30697495>
                           전체 카테고리
                        </span> 
                        <div class="dropdown" data-v-30697495>
                           <ul data-v-30697495>
                              <li data-v-30697495>
                                 <a href="/menu" data-v-30697495>전체보기</a>
                              </li>
                              <li data-v-30697495>
                                 <a href="/menu/subscription" data-v-30697495>정기배송</a>
                              </li>
                              <li data-v-30697495>
                                 <a href="/menu/salad" data-v-30697495>샐러드</a>
                              </li>
                              <li data-v-30697495>
                                 <a href="/menu/salad-wrap" data-v-30697495>랩·샌드위치</a>
                              </li>
                              <li data-v-30697495>
                                 <a href="/menu/meal" data-v-30697495>도시락·간편식</a>
                              </li>
                              <li data-v-30697495>
                                 <a href="/menu/set" data-v-30697495>세트상품</a>
                              </li>
                              <li data-v-30697495>
                                 <a href="/menu/snack" data-v-30697495>간식</a>
                              </li>
                              <li data-v-30697495>
                                 <a href="/menu/drink" data-v-30697495>음료</a>
                              </li>
                              <li data-v-30697495>
                                 <a href="/menu/event" data-v-30697495>할인기획전</a>
                              </li>
                              <li data-v-30697495>
                                 <a href="/menu/soon" data-v-30697495>오픈예정</a>
                              </li>
                              <li data-v-30697495>
                                 <a href="/menu/soup" data-v-30697495>죽·스프</a>
                              </li>
                           </ul>
                        </div>
                     </div> 
                     <a href="/menu/subscription" class="item" data-v-30697495>정기배송</a>
                     <a href="/menu/salad" class="item" data-v-30697495>샐러드</a>
                     <a href="/menu/salad-wrap" class="item" data-v-30697495>랩·샌드위치</a>
                     <a href="/menu/event" class="item" data-v-30697495>할인기획전</a>
                     <a href="/event" class="item" data-v-30697495>이벤트</a>
                     <a href="/fcospot" class="item" data-v-30697495>프코스팟</a>
                  </div> 
                  <div class="header__menus-side" data-v-30697495>
                     <a href="/search" class="search-logo" data-v-30697495>
                        <img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/ic-navi-search%403x.png"  class="search-logo-img" style="width: 24px; height: 24px;" data-v-30697495> 
                        <div data-v-30697495>검색</div>
                     </a> 
                     <a href="/cart" class="cart-logo-wrap item" data-v-30697495>
                        <img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/cart-header-icon%403x.png"  class="cart-logo empty" style="width: 24px; height: 24px;" data-v-30697495>
                         장바구니
                       </a> 
                       <a href="/order" class="item" data-v-30697495>
                       <img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/icon_order.png" class="icon-order" style="width: 24px; height: 24px;" data-v-30697495>
                         바로주문
                       </a>
                   </div>
                  </nav> 
                  <div class="header__side" data-v-30697495>
                        <a href="/search" class="search-logo" data-v-30697495>
                           <img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/ic-navi-search%403x.png" class="search-logo-img" style="width: 24px; height: 24px;" data-v-30697495></a>
                        </a> 
                        <a href="/cart" class="cart-logo-wrap item" data-v-30697495>
                           <img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/cart-header-icon%403x.png"  class="cart-logo empty" style="width: 24px; height: 24px;" data-v-30697495>
                        </a> 
                        <nav class="header__toggle-button" data-v-30697495>
                           <button type="button" data-v-30697495>
                              <img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/ic-navi-search%403x.png"  style="width: 24px; height: 24px;" data-v-30697495>
                           </button>
                        </nav>
                  </div>
            </div> 
            <div class="mobile-nav js-mobile-nav" data-v-30697495>
               <div class="mobile-nav-wrap" data-v-30697495>
                  <div class="mobile-nav-scroll" data-v-30697495>
                     <ul class="mobile-nav-contents" data-v-30697495>
                        <li class="mobile-nav-contents-item" data-v-30697495>
                           <a href="/menu" data-v-30697495>전체 메뉴</a>
                          </li>
                          <li class="mobile-nav-contents-item" data-v-30697495>
                             <a href="/menu/subscription" data-v-30697495>정기배송</a>
                          </li>
                          <li class="mobile-nav-contents-item" data-v-30697495>
                             <a href="/menu/event" data-v-30697495>할인기획전</a>
                          </li>
                          <li class="mobile-nav-contents-item" data-v-30697495>
                             <a href="/info" data-v-30697495>배송안내</a>
                          </li>
                          <li class="mobile-nav-contents-item" data-v-30697495>
                             <a href="/fcospot" data-v-30697495>프코스팟</a>
                          </li>
                      </ul>
                  </div> 
                  <div class="all-menus-container" style="display:none;" data-v-30697495>
                     <div class="all-menus-list-wrap" data-v-30697495>
                        <ul class="all-menus-list js-all-menus-list" data-v-30697495>
                           <li class="all-menus-item" data-v-30697495>
                              <a href="/menu" class="js-all-menus-item-link-0 all-menus-item-link" data-v-30697495>
                                    전체보기</a>
                              </li>
                              <li class="all-menus-item" data-v-30697495><a href="/menu/subscription" class="js-all-menus-item-link-1 all-menus-item-link" data-v-30697495>
                                    정기배송</a>
                              </li>
                              <li class="all-menus-item" data-v-30697495><a href="/menu/salad" class="js-all-menus-item-link-2 all-menus-item-link" data-v-30697495>
                                    샐러드</a>
                              </li>
                              <li class="all-menus-item" data-v-30697495><a href="/menu/salad-wrap" class="js-all-menus-item-link-3 all-menus-item-link" data-v-30697495>
                                    랩·샌드위치</a>
                              </li>
                              <li class="all-menus-item" data-v-30697495><a href="/menu/meal" class="js-all-menus-item-link-4 all-menus-item-link" data-v-30697495>
                                    도시락·간편식</a>
                              </li>
                              <li class="all-menus-item" data-v-30697495><a href="/menu/set" class="js-all-menus-item-link-5 all-menus-item-link" data-v-30697495>
                                    세트상품</a>
                              </li>
                              <li class="all-menus-item" data-v-30697495><a href="/menu/snack" class="js-all-menus-item-link-6 all-menus-item-link" data-v-30697495>
                                    간식</a>
                              </li>
                              <li class="all-menus-item" data-v-30697495><a href="/menu/drink" class="js-all-menus-item-link-7 all-menus-item-link" data-v-30697495>
                                    음료</a>
                              </li>
                              <li class="all-menus-item" data-v-30697495><a href="/menu/event" class="js-all-menus-item-link-8 all-menus-item-link" data-v-30697495>
                                    할인기획전</a>
                              </li>
                              <li class="all-menus-item" data-v-30697495><a href="/menu/soon" class="js-all-menus-item-link-9 all-menus-item-link" data-v-30697495>
                                    오픈예정</a>
                              </li>
                              <li class="all-menus-item" data-v-30697495><a href="/menu/soup" class="js-all-menus-item-link-10 all-menus-item-link" data-v-30697495>
                                    죽·스프</a>
                              </li>
                          </ul>
                      </div> 
                      <div class="all-menus-shadow" data-v-30697495></div> 
                      <div class="all-menus-arrow-wrap" data-v-30697495>
                         <img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/icon-arrow-down%402x.png"  class="all-menus-arrow" data-v-30697495>
                        </div>
                  </div>
               </div>
            </div> 
            <!----> 
            <!----> 
            <!---->
        </header> 
        <div id="home">
            <!--위에 container에 padding-top:182px 주는 이유:
            헤더가 스크롤에 따라 바뀌면서 그 아래 container가 스크롤을 올리면 잘 안보임-->
            <div class="menu__container">
                <article class="menu">
                    <div id="menu__head" class="menu__head">
                        <figure class="menu__image">
                            <div class="menu-badge">
                            </div>
                                <img src="${detail.item_image }" alt="상품 이미지">
                        </figure>
                        <div data-v-32a18372 class="menu__body">
                            <header data-v-32a18372 class="menu__header">
                                <h2 data-v-32a18372 class="menu__name">${detail.item_name }</h2>
                                <div data-v-32a18372 class="menu__summary">${detail.item_summary }</div>
                                <div data-v-32a18372 class="review">
                                    <div data-v-32a18372 class="row--v-center review-wrap">
                                    
                                    
                                        <div class="review-stars">

                                            <img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/icon_star_full%402x.png">
                                            <img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/icon_star_full%402x.png">
                                            <img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/icon_star_full%402x.png">
                                            <img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/icon_star_full%402x.png">
                                            <img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/icon_star_half%402x.png">
                                        </div>
                                        
                                        
                                        <div>
                                            <span class="review-count">
                                                ★★★★${avgCount.starAvg }(후기 ${avgCount.reviewCount})
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="price-wrap">
                                    <b>${detail.item_price_m }원 </b>
                                    <c:if test= "${detail.item_price_m_sub !='' }">
                                    <b>~</b>
                                    <del>${detail.item_price_m_sub }원</del>
                                    </c:if> 
                                </div>
                                <ul data-v-32a18372 class="menu-detail">
                                    ${detail.item_explain }
<!-- 택배 배송 일때 -->                 <c:if test="${tagSub == 102}">
                                   		<li data-v-32a18372="" class="menu-detail__deliveryType">
                                   			<div data-v-32a18372="" class="menu-detail__deliveryType-text">
												<label data-v-32a18372="" class="menu__label">배송 방법</label>
													<div data-v-32a18372="" class="menu-text-wrap">
														<span data-v-32a18372="" class="menu__text" style="color: rgb(74, 144, 226);"> 택배배송 
															<span data-v-32a18372="" class="menu__sub-text"> (도서산간지역 제외) </span>
														</span> 
														<span data-v-32a18372="" class="subs-desc-bold">오전 8시까지 주문 시 당일 발송</span>
														<span data-v-32a18372="" class="subs-desc">화요일부터 토요일까지 배송됩니다.</span>
													</div>
											</div>
										</li>
                                    </c:if>
 <!-- 새벽 배송 일때 -->                <c:if test="${tagSub == 101 }">
                                    	<li data-v-32a18372="" class="menu-detail__deliveryType">
                                    		<div data-v-32a18372="" class="menu-detail__deliveryType-text">
												<label data-v-32a18372="" class="menu__label">배송 방법</label>
													<div data-v-32a18372="" class="menu-text-wrap">
														<span data-v-32a18372="" class="menu__text" style="color: rgb(46, 58, 130);"> 새벽배송 
															<span data-v-32a18372="" class="menu__sub-text"> (서울 전체, 경기/인천 일부) </span>
														</span> 
														<span data-v-32a18372="" class="subs-desc-bold">밤 12시 - 새벽 7시 이내 도착</span> 
														<span data-v-32a18372="" class="subs-desc">월요일부터토요일까지 배송됩니다.</span>
													</div>
											</div>
										</li>
                                    </c:if>
                                </ul>

									<!-- 시작 -->
								
									<div data-v-2706028c="" data-v-32a18372="" class="menu-select-panel">
										<div data-v-2706028c="" class="menu__select-size">
											<ul data-v-2706028c="" class="menu__select-size-list normal">
												<li data-v-2706028c="" class="menu__options"><label
													data-v-2706028c="" class="menu__label">사이즈 선택</label>
													<div data-v-2706028c="" class="row--v-center">
	<!--  -->												
													<c:if test="${ empty detail.item_price_l  }">
														<div data-v-2706028c="" class="row--v-center radio-label">
															<label data-v-3f971378="" data-v-2706028c="" class="form-radio">
																<input data-v-3f971378="" id="Medium" type="radio" name="menu-sizeboth" class="form-radio-input" value="Medium"> 
																	<span data-v-3f971378="" class="form-radio-circle">
																		<i data-v-3f971378="" class="form-radio-circle-interior"></i>
																	</span>
																Medium 
															</label> 
															<label data-v-2706028c="" for="Medium" class="radio-side-text">Medium</label>
														</div>
													</c:if>
													<c:if test="${ not empty detail.item_price_l }">
														<div data-v-2706028c="" class="row--v-center radio-label">
															<label data-v-3f971378="" data-v-2706028c="" class="form-radio">
																<input data-v-3f971378="" id="Medium" type="radio" name="menu-sizeboth" class="form-radio-input" value="Medium"> 
																	<span data-v-3f971378="" class="form-radio-circle">
																		<i data-v-3f971378="" class="form-radio-circle-interior"></i>
																	</span>
																Medium 
															</label> 
															<label data-v-2706028c="" for="Medium" class="radio-side-text">Medium</label>
														</div>
														<div data-v-2706028c="" class="row--v-center radio-label">
															<label data-v-3f971378="" data-v-2706028c="" class="form-radio">
																<input data-v-3f971378="" id="Large" type="radio" name="menu-sizeboth" class="form-radio-input" value="Large"> 
																	<span data-v-3f971378="" class="form-radio-circle">
																		<i data-v-3f971378="" class="form-radio-circle-interior"></i>
																	</span>
																Medium 
															</label> 
															<label data-v-2706028c="" for="Large" class="radio-side-text">Large</label>
														</div>
													</c:if>	
														
													</div>
												</li>
												<li data-v-2706028c="" class="menu__period-select">
													<label data-v-2706028c="" class="menu__label only-desktop ">
														기간 선택
													</label>
													<div data-v-4837bb91="" data-v-2706028c="" class="dropdown-btn-flex-wrap both-style">
														<div data-v-4837bb91="" class="dropdown-btn">
															<div data-v-4837bb91="" class="button dropdown">
																<div data-v-4837bb91="" class="">기간 선택(기간이 길수록 더 많이 할인됩니다)</div>
															</div>
												<!---->
												<!-- 여기에 리스트 나옴-->
												<!---->
														</div>
													</div>
												</li>
												<li data-v-2706028c="" class="menu__date-select">
													<label data-v-2706028c="" class="menu__label only-desktop">
													시작일(수령일) 선택
													</label>
													<div data-v-2706028c="" class="date-picker-with-icon">
														<span data-v-56ae83be="" data-v-2706028c="" disabled="disabled" class="v-date-custom">
															<input data-v-2706028c="" data-v-56ae83be="" disabled="disabled" placeholder="시작일 선택" readonly="readonly" type="input" class="date-picker-input">
	<!---->															
	<!---->															
															
															<div data-v-7605e1b2="" data-v-56ae83be="" class="vc-popover-content-wrapper" style>
																	<!---->
															</div>
	<!---->															
	<!---->															
															
														</span> 
														<img data-v-2706028c="" src="/images/icon-calendar-active@3x.png"  class="date-select-calendar-icon" style="cursor: pointer;">
													</div>
												</li>
											</ul>
											<!---->
										</div>
										<div data-v-2706028c="" class="menu__price">
											<label data-v-2706028c="" class="menu__label menu__price-label">
												상품 금액 </label>
											<div data-v-2706028c="" class="menu__price-right">
												<!---->
												<div data-v-2706028c="" class="menu__price-current-price__wrapper">
													<!---->
													<div data-v-2706028c="" class="menu__price-current-price">0원
													</div>
												</div>
											</div>
										</div>
									</div>
									<!--  끝 -->	
                                                 
                            </header>
                            <nav data-v-32a18372 class="menu__button-order-body">
                                <div data-v-32a18372 class="row--v-center" style="width: 100%; flex-wrap: nowrap;">
                                    <div data-v-32a18372 class="cart-btn-wrap">
                                        <button data-v-a1c889e0 data-v-32a18372 type="button" title class="button button button--outline2" id="mobCart" style="margin-right: 5px;">
                                        	<input type="hidden" value="${detail.item_code }" id="itemCode">
											<input type="hidden" value="${detail.item_tag_main }" id="tagMain">
                                            <span data-v-a1c889e0 class="button__wrap">장바구니 담기</span>
                                        </button>
                                    </div>
                                    <div data-v-32a18372 class="purchase-btn-wrap">
                                        <button data-v-a1c889e0 data-v-32a18372 type="button" title class="button button">
                                            <span data-v-a1c889e0 class="button__wrap">주문하기</span>
                                        </button>
                                    </div>
                                </div>
                            </nav>
                        </div>
                    </div>
                    <article data-v-3ebe8eb0 data-v-32a18372 class="reco-index">
                        <header data-v-3ebe8eb0 class="row--v-center reco-index__header">
                            <div data-v-3ebe8eb0 class="col reco-title-wrap">
                                <img data-v-3ebe8eb0 src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/icon-like%402x.png"  class="reco-title-img">
                                <h2 data-v-3ebe8eb0>다른 고객들이 함께 본 상품</h2>
                            </div>
                            <nav data-v-3ebe8eb0>
                                <!--이 nav 태그 뭐에 쓰이는건 모르겠어서 생략..-->
                            </nav>
                        </header>
                   <!--  -->
                   <!--  -->
                   <!--  -->
                   <!--다른 고객들이 함께 본 상품-->
						<div class="swiper-container" >
							<div class="swiper-wrapper">
	
								<c:forEach var="item" items="${random }">
									<div class="swiper-slide">
										<input type="hidden" value="${item.itemCode }" id="itemCode">
										<input type="hidden" value="${item.tagMain }" id="tagMain">
										<ul>
											<li data-v-4c9a9e82="" class="col-6 col--lg-3">
												<article
													data-v-15082832="" data-v-4c9a9e82=""
													class="item for-loop-cloned-item-244">

													<div data-v-15082832="" class="for-loop-cloned-item-244">
														<figure data-v-15082832=""
															class="item__image for-loop-cloned-item-244">
															<div data-v-15082832=""
																class="item-badge for-loop-cloned-item-244">
																<!---->
															</div>
															<img data-v-15082832=""
																src="${item.itemImage }"
																alt="${item.itemName } " title="${item.itemName } "
																class="for-loop-cloned-item-244">
														</figure>
														<div data-v-15082832=""
															class="item__body for-loop-cloned-item-244">
															<!---->
															<strong data-v-15082832=""
																class="for-loop-cloned-item-244">${item.itemName }</strong>
															<div data-v-15082832=""
																class="for-loop-cloned-item-244 options">
																<dl data-v-15082832=""
																	class="for-loop-cloned-item-244 row--v">
																	<dd data-v-15082832="" class="for-loop-cloned-item-244">
																		<em data-v-15082832=""
																			class="for-loop-cloned-item-244"><b>${item.itemPriceM }원</b></em>~ <span
																			data-v-15082832="" class="for-loop-cloned-item-244">
																			<c:if test="${item.itemPriceMSub ne ''}">
																					${item.itemPriceMSub }
																			</c:if>
																			</span>
																	</dd>
																</dl>
															</div>
															<span data-v-15082832="" class="for-loop-cloned-item-244">${item.itemSummary }</span>
															<div data-v-15082832=""
																class="item-bottom for-loop-cloned-item-244 row--v-center row--h-between">
																<div data-v-15082832=""
																	class="for-loop-cloned-item-244 info-wrap">
																	<span data-v-15082832=""
																		class="for-loop-cloned-item-244 star-info">${item.starAvg }</span>
																	<span data-v-15082832=""
																		class="for-loop-cloned-item-244 review-info">${item.reviewCount }</span>
																</div>
																<div data-v-15082832=""
																	class="row--v-center for-loop-cloned-item-244 tag-wrap">
																	<div data-v-15082832=""
																		class="for-loop-cloned-item-244 row--v-center">
											<!-- 																		<div data-v-15082832="" -->
											<!-- 																			class="for-loop-cloned-item-244 vegi-tag md-item-vegi-tag"> -->
											<!-- 																			락토베지테리언</div> -->
																</div>
															</div>
														</div>
													</div>
												</div>
											</article>
										</li>
									</ul>
								</div>
							</c:forEach>
						</div>
					<!-- 이동을위한 div  -->
						<div id="section01"></div>  
					<!-- 네비게이션 -->
						<div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
						<div class="swiper-button-prev"></div><!-- 이전 버튼 -->
					
					<!-- 페이징 -->
						<div class="swiper-pagination"></div>
					</div>   
					<!--  --> 
					          
					<!--  -->             
					<!--  -->                        
                    </article>
                    <div data-v-32a18372 class="menu__tab">
                        <nav data-v-61e19c34 data-v-32a18372 class="menu-tab unit">
                            <div data-v-61e19c34 class="menu-tab-btn-wrap on" onclick="location.href='#section01';">
                                <button data-v-61e19c34 type="button">
                                    <span data-v-61e19c34>상품정보</span>
                                </button>
                            </div>
                            <div data-v-61e19c34 class="menu-tab-btn-wrap" onclick="location.href='#section02';">
                                <button data-v-61e19c34 type="button">
                                    <span data-v-61e19c34>상세정보</span>
                                </button>
                            </div>
                            <div data-v-61e19c34 class="menu-tab-btn-wrap" onclick="location.href='#product-info';">
                                <button data-v-61e19c34 type="button">
                                    <span data-v-61e19c34>FAQ</span>
                                </button>
                            </div>
                            <div data-v-61e19c34 class="menu-tab-btn-wrap" onclick="location.href='#section03';">
                                <button data-v-61e19c34 type="button">
                                    <span data-v-61e19c34>고객후기</span>
                                </button>
                            </div>
                            <div data-v-61e19c34 class="desktop-tab-blank">
                            </div>
                        </nav>
                    </div>
                    <div data-v-32a18372 class="menu-description-container" >
                        <div data-v-32a18372 class="menu-description">
                            <div data-v-32a18372 class="menu-description-left">
                                <div data-v-32a18372 id="menu-detail" class="menu__tab-info">
                                    <div data-v-79f00ef9 data-v-32a18372 class="menu-info">
                                        <div data-v-79f00ef9 class="detail-wrapper">
                                            <div data-v-79f00ef9 id="bundle-detail" class="detail">
                                                <div data-v-79f00ef9 class="img-wrapper">
                                                     <c:forEach var="showImage" items="${showImage }">
                                                   		<div data-v-79f00ef9 id>
                                                        	<img data-v-79f00ef9 src="${showImage }" class="img-fade">
                                                    	</div>
                                                	</c:forEach>
                                                    
<!--                                                     <div data-v-79f00ef9 class="shadow"></div> -->
                                                </div>
                                            </div>
                                            <div data-v-79f00ef9 class="more-btn">
                                                <span data-v-79f00ef9 class="more-btn-text">상품 정보 더보기</span>
                                                <img data-v-79f00ef9 src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/arrow-down-green%402x.png"  class="more-btn-arrow">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div data-v-32a18372 class="menu__tab-info delivery">
                                    <h1 data-v-32a18372 class="menu__tab-info-title delivery">
                                        배송정보
                                    </h1>
                                    <div data-v-79f00ef9 data-v-32a18372 class="menu-info">
                                        <div data-v-79f00ef9>
                                            <img data-v-79f00ef9 src="https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/content/origin/7946_20210707161730" class="img-fade">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div data-v-32a18372 class="menu-select-panel-desktop">
                                <h4 data-v-32a18372>상품 선택</h4>
                                <div data-v-2706028c data-v-32a18372 class="menu-select-panel floating-panel-default">
                                    <div data-v-2706028c class="menu__select-size" style="border-bottom: 0px;">
                                        <ul data-v-2706028c class="menu__select-size-list">
                                            <li data-v-2706028c>
                                                <div data-v-2706028c class="dropdown-btn-wrap" style="width: 100%;">
                                                    <div data-v-5b7f52e9 data-v-2706028c>
                                                        <div data-v-5b7f52e9 class="dropdown-btn">
                                                            <div data-v-5b7f52e9 class="button dropdown">
                                                                <div data-v-5b7f52e9 class="dropdown-content">
                                                                    <span data-v-5b7f52e9>선택</span>
                                                                </div>
                                                                <div data-v-5b7f52e9 class="dropdown-icon">
                                                                    <img data-v-5b7f52e9 src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/arrow-down%402x.png"  class="dropdown-icon">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                            <li data-v-2706028c class="menu-option">
                                                <div data-v-2706028c class="menu-option-wrap">
                                                    <label data-v-2706028c class="menu__label">함께 드시면 좋을 MD 추천 상품</label>
                                                    <div data-v-2706028c class="menu-option-item isDesktop">
                                                        <div data-v-2706028c class="menu-option-left">
                                                            <input data-v-2706028c class="menu-option-checkbox-508-desktop" name="menu-option-checkbox-508" type="checkbox" class="menu-option-checkbox" value="508">
                                                            <label data-v-2706028c for="menu-option-checkbox-508" class="menu-option-label">
                                                                <span data-v-2706028c class="menu-option-text">[맛꾼푸드] 아이스 엿구마 1봉</span>
                                                            </label>
                                                        </div>
                                                        <div data-v-2706028c class="meni-option-right">
                                                            3,000원
                                                        </div>
                                                    </div>
                                                    <div data-v-2706028c class="menu-option-item isDesktop">
                                                        <div data-v-2706028c class="menu-option-left">
                                                            <input data-v-2706028c class="menu-option-checkbox-508-desktop" name="menu-option-checkbox-508" type="checkbox" class="menu-option-checkbox" value="508">
                                                            <label data-v-2706028c for="menu-option-checkbox-508" class="menu-option-label">
                                                                <span data-v-2706028c class="menu-option-text">[아임얼라이브] 유기농 콤부차 4종 석류</span>
                                                            </label>
                                                        </div>
                                                        <div data-v-2706028c class="menu-option-right">
                                                            3,600원
                                                        </div>
                                                    </div>
                                                    <div data-v-2706028c class="menu-option-item isDesktop">
                                                        <div data-v-2706028c class="menu-option-left">
                                                            <input data-v-2706028c class="menu-option-checkbox-508-desktop" name="menu-option-checkbox-508" type="checkbox" class="menu-option-checkbox" value="508">
                                                            <label data-v-2706028c for="menu-option-checkbox-508" class="menu-option-label">
                                                                <span data-v-2706028c class="menu-option-text">[그릭데이] 그릭요거트 2종 시그니처 1개</span>
                                                            </label>
                                                        </div>
                                                        <div data-v-2706028c class="menu-option-right">
                                                            3,300원
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>
                                        <ul data-v-2706028c class="selected-detail-list isDesktop">
  <!--  여기에 추가되어야함  -->                                      
                                        
                                        
                                        
                                        </ul>
                                    </div>
                                    <div data-v-2706028c class="menu__price isDesktop">
                                        <label data-v-2706028c class="menu__label menu__price-label" style="width: 108px;">상품 금액</label>
                                        <div data-v-2706028c class="menu__price-right">
                                            <div data-v-2706028c class="menu__price-current-price__wrapper">
                                                <div data-v-2706028c class="menu__price-current-price">0원</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div data-v-32a18372 class="row--v-center" style="width: 100%; flex-wrap:nowrap;">
                                    <div data-v-32a18372 class="cart-btn-wrap">
                                        <button data-v-a1c889e0 data-v-32a18372 type="button" title class="button button button--outline2" id="mobCart" style="margin-right: 5px; height: 52px;">
                                        	<input type="hidden" value="${detail.item_code }" id="itemCode">
											<input type="hidden" value="${detail.item_tag_main }" id="tagMain">
                                            <span data-v-a1c889e0 class="button__wrap">장바구니 담기</span>
                                        </button>
                                    </div>
                                    <div data-v-32a18372 class="purchase-btn-wrap">
                                        <button data-v-a1c889e0 data-v-32a18372 type="button" title class="button button" style="height: 52px;">
                                            <span data-v-a1c889e0 class="button__wrap">주문하기</span>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="section02"></div>
                        <div data-v-32a18372 id="product-info">
                            <h3 data-v-32a18372 class="menu__tab-info-title menu-info">
                                <span data-v-32a18372>상품 정보 고시</span>
                                <div data-v-32a18372 class="info-title-img"></div>
                            </h3>
						<!-- <div>~~~ 생겨야됨. -->
							<div data-v-32a18372="" class="menu-info-content-wrap" id="item_info_show">
								<section data-v-32a18372="" class="menu-info-content-header">
									<img data-v-32a18372="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/Logo_close.png"
										alt="상품정보 고시 닫기 버튼" class="content-header-close">
									<h3 data-v-32a18372="" class="content-header-title">상품 정보 고시</h3>
								</section>
								<section data-v-32a18372="" class="menu-info-content-body">

									<c:if test="${detail.item_tag_main ne 100 && detail.item_tag_main ne 600 }">
										<c:forEach var="detailInfo" items="${detailInfo }">
			                      			${detailInfo }
			                      		</c:forEach>
		                      		</c:if>
		                      		<c:if test="${detail.item_tag_main eq 100 || detail.item_tag_main eq 600 }">
		                      			<c:forEach var="detailInfo2" items="${detailInfo2}">
		                      				${detailInfo2}
		                      			</c:forEach>
		                      		</c:if>
	                      		</section>
							</div>
						<!-- </div> -->
                        </div>
                        <div data-v-32a18372 id="nutrition-info">
                            <h3 data-v-32a18372 class="menu__tab-info-title menu-info">
                                <span data-v-32a18372>영양 정보 고시</span>
                                <div data-v-32a18372 class="info-title-img"></div>
                            </h3>
                            
                         <!--<div>~~~ 생겨야됨.  --> 
	                        <div data-v-32a18372="" class="menu-info-content-wrap" id="item_nut_show">
								<section data-v-32a18372="" class="menu-info-content-header">
									<img data-v-32a18372="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/Logo_close.png"
										alt="영양 정보 고시 닫기 버튼" class="content-header-close">
									<h3 data-v-32a18372="" class="content-header-title">영양 정보
										고시</h3>
								</section>
								
								<section data-v-32a18372="" class="menu-info-content-body">
									<c:if test="${detail.item_tag_main ne 100 && detail.item_tag_main ne 600 }">
										<c:forEach var="itemNut" items="${itemNut}">
		                      				${itemNut}
		                      			</c:forEach>
		                      		</c:if>
		                      		<c:if test="${detail.item_tag_main eq 100 || detail.item_tag_main eq 600 }">
		                      			<c:forEach var="detailNut" items="${detailNut}">
		                      				${detailNut}
		                      			</c:forEach>
		                      		</c:if>
	                      		</section>
	                        </div>
                        <!-- <div>-->  
                        
                        </div>
                        <div data-v-32a18372 id="faq" class="menu__tab-info tab_menu_detail" >
                            <p data-v-32a18372 class="menu__tab-info-title faq" >FAQ</p>
                            <div data-v-e3f957fc data-v-32a18372 class="menu-info-table-wrap">
                                <div data-v-e3f957fc class="menu-info-table-opener" id="section03">
                                    <div data-v-e3f957fc class="menu-info-table-title-wrapper">
                                        <img data-v-e3f957fc src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/fa-question%402x.png"  class="menu-info-table-img question">
                                        <p data-v-e3f957fc class="menu-info-table-title">[결제 안내]</p>
                                    </div>
                                    <img data-v-e3f957fc src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/arrow-down%402x.png"  class="menu-info-table-opener-arrow">
                                </div>
								<div data-v-e3f957fc="" class="menu-info-table-content-wrap review-hide"
									style="border-bottom: 1px solid rgb(233, 233, 233);">
									<div data-v-e3f957fc="" class="answer-wrapper">
										<div data-v-e3f957fc="" class="answer-column left">
											<img data-v-e3f957fc="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/fa-answer%402x.png"
												 class="menu-info-table-img answer">
										</div>
										<div data-v-e3f957fc="" class="answer-column right">
											<div data-v-e3f957fc=""
												class="menu-info-table-content-description">▶ 결제수단안내<br>
												프레시코드에서는 프코페이, PAYCO, 신용카드, kakaopay,toss,계좌이체가 가능합니다. 
												GS25 편의점 스팟으로 주문 시, toss결제수단은 사용할 수 없으니 이용에 참고 부탁 드립니다.</div>
										</div>
									</div>
								</div>
							</div>
                            <div data-v-e3f957fc data-v-32a18372 class="menu-info-table-wrap">
                                <div data-v-e3f957fc class="menu-info-table-opener">
                                    <div data-v-e3f957fc class="menu-info-table-title-wrapper">
                                        <img data-v-e3f957fc src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/fa-question%402x.png"  class="menu-info-table-img question">
                                        <p data-v-e3f957fc class="menu-info-table-title">[주문단계 안내]</p>
                                    </div>
                                    <img data-v-e3f957fc src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/arrow-down%402x.png"  class="menu-info-table-opener-arrow">
                                </div>
                                <div data-v-e3f957fc="" class="menu-info-table-content-wrap review-hide"
									style="border-bottom: 1px solid rgb(233, 233, 233);">
									<div data-v-e3f957fc="" class="answer-wrapper">
										<div data-v-e3f957fc="" class="answer-column left">
											<img data-v-e3f957fc="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/fa-answer%402x.png"
												 class="menu-info-table-img answer">
										</div>
										<div data-v-e3f957fc="" class="answer-column right">
											<div data-v-e3f957fc=""
												class="menu-info-table-content-description">▶ 일반배송 주문 과정 안내<br>
                                             1. 원하는 상품 선택.
                                             2. 희망하는 배송방법 선택.
                                             (프코스팟/퀵/새벽배송/택배배송)
                                             3.구매하고자 하는 상품 및 수량 선택.
                                             4. 유상 구매로 제공되는 일회용품 유/무 선택.
                                             5. 희망 배송 날짜 선택.
                                             6. 나의 배송지 정보 확인
                                             7. 주문자 정보 확인 후 결제.</div>
										</div>
									</div>
								</div>
                            </div>
                            <div data-v-e3f957fc data-v-32a18372 class="menu-info-table-wrap">
                                <div data-v-e3f957fc class="menu-info-table-opener">
                                    <div data-v-e3f957fc class="menu-info-table-title-wrapper">
                                        <img data-v-e3f957fc src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/fa-question%402x.png"  class="menu-info-table-img question">
                                        <p data-v-e3f957fc class="menu-info-table-title">[취소 및 환불 안내]</p>
                                    </div>
                                    <img data-v-e3f957fc src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/arrow-down%402x.png"  class="menu-info-table-opener-arrow">
                                </div>
                                <div data-v-e3f957fc class="menu-info-table-content-wrap review-hide">
                                    <div data-v-e3f957fc class="answer-wrapper">
                                       <div data-v-e3f957fc class="answer-column left">
                                          <img data-v-e3f957fc src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/fa-answer%402x.png"  class="menu-info-table-img answer">
                                       </div>
                                       <div data-v-e3f957fc class="answer-column right">
                                          <div data-v-e3f957fc class="menu-info-table-content-description">▶ 일반상품 취소 가능 시점<br>
                                             ●  점심/저녁 스팟,퀵배송은 배송 예정일 당일 오전 7시까지 홈페이지를 통해 직접 취소 가능
                                             ● 새벽/택배배송은 배송 예정일 D-1일 오후 3시까지 홈페이지를 통해 직접 취소 가능 
                                             ※ 신선식품 특성 상 주문취소시간 외 취소 및 변경 불가합니다.

                                             ▶ 고객님의 단순 변심/개인사유 포함하여 취소 요청 시, 쿠폰 사용금액 제외한 실 결제금액에서 배송 완료된 모든 상품의 정상가 차감 후 나머지만 환불 됩니다.


                                             ▶ 제품 이상이 있거나, 오배송이 된 경우 반드시 사진 촬영을 해주신 후 고객센터로 문의 남겨주세요
                                             ▶ 신선식품의 특성 상 재판매가 불가합니다. 고객님의 단순 변심 혹은 개인사유로 인해 취소 가능한 시점 이후에는 취소가 불가합니다.
                                             ▶ 고객의 부주의 혹은 잘못된 보관방법으로 인한 상품 변질은 취소 및 환불이 불가합니다.</div>
                                       </div>
                                    </div>
                                 </div>
                            </div>
                            <div data-v-e3f957fc data-v-32a18372 class="menu-info-table-wrap">
                                <div data-v-e3f957fc class="menu-info-table-opener">
                                    <div data-v-e3f957fc class="menu-info-table-title-wrapper">
                                        <img data-v-e3f957fc src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/fa-question%402x.png"  class="menu-info-table-img question">
                                        <p data-v-e3f957fc class="menu-info-table-title">[배송 안내]</p>
                                    </div>
                                    <img data-v-e3f957fc src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/arrow-down%402x.png"  class="menu-info-table-opener-arrow">
                                </div>
                                <div data-v-e3f957fc="" class="menu-info-table-content-wrap review-hide"
									style="border-bottom: 1px solid rgb(233, 233, 233);">
									<div data-v-e3f957fc="" class="answer-wrapper">
										<div data-v-e3f957fc="" class="answer-column left">
											<img data-v-e3f957fc="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/fa-answer%402x.png"
												 class="menu-info-table-img answer">
										</div>
										<div data-v-e3f957fc="" class="answer-column right">
											<div data-v-e3f957fc=""
												class="menu-info-table-content-description"> ▶ 프코스팟 배송 <br>
                                             프코스팟은 배송 장소에 따라 이용이 제한 될 수 있습니다.
                                             사전에 이용이 가능한 스팟인지 꼭 확인하시고 주문해주시길 바랍니다.
                                             
                                             ● 프라이빗 스팟 : 임직원 및 멤버 전용 (예 : 회사 및 공유오피스등)
                                             ● 퍼블릭 스팟 : 누구나 이용 가능한 스팟 (예 : gs25 및 헬스장등)
                                             
                                             최소 주문금액 6천원 이상, 배송비는 무료이며 
                                             점심배송은 오전 11시 ~ 오후 12시 30분사이 배송이며
                                             저녁배송은 오후 1시 ~ 오후5시 사이 배송 됩니다. 
                                             
                                             
                                             ▶퀵배송
                                             주변에 이용 가능한 프코스팟이 없다면 서울 전지역 점심/저녁 퀵 배송이 가능합니다.
                                             최소 주문금액 1만원 이상, 배송비는 4천원이며 4만원 이상 구매 시, 무료배송 입니다.
                                             
                                              점심배송은 12시 30분 전/후로 배송 예정되며
                                              저녁배송은 오후 1시~5시 사이 배송 됩니다.
                                             
                                             
                                             ▶새벽배송
                                             새벽배송은 00시 ~ 07시 사이 요청하신 장소로 배송이 되며
                                             새벽시간 특성 상 고객님께 별도 연락 없이, 배송완료가 되면 문자로 사진과 함께 안내 드리고 있습니다.
                                             
                                             안전한 배송을 위해 건물 출입 가능한 방법을 자세히 기재 해주셔야 하며
                                             새벽배송 가능한 지역이라도 학교/기숙사/관공서/병원/쇼핑몰/군부대등 일부 장소는 배송이 불가하며
                                             엘레베이터가 없는 6층 이상의 건물에는 1층에 대응배송을 하고 있습니다.
                                             (주소 및 출입방법을 정확히 작성하지 않아 발생한 문제에 대해서는 교환이나 환불이 불가합니다.)
                                             
                                             최소 주문금액 1만원 이상, 배송비는 3500원이며 35,000원 이상 구매 시, 무료배송 입니다.
                                             
                                             ▶택배배송
                                             제주도, 도서산간을 제외한 모든 지역이 배송이 가능하며 CJ 대한통운을 통해 배송이 됩니다.
                                             최소 주문 금액 1만원 이상 배송비는 3500원이며 35,000원 구매 시 , 무료 배송입니다.
                                             CJ대한통운을 통해 배송이 되고 있으며, 각 지역의 물량이나 동선에 따라 도착시간이 다르기 때문에 배송관련한 문의는 CJ대한통운 고객센터로 문의 부탁 드립니다. (CJ대한통운 고객센터 : 1588-1255)
												</div>
										</div>
									</div>
								</div>
                            </div>
                            <div data-v-e3f957fc data-v-32a18372 class="menu-info-table-wrap">
                                <div data-v-e3f957fc class="menu-info-table-opener">
                                    <div data-v-e3f957fc class="menu-info-table-title-wrapper">
                                        <img data-v-e3f957fc src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/fa-question%402x.png"  class="menu-info-table-img question">
                                        <p data-v-e3f957fc class="menu-info-table-title">[기타 사항(자주 묻는 질문)]</p>
                                    </div>
                                    <img data-v-e3f957fc src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/arrow-down%402x.png"  class="menu-info-table-opener-arrow">
                                </div>
                                <div data-v-e3f957fc="" class="menu-info-table-content-wrap review-hide"
									style="border-bottom: 1px solid rgb(233, 233, 233);">
									<div data-v-e3f957fc="" class="answer-wrapper">
										<div data-v-e3f957fc="" class="answer-column left">
											<img data-v-e3f957fc="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/fa-answer%402x.png"
												 class="menu-info-table-img answer">
										</div>
										<div data-v-e3f957fc="" class="answer-column right">
											<div data-v-e3f957fc=""
												class="menu-info-table-content-description">▶ 배송일 변경이 가능한가요?<br>
                                             ● 프코스팟/퀵배송은 수령일 당일 오전 7시까지 홈페이지에서 직접 변경이 가능합니다.
                                             ● 새벽배송/택배배송의 경우 배송 예정일 D-1일 오후 3시까지  홈페이지에서 직접 변경이 가능합니다.


                                             ▶ 상품변경 혹은 주문내역 변경이 가능한가요?
                                             ● 프코스팟/퀵배송의 경우 수령일 당일 오전 7시까지 고객님께서 직접 홈페이지를 통해 기존 주문건 취소 후 재주문 해주셔야 합니다.
                                             ● 새벽배송/택배배송의 경우 배송 예정일 D-1일 오후 3시까지 고객님께서 직접 홈페이지를 통해 기존 주문건 취소 후 재주문 해주셔야 합니다.

                                             ▶샐러드에 못먹는 재료가 있는데 제외 가능한가요?
                                             ●  대량으로 일괄생산하고 있어, 특정 재료나 드레싱 제외가 불가합니다.

                                             ▶ 정기배송과 일반배송 합배송이 되나요?
                                             ● 정기배송과 일반배송 상품은 합배송이 불가하며, 같은 주소지로 동시에 배송 받으시더라도 개별로 배송비가 부과 됩니다.
												</div>
										</div>
									</div>
								</div>
                            </div>
                        </div>
                    </div>
                    <div data-v-32a18372 class="menu__tab-review" id="review"
                    data-gtm-vis-first-on-screen-7693391_542="15381"
                    data-gtm-vis-total-visible-time-7693391_542="3000"
                    data-gtm-vis-has-fired-7693391_542="1">
                        <a data-v-32a18372 href="#" class>
                            <div data-v-32a18372 class="menu__tab-review-banner"></div>
                        </a>
                        <div data-v-f8b893b0="" data-v-32a18372="" class="menu-review">
                            <section data-v-f8b893b0="" class="menu-review__album">
                                <h3 data-v-f8b893b0="" class="menu-review__album-title">
                                  고객 후기 사진 (13)
                                </h3>
                                <div data-v-f8b893b0="" class="images">
                                  <div data-v-f8b893b0="">
                                     <span id="carousel_prev_nj8u0ztnu9d" style=""></span>
                                     <div id="carousel_ola7225lcr9"
                                        class="owl-carousel owl-theme owl-loaded">
                                        <div class="owl-stage-outer">
                                           <div class="owl-stage"
                                              style="transform: translate3d(-1224px, 0px, 0px); transition: all 0s ease 0s; width: 5100px;">
                                              <div class="owl-item cloned"
                                                 style="width: 180px; margin-right: 24px;">
                                                 <div data-v-f8b893b0="" class="images__image">
                                                    <a data-v-f8b893b0="" href="#"><i
                                                       data-v-f8b893b0="" id="7"
                                                       style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44177_20220120123659&quot;);"></i></a>
                                                 </div>
                                              </div>
                                              <div class="owl-item cloned"
                                                 style="width: 180px; margin-right: 24px;">
                                                 <div data-v-f8b893b0="" class="images__image">
                                                    <a data-v-f8b893b0="" href="#"><i
                                                       data-v-f8b893b0="" id="8"
                                                       style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44178_20220120123659&quot;);"></i></a>
                                                 </div>
                                              </div>
                                              <div class="owl-item cloned"
                                                 style="width: 180px; margin-right: 24px;">
                                                 <div data-v-f8b893b0="" class="images__image">
                                                    <a data-v-f8b893b0="" href="#"><i
                                                       data-v-f8b893b0="" id="9"
                                                       style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44144_20220120071145&quot;);"></i></a>
                                                 </div>
                                              </div>
                                              <div class="owl-item cloned"
                                                 style="width: 180px; margin-right: 24px;">
                                                 <div data-v-f8b893b0="" class="images__image">
                                                    <a data-v-f8b893b0="" href="#"><i
                                                       data-v-f8b893b0="" id="10"
                                                       style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44145_20220120071145&quot;);"></i></a>
                                                 </div>
                                              </div>
                                              <div class="owl-item cloned"
                                                 style="width: 180px; margin-right: 24px;">
                                                 <div data-v-f8b893b0="" class="images__image">
                                                    <a data-v-f8b893b0="" href="#"><i
                                                       data-v-f8b893b0="" id="11"
                                                       style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44112_20220119135334&quot;);"></i></a>
                                                 </div>
                                              </div>
                                              <div class="owl-item cloned"
                                                 style="width: 180px; margin-right: 24px;">
                                                 <div data-v-f8b893b0="" class="images__image">
                                                    <a data-v-f8b893b0="" href="#"><i
                                                       data-v-f8b893b0="" id="12"
                                                       style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44090_20220119113045&quot;);"></i></a>
                                                 </div>
                                              </div>
                                              <div class="owl-item active"
                                                 style="width: 180px; margin-right: 24px;">
                                                 <div data-v-f8b893b0="" class="images__image">
                                                    <a data-v-f8b893b0="" href="#"><i
                                                       data-v-f8b893b0="" id="0"
                                                       style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44381_20220124003124&quot;);"></i></a>
                                                 </div>
                                              </div>
                                              <div class="owl-item active"
                                                 style="width: 180px; margin-right: 24px;">
                                                 <div data-v-f8b893b0="" class="images__image">
                                                    <a data-v-f8b893b0="" href="#"><i
                                                       data-v-f8b893b0="" id="1"
                                                       style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44382_20220124003124&quot;);"></i></a>
                                                 </div>
                                              </div>
                                              <div class="owl-item active"
                                                 style="width: 180px; margin-right: 24px;">
                                                 <div data-v-f8b893b0="" class="images__image">
                                                    <a data-v-f8b893b0="" href="#"><i
                                                       data-v-f8b893b0="" id="2"
                                                       style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44324_20220122204821&quot;);"></i></a>
                                                 </div>
                                              </div>
                                              <div class="owl-item active"
                                                 style="width: 180px; margin-right: 24px;">
                                                 <div data-v-f8b893b0="" class="images__image">
                                                    <a data-v-f8b893b0="" href="#"><i
                                                       data-v-f8b893b0="" id="3"
                                                       style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44276_20220121141048&quot;);"></i></a>
                                                 </div>
                                              </div>
                                              <div class="owl-item active"
                                                 style="width: 180px; margin-right: 24px;">
                                                 <div data-v-f8b893b0="" class="images__image">
                                                    <a data-v-f8b893b0="" href="#"><i
                                                       data-v-f8b893b0="" id="4"
                                                       style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44231_20220121072316&quot;);"></i></a>
                                                 </div>
                                              </div>
                                              <div class="owl-item active"
                                                 style="width: 180px; margin-right: 24px;">
                                                 <div data-v-f8b893b0="" class="images__image">
                                                    <a data-v-f8b893b0="" href="#"><i
                                                       data-v-f8b893b0="" id="5"
                                                       style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44232_20220121072316&quot;);"></i></a>
                                                 </div>
                                              </div>
                                              <div class="owl-item"
                                                 style="width: 180px; margin-right: 24px;">
                                                 <div data-v-f8b893b0="" class="images__image">
                                                    <a data-v-f8b893b0="" href="#"><i
                                                       data-v-f8b893b0="" id="6"
                                                       style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44194_20220120145825&quot;);"></i></a>
                                                 </div>
                                              </div>
                                              <div class="owl-item"
                                                 style="width: 180px; margin-right: 24px;">
                                                 <div data-v-f8b893b0="" class="images__image">
                                                    <a data-v-f8b893b0="" href="#"><i
                                                       data-v-f8b893b0="" id="7"
                                                       style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44177_20220120123659&quot;);"></i></a>
                                                 </div>
                                              </div>
                                              <div class="owl-item"
                                                 style="width: 180px; margin-right: 24px;">
                                                 <div data-v-f8b893b0="" class="images__image">
                                                    <a data-v-f8b893b0="" href="#"><i
                                                       data-v-f8b893b0="" id="8"
                                                       style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44178_20220120123659&quot;);"></i></a>
                                                 </div>
                                              </div>
                                              <div class="owl-item"
                                                 style="width: 180px; margin-right: 24px;">
                                                 <div data-v-f8b893b0="" class="images__image">
                                                    <a data-v-f8b893b0="" href="#"><i
                                                       data-v-f8b893b0="" id="9"
                                                       style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44144_20220120071145&quot;);"></i></a>
                                                 </div>
                                              </div>
                                              <div class="owl-item"
                                                 style="width: 180px; margin-right: 24px;">
                                                 <div data-v-f8b893b0="" class="images__image">
                                                    <a data-v-f8b893b0="" href="#"><i
                                                       data-v-f8b893b0="" id="10"
                                                       style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44145_20220120071145&quot;);"></i></a>
                                                 </div>
                                              </div>
                                              <div class="owl-item"
                                                 style="width: 180px; margin-right: 24px;">
                                                 <div data-v-f8b893b0="" class="images__image">
                                                    <a data-v-f8b893b0="" href="#"><i
                                                       data-v-f8b893b0="" id="11"
                                                       style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44112_20220119135334&quot;);"></i></a>
                                                 </div>
                                              </div>
                                              <div class="owl-item"
                                                 style="width: 180px; margin-right: 24px;">
                                                 <div data-v-f8b893b0="" class="images__image">
                                                    <a data-v-f8b893b0="" href="#"><i
                                                       data-v-f8b893b0="" id="12"
                                                       style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44090_20220119113045&quot;);"></i></a>
                                                 </div>
                                              </div>
                                              <div class="owl-item cloned"
                                                 style="width: 180px; margin-right: 24px;">
                                                 <div data-v-f8b893b0="" class="images__image">
                                                    <a data-v-f8b893b0="" href="#"><i
                                                       data-v-f8b893b0="" id="0"
                                                       style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44381_20220124003124&quot;);"></i></a>
                                                 </div>
                                              </div>
                                              <div class="owl-item cloned"
                                                 style="width: 180px; margin-right: 24px;">
                                                 <div data-v-f8b893b0="" class="images__image">
                                                    <a data-v-f8b893b0="" href="#"><i
                                                       data-v-f8b893b0="" id="1"
                                                       style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44382_20220124003124&quot;);"></i></a>
                                                 </div>
                                              </div>
                                              <div class="owl-item cloned"
                                                 style="width: 180px; margin-right: 24px;">
                                                 <div data-v-f8b893b0="" class="images__image">
                                                    <a data-v-f8b893b0="" href="#"><i
                                                       data-v-f8b893b0="" id="2"
                                                       style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44324_20220122204821&quot;);"></i></a>
                                                 </div>
                                              </div>
                                              <div class="owl-item cloned"
                                                 style="width: 180px; margin-right: 24px;">
                                                 <div data-v-f8b893b0="" class="images__image">
                                                    <a data-v-f8b893b0="" href="#"><i
                                                       data-v-f8b893b0="" id="3"
                                                       style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44276_20220121141048&quot;);"></i></a>
                                                 </div>
                                              </div>
                                              <div class="owl-item cloned"
                                                 style="width: 180px; margin-right: 24px;">
                                                 <div data-v-f8b893b0="" class="images__image">
                                                    <a data-v-f8b893b0="" href="#"><i
                                                       data-v-f8b893b0="" id="4"
                                                       style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44231_20220121072316&quot;);"></i></a>
                                                 </div>
                                              </div>
                                              <div class="owl-item cloned"
                                                 style="width: 180px; margin-right: 24px;">
                                                 <div data-v-f8b893b0="" class="images__image">
                                                    <a data-v-f8b893b0="" href="#"><i
                                                       data-v-f8b893b0="" id="5"
                                                       style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44232_20220121072316&quot;);"></i></a>
                                                 </div>
                                              </div>
                                           </div>
                                        </div>
                                        <div class="owl-nav">
                                           <div class="owl-prev">next</div>
                                           <div class="owl-next">prev</div>
                                        </div>
                                        <div class="owl-dots disabled"></div>
                                     </div>
                                     <span id="carousel_next_tc5wlekmakl"></span>
                                  </div>
                               </div>
                            </section>
                            <section data-v-f8b893b0="" class="menu-review__rating">
                               <div data-v-f8b893b0="" class="wrap">
                                  <h3 data-v-f8b893b0="">고객 후기</h3>
                                  <div data-v-f8b893b0=""
                                     class="row--v-center review-box-wrapper">
                                     <div data-v-f8b893b0="" class="review-stars">
                                        <img data-v-f8b893b0="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/icon_star_full%402x.png" class="review-stars-star">
                                        <img data-v-f8b893b0="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/icon_star_full%402x.png" class="review-stars-star">
                                        <img data-v-f8b893b0="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/icon_star_full%402x.png" class="review-stars-star">
                                        <img data-v-f8b893b0="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/icon_star_full%402x.png" class="review-stars-star">
                                        <img data-v-f8b893b0="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/icon_star_half%402x.png" class="review-stars-star">
                                     </div>
                                     <div data-v-f8b893b0="" class="review-rating-counts">
                                        ${avgCount.starAvg }(후기 ${avgCount.reviewCount})</div>
                                  </div>
                               </div>
                            </section>
                            <section data-v-f8b893b0="" class="menu-review__index">
                               <ul data-v-f8b893b0="">
                               
                               
                               
	                               	  <c:forEach var="board" items="${boardList }">
		                               	  <li data-v-22105fb8="" data-v-f8b893b0="" class="review-item">
		                                     <div data-v-22105fb8="" class="review-item__head">
		                                        <div data-v-22105fb8="" class="head-rating">
		                                           <img data-v-22105fb8=""
		                                              src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/icon_star_full%402x.png" 
		                                              class="rating-img">
		                                           <div data-v-22105fb8="" class="rating-count">${board.star }</div>
		                                        </div>
		                                        <div data-v-22105fb8="" class="head-summary">
		                                           <div data-v-22105fb8="" class="head-summary-left">
		                                              <img data-v-22105fb8="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/pics%402x.png"
		                                                  class="summary-photo">
		                                              <div data-v-22105fb8="" class="summary-text">${board.content }</div>
		                                           </div>
		                                           <!---->
		                                        </div>
		                                        <div data-v-22105fb8="" class="head-text">
		                                           <div data-v-22105fb8="" class="text-name">${board.user_name }</div>
		                                           <div data-v-22105fb8="" class="text-date">${fn:substring(board.write_date, 0, 10)}</div>
		                                        </div>
		                                     </div>
		                                     <div data-v-22105fb8=""
		                                        class="review-desktop-toggle review-hide">
		                                        <div data-v-22105fb8="" class="review-item__body">
		                                           <div data-v-22105fb8="" class="review-item__comment">${board.content }</div>
		                                           <div data-v-22105fb8="" class="review-item__photos">
		                                              <div data-v-22105fb8="" class="review-item__photo-wrap">
		                                                 <div data-v-22105fb8="" class="review-item__photo"
		                                                    style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44381_20220124003124&quot;);"></div>
		                                              </div>
		                                              <div data-v-22105fb8="" class="review-item__photo-wrap">
		                                                 <div data-v-22105fb8="" class="review-item__photo"
		                                                    style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44382_20220124003124&quot;);"></div>
		                                              </div>
		                                           </div>
		                                        </div>
		                                        <!---->
		                                     </div>
		                                  </li>
	                                  </c:forEach>
												
                                  <li data-v-22105fb8="" data-v-f8b893b0="" class="review-item">
                                     <div data-v-22105fb8="" class="review-item__head">
                                        <div data-v-22105fb8="" class="head-rating">
                                           <img data-v-22105fb8=""
                                              src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/icon_star_full%402x.png" 
                                              class="rating-img">
                                           <div data-v-22105fb8="" class="rating-count">5</div>
                                        </div>
                                        <div data-v-22105fb8="" class="head-summary">
                                           <div data-v-22105fb8="" class="head-summary-left">
                                              <img data-v-22105fb8="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/pics%402x.png"
                                                  class="summary-photo">
                                              <div data-v-22105fb8="" class="summary-text">점심에
                                                 간단히 먹으려고 샌드위치 하나랑 샐러드 두개 오는 정기배송 시켜서 먹어봤는데 너무 맛있어요. 배송도
                                                 꼼꼼히 안전하게 잘 오고 잘 시킨것 같아요</div>
                                           </div>
                                           <!---->
                                        </div>
                                        <div data-v-22105fb8="" class="head-text">
                                           <div data-v-22105fb8="" class="text-name">안*율</div>
                                           <div data-v-22105fb8="" class="text-date">2022. 01.
                                              24.</div>
                                        </div>
                                     </div>
                                     <div data-v-22105fb8=""
                                        class="review-desktop-toggle review-hide">
                                        <div data-v-22105fb8="" class="review-item__body">
                                           <div data-v-22105fb8="" class="review-item__comment">점심에
                                              간단히 먹으려고 샌드위치 하나랑 샐러드 두개 오는 정기배송 시켜서 먹어봤는데 너무 맛있어요. 배송도
                                              꼼꼼히 안전하게 잘 오고 잘 시킨것 같아요</div>
                                           <div data-v-22105fb8="" class="review-item__photos">
                                              <div data-v-22105fb8="" class="review-item__photo-wrap">
                                                 <div data-v-22105fb8="" class="review-item__photo"
                                                    style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44381_20220124003124&quot;);"></div>
                                              </div>
                                              <div data-v-22105fb8="" class="review-item__photo-wrap">
                                                 <div data-v-22105fb8="" class="review-item__photo"
                                                    style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44382_20220124003124&quot;);"></div>
                                              </div>
                                           </div>
                                        </div>
                                        <!---->
                                     </div>
                                  </li>
                                  <li data-v-22105fb8="" data-v-f8b893b0="" class="review-item"><div
                                        data-v-22105fb8="" class="review-item__head">
                                        <div data-v-22105fb8="" class="head-rating">
                                           <img data-v-22105fb8=""
                                              src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/icon_star_full%402x.png" 
                                              class="rating-img">
                                           <div data-v-22105fb8="" class="rating-count">5</div>
                                        </div>
                                        <div data-v-22105fb8="" class="head-summary">
                                           <div data-v-22105fb8="" class="head-summary-left">
                                              <img data-v-22105fb8="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/pics%402x.png"
                                                  class="summary-photo">
                                              <div data-v-22105fb8="" class="summary-text">정말
                                                 맛있어요 자주시켜먹어요 ㅎ 정기배송이라 신경쓸게없엉ᆢㄷ</div>
                                           </div>
                                           <!---->
                                        </div>
                                        <div data-v-22105fb8="" class="head-text">
                                           <div data-v-22105fb8="" class="text-name">허*수</div>
                                           <div data-v-22105fb8="" class="text-date">2022. 01.
                                              22.</div>
                                        </div>
                                     </div>
                                     <div data-v-22105fb8=""
                                        class="review-desktop-toggle review-hide">
                                        <div data-v-22105fb8="" class="review-item__body">
                                           <div data-v-22105fb8="" class="review-item__comment">
                                              정말 맛있어요<br>자주시켜먹어요 ㅎ<br>정기배송이라 신경쓸게없엉ᆢㄷ
                                           </div>
                                           <div data-v-22105fb8="" class="review-item__photos">
                                              <div data-v-22105fb8="" class="review-item__photo-wrap">
                                                 <div data-v-22105fb8="" class="review-item__photo"
                                                    style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44324_20220122204821&quot;);"></div>
                                              </div>
                                           </div>
                                        </div>
                                        <!---->
                                     </div></li>
                                     <!-- 댓글 내용 열 시 추가 되어야 할 클래스 이름 :  review-item__head 부분에 border-bottom-desktop-show -->
                                     <!-- 댓글 내용 열 시 사라져야 할 클래스 이름 : review-desktop-toggle 부분에 review-hide -->
                                     <!-- 댓글 내용 닫을 시 사라져야 할 클래스 이름 :  review-item__head 부분에 border-bottom-desktop-show -->
                                     <!-- 댓글 내용 닫을 시 추가 되어야 할 클래스 이름 : review-desktop-toggle 부분에 review-hide -->
                                   
                               </ul>
                               <div data-v-20ad18c6="" data-v-f8b893b0=""
                                  class="nav-paginate-wrap">
                                  <div data-v-20ad18c6="" class="nav-paginate-wrap__mobile">
                                     <nav data-v-43f58a9c="" data-v-20ad18c6="" class="nav-paginate">
                                        <ul class="btn-group pagination">
										    <c:if test="${pageMaker.prev }">
											    <li>
											<%--         <a href='<c:url value="/detail.do?page=${pageMaker.startPage-1 }"/>'> --%>
														 <a data-v-43f58a9c="" href='detail.do?page=${pageMaker.startPage-1 }&itemCode01=${detail.item_code}&tagMain01=${detail.item_tag_main}'>
											        <i class="fa fa-chevron-left"><img data-v-43f58a9c class="nav-arrow arrow-left" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_arrow_left(s).png"></i>
											        </a>
											    </li>
										    </c:if>
										    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
											    <li>
											<%--         <a href='<c:url value="/detail.do?page=${pageNum }"/>'> --%>
													<a data-v-43f58a9c="" href="detail.do?page=${pageNum }&itemCode01=${detail.item_code}&tagMain01=${detail.item_tag_main}">
											        <i class="fa">${pageNum }  </i> 
											        </a>
											    </li>
										    </c:forEach>
										    <c:if test="${pageMaker.next && pageMaker.endPage >0 }">
											    <li>
											<%--         <a href='<c:url value="/detail.do?page=${pageMaker.endPage+1 }"/>'> --%>
														 <a data-v-43f58a9c="" href='detail.do?page=${pageMaker.endPage+1 }&itemCode01=${detail.item_code}&tagMain01=${detail.item_tag_main}'>
											        <i class="fa fa-chevron-right"><img data-v-43f58a9c class="nav-arrow arrow-right" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_arrow_right(s).png"></i>
											        </a>
											    </li>
										    </c:if>
										</ul>
                                     </nav>
                                  </div>
                                  <div data-v-20ad18c6 class="nav-paginate-wrap__desktop">
                                     <nav data-v-43f58a9c data-v-20ad18c6 class="nav-paginate">
<!--                                         <a data-v-43f58a9c href="#" class="nav-paginate__dir nav-paginate-dir-prev" style="opacity: 0.2;"> -->
<!--                                             <img data-v-43f58a9c src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/arrow-left%402x.png"  class="nav-arrow arrow-left"> -->
<!--                                         </a> -->
										<ul class="btn-group pagination">
										    <c:if test="${pageMaker.prev }">
											    <li>
											<%--         <a href='<c:url value="/detail.do?page=${pageMaker.startPage-1 }"/>'> --%>
														 <a data-v-43f58a9c="" href='detail.do?page=${pageMaker.startPage-1 }&itemCode01=${detail.item_code}&tagMain01=${detail.item_tag_main}'>
											        <i class="fa fa-chevron-left"><img data-v-43f58a9c class="nav-arrow arrow-left" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_arrow_left(s).png"></i>
											        </a>
											    </li>
										    </c:if>
										    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
											    <li>
											<%--         <a href='<c:url value="/detail.do?page=${pageNum }"/>'> --%>
													<a data-v-43f58a9c="" href="detail.do?page=${pageNum }&itemCode01=${detail.item_code}&tagMain01=${detail.item_tag_main}">
											        <i class="fa">${pageNum }  </i> 
											        </a>
											    </li>
										    </c:forEach>
										    <c:if test="${pageMaker.next && pageMaker.endPage >0 }">
											    <li>
											<%--         <a href='<c:url value="/detail.do?page=${pageMaker.endPage+1 }"/>'> --%>
														 <a data-v-43f58a9c="" href='detail.do?page=${pageMaker.endPage+1 }&itemCode01=${detail.item_code}&tagMain01=${detail.item_tag_main}'>
											        <i class="fa fa-chevron-right"><img data-v-43f58a9c class="nav-arrow arrow-right" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_arrow_right(s).png"></i>
											        </a>
											    </li>
										    </c:if>
										</ul>
<!--                                         <a data-v-43f58a9c="" href="#" class="nav-paginate__dir nav-paginate-dir-next" style="opacity: 1;"> -->
<!--                                            <img data-v-43f58a9c src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/arrow-right%402x.png"  class="nav-arrow arrow-right"> -->
<!--                                         </a> -->
                                     </nav>
                                  </div>
                               </div>
                            </section>
                            <!---->
                         </div>
                    </div>
                    <div data-v-32a18372="" class="notify-register-modal">
                    <!---->
                    </div>
                </article>
            </div>
        </div>
        <footer class="footer" data-v-438b4fe4 data-v-0f5971ec>
            <div class="footer__wrap" data-v-438b4fe4 >
               <h2 class="footer--logo" data-v-438b4fe4>
                  <img class="footer-logo" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/02.png" alt="SALAD:IT" data-v-438b4fe4> 
                  <div data-v-438b4fe4></div>
               </h2> 
               <div class="footer__body" data-v-438b4fe4>
                  <nav class="footer__menus" data-v-438b4fe4>
                     <div class="footer__menus-item" data-v-438b4fe4>
                        <a href="#" data-v-438b4fe4>FAQ</a> 
                        <a href="/terms" data-v-438b4fe4>이용약관</a> 
                        <a href="/privacy" data-v-438b4fe4>개인정보처리방침</a>
                     </div> 
                     <div class="footer__menus-item" data-v-438b4fe4>
                        <a href="#" data-v-438b4fe4>제휴문의</a> 
                        <a href="#" data-v-438b4fe4>채용문의</a> 
                        <a href="#" data-v-438b4fe4>케이터링 문의</a>
                     </div>
                  </nav> 
                  <address class="footer__cs" data-v-438b4fe4>
                     <h3 data-v-438b4fe4>프코고객센터</h3> 
                     <div class="cs-time" data-v-438b4fe4>
                        <div class="btn-channel-talk" data-v-438b4fe4>1:1 문의하기</div> 
                        <div class="cs-time__inner" data-v-438b4fe4>
                           <div data-v-438b4fe4>
                              <div id="sa04" class="cs-time-text" data-v-438b4fe4>
                                 <b data-v-438b4fe4>평일</b> 
                                 <p data-v-438b4fe4>9:00 - 18:00 (점심시간 13:00 - 14:00)</p>
                              </div> 
                              <div id="sa03" class="cs-time-text" data-v-438b4fe4>
                                 <b data-v-438b4fe4>토요일</b> 
                                 <p data-v-438b4fe4>9:00 - 13:00
                                          <span data-v-438b4fe4> (홈페이지 채팅문의만 운영)</span>
                                       </p>
                                    </div>
                                 </div> 
                                 <div data-v-438b4fe4>
                                    <div class="cs-time-text" data-v-438b4fe4>
                                       <b data-v-438b4fe4>공휴일</b> 
                                       <p data-v-438b4fe4>휴무</p>
                                    </div> 
                                    <div class="cs-time-text" data-v-438b4fe4>
                                       <b data-v-438b4fe4>고객센터</b> 
                                       <p data-v-438b4fe4>1644-4559</p>
                                    </div>
                                 </div>
                              </div>
                              
                           </div>
                        </address> 
                        <address class="footer__address hide" data-v-438b4fe4>
                           <p data-v-438b4fe4><b data-v-438b4fe4>대표</b>정유석</p> 
                           <p data-v-438b4fe4><b data-v-438b4fe4>주소</b> <span data-v-438b4fe4>서울특별시 성동구 왕십리로 115, 헤이그라운드 서울숲점 7층</span></p> 
                           <p data-v-438b4fe4><b data-v-438b4fe4>사업자등록번호</b>883-81-00307</p> 
                           <p data-v-438b4fe4><b data-v-438b4fe4>통신판매업신고</b>제 2016-서울용산-00657</p>
                        </address> 
                        <address class="footer__address help hide" data-v-438b4fe4>
                           <p data-v-438b4fe4><b data-v-438b4fe4>제휴문의</b><a href="mailto:biz@freshcode.me" data-v-438b4fe4>biz@freshcode.me</a></p> 
                           <p data-v-438b4fe4><b data-v-438b4fe4>카카오ID</b><a href="#" data-v-438b4fe4>@프레시코드-freshcode</a></p> 
                           <p data-v-438b4fe4><b data-v-438b4fe4>단체주문문의</b><a href="mailto:order@freshcode.me" data-v-438b4fe4>order@freshcode.me</a></p>
                        </address> 
                        <aside class="footer__side" data-v-438b4fe4>
                           <p class="footer__copyright hide" data-v-438b4fe4>
                         ⓒ 2020. FreshCode, Inc. All Rights Reserved<br data-v-438b4fe4>프레시코드가
                         제공하는 UI/UX, 프로그램, 콘텐츠, 디자인 등은 특허법, 저작권법,
                         부정경쟁방지법 등에 의해 보호 받고 있습니다.<br data-v-438b4fe4>무단 복제, 유사한
                         변형, 사용 등에 대하여는 법적 책임이 있음을 알려드립니다.
                       </p> 
                       <div class="footer__sns-wrap" data-v-438b4fe4>
                          <nav class="footer__sns" data-v-438b4fe4>
                             <img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/instagram%402x.png" title="instagram" data-v-438b4fe4>
                             <img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/facebook%402x.png" title="facebook" data-v-438b4fe4>
                             <img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/youtube%403x.png" title="youtube" data-v-438b4fe4>
                             <img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/group-21%402x.png" title="blog" data-v-438b4fe4>
                             <img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/blog-post%402x.png" title="Naver post" data-v-438b4fe4>
                             <img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/kakao-channel%402x.png" title="kakao channel" data-v-438b4fe4>
                          </nav>
                       </div>
                       
                   </aside>
               </div>
               
            </div>
            
         </footer>
         
    </div>
    	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
	<script>
// 슬라이드 이미지 용
	new Swiper('.swiper-container', {
	
		slidesPerView : 4, // 동시에 보여줄 슬라이드 갯수
		spaceBetween : 30, // 슬라이드간 간격
		slidesPerGroup : 4, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음
	
		// 그룹수가 맞지 않을 경우 빈칸으로 메우기
		// 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
		loopFillGroupWithBlank : true,
	
		loop : true, // 무한 반복
	
		pagination : { // 페이징
			el : '.swiper-pagination',
			clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
		},
		navigation : { // 네비게이션
			nextEl : '.swiper-button-next', // 다음 버튼 클래스명
			prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
		},
	});
	</script>
    
</body>
</html>