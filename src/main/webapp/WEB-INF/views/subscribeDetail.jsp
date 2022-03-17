<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path"
	value="${pageContext.request.contextPath}/resources/subscribeDetail" />
<!DOCTYPE html>
<html class="">
<head>
<style>
.gm-style-moc {
	background-color: rgba(0, 0, 0, 0.45);
	pointer-events: none;
	text-align: center;
	transition: opacity ease-in-out
}

.gm-style-mot {
	color: white;
	font-family: Roboto, Arial, sans-serif;
	font-size: 22px;
	margin: 0;
	position: relative;
	top: 50%;
	transform: translateY(-50%);
	-webkit-transform: translateY(-50%);
	-ms-transform: translateY(-50%)
}
</style>
<style>
.gm-style img {
	max-width: none;
}

.gm-style {
	font: 400 11px Roboto, Arial, sans-serif;
	text-decoration: none;
}
</style>

<title>프레시코드 - 프리미엄 샐러드 배달 서비스</title>
<meta data-n-head="ssr" charset="utf-8">
<meta data-n-head="ssr" name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1.0, minimal-ui, viewport-fit=cover, user-scalable=no">
<meta data-n-head="ssr" data-hid="subject" name="subject"
	content="프레시코드 - 프리미엄 샐러드 배달 서비스">
<meta data-n-head="ssr" data-hid="author" name="author"
	content="https://www.freshcode.me">
<meta data-n-head="ssr" data-hid="og:type" property="og:type"
	content="website">
<meta data-n-head="ssr" data-hid="og:site_name" property="og:site_name"
	content="프레시코드 - 프리미엄 샐러드 배달 서비스">
<meta data-n-head="ssr" data-hid="fb:app_id" property="fb:app_id"
	content="323001348061168">

<link data-n-head="ssr" rel="icon" type="image/x-icon"
	href="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_leaf.png"
	sizes="16x16">
<link data-n-head="ssr" rel="icon" type="image/x-icon"
	href="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_leaf.png"
	sizes="24x24">
<link data-n-head="ssr" rel="icon" type="image/x-icon"
	href="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_leaf.png"
	sizes="32x32">
<link data-n-head="ssr" rel="icon" type="image/x-icon"
	href="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_leaf.png"
	sizes="57x57">
<link data-n-head="ssr" rel="icon" type="image/x-icon"
	href="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_leaf.png"
	sizes="120x120">
<link data-n-head="ssr" rel="icon" type="image/x-icon"
	href="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_leaf.png"
	sizes="152x152">
<link data-n-head="ssr" rel="icon" type="image/x-icon"
	href="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_leaf.png"
	sizes="196x196">

<!-- for slide -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>

<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
   <link rel="stylesheet" href="${path }/style.css">
   <link rel="stylesheet" href="${path }/style2.css">
   <script type="text/javascript">
   function page_move(tagNum){
	   var f = document.paging; //폼 name
	   f.tagMain01.value = tagNum; //POST방식으로 넘기고 싶은 값
	   f.action="tapPage.do";//이동할 페이지
	   f.method="post";//POST방식
	   f.submit();
	}
   
   $(document).on('click', '#closeFinalCheck', function(){
		$('.swal2-container').attr('class', 'swal2-container swal2-center swal2-backdrop-hide');
		$('.swal2-popup').attr('swal2-popup swal2-modal swal2-icon-info swal2-hide');
		setTimeout(function() {
			$('.swal2-container').detach();
		}, 100);
	})
	
	$(document).on('click', '.swal2-container.swal2-center.swal2-backdrop-show', function(e){
		if (!$(e.target).hasClass("swal2-popup") && !$(e.target).hasClass("swal2-header") && !$(e.target).hasClass("swal2-content") && !$(e.target).hasClass("swal2-actions")
				&& !$(e.target).hasClass("swal2-icon") && !$(e.target).hasClass("swal2-icon-content") && !$(e.target).hasClass("swal2-html-container")) {
			$('.swal2-container').attr('class', 'swal2-container swal2-center swal2-backdrop-hide');
			$('.swal2-popup').attr('swal2-popup swal2-modal swal2-icon-info swal2-hide');
			setTimeout(function() {
				$('.swal2-container').detach();
			}, 100);
		}
	});


	$(document).on('click', '#sideEvent', function(){
		$(location).attr("href", "event.do");
	});
	
	$(document).on('click', '#sideBasket', function(){
		$(location).attr("href", "basket.do");
	})
	
	$(document).on('click', '.header__toggle-button', function(){
		$('html').attr('class', 'mode-popup');
		$.ajax({
			url : 'sideMune.do',
			dataType : 'html',
			success : function(htmlOut){
				$('#header-area').after(htmlOut);
			}
		})
	});
	$(document).on('click', '.side-nav__overlay', function(e){
		if (!$(e.target).hasClass(".side-nav__wrap")) {
			$('.side-nav').attr('class', 'side-nav side-nav-leave-active side-nav-leave-to');
			$('html').removeClass('mode-popup');
			setTimeout(function() {
				$('.side-nav').detach();
			}, 350);
		}
	});
   

	 
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
		$(document).on('click','.dropdown-btn.click',function(event){			
			// 해당 페이지의 아이템 코드를 가져옴 ( 전에썻던거 그냥 써봄 )
			//alert("1.드랍다운 클릭");
			var code =$('.itemCode').attr('value');	
			var tag = $('.tagMain').attr('value');
			var str ="";
			if($('.dropdown-btn,click').hasClass('dropdown-open')){
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
					context : this,
					success : function(htmlOut){
						str += "<ul data-v-5b7f52e9='' class='toggle-drop-down'>";
						str += htmlOut;
						str += "</ul>";
						$(this).append(str);
						
					}
				}); // ajax 끝								
			} //else 끝
			$('.dropdown-btn').toggleClass('dropdown-open');
			$('')
		}); // 드롭 다운 끝

// 드롭 다운 아이템 클릭
		$(document).on('click','.detail-name-and-badge',function(){
		//alert("2.드랍다운 아이템 클릭");
			// 선택한 주를 text에 표기
			$('.dropdown-btn.click').children().children().first().addClass('selected-content');
			$('.dropdown-btn.click:eq(0)').children().children().first().text($(this).text());
			$('.dropdown-btn.click:eq(1)').children().children().first().text($(this).text());

			var week = $(this).text();
			var selectedWeek = Number(week.replace('주', '').replace(',', ''));
			$('.setWeek').val(selectedWeek);
			//alert("몇주? : "+ selectedWeek);
			// 선택한 주를 숫자로 표시.
			
			// M 가격 
			var subPriceM = $('.subPrcieM').val(); 
			subPriceM = Number(subPriceM.replace('원', '').replace(',', ''));
			//alert('M가격 : '+subPriceM);
			// M 할인전 가격
			var subPriceM_Sub = $('.subPrcieM_Sub').val();
			subPriceM_Sub = Number(subPriceM_Sub.replace('원', '').replace(',', ''));
			//alert("M할인전 가격 :"+subPriceM_Sub);
			
			// L 가격 
			var subPriceL = $('.subPrcieL').val(); 
			subPriceL = Number(subPriceL.replace('원', '').replace(',', ''));
			//alert('L가격 : '+subPriceL);
			// L 할인전 가격
			var subPriceL_Sub = $('.subPrcieL_Sub').val();
			subPriceL_Sub = Number(subPriceL_Sub.replace('원', '').replace(',', ''));
			//alert("L할인전 가격 :"+subPriceL_Sub);
			
			// 사이즈 불러오기
			var size = $('.setSize').val();

	//미디움 클릭후 가격 셋팅		
			if(size =='Medium'){ 			
				//alert("미디움일때");
				$('.setPrice').val(subPriceM);
				var setPrice = $('.setPrice').val();
				var totalPrice = setPrice*selectedWeek;
				$('.setTotal').val(totalPrice);
				
				$('.setPriceSub').val(subPriceM_Sub);
				var setPriceSub = $('.setPriceSub').val();
				var totalPriceSub = setPriceSub*selectedWeek;
				$('.setTotalSub').val(totalPriceSub);
			
				//alert("주당 가격 : "+setPrice+"주당 할인전 가격 : "+setPriceSub+" 몇주 : "+selectedWeek+" 총 합계 : "+totalPrice);
			
	// 라지 클릭후 가격 셋팅					
			}else if(size =="Large"){							
				//alert("라지일때");
				$('.setPrice').val(subPriceL);
				var setPrice = $('.setPrice').val();
				var totalPrice = setPrice*selectedWeek;
				$('.setTotal').val(totalPrice);
				
				$('.setPriceSub').val(subPriceL_Sub);
				var setPriceSub = $('.setPriceSub').val();
				var totalPriceSub = setPriceSub*selectedWeek;
				$('.setTotalSub').val(totalPriceSub);
				
				//alert("주당 가격 : "+setPrice+"주당 할인전 가격 : "+setPriceSub+" 몇주 : "+selectedWeek+" 총 합계 : "+totalPrice);
				
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
		$(document).on('click','.date-picker-input',function(){
			alert("달력클릭");
			// css 변경을 원본 홈피와 그대로 하겠다.

			
			var test = "test";
			
			if($('.vc-popover-content-wrapper').hasClass('is-interactive')){
				alert("달력 있다");
// 				$('div').detach('.vc-popover-content-wrapper:eq(1)'); // 이름이 같아서 2번째인 달력을 detach
// 				$('div').detach('.vc-popover-content-wrapper:eq(2)');
				$('div #cal').remove();


				$('.vc-popover-content-wrapper').removeClass('is-interactive');
				$('.vc-popover-content-wrapper').removeAttr('style'); //스타일을 다지워줌
			}else{	
				alert("달력 없음");
				$.ajax({
					url : 'calendar.do',
					type : 'post',
					datatype : 'html',
					data : {
						"test" : test
					},
					success : function(htmlOut){
						$('.vc-popover-content-wrapper').append(htmlOut);
						$('.vc-popover-content-wrapper').addClass('is-interactive')
						$(".vc-popover-content-wrapper").css({
							'position': 'absolute',
							'transform': 'translate3d(0px, -279px, 0px)', 
							'top': '0px', 
							'left': '0px', 
							'will-change': 'transform'
						    });
						
					}
				}); // ajax 끝		
				
			} // if문 끝
			$('.vc-text-gray-400').attr("disabled", disabled);
	
		});// 날짜 선택 클릭 끝

// 날짜 선택
		$(document).on('click','.vc-day-content',function(){
			alert("날짜 클릭");
			$('div #cal').remove();
			$('.vc-popover-content-wrapper').removeClass('is-interactive');
			
			//가격
			var price = $('.setPrice').val();
			var priceSub = $('.setPriceSub').val();				
			//이름
			var name = $('.menu__name').text();
			//사이즈
			var size = $('.setSize').val();
			//몇주
			var week = $('.setWeek').val();
			//날짜
			var setDate = $(this).attr('aria-label');
			$('.startDate').val(setDate);
			var start = $('.startDate').val();
			
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
			
			$("<div data-v-2706028c ></div>").insertBefore(".menu__price-current-price__wrapper").addClass('menu__price-prior-price');
			$('.menu__price-prior-price').text(priceSub);
			$('.menu__price-current-price').text(price+"원");

	// disable
// 			// 사품금액 표기까지 같이묶여져서 다 토글클래스때리고 상품금액은 다시해서 disabled를 막았다.
			$('.menu__label').toggleClass('disabled-style');
			$('.menu__label').attr("disabled", 'disabled');
			$('.menu__label.menu__price-label').toggleClass('disabled-style');
			$('.menu__label.menu__price-label').attr("disabled", 'disabled');
			// M / L 버튼 disabled
			$('.row--v-center.radio-label').toggleClass('disabled-style');
			$('.row--v-center.radio-label').attr("disabled", 'disabled');
			$('.row--v-center').toggleClass('disabled-style');
			$('.row--v-center').attr("disabled", 'disabled');
			$('.form-radio').toggleClass('form-radio--disabled');
			$('.form-radio').attr("disabled", 'disabled');
			$('.radio-side-text').toggleClass('disabled-style');
			$('.radio-side-text').attr("disabled", 'disabled');
			// 원하는주 disable
			$('.dropdown-btn-flex-wrap').toggleClass('disabled');
			// 달력 disabled
			$('.date-picker-input').attr("disabled", 'disabled');
			
		
		});
		
// 구독 상세명서 삭제 버튼		
		$(document).on('click','.selected-detail__close',function(){
			alert("삭제버튼");
		// 기간 선택 원위치
			$('.selected-detail-wrap').detach();
			$('.dropdown-btn.click:eq(0)').children().children().first().text("기간 선택(기간이 길수록 더많이 할인됩니다)");
			$('.dropdown-btn.click:eq(1)').children().children().first().text("기간 선택(기간이 길수록 더많이 할인됩니다)");
		// 현재 저장되어있는 값 초기화.
			var nothing ="";
			$('.setPrice').val(nothing);
			$('.setSize').val(nothing);
			$('.setTotal').val(nothing);
			$('.startDate').val(nothing);
			
		// 가격 원위치
			
			$('.menu__price-prior-price').remove();
			$('.menu__price-current-price').text("0원");
		
		
			// disable
// 			// 사품금액 표기까지 같이묶여져서 다 토글클래스때리고 상품금액은 다시해서 disabled를 막았다.
			$('.menu__label').toggleClass('disabled-style');
			$('.menu__label').attr("disabled", 'disabled');
			$('.menu__label.menu__price-label').toggleClass('disabled-style');
			$('.menu__label.menu__price-label').attr("disabled", 'disabled');
			// M / L 버튼 disabled
			$('.row--v-center.radio-label').toggleClass('disabled-style');
			$('.row--v-center.radio-label').attr("disabled", 'disabled');
			$('.row--v-center').toggleClass('disabled-style');
			$('.row--v-center').attr("disabled", 'disabled');
			$('.form-radio').toggleClass('form-radio--disabled');
			$('.form-radio').attr("disabled", 'disabled');
			$('.radio-side-text').toggleClass('disabled-style');
			$('.radio-side-text').attr("disabled", 'disabled');
			// 원하는주 disable
			$('.dropdown-btn-flex-wrap').toggleClass('disabled');
			// 달력 disabled
			$('.date-picker-input').attr("disabled", 'disabled');
			
			
		})
		
// 식단확인 및 변경 클릭
		$(document).on('click','.selected-detail__btn',function(){
			alert("식단변경");
			var price = $('.setPrice').val();	// 총 가격
			var size = $('.setSize').val();		// 사이즈
			var start = $('.startDate').val();	// 시작일
			var week = $('.setWeek').val();		// 총 주
			var code = $('.itemCode').val();	// 아이템 코드
			var tag = $('.tagMain').val();
			// 요일은 컨트롤러에서 자르자.
			
			$.ajax({
	//			alert("ajax 들어옴");
				url : 'modal.do',
				type : 'post',
				dataType : 'html',
				data :{
					'price' : price,
					'size' : size,
					'start' : start,
					'week' : week,
					'code' : code,
					'tag' : tag
				},
				success : function(htmlOut){
					alert("성공");
					$('html').attr('class', 'mode-popup');
					$('.menu').append(htmlOut);
					$('.item-text:eq(0)').parent().addClass('selected');
				}
			});// ajax 끝
			
		})
		
// 모달창 닫기
		$(document).on('click','.button--outline4',function(){
			alert("닫기");
			$('.modal').detach();
			if($('html').hasClass('mode-popup')){
				$('html').removeClass('mode-popup');
			}
		})

// 몇주째 클릭 으로 초록색 바탕 보이고 나타내기 
		$(document).on('click','.item-text',function(){
			//alert("주 클릭");
			$('.item-wrap.selected').removeClass('selected');
			$(this).parent().addClass('selected');
			


		})

// 모달창 드랍다운 클릭

// 		$(document).on('click','.menu-select-wrap__list .dropdown-btn',function(){
// //			alert("모달 버튼 클릭");
// 			var code = $('.itemCode').val();	// 아이템 코드
// //			alert("넘어온 코드"+code);
// 			var tag = $('.tagMain').val();
// //			alert("넘어온 태그"+tag);
			
			
// 			$.ajax({
// 				url : 'modalList.do',
// 				type : 'post',
// 				dataType : 'html',
// 				data :{
// 					"tag" : tag,
// 					"code" : code
// 				},
// 				context : this,
// 				success : function(htmlOut){
// 					alert("ajax성공");
// 					$(this).attr('class','dropdown-btn dropdown-open');
// 					$(this).children().append(htmlOut);
					
// 				},
// 				error:function(){
// 			        alert("에러");
// 			       }

// 			});// ajax 끝
			
			
			
// 		});	

		
// 상품 이미지 더보기
		$(document).on('click','.more-btn',function(){
			$(this).prev().children().toggleClass('img-wrapper');
					
		});	
		
		// nav바 클릭시 스크롤이동
		$(document).on('click','.menu-tab-btn-wrap',function(){
			var text = $(this).children().children().text();
			if(text =="상품정보"){
				var location = document.querySelector(".menu-description-container").offsetTop;
				window.scrollTo({top:location-150, behavior:'smooth'});
				$(this).siblings().removeClass('on');
				$(this).addClass('on');
			}else if(text =="상세정보"){  
				var location = document.querySelector("#product-info").offsetTop;
				window.scrollTo({top:location-180, behavior:'smooth'});
				$(this).siblings().removeClass('on');
				$(this).addClass('on');
			}else if(text == "FAQ"){
				var location = document.querySelector("#faq").offsetTop;
				window.scrollTo({top:location-220, behavior:'smooth'});
				$(this).siblings().removeClass('on');
				$(this).addClass('on');
			}else if(text == "고객후기"){
				var location = document.querySelector("#ClientReview").offsetTop;
				window.scrollTo({top:location-220, behavior:'smooth'});
				$(this).siblings().removeClass('on');
				$(this).addClass('on');
			}
		})
		
// 스크롤 이동시 nav 바 변경
	   $(document).ready(function(){
			var menu =$('.menu-tab-btn-wrap');
			var contents = $('.navBar');
			$(window).scroll(function(){
				var scltop = $(window).scrollTop();
				$.each(contents, function(idx,item){
					var target = contents.eq(idx);
					var i = target.index();
					var targetTop = target.offset().top;
					if (targetTop-265 <= scltop) {
			  			menu.removeClass('on');
			  			menu.eq(idx).addClass('on');
			  		}
			  		if (!(600 <= scltop)) {
			  			menu.removeClass('on');
			  		}
				})		
			})
		});s

     }); //function 끝

    </script>

</head>
<body>
	<noscript data-n-head="ssr" data-hid="gtm-noscript" data-pbody="true">
		<iframe src="https://www.googletagmanager.com/ns.html?id=GTM-WWVZF4F&"
			height="0" width="0" style="display: none; visibility: hidden"
			title="gtm"></iframe>
	</noscript>
	<div id="__nuxt">
		<div id="__layout">
			<main class="viewport" data-v-0f5971ec="">
				<header data-v-7aa1f9b4="" data-v-1739428d="" id="header-area"
					class="header">
					<div data-v-7aa1f9b4="" class="header-banner-wrap">
						<!---->
					</div>
					<form name="paging">
						<input type="hidden" name="tagMain01" value="">
					</form>
					<div data-v-7aa1f9b4="" id="header__body" class="header__body">
						<div data-v-7aa1f9b4="" class="header__top">
							<a data-v-7aa1f9b4="" href="/info" class="header__top-left"></a>
							<div data-v-7aa1f9b4="" class="header__top-right">

								<c:choose>
									<c:when test="${empty member.gender}">
										<a href="signup.do" data-v-30697495="">회원가입</a>
										<a data-v-30697495="" href="login.do">로그인</a>
									</c:when>
									<c:otherwise>
										<a href="myPayInfo.do" id="nickname" data-v-30697495>${member.name }
											<span data-v-30697495>님</span>
										</a>
									</c:otherwise>
								</c:choose>
								<span data-v-7aa1f9b4="">1:1문의</span> <a data-v-7aa1f9b4=""
									href="https://forms.gle/92o1ctx6U4CYe2yF9" target="_blank">B2B
									신청</a>
							</div>
						</div>
						<!---->
						<div data-v-7aa1f9b4="" class="header__logo">
							<a data-v-7aa1f9b4="" href="main.do" class="nuxt-link-active"></a>
							<!---->
						</div>
<!--                input hidden 태그 -->
<!--                input hidden 태그 -->
<!--                input hidden 태그 -->
				<input type="hidden" class="setPrice" value="">
				<input type="hidden" class="setPriceSub" value="">
				<input type="hidden" class="setSize" value="">
				<input type="hidden" class="setTotal" value="">
				<input type="hidden" class="setTotalSub" value="">
				<input type="hidden" class="startDate" value="">
				<input type="hidden" class="setWeek" value="">
				<input type="hidden" value="${detail.item_code }" class="itemCode">
				<input type="hidden" value="${detail.item_tag_main }" class="tagMain">
			
<!--                input hidden 태그 -->
<!--                input hidden 태그 -->
<!--                input hidden 태그 -->	
						<nav data-v-7aa1f9b4="" class="header__menus">
							<div data-v-7aa1f9b4="">
								<div data-v-7aa1f9b4="" class="dropdown">
									<span data-v-7aa1f9b4="" class="item">전체 카테고리</span>
									<div data-v-7aa1f9b4="" class="dropdown">
										<ul data-v-7aa1f9b4="">
											<li data-v-7aa1f9b4=""><a data-v-7aa1f9b4=""
												href="javascript:page_move(0);" class=""> 전체보기 </a></li>
											<li data-v-7aa1f9b4=""><a data-v-7aa1f9b4=""
												href="javascript:page_move(200);" class=""> 샐러드 </a></li>
											<li data-v-7aa1f9b4=""><a data-v-7aa1f9b4=""
												href="javascript:page_move(100);" class="new"> 정기구독 </a></li>
											<li data-v-7aa1f9b4=""><a data-v-7aa1f9b4=""
												href="javascript:page_move(300);" class="new"> 샌드위치·랩 </a></li>
											<li data-v-7aa1f9b4=""><a data-v-7aa1f9b4=""
												href="javascript:page_move(400);" class="new"> 도시락·간편식 </a></li>
											<li data-v-7aa1f9b4=""><a data-v-7aa1f9b4=""
												href="javascript:page_move(500);" class=""> 죽·스프 </a></li>
											<li data-v-7aa1f9b4=""><a data-v-7aa1f9b4=""
												href="javascript:page_move(600);" class="new"> 세트상품 </a></li>
											<li data-v-7aa1f9b4=""><a data-v-7aa1f9b4=""
												href="javascript:page_move(700);" class="new"> 간식 </a></li>
											<li data-v-7aa1f9b4=""><a data-v-7aa1f9b4=""
												href="javascript:page_move(800);" class="new"> 음료 </a></li>
											<li data-v-7aa1f9b4=""><a data-v-7aa1f9b4=""
												href="javascript:page_move(1);" class="new"> 초코베리머치 </a></li>
										</ul>
									</div>
								</div>
								<a data-v-7aa1f9b4="" href="javascript:page_move(100);" class="item">정기구독 </a>
								<a data-v-7aa1f9b4="" href="javascript:page_move(200);" class="item">샐러드 </a>
								<a data-v-7aa1f9b4="" href="javascript:page_move(300);" class="item">샌드위치·랩 </a>
								<a data-v-7aa1f9b4="" href="javascript:page_move(1);" class="item">초코베리머치 </a>
								<a data-v-7aa1f9b4="" href="event.do" class="item">이벤트 </a>
								<a data-v-7aa1f9b4="" href="/fcospot" class="item">프코스팟 </a>
							</div>
							<div data-v-7aa1f9b4="" class="header__menus-side">
								<a data-v-7aa1f9b4="" href="search.do" class="search-logo">
									<img data-v-7aa1f9b4="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_search_gray.PNG" class="search-logo-img" style="width: 30px; height: 30px;">
									<div data-v-7aa1f9b4="">검색</div>
								</a> 
								<a data-v-7aa1f9b4="" href="basket.do" class="cart-logo-wrap item">
									<div data-v-7aa1f9b4=""  class="cart-logo empty"><!----></div> <!---->
									 장바구니 
								</a> 
								<a data-v-7aa1f9b4="" href="order.do" class="item">
									<div data-v-7aa1f9b4="" class="icon-order"></div>
									바로주문 
								</a>
							</div>
						</nav>
						<div data-v-7aa1f9b4="" class="header__side">
							<a data-v-7aa1f9b4="" href="search.do" class="search-logo"><img data-v-7aa1f9b4="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_search_gray.PNG" class="search-logo-img" style="width: 30px; height: 30px;"></a> 
								<a data-v-7aa1f9b4="" href="basket.do" class="cart-logo-wrap item">
									<div style="width: 24px; height: 24px;" data-v-7aa1f9b4="" class="cart-logo empty">
										<!---->
									</div>
								</a>
							<nav data-v-7aa1f9b4="" class="header__toggle-button">
								<button data-v-7aa1f9b4="" type="button">
									<img data-v-7aa1f9b4="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_menu.PNG" style="width: 30px; height: 30px;">
								</button>
							</nav>
						</div>
					</div>
					<!---->
					<!---->
					<!---->
					<!---->
				</header>
				<div class="container" data-v-0f5971ec="" value="${detail.item_code }">
					<div data-v-32a18372="" data-v-0f5971ec="" class="menu__container">
						<article data-v-32a18372="" class="menu">
							<div data-v-32a18372="" id="menu__head" class="menu__head">
								<figure class="menu__image">
									<div class="menu-badge"></div>
									<img src="${detail.item_image }" >
								</figure>
								<div data-v-32a18372="" class="menu__body">
									<header data-v-32a18372="" class="menu__header">
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
													<span class="review-count"> ★★★★${avgCount.starAvg }(후기 ${avgCount.reviewCount}) </span>
												</div>
											</div>
										</div>
										<div data-v-32a18372="" class="price-wrap">
											<b>${detail.item_price_m }원 </b>
											<c:if test="${detail.item_price_m_sub !='' }">
												<b>~</b>
												<del>${detail.item_price_m_sub }원</del>
											</c:if>
										</div>
										<ul data-v-32a18372 class="menu-detail">
											${detail.item_explain }
											<!-- 택배 배송 일때 -->
											<c:if test="${tagSub == 102}">
												<li data-v-32a18372="" class="menu-detail__deliveryType">
													<div data-v-32a18372=""
														class="menu-detail__deliveryType-text">
														<label data-v-32a18372="" class="menu__label">배송
															방법</label>
														<div data-v-32a18372="" class="menu-text-wrap">
															<span data-v-32a18372="" class="menu__text"
																style="color: rgb(74, 144, 226);"> 택배배송 <span
																data-v-32a18372="" class="menu__sub-text">
																	(도서산간지역 제외) </span>
															</span> <span data-v-32a18372="" class="subs-desc-bold">오전
																8시까지 주문 시 당일 발송</span> <span data-v-32a18372=""
																class="subs-desc">화요일부터 토요일까지 배송됩니다.</span>
														</div>
													</div>
												</li>
											</c:if>
											<!-- 새벽 배송 일때 -->
											<c:if test="${tagSub == 101 }">
												<li data-v-32a18372="" class="menu-detail__deliveryType">
													<div data-v-32a18372=""
														class="menu-detail__deliveryType-text">
														<label data-v-32a18372="" class="menu__label">배송
															방법</label>
														<div data-v-32a18372="" class="menu-text-wrap">
															<span data-v-32a18372="" class="menu__text"
																style="color: rgb(46, 58, 130);"> 새벽배송 <span
																data-v-32a18372="" class="menu__sub-text"> (서울
																	전체, 경기/인천 일부) </span>
															</span> <span data-v-32a18372="" class="subs-desc-bold">밤
																12시 - 새벽 7시 이내 도착</span> <span data-v-32a18372=""
																class="subs-desc">월요일부터토요일까지 배송됩니다.</span>
														</div>
													</div>
												</li>
											</c:if>
										</ul>
										<!---->
										<div data-v-2706028c="" data-v-32a18372=""
											class="menu-select-panel">
											<div data-v-2706028c="" class="menu__select-size">
												<ul data-v-2706028c="" class="menu__select-size-list normal">
													<li data-v-2706028c="" class="menu__options"><label
														data-v-2706028c="" class="menu__label">사이즈 선택</label>
														<div data-v-2706028c="" class="row--v-center">
															<!--  -->
															<c:if test="${ empty detail.item_price_l  }">
																<div data-v-2706028c=""
																	class="row--v-center radio-label">
																	<label data-v-3f971378="" data-v-2706028c=""
																		class="form-radio"> <input data-v-3f971378=""
																		id="Medium" type="radio" name="menu-sizeboth"
																		class="form-radio-input" value="Medium"> <span
																		data-v-3f971378="" class="form-radio-circle"> <i
																			data-v-3f971378="" class="form-radio-circle-interior"></i>
																	</span> Medium
																	</label> <label data-v-2706028c="" for="Medium"
																		class="radio-side-text">Medium</label>
																</div>
															</c:if>
															<c:if test="${ not empty detail.item_price_l }">
																<div data-v-2706028c=""
																	class="row--v-center radio-label">
																	<label data-v-3f971378="" data-v-2706028c=""
																		class="form-radio"> <input data-v-3f971378=""
																		id="Medium" type="radio" name="menu-sizeboth"
																		class="form-radio-input" value="Medium"> <span
																		data-v-3f971378="" class="form-radio-circle"> <i
																			data-v-3f971378="" class="form-radio-circle-interior"></i>
																	</span> Medium
																	</label> <label data-v-2706028c="" for="Medium"
																		class="radio-side-text">Medium</label>
																</div>
																<div data-v-2706028c=""
																	class="row--v-center radio-label">
																	<label data-v-3f971378="" data-v-2706028c=""
																		class="form-radio"> <input data-v-3f971378=""
																		id="Large" type="radio" name="menu-sizeboth"
																		class="form-radio-input" value="Large"> <span
																		data-v-3f971378="" class="form-radio-circle"> <i
																			data-v-3f971378="" class="form-radio-circle-interior"></i>
																	</span> Medium
																	</label> <label data-v-2706028c="" for="Large"
																		class="radio-side-text">Large</label>
																</div>
															</c:if>

														</div></li>
													<li data-v-2706028c="" class="menu__period-select"><label
														data-v-2706028c="" class="menu__label only-desktop">기간
															선택</label>
														<div data-v-4837bb91="" data-v-2706028c=""
															class="dropdown-btn-flex-wrap both-style">
															<div data-v-4837bb91="" class="dropdown-btn click">
																<div data-v-4837bb91="" class="button dropdown">
																	<div data-v-4837bb91="" class="">
																		기간 선택(기간이 길수록 더많이 할인됩니다)
																	</div>
																	
																</div>
																<!---->
															</div>
														</div></li>
													<li data-v-2706028c="" class="menu__date-select">
														<label data-v-2706028c="" class="menu__label only-desktop">시작일(수령일) 선택</label>
														<div data-v-2706028c="" class="date-picker-with-icon">
															<span data-v-56ae83be="" data-v-2706028c="" disabled="disabled" class="v-date-custom">
																<input data-v-2706028c="" data-v-56ae83be="" disabled="disabled" placeholder="시작일 선택" readonly="readonly" type="input" class="date-picker-input">
																<div data-v-7605e1b2="" data-v-56ae83be=""class="vc-popover-content-wrapper">
																	<!---->
																</div>
															</span> 
															<img data-v-2706028c="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon-calendar.png" class="date-select-calendar-icon" style="cursor: pointer;">
														</div>
													</li>
												</ul>
												<!---->
											</div>
											<div data-v-2706028c="" class="menu__price">
												<label data-v-2706028c="" class="menu__label menu__price-label"> 상품 금액 </label>
												<div data-v-2706028c="" class="menu__price-right">
													<!---->
													<div data-v-2706028c="" class="menu__price-current-price__wrapper">
														<!---->
														<div data-v-2706028c="" class="menu__price-current-price">0원</div>
													</div>
												</div>
											</div>
										</div>
									</header>
									<nav data-v-32a18372="" class="menu__button-order-body">
										<div data-v-32a18372="" class="row--v-center" style="width: 100%; flex-wrap: nowrap;">
											<!---->
											<div data-v-32a18372="" class="purchase-btn-wrap" style="width: 100%;">
												<button data-v-a1c889e0="" data-v-32a18372="" type="button" title="" class="button button">
													<span data-v-a1c889e0="" class="button__wrap" id="sub">구독하기</span>
												</button>
											</div>
										</div>
										<div data-v-32a18372="" class="morning-delivery-wrap">
											<svg data-v-32a18372="" version="1.1" xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" viewBox="0 0 512 512" xml:space="preserve">
												<g data-v-32a18372="">
													<path data-v-32a18372="" fill="currentColor"
														d="M256,0C153.755,0,70.573,83.182,70.573,185.426c0,126.888,165.939,313.167,173.004,321.035
											               c6.636,7.391,18.222,7.378,24.846,0c7.065-7.868,173.004-194.147,173.004-321.035C441.425,83.182,358.244,0,256,0z M256,278.719
											               c-51.442,0-93.292-41.851-93.292-93.293S204.559,92.134,256,92.134s93.291,41.851,93.291,93.293S307.441,278.719,256,278.719z">
	                								</path>
                								</g>
                							</svg>
											<div data-v-32a18372="">새벽배송 가능지역 조회</div>
											
										</div>
									</nav>
								</div>
							</div>
							                    <article data-v-3ebe8eb0 data-v-32a18372 class="reco-index">
                        <header data-v-3ebe8eb0 class="row--v-center reco-index__header">
                            <div data-v-3ebe8eb0 class="col reco-title-wrap">
                                <img data-v-3ebe8eb0 src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_like.png"  class="reco-title-img">
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
						<div class="swiper-container">
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
							<div data-v-32a18372="" class="menu__tab">
								<nav data-v-61e19c34="" data-v-32a18372="" class="menu-tab unit">
									<div data-v-61e19c34="" class="menu-tab-btn-wrap on">
										<button data-v-61e19c34="" type="button">
											<span data-v-61e19c34="">상품정보</span>
										</button>
									</div>
									<div data-v-61e19c34="" class="menu-tab-btn-wrap">
										<button data-v-61e19c34="" type="button">
											<span data-v-61e19c34="">상세정보</span>
										</button>
									</div>
									<div data-v-61e19c34="" class="menu-tab-btn-wrap">
										<button data-v-61e19c34="" type="button">
											<span data-v-61e19c34="">FAQ</span>
										</button>
									</div>
									<div data-v-61e19c34="" class="menu-tab-btn-wrap">
										<button data-v-61e19c34="" type="button">
											<span data-v-61e19c34="">고객후기</span>
										</button>
									</div>
									<div data-v-61e19c34="" class="desktop-tab-blank"></div>
								</nav>
							</div>
							<div data-v-32a18372="" class="menu-description-container navBar">
								<div data-v-32a18372 class="menu-description">
									<div data-v-32a18372 class="menu-description-left">
										<div data-v-32a18372 id="menu-detail" class="menu__tab-info">
											<div data-v-79f00ef9 data-v-32a18372 class="menu-info">
												<div data-v-79f00ef9 class="detail-wrapper">
													<div data-v-79f00ef9 id="bundle-detail" class="detail">
														<div data-v-79f00ef9 class="img-wrapper">
															<c:forEach var="showImage" items="${showImage }">
																<div data-v-79f00ef9 id>
																	<img data-v-79f00ef9 src="${showImage }"
																		class="img-fade">
																</div>
															</c:forEach>

															<!--                                                     <div data-v-79f00ef9 class="shadow"></div> -->
														</div>
													</div>
													<div data-v-79f00ef9 class="more-btn">
														<span data-v-79f00ef9 class="more-btn-text">상품 정보 더보기</span> 
														<img data-v-79f00ef9 src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_arrow_down(green).png" class="more-btn-arrow">
													</div>
												</div>
											</div>
										</div>
										<div data-v-32a18372 class="menu__tab-info delivery">
											<h1 data-v-32a18372 class="menu__tab-info-title delivery">
												배송정보</h1>
											<div data-v-79f00ef9 data-v-32a18372 class="menu-info">
												<div data-v-79f00ef9>
													<img data-v-79f00ef9 src="https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/content/origin/7946_20210707161730" class="img-fade">
												</div>
											</div>
										</div>
									</div>
									<div data-v-32a18372="" class="menu-select-panel-desktop">
										<h4 data-v-32a18372="">상품 선택</h4>
										<div data-v-2706028c="" data-v-32a18372=""
											class="menu-select-panel floating-panel-default">
											<div data-v-2706028c="" class="menu__select-size"
												style="border-bottom: 0px;">
												<ul data-v-2706028c="" class="menu__select-size-list normal">
													<li data-v-2706028c="" class="menu__options">
														<label data-v-2706028c="" class="menu__label" style="width: 108px;">사이즈 선택</label>
														<div data-v-2706028c="" class="row--v-center">
															<div data-v-2706028c="" class="row--v-center radio-label">
																<label data-v-3f971378="" data-v-2706028c="" class="form-radio">
																	<input data-v-3f971378="" id="Medium" type="radio" name="menu-sizedesktop" class="form-radio-input" value="Medium"> 
																	<span data-v-3f971378="" class="form-radio-circle">
																		<i data-v-3f971378="" class="form-radio-circle-interior"></i>
																	</span>
																	Medium 
																</label> 
																<label data-v-2706028c="" for="Medium" class="radio-side-text">Medium</label>
															</div>
															<div data-v-2706028c="" class="row--v-center radio-label">
																<label data-v-3f971378="" data-v-2706028c="" class="form-radio">
																<input data-v-3f971378="" id="Large" type="radio" name="menu-sizedesktop" class="form-radio-input" value="Large"> 
																	<span data-v-3f971378="" class="form-radio-circle">
																		<i data-v-3f971378="" class="form-radio-circle-interior"></i>
																	</span>
																	Medium 
																</label> 
																<label data-v-2706028c="" for="Large" class="radio-side-text">Large</label>
															</div>
														</div>
													</li>
													<li data-v-2706028c="" class="menu__period-select">
														<!---->
														<div data-v-4837bb91="" data-v-2706028c="" class="dropdown-btn-flex-wrap">
															<div data-v-4837bb91="" class="dropdown-btn click">
																<div data-v-4837bb91="" class="button dropdown">
																	<div data-v-4837bb91="" class="">기간 선택(기간이 길수록 더 많이 할인됩니다)</div>
																</div>
																<!---->
															</div>
														</div>
													</li>
													<li data-v-2706028c="" class="menu__date-select">
														<!---->
														<div data-v-2706028c="" class="date-picker-with-icon">
															<span data-v-56ae83be="" data-v-2706028c="" disabled="disabled" class="v-date-custom">
																<input data-v-2706028c="" data-v-56ae83be="" disabled="disabled" placeholder="시작일 선택" readonly="readonly" type="input" class="date-picker-input">
																<div data-v-7605e1b2="" data-v-56ae83be="" class="vc-popover-content-wrapper">
																	<!---->
																
																</div>
															</span> 
															<img data-v-2706028c="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon-calendar.png" class="date-select-calendar-icon" style="cursor: pointer;">
														</div>
													</li>
												</ul>
												<!---->
											</div>
											<div data-v-2706028c="" class="menu__price isDesktop">
												<label data-v-2706028c="" class="menu__label menu__price-label" style="width: 108px;"> 상품 금액 </label>
												<div data-v-2706028c="" class="menu__price-right">
													<!---->
													<div data-v-2706028c="" class="menu__price-current-price__wrapper">
														<!---->
														<div data-v-2706028c="" class="menu__price-current-price">0원</div>
													</div>
												</div>
											</div>
										</div>
										<div data-v-32a18372="" class="row--v-center" style="width: 100%; flex-wrap: nowrap;">
											<!---->
											<div data-v-32a18372="" class="purchase-btn-wrap" style="width: 100%;">
												<button data-v-a1c889e0="" data-v-32a18372="" type="button" title="" class="button button" style="height: 52px;">
													<span data-v-a1c889e0="" class="button__wrap">구독하기</span>
												</button>
											</div>
										</div>
									</div>
								</div>


								<div id="section02"></div>
								<div data-v-32a18372 id="product-info" class="navBar">
									<h3 data-v-32a18372 class="menu__tab-info-title menu-info">
										<span data-v-32a18372>상품 정보 고시</span>
										<div data-v-32a18372 class="info-title-img"></div>
									</h3>
									<!-- <div>~~~ 생겨야됨. -->
									<div data-v-32a18372="" class="menu-info-content-wrap" id="item_info_show">
										<section data-v-32a18372="" class="menu-info-content-header">
											<img data-v-32a18372="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/Logo_close.png" class="content-header-close">
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
											<img data-v-32a18372="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/Logo_close.png" class="content-header-close">
											<h3 data-v-32a18372="" class="content-header-title">영양 정보 고시</h3>
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

								<div data-v-32a18372="" id="faq" class="menu__tab-info tab_menu_detail navBar" style="">
									<p data-v-32a18372="" class="menu__tab-info-title faq">FAQ</p>
									<div data-v-e3f957fc data-v-32a18372 class="menu-info-table-wrap">
										<div data-v-e3f957fc class="menu-info-table-opener" id="section03">
											<div data-v-e3f957fc class="menu-info-table-title-wrapper">
												<img data-v-e3f957fc src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_question.png" class="menu-info-table-img question">
												<p data-v-e3f957fc class="menu-info-table-title">[결제 안내]</p>
											</div>
											<img data-v-e3f957fc src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_arrow_down_s.png" class="menu-info-table-opener-arrow">
										</div>
										<div data-v-e3f957fc="" class="menu-info-table-content-wrap review-hide" style="border-bottom: 1px solid rgb(233, 233, 233);">
											<div data-v-e3f957fc="" class="answer-wrapper">
												<div data-v-e3f957fc="" class="answer-column left">
													<img data-v-e3f957fc="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_answer.png"class="menu-info-table-img answer">
												</div>
												<div data-v-e3f957fc="" class="answer-column right">
													<div data-v-e3f957fc="" class="menu-info-table-content-description">
														▶ 결제수단안내<br> 프레시코드에서는 프코페이, PAYCO, 신용카드,
														kakaopay,toss,계좌이체가 가능합니다. GS25 편의점 스팟으로 주문 시, toss결제수단은
														사용할 수 없으니 이용에 참고 부탁 드립니다.
													</div>
												</div>
											</div>
										</div>
									</div>
									<div data-v-e3f957fc data-v-32a18372 class="menu-info-table-wrap">
										<div data-v-e3f957fc class="menu-info-table-opener">
											<div data-v-e3f957fc class="menu-info-table-title-wrapper">
												<img data-v-e3f957fc src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_question.png" class="menu-info-table-img question">
												<p data-v-e3f957fc class="menu-info-table-title">[주문단계 안내]</p>
											</div>
											<img data-v-e3f957fc src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_arrow_down_s.png"class="menu-info-table-opener-arrow">
										</div>
										<div data-v-e3f957fc="" class="menu-info-table-content-wrap review-hide" style="border-bottom: 1px solid rgb(233, 233, 233);">
											<div data-v-e3f957fc="" class="answer-wrapper">
												<div data-v-e3f957fc="" class="answer-column left">
													<img data-v-e3f957fc="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_answer.png" class="menu-info-table-img answer">
												</div>
												<div data-v-e3f957fc="" class="answer-column right">
													<div data-v-e3f957fc="" class="menu-info-table-content-description">
														▶ 일반배송 주문 과정 안내<br> 1. 원하는 상품 선택. 2. 희망하는 배송방법 선택.
														(프코스팟/퀵/새벽배송/택배배송) 3.구매하고자 하는 상품 및 수량 선택. 4. 유상 구매로 제공되는
														일회용품 유/무 선택. 5. 희망 배송 날짜 선택. 6. 나의 배송지 정보 확인 7. 주문자 정보 확인
														후 결제.
													</div>
												</div>
											</div>
										</div>
									</div>
									<div data-v-e3f957fc data-v-32a18372 class="menu-info-table-wrap">
										<div data-v-e3f957fc class="menu-info-table-opener">
											<div data-v-e3f957fc class="menu-info-table-title-wrapper">
												<img data-v-e3f957fc src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_question.png" class="menu-info-table-img question">
												<p data-v-e3f957fc class="menu-info-table-title">[취소 및 환불 안내]</p>
											</div>
											<img data-v-e3f957fc src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_arrow_down_s.png" class="menu-info-table-opener-arrow">
										</div>
										<div data-v-e3f957fc class="menu-info-table-content-wrap review-hide">
											<div data-v-e3f957fc class="answer-wrapper">
												<div data-v-e3f957fc class="answer-column left">
													<img data-v-e3f957fc src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_answer.png" class="menu-info-table-img answer">
												</div>
												<div data-v-e3f957fc class="answer-column right">
													<div data-v-e3f957fc class="menu-info-table-content-description">
														▶ 일반상품 취소 가능 시점<br> ● 점심/저녁 스팟,퀵배송은 배송 예정일 당일 오전 7시까지
														홈페이지를 통해 직접 취소 가능 ● 새벽/택배배송은 배송 예정일 D-1일 오후 3시까지 홈페이지를 통해
														직접 취소 가능 ※ 신선식품 특성 상 주문취소시간 외 취소 및 변경 불가합니다. ▶ 고객님의 단순
														변심/개인사유 포함하여 취소 요청 시, 쿠폰 사용금액 제외한 실 결제금액에서 배송 완료된 모든 상품의
														정상가 차감 후 나머지만 환불 됩니다. ▶ 제품 이상이 있거나, 오배송이 된 경우 반드시 사진 촬영을
														해주신 후 고객센터로 문의 남겨주세요 ▶ 신선식품의 특성 상 재판매가 불가합니다. 고객님의 단순 변심
														혹은 개인사유로 인해 취소 가능한 시점 이후에는 취소가 불가합니다. ▶ 고객의 부주의 혹은 잘못된
														보관방법으로 인한 상품 변질은 취소 및 환불이 불가합니다.
													</div>
												</div>
											</div>
										</div>
									</div>
									<div data-v-e3f957fc data-v-32a18372 class="menu-info-table-wrap">
										<div data-v-e3f957fc class="menu-info-table-opener">
											<div data-v-e3f957fc class="menu-info-table-title-wrapper">
												<img data-v-e3f957fc src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_question.png" class="menu-info-table-img question">
												<p data-v-e3f957fc class="menu-info-table-title">[배송 안내]</p>
											</div>
											<img data-v-e3f957fc src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_arrow_down_s.png" class="menu-info-table-opener-arrow">
										</div>
										<div data-v-e3f957fc="" class="menu-info-table-content-wrap review-hide" style="border-bottom: 1px solid rgb(233, 233, 233);">
											<div data-v-e3f957fc="" class="answer-wrapper">
												<div data-v-e3f957fc="" class="answer-column left">
													<img data-v-e3f957fc="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_answer.png"class="menu-info-table-img answer">
												</div>
												<div data-v-e3f957fc="" class="answer-column right">
													<div data-v-e3f957fc="" class="menu-info-table-content-description">
														▶ 프코스팟 배송 <br> 프코스팟은 배송 장소에 따라 이용이 제한 될 수 있습니다. 사전에
														이용이 가능한 스팟인지 꼭 확인하시고 주문해주시길 바랍니다. ● 프라이빗 스팟 : 임직원 및 멤버 전용
														(예 : 회사 및 공유오피스등) ● 퍼블릭 스팟 : 누구나 이용 가능한 스팟 (예 : gs25 및
														헬스장등) 최소 주문금액 6천원 이상, 배송비는 무료이며 점심배송은 오전 11시 ~ 오후 12시
														30분사이 배송이며 저녁배송은 오후 1시 ~ 오후5시 사이 배송 됩니다. ▶퀵배송 주변에 이용 가능한
														프코스팟이 없다면 서울 전지역 점심/저녁 퀵 배송이 가능합니다. 최소 주문금액 1만원 이상, 배송비는
														4천원이며 4만원 이상 구매 시, 무료배송 입니다. 점심배송은 12시 30분 전/후로 배송 예정되며
														저녁배송은 오후 1시~5시 사이 배송 됩니다. ▶새벽배송 새벽배송은 00시 ~ 07시 사이 요청하신
														장소로 배송이 되며 새벽시간 특성 상 고객님께 별도 연락 없이, 배송완료가 되면 문자로 사진과 함께 안내
														드리고 있습니다. 안전한 배송을 위해 건물 출입 가능한 방법을 자세히 기재 해주셔야 하며 새벽배송 가능한
														지역이라도 학교/기숙사/관공서/병원/쇼핑몰/군부대등 일부 장소는 배송이 불가하며 엘레베이터가 없는 6층
														이상의 건물에는 1층에 대응배송을 하고 있습니다. (주소 및 출입방법을 정확히 작성하지 않아 발생한
														문제에 대해서는 교환이나 환불이 불가합니다.) 최소 주문금액 1만원 이상, 배송비는 3500원이며
														35,000원 이상 구매 시, 무료배송 입니다. ▶택배배송 제주도, 도서산간을 제외한 모든 지역이 배송이
														가능하며 CJ 대한통운을 통해 배송이 됩니다. 최소 주문 금액 1만원 이상 배송비는 3500원이며
														35,000원 구매 시 , 무료 배송입니다. CJ대한통운을 통해 배송이 되고 있으며, 각 지역의 물량이나
														동선에 따라 도착시간이 다르기 때문에 배송관련한 문의는 CJ대한통운 고객센터로 문의 부탁 드립니다.
														(CJ대한통운 고객센터 : 1588-1255)
													</div>
												</div>
											</div>
										</div>
									</div>
									<div data-v-e3f957fc data-v-32a18372 class="menu-info-table-wrap">
										<div data-v-e3f957fc class="menu-info-table-opener">
											<div data-v-e3f957fc class="menu-info-table-title-wrapper">
												<img data-v-e3f957fc src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_question.png" class="menu-info-table-img question">
												<p data-v-e3f957fc class="menu-info-table-title">[기타 사항(자주 묻는 질문)]</p>
											</div>
											<img data-v-e3f957fc src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_arrow_down_s.png" class="menu-info-table-opener-arrow">
										</div>
										<div data-v-e3f957fc="" class="menu-info-table-content-wrap review-hide" style="border-bottom: 1px solid rgb(233, 233, 233);">
											<div data-v-e3f957fc="" class="answer-wrapper">
												<div data-v-e3f957fc="" class="answer-column left">
													<img data-v-e3f957fc="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_answer.png" class="menu-info-table-img answer">
												</div>
												<div data-v-e3f957fc="" class="answer-column right">
													<div data-v-e3f957fc="" class="menu-info-table-content-description">
														▶ 배송일 변경이 가능한가요?<br> ● 프코스팟/퀵배송은 수령일 당일 오전 7시까지
														홈페이지에서 직접 변경이 가능합니다. ● 새벽배송/택배배송의 경우 배송 예정일 D-1일 오후 3시까지
														홈페이지에서 직접 변경이 가능합니다. ▶ 상품변경 혹은 주문내역 변경이 가능한가요? ● 프코스팟/퀵배송의
														경우 수령일 당일 오전 7시까지 고객님께서 직접 홈페이지를 통해 기존 주문건 취소 후 재주문 해주셔야
														합니다. ● 새벽배송/택배배송의 경우 배송 예정일 D-1일 오후 3시까지 고객님께서 직접 홈페이지를 통해
														기존 주문건 취소 후 재주문 해주셔야 합니다. ▶샐러드에 못먹는 재료가 있는데 제외 가능한가요? ●
														대량으로 일괄생산하고 있어, 특정 재료나 드레싱 제외가 불가합니다. ▶ 정기배송과 일반배송 합배송이
														되나요? ● 정기배송과 일반배송 상품은 합배송이 불가하며, 같은 주소지로 동시에 배송 받으시더라도 개별로
														배송비가 부과 됩니다.
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div data-v-32a18372="" class="menu__tab-review" id="review">
								<a data-v-32a18372="" href="/mypage/review" class="">
									<div data-v-32a18372="" class="menu__tab-review-banner"></div>
								</a>
								<div data-v-f8b893b0="" data-v-32a18372="" class="menu-review">
									<section data-v-f8b893b0="" class="menu-review__album">
										<h3 data-v-f8b893b0="" class="menu-review__album-title">고객 후기 사진 (13)</h3>
										<div data-v-f8b893b0="" class="images">
											<div data-v-f8b893b0="">
												<span id="carousel_prev_q0wbctuwunf" style=""></span>
												<div id="carousel_8blt08p8ty9" class="owl-carousel owl-theme owl-loaded">
													<div class="owl-stage-outer">
														<div class="owl-stage" style="transform: translate3d(-1159px, 0px, 0px); transition: all 0s ease 0s; width: 4834px;">
															<div class="owl-item cloned"
																style="width: 169.333px; margin-right: 24px;">
																<div data-v-f8b893b0="" class="images__image">
																	<a data-v-f8b893b0="" href="#"><i
																		data-v-f8b893b0="" id="7"
																		style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/46340_20220224162011&quot;);"></i></a>
																</div>
															</div>
															<div class="owl-item cloned"
																style="width: 169.333px; margin-right: 24px;">
																<div data-v-f8b893b0="" class="images__image">
																	<a data-v-f8b893b0="" href="#"><i
																		data-v-f8b893b0="" id="8"
																		style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/46299_20220223225102&quot;);"></i></a>
																</div>
															</div>
															<div class="owl-item cloned"
																style="width: 169.333px; margin-right: 24px;">
																<div data-v-f8b893b0="" class="images__image">
																	<a data-v-f8b893b0="" href="#"><i
																		data-v-f8b893b0="" id="9"
																		style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/46269_20220223154934&quot;);"></i></a>
																</div>
															</div>
															<div class="owl-item cloned"
																style="width: 169.333px; margin-right: 24px;">
																<div data-v-f8b893b0="" class="images__image">
																	<a data-v-f8b893b0="" href="#"><i
																		data-v-f8b893b0="" id="10"
																		style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/46270_20220223154934&quot;);"></i></a>
																</div>
															</div>
															<div class="owl-item cloned"
																style="width: 169.333px; margin-right: 24px;">
																<div data-v-f8b893b0="" class="images__image">
																	<a data-v-f8b893b0="" href="#"><i
																		data-v-f8b893b0="" id="11"
																		style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/46142_20220222113647&quot;);"></i></a>
																</div>
															</div>
															<div class="owl-item cloned"
																style="width: 169.333px; margin-right: 24px;">
																<div data-v-f8b893b0="" class="images__image">
																	<a data-v-f8b893b0="" href="#"><i
																		data-v-f8b893b0="" id="12"
																		style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/46101_20220221172529&quot;);"></i></a>
																</div>
															</div>
															<div class="owl-item active"
																style="width: 169.333px; margin-right: 24px;">
																<div data-v-f8b893b0="" class="images__image">
																	<a data-v-f8b893b0="" href="#"><i
																		data-v-f8b893b0="" id="0"
																		style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/46625_20220302211702&quot;);"></i></a>
																</div>
															</div>
															<div class="owl-item active"
																style="width: 169.333px; margin-right: 24px;">
																<div data-v-f8b893b0="" class="images__image">
																	<a data-v-f8b893b0="" href="#"><i
																		data-v-f8b893b0="" id="1"
																		style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/46626_20220302211702&quot;);"></i></a>
																</div>
															</div>
															<div class="owl-item active"
																style="width: 169.333px; margin-right: 24px;">
																<div data-v-f8b893b0="" class="images__image">
																	<a data-v-f8b893b0="" href="#"><i
																		data-v-f8b893b0="" id="2"
																		style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/46618_20220302182048&quot;);"></i></a>
																</div>
															</div>
															<div class="owl-item active"
																style="width: 169.333px; margin-right: 24px;">
																<div data-v-f8b893b0="" class="images__image">
																	<a data-v-f8b893b0="" href="#"><i
																		data-v-f8b893b0="" id="3"
																		style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/46472_20220227221307&quot;);"></i></a>
																</div>
															</div>
															<div class="owl-item active"
																style="width: 169.333px; margin-right: 24px;">
																<div data-v-f8b893b0="" class="images__image">
																	<a data-v-f8b893b0="" href="#"><i
																		data-v-f8b893b0="" id="4"
																		style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/46473_20220227221307&quot;);"></i></a>
																</div>
															</div>
															<div class="owl-item active"
																style="width: 169.333px; margin-right: 24px;">
																<div data-v-f8b893b0="" class="images__image">
																	<a data-v-f8b893b0="" href="#"><i
																		data-v-f8b893b0="" id="5"
																		style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/46385_20220225113317&quot;);"></i></a>
																</div>
															</div>
															<div class="owl-item"
																style="width: 169.333px; margin-right: 24px;">
																<div data-v-f8b893b0="" class="images__image">
																	<a data-v-f8b893b0="" href="#"><i
																		data-v-f8b893b0="" id="6"
																		style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/46386_20220225113317&quot;);"></i></a>
																</div>
															</div>
															<div class="owl-item"
																style="width: 169.333px; margin-right: 24px;">
																<div data-v-f8b893b0="" class="images__image">
																	<a data-v-f8b893b0="" href="#"><i
																		data-v-f8b893b0="" id="7"
																		style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/46340_20220224162011&quot;);"></i></a>
																</div>
															</div>
															<div class="owl-item"
																style="width: 169.333px; margin-right: 24px;">
																<div data-v-f8b893b0="" class="images__image">
																	<a data-v-f8b893b0="" href="#"><i
																		data-v-f8b893b0="" id="8"
																		style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/46299_20220223225102&quot;);"></i></a>
																</div>
															</div>
															<div class="owl-item"
																style="width: 169.333px; margin-right: 24px;">
																<div data-v-f8b893b0="" class="images__image">
																	<a data-v-f8b893b0="" href="#"><i
																		data-v-f8b893b0="" id="9"
																		style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/46269_20220223154934&quot;);"></i></a>
																</div>
															</div>
															<div class="owl-item"
																style="width: 169.333px; margin-right: 24px;">
																<div data-v-f8b893b0="" class="images__image">
																	<a data-v-f8b893b0="" href="#"><i
																		data-v-f8b893b0="" id="10"
																		style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/46270_20220223154934&quot;);"></i></a>
																</div>
															</div>
															<div class="owl-item"
																style="width: 169.333px; margin-right: 24px;">
																<div data-v-f8b893b0="" class="images__image">
																	<a data-v-f8b893b0="" href="#"><i
																		data-v-f8b893b0="" id="11"
																		style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/46142_20220222113647&quot;);"></i></a>
																</div>
															</div>
															<div class="owl-item"
																style="width: 169.333px; margin-right: 24px;">
																<div data-v-f8b893b0="" class="images__image">
																	<a data-v-f8b893b0="" href="#"><i
																		data-v-f8b893b0="" id="12"
																		style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/46101_20220221172529&quot;);"></i></a>
																</div>
															</div>
															<div class="owl-item cloned"
																style="width: 169.333px; margin-right: 24px;">
																<div data-v-f8b893b0="" class="images__image">
																	<a data-v-f8b893b0="" href="#"><i
																		data-v-f8b893b0="" id="0"
																		style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/46625_20220302211702&quot;);"></i></a>
																</div>
															</div>
															<div class="owl-item cloned"
																style="width: 169.333px; margin-right: 24px;">
																<div data-v-f8b893b0="" class="images__image">
																	<a data-v-f8b893b0="" href="#"><i
																		data-v-f8b893b0="" id="1"
																		style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/46626_20220302211702&quot;);"></i></a>
																</div>
															</div>
															<div class="owl-item cloned"
																style="width: 169.333px; margin-right: 24px;">
																<div data-v-f8b893b0="" class="images__image">
																	<a data-v-f8b893b0="" href="#"><i
																		data-v-f8b893b0="" id="2"
																		style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/46618_20220302182048&quot;);"></i></a>
																</div>
															</div>
															<div class="owl-item cloned"
																style="width: 169.333px; margin-right: 24px;">
																<div data-v-f8b893b0="" class="images__image">
																	<a data-v-f8b893b0="" href="#"><i
																		data-v-f8b893b0="" id="3"
																		style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/46472_20220227221307&quot;);"></i></a>
																</div>
															</div>
															<div class="owl-item cloned"
																style="width: 169.333px; margin-right: 24px;">
																<div data-v-f8b893b0="" class="images__image">
																	<a data-v-f8b893b0="" href="#"><i
																		data-v-f8b893b0="" id="4"
																		style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/46473_20220227221307&quot;);"></i></a>
																</div>
															</div>
															<div class="owl-item cloned"
																style="width: 169.333px; margin-right: 24px;">
																<div data-v-f8b893b0="" class="images__image">
																	<a data-v-f8b893b0="" href="#"><i
																		data-v-f8b893b0="" id="5"
																		style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/46385_20220225113317&quot;);"></i></a>
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
												<span id="carousel_next_uy1tpo86erk"></span>
											</div>
										</div>
									</section>
									<section data-v-f8b893b0="" class="menu-review__rating">
										<div data-v-f8b893b0="" class="wrap">
											<h3 data-v-f8b893b0="" id="ClientReview" class="navBar">고객 후기</h3>
											<div data-v-f8b893b0=""
												class="row--v-center review-box-wrapper">
												<div data-v-f8b893b0="" class="review-stars">
													<img data-v-f8b893b0="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/icon_star_full%402x.png"class="review-stars-star"> 
													<img data-v-f8b893b0="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/icon_star_full%402x.png" class="review-stars-star"> 
													<img data-v-f8b893b0="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/icon_star_full%402x.png" class="review-stars-star"> 
													<img data-v-f8b893b0="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/icon_star_full%402x.png" class="review-stars-star"> 
													<img data-v-f8b893b0=""src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/icon_star_half%402x.png" class="review-stars-star">
												</div>
												<div data-v-f8b893b0="" class="review-rating-counts">
													${avgCount.starAvg }(후기 ${avgCount.reviewCount})
												</div>
											</div>
										</div>
									</section>
									<section data-v-f8b893b0="" class="menu-review__index">
										<ul data-v-f8b893b0="">
<!--  리뷰  -->										
											<c:forEach var="board" items="${boardList }">
												<li data-v-22105fb8="" data-v-f8b893b0="" class="review-item">
													<div data-v-22105fb8="" class="review-item__head">
														<div data-v-22105fb8="" class="head-rating">
															<img data-v-22105fb8="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_star(full).png" class="rating-img">
															<div data-v-22105fb8="" class="rating-count">${board.star }</div>
														</div>
														<div data-v-22105fb8="" class="head-summary">
															<div data-v-22105fb8="" class="head-summary-left">
																<img data-v-22105fb8="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/pics%402x.png" class="summary-photo">
																<div data-v-22105fb8="" class="summary-text">${board.content }</div>
															</div>
															<!---->
														</div>
														<div data-v-22105fb8="" class="head-text">
															<div data-v-22105fb8="" class="text-name">${board.user_name }</div>
															<div data-v-22105fb8="" class="text-date">${fn:substring(board.write_date, 0, 10)}</div>
														</div>
													</div>
													<div data-v-22105fb8="" class="review-desktop-toggle review-hide">
														<div data-v-22105fb8="" class="review-item__body">
															<div data-v-22105fb8="" class="review-item__comment">${board.content }</div>
															<div data-v-22105fb8="" class="review-item__photos">
																<div data-v-22105fb8="" class="review-item__photo-wrap">
																	<div data-v-22105fb8="" class="review-item__photo" style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44381_20220124003124&quot;);"></div>
																</div>
																<div data-v-22105fb8="" class="review-item__photo-wrap">
																	<div data-v-22105fb8="" class="review-item__photo" style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44382_20220124003124&quot;);"></div>
																</div>
															</div>
														</div>
														<!---->
													</div>
												</li>
											</c:forEach>
											
											<!-- 댓글 내용 열 시 추가 되어야 할 클래스 이름 :  review-item__head 부분에 border-bottom-desktop-show -->
											<!-- 댓글 내용 열 시 사라져야 할 클래스 이름 : review-desktop-toggle 부분에 review-hide -->
											<!-- 댓글 내용 닫을 시 사라져야 할 클래스 이름 :  review-item__head 부분에 border-bottom-desktop-show -->
											<!-- 댓글 내용 닫을 시 추가 되어야 할 클래스 이름 : review-desktop-toggle 부분에 review-hide -->

										</ul>
<!-- 페이징 넘김 처리 -->
										<div data-v-20ad18c6="" data-v-f8b893b0="" class="nav-paginate-wrap">
											<div data-v-20ad18c6="" class="nav-paginate-wrap__mobile">
												<nav data-v-43f58a9c="" data-v-20ad18c6="" class="nav-paginate">
													<ul class="btn-group pagination">
														<c:if test="${pageMaker.prev }">
															<li>
																<%--         <a href='<c:url value="/detail.do?page=${pageMaker.startPage-1 }"/>'> --%>
																<a data-v-43f58a9c="" href='detail.do?page=${pageMaker.startPage-1 }&itemCode01=${detail.item_code}&tagMain01=${detail.item_tag_main}'>
																	<i class="fa fa-chevron-left">
																	<img data-v-43f58a9c class="nav-arrow arrow-left" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_arrow_left(s).png"></i>
																</a>
															</li>
														</c:if>
														<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
															<li>
																<%--         <a href='<c:url value="/detail.do?page=${pageNum }"/>'> --%>
																<a data-v-43f58a9c="" href="detail.do?page=${pageNum }&itemCode01=${detail.item_code}&tagMain01=${detail.item_tag_main}">
																	<i class="fa">${pageNum } </i>
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
																	<i class="fa fa-chevron-left">
																	<img data-v-43f58a9c class="nav-arrow arrow-left" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_arrow_left(s).png"></i>
																</a>
															</li>
														</c:if>
														<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
															<li>
																<%--         <a href='<c:url value="/detail.do?page=${pageNum }"/>'> --%>
																<a data-v-43f58a9c="" href="detail.do?page=${pageNum }&itemCode01=${detail.item_code}&tagMain01=${detail.item_tag_main}">
																	<i class="fa">${pageNum } </i>
																</a>
															</li>
														</c:forEach>
														<c:if test="${pageMaker.next && pageMaker.endPage >0 }">
															<li>
																<%--         <a href='<c:url value="/detail.do?page=${pageMaker.endPage+1 }"/>'> --%>
																<a data-v-43f58a9c="" href='detail.do?page=${pageMaker.endPage+1 }&itemCode01=${detail.item_code}&tagMain01=${detail.item_tag_main}'>
																	<i class="fa fa-chevron-right">
																	<img data-v-43f58a9c class="nav-arrow arrow-right" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_arrow_right(s).png"></i>
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
							<!---->
							<!---->
							<!---->
							<div data-v-32a18372="" class="js-mobile-panel-dim"
								style="display: none;">
								<div data-v-32a18372="" class="mobile-panel-wrap">
									<div data-v-32a18372="" class="mobile-panel-wrapper">
										<div data-v-32a18372="" class="mobile-panel">
											<div data-v-32a18372="" class="mobile-panel-header">
												<div data-v-32a18372=""
													class="mobile-panel-header-handle js-mobile-panel-header-handle">
													<img data-v-32a18372="" src="/images/arrow-up@3x.png"
														class="mobile-panel-header-handle-arrow">
												</div>
												<div data-v-32a18372="" class="mobile-panel-header-text">[새벽/정기구독]
													한끼 샐러드/샌드위치 교차</div>
											</div>
											<div data-v-32a18372="" class="mobile-panel-content hide">
												<div data-v-2706028c="" data-v-32a18372=""
													class="menu-select-panel">
													<div data-v-2706028c="" class="menu__select-size">
														<ul data-v-2706028c=""
															class="menu__select-size-list normal">
															<li data-v-2706028c="" class="menu__options"
																style="margin-top: -4px;"><label data-v-2706028c=""
																class="menu__label">사이즈 선택</label>
																<div data-v-2706028c="" class="row--v-center">
																	<div data-v-2706028c=""
																		class="row--v-center radio-label">
																		<label data-v-3f971378="" data-v-2706028c=""
																			class="form-radio"><input data-v-3f971378=""
																			id="Medium" type="radio" name="menu-sizemobile"
																			class="form-radio-input" value="Medium"> <span
																			data-v-3f971378="" class="form-radio-circle"><i
																				data-v-3f971378=""
																				class="form-radio-circle-interior"></i></span> Medium </label> <label
																			data-v-2706028c="" for="Medium"
																			class="radio-side-text">Medium</label>
																	</div>
																	<div data-v-2706028c=""
																		class="row--v-center radio-label">
																		<label data-v-3f971378="" data-v-2706028c=""
																			class="form-radio"><input data-v-3f971378=""
																			id="Large" type="radio" name="menu-sizemobile"
																			class="form-radio-input" value="Large"> <span
																			data-v-3f971378="" class="form-radio-circle"><i
																				data-v-3f971378=""
																				class="form-radio-circle-interior"></i></span> Medium </label> <label
																			data-v-2706028c="" for="Large"
																			class="radio-side-text">Large</label>
																	</div>
																</div></li>
															<li data-v-2706028c="" class="menu__period-select">
																<!---->
																<div data-v-4837bb91="" data-v-2706028c=""
																	class="dropdown-btn-flex-wrap ">
																	<div data-v-4837bb91="" class="dropdown-btn click">
																		<div data-v-4837bb91="" class="button dropdown">
																			<div data-v-4837bb91="" class="">기간 선택(기간이 길수록
																				더 많이 할인됩니다)</div>
																		</div>
																		<!---->
																	</div>
																</div>
															</li>
															<li data-v-2706028c="" class="menu__date-select">
																<!---->
																<div data-v-2706028c="" class="date-picker-with-icon">
																	<span data-v-56ae83be="" data-v-2706028c=""
																		disabled="disabled" class="v-date-custom"><input
																		data-v-2706028c="" data-v-56ae83be=""
																		disabled="disabled" placeholder="시작일 선택"
																		readonly="readonly" type="input"
																		class="date-picker-input">
																		<div data-v-7605e1b2="" data-v-56ae83be=""
																			class="vc-popover-content-wrapper">
																			<!---->
																		</div></span> <img data-v-2706028c=""
																		src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon-calendar.png"
																		 class="date-select-calendar-icon"
																		style="cursor: pointer;">
																</div>
															</li>
														</ul>
														<!---->
													</div>
													<div data-v-2706028c="" class="menu__price">
														<label data-v-2706028c=""
															class="menu__label menu__price-label"> 상품 금액 </label>
														<div data-v-2706028c="" class="menu__price-right">
															<!---->
															<div data-v-2706028c=""
																class="menu__price-current-price__wrapper">
																<!---->
																<div data-v-2706028c=""
																	class="menu__price-current-price">0원</div>
															</div>
														</div>
													</div>
												</div>
												<div data-v-32a18372="" class="row--v-center"
													style="width: 100%; flex-wrap: nowrap;">
													<!---->
													<div data-v-32a18372="" class="purchase-btn-wrap"
														style="width: 100%;">
														<button data-v-a1c889e0="" data-v-32a18372=""
															type="button" title="" class="button button">
															<span data-v-a1c889e0="" class="button__wrap">구독하기</span>
														</button>
													</div>
												</div>
											</div>
										</div>
										<div data-v-32a18372="" class="white-box"></div>
									</div>
									<div data-v-32a18372="" class="white-box"></div>
								</div>
							</div>
						</article>
					</div>
				</div>
				<!---->
				<footer class="footer footer-menu-detail" data-v-438b4fe4=""
					data-v-0f5971ec="">
					<div class="footer__wrap" data-v-438b4fe4="">
						<h2 class="footer__logo" data-v-438b4fe4="">
							<img src="/images/logo-20211111.png" 
								data-v-438b4fe4="">
							<div data-v-438b4fe4="" class="open"></div>
						</h2>
						<div class="footer__body" data-v-438b4fe4="">
							<nav class="footer__menus" data-v-438b4fe4="">
								<div class="footer__menus-item" data-v-438b4fe4="">
									<a href="#" data-v-438b4fe4="">FAQ</a> <a href="/terms"
										data-v-438b4fe4="" class="">이용약관</a> <a href="/privacy"
										data-v-438b4fe4="" class="">개인정보처리방침</a>
								</div>
								<div class="footer__menus-item" data-v-438b4fe4="">
									<a href="#" data-v-438b4fe4="">제휴문의</a> <a href="#"
										data-v-438b4fe4="">채용문의</a> <a href="#" data-v-438b4fe4="">케이터링
										문의</a>
								</div>
							</nav>
							<address class="footer__cs" data-v-438b4fe4="">
								<h3 data-v-438b4fe4="">프코고객센터</h3>
								<div class="cs-time" data-v-438b4fe4="">
									<div class="btn-channel-talk" data-v-438b4fe4="">1:1 문의하기</div>
									<div class="cs-time__inner" data-v-438b4fe4="">
										<div data-v-438b4fe4="">
											<div class="cs-time-text" data-v-438b4fe4="">
												<b data-v-438b4fe4="">평일</b>
												<p data-v-438b4fe4="">9:00 - 18:00 (점심시간 13:00 - 14:00)</p>
											</div>
											<div class="cs-time-text" data-v-438b4fe4="">
												<b data-v-438b4fe4="">토요일</b>
												<p data-v-438b4fe4="">
													9:00 - 13:00 <span data-v-438b4fe4="">&nbsp;(홈페이지
														채팅문의만 운영)</span>
												</p>
											</div>
										</div>
										<div data-v-438b4fe4="">
											<div class="cs-time-text" data-v-438b4fe4="">
												<b data-v-438b4fe4="">공휴일</b>
												<p data-v-438b4fe4="">휴무</p>
											</div>
											<div class="cs-time-text" data-v-438b4fe4="">
												<b data-v-438b4fe4="">고객센터</b>
												<p data-v-438b4fe4="">1644-4559</p>
											</div>
										</div>
									</div>
								</div>
							</address>
							<address class="footer__address" data-v-438b4fe4="">
								<p data-v-438b4fe4="">
									<b data-v-438b4fe4="">대표</b>정유석
								</p>
								<p data-v-438b4fe4="">
									<b data-v-438b4fe4="">주소</b> <span data-v-438b4fe4="">서울특별시
										성동구 왕십리로 115, 헤이그라운드 서울숲점 7층</span>
								</p>
								<p data-v-438b4fe4="">
									<b data-v-438b4fe4="">사업자등록번호</b>883-81-00307
								</p>
								<p data-v-438b4fe4="">
									<b data-v-438b4fe4="">통신판매업신고</b>제 2016-서울용산-00657
								</p>
							</address>
							<address class="footer__address help" data-v-438b4fe4="">
								<p data-v-438b4fe4="">
									<b data-v-438b4fe4="">제휴문의</b><a href="mailto:biz@freshcode.me"
										data-v-438b4fe4="">biz@freshcode.me</a>
								</p>
								<p data-v-438b4fe4="">
									<b data-v-438b4fe4="">카카오ID</b><a href="#" data-v-438b4fe4="">@프레시코드-freshcode</a>
								</p>
								<p data-v-438b4fe4="">
									<b data-v-438b4fe4="">단체주문문의</b><a
										href="mailto:order@freshcode.me" data-v-438b4fe4="">order@freshcode.me</a>
								</p>
							</address>
							<aside class="footer__side" data-v-438b4fe4="">
								<p class="footer__copyright" data-v-438b4fe4="">
									ⓒ 2020. FreshCode, Inc. All Rights Reserved<br
										data-v-438b4fe4="">프레시코드가 제공하는 UI/UX, 프로그램, 콘텐츠, 디자인 등은
									특허법, 저작권법, 부정경쟁방지법 등에 의해 보호 받고 있습니다.<br data-v-438b4fe4="">무단
									복제, 유사한 변형, 사용 등에 대하여는 법적 책임이 있음을 알려드립니다.
								</p>
								<div class="footer__sns-wrap" data-v-438b4fe4="">
									<nav class="footer__sns" data-v-438b4fe4="">
										<img src="/images/instagram@2x.png" title="instagram"
											data-v-438b4fe4="" class=""><img
											src="/images/facebook@2x.png" title="facebook"
											data-v-438b4fe4="" class=""><img
											src="/images/youtube@3x.png" title="youtube"
											data-v-438b4fe4="" class=""><img
											src="/images/group-21@2x.png" title="blog" data-v-438b4fe4=""
											class=""><img src="/images/blog-post@2x.png"
											title="Naver post" data-v-438b4fe4="" class=""><img
											src="/images/kakao-channel@2x.png" title="kakao channel"
											data-v-438b4fe4="" class="">
									</nav>
								</div>
							</aside>
						</div>
					</div>
				</footer>
				<!---->
				<!---->
				<!---->
				<!---->
			</main>
		</div>
	</div>
	<a class="custom-ch-btn" style="display: none">문의하기</a>
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