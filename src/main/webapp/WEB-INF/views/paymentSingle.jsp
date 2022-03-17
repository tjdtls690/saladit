<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}/resources/paymentSingle"/>
<!DOCTYPE html>
<html class="">
<head>

<title>샐러딧 - 프리미엄 샐러드 배달 서비스</title>
<meta data-n-head="ssr" charset="utf-8">
<meta data-n-head="ssr" name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1.0, minimal-ui, viewport-fit=cover, user-scalable=no">
<meta data-n-head="ssr" data-hid="title" name="title"
	content="프레시코드 - 프리미엄 샐러드 배달 서비스">
<meta data-n-head="ssr" data-hid="subject" name="subject"
	content="프레시코드 - 프리미엄 샐러드 배달 서비스">
<meta data-n-head="ssr" data-hid="description" name="description"
	content="프코스팟은 무료배송. 오늘 주문하면 내일 아침 새벽배송. 맛있는 샐러드 도시락을 신선>하게 배달합니다. 다이어트 샐러드도 역시 프레시코드.">
<meta data-n-head="ssr" data-hid="keywords" name="keywords"
	content="프레시코드, 새벽배송, 샐러드, 신선배달">
<meta data-n-head="ssr" data-hid="author" name="author"
	content="https://www.freshcode.me">
<meta data-n-head="ssr" data-hid="og:title" property="og:title"
	content="프레시코드 - 프리미엄 샐러드 배달 서비스">
<meta data-n-head="ssr" data-hid="og:description"
	property="og:description" content="undefined">
<meta data-n-head="ssr" data-hid="og:type" property="og:type"
	content="website">
<meta data-n-head="ssr" data-hid="og:url" property="og:url"
	content="https://www.freshcode.me">
<meta data-n-head="ssr" data-hid="og:image" property="og:image"
	content="https://s3.ap-northeast-2.amazonaws.com/freshcode/img/seo/main.png">
<meta data-n-head="ssr" data-hid="og:site_name" property="og:site_name"
	content="프레시코드 - 프리미엄 샐러드 배달 서비스">
<meta data-n-head="ssr" data-hid="fb:app_id" property="fb:app_id"
	content="323001348061168">
<link data-n-head="ssr" rel="icon" type="image/x-icon"
	href="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_leaf.png" sizes="16x16">
<link data-n-head="ssr" rel="icon" type="image/x-icon"
	href="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_leaf.png" sizes="24x24">
<link data-n-head="ssr" rel="icon" type="image/x-icon"
	href="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_leaf.png" sizes="32x32">
<link data-n-head="ssr" rel="icon" type="image/x-icon"
	href="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_leaf.png" sizes="57x57">
<link data-n-head="ssr" rel="icon" type="image/x-icon"
	href="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_leaf.png" sizes="120x120">
<link data-n-head="ssr" rel="icon" type="image/x-icon"
	href="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_leaf.png" sizes="152x152">
<link data-n-head="ssr" rel="icon" type="image/x-icon"
	href="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_leaf.png" sizes="196x196">
<link rel="stylesheet" href="${path }/style.css">
<link rel="stylesheet" href="${path }/style2.css?ver=2">
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script type="text/javascript">
	function page_move(tagNum){
	   var f = document.paging; //폼 name
	   f.tagMain01.value = tagNum; //POST방식으로 넘기고 싶은 값
	   f.action="tapPage.do";//이동할 페이지
	   f.method="post";//POST방식
	   f.submit();
	}
	
	$(function(){
		$('.row--v-center.same-with-order-wrap > span').trigger('click');
		
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
					if($('.form-text').eq(2).val().length == 0 && $('#paymentDeliveryTypeCheck').val() == 0){
				    	$('html').attr('class', '');
				    	$('body').attr('class', '');
				    	$('noscript').removeAttr('aria-hidden');
				    	$('#__nuxt').removeAttr('aria-hidden');
					}
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

		var lastScrollTop = 0,
	    	delta = 90;
	    	$(window).scroll(function(event){
	    		var st = $(this).scrollTop();
	    		if(Math.abs(lastScrollTop - st) <= delta) return;
	    		if((st > lastScrollTop) && (lastScrollTop > 0)){
	    			if(window.innerWidth > 1023){
	    				$(".header").css("top","-130px");
	    			}else{
	    				$(".header").css("top","-50px");
	    			}
	    		}else{
	    			$(".header").css("top","0px");
	    		}
	    		lastScrollTop = st;
	    	});
	    	
	    	
	    // 주문자 정보와 같습니다 체크박스
	    $(document).on('click', '.row--v-center.same-with-order-wrap svg', function(){
	    	if($('#samePerson').val() == 0){
	    		$('#samePerson').val(1);
	    		$('.form-text').eq(0).val($('#memberName').val()); // 받는분 이름을 입력해주세요.
	    		$('.form-text').eq(1).val($('#memberPhone').val()); // 연락처를 입력해주세요
	    	}else{
	    		$('#samePerson').val(0);
	    		$('.form-text').eq(0).val(''); // 받는분 이름을 입력해주세요.
	    		$('.form-text').eq(1).val(''); // 연락처를 입력해주세요
	    	}
	    })
	    
	    
	    // 주문자 정보와 같습니다 문자열
	    $(document).on('click', '.row--v-center.same-with-order-wrap > span', function(){
	    	if($('#samePerson').val() == 0){
	    		$('#samePerson').val(1);
	    		$('.form-text').eq(0).val($('#memberName').val()); // 받는분 이름을 입력해주세요.
	    		$('.form-text').eq(1).val($('#memberPhone').val()); // 연락처를 입력해주세요
	    	}else{
	    		$('#samePerson').val(0);
	    		$('.form-text').eq(0).val(''); // 받는분 이름을 입력해주세요.
	    		$('.form-text').eq(1).val(''); // 연락처를 입력해주세요
	    	}
	    })
	    
	    $(document).on('click', '.checkout__items svg', function(){
	    	if($('#orderListOpenClose').val() == 1){
	    		$(this).attr('aria-labelledby', 'arrow-down-1');
	    		$('#orderListOpenClose').val(0);
	    		$('.products').css('display', 'none');
	    		$.ajax({
	    			url : 'paymentArrow.do',
	    			dataType : 'html',
	    			type : 'post',
	    			data : {
	    				'check' : 0
	    			},
	    			success : function(htmlOut){
	    				$('.checkout__items svg g').html(htmlOut);
	    			}
	    		})
	    	}else{
	    		$(this).attr('aria-labelledby', 'arrow-up-1');
	    		$('#orderListOpenClose').val(1);
	    		$('.products').css('display', '');
	    		$.ajax({
	    			url : 'paymentArrow.do',
	    			dataType : 'html',
	    			type : 'post',
	    			data : {
	    				'check' : 1
	    			},
	    			success : function(htmlOut){
	    				$('.checkout__items svg g').html(htmlOut);
	    			}
	    		})
	    	}
	    });
	    
	    
	    // 결제하기 버튼
	    $(document).on('click', '#pay-btn2', function(){
	    	// 공동현관 메모 비어있을 시 리턴
	    	if($('.form-text').eq(2).val().length == 0 && $('#paymentDeliveryTypeCheck').val() == 0){
	    		$('html').attr('class', 'swal2-shown swal2-height-auto');
		    	$('body').attr('class', 'swal2-shown swal2-height-auto');
		    	$('noscript').attr('aria-hidden', 'true');
		    	$('#__nuxt').attr('aria-hidden', 'true');
	    		$.ajax({
	    			url : 'paymentEnterExitType.do',
	    			dataType : 'html',
	    			success : function(htmlOut){
	    				$('body').append(htmlOut);
	    				return false;
	    			}
	    		});
	    		return false;
	    	}else if($('.form-text').eq(0).val().length == 0){
	    		alert('받는분 이름을 입력해 주세요.');
	    		return false;
	    	}else if($('.form-text').eq(1).val().length == 0){
	    		alert('받는분 연락처를 입력해 주세요.');
	    		return false;
	    	}
	    	
			var zNum = $('.deliveryZipcodeCode').val();
			var productsName = $('#productsName').val();
			var productsNum = $('#productsNum').val();
			if($('#productsNum').val() > 0){
				productsName += ' 외 '+ (Number(productsNum) - 1) + '개';
			}
			
			$.ajax({
				url : 'getZipcode.do',
				type : 'post',
				data : {
					'deliveryZipcodeCode' : zNum
				},
				success : function(data){
// 					alert($('#productsFinalPrice').val() + ' ' + $('#memberName').val());
// 					alert($('#memberPhone').val() + ' ' + $('#productsFinalShippingAddress2').val());
// 					alert(data + ' ' + productsName);
					var IMP = window.IMP;
			        IMP.init('imp80414894');
			        IMP.request_pay({
				          pg: 'html5_inicis', 
				          pay_method: 'card',
				          merchant_uid: 'merchant_' + new Date().getTime(),
				          name: productsName,
				          //결제창에서 보여질 이름
				          amount: Number($('#productsFinalPrice').val().replace(',', '')),
				          //가격
				          buyer_email: $('#memberEmail').val(),
				          buyer_name: $('#memberName').val(),
				          buyer_tel: $('#memberPhone').val(),
				          buyer_addr: $('#productsFinalShippingAddress2').val(),
				          buyer_postcode: data
			        }, function (rsp) {
				         console.log(rsp);
				         if (rsp.success) {
					          var msg = '결제가 완료되었습니다.\n';
					          msg += '고유ID : ' + rsp.imp_uid;
					          msg += '\n상점 거래ID : ' + rsp.merchant_uid;
					          msg += '\n결제 금액 : ' + rsp.paid_amount;
					          msg += '\n카드 승인번호 : ' + rsp.apply_num;
		 			          location.href="paymentComplete.do";
				         } else {
					          var msg = '결제에 실패하였습니다.\n';
					          msg += '에러내용 : ' + rsp.error_msg;
				         }
				         alert(msg);
				    })
				 }
			})
		});
	    
	    // 일반 체크 모달창 확인 버튼
	    $(document).on('click', '.swal2-confirm.swal2-styled', function(){
	    	$('html').attr('class', '');
	    	$('body').attr('class', '');
	    	$('noscript').removeAttr('aria-hidden');
	    	$('#__nuxt').removeAttr('aria-hidden');
	    });
	    
	    // 할인 쿠폰 버튼
	    $(document).on('click', '.coupon button', function(){
	    	$('html').attr('class', 'mode-popup');
	    	$.ajax({
	    		url : 'paymentCouponModal.do',
	    		dataType : 'html',
	    		success : function(htmlOut){
	    			$('.checkout').append(htmlOut);
	    		}
	    	});
	    });
	    
	    // 쿠폰 모달창 중 x버튼, 선택 완료 버튼, 모달창 바깥 영역 클릭 시
	    $(document).on('click', '.modal-wrap.modal-wrap--full', function(e){
	    	if(!$(e.target).hasClass("select-coupon__title") && !$(e.target).hasClass("select-coupon__bar") && !$(e.target).hasClass("except1")
	    			&& !$(e.target).hasClass("select-coupon__body") && !$(e.target).hasClass("error-list")){
	    		$('.modal').attr('class', 'modal modal-leave-active modal-leave-to');
	    		setTimeout(function() {
					$('.modal.modal-leave-active.modal-leave-to').detach();
					$('html').attr('class', '');
				}, 400);
	    	}
	    })
	})
</script>
</head>
<body class="">
	<noscript data-n-head="ssr" data-hid="gtm-noscript" data-pbody="true">
		<iframe src="https://www.googletagmanager.com/ns.html?id=GTM-WWVZF4F&"
			height="0" width="0" style="display: none; visibility: hidden"
			title="gtm"></iframe>
	</noscript>
	<div id="__nuxt">
		<div id="__layout">
			<main data-v-1739428d="" class="viewport-none-footer">
								<header data-v-7aa1f9b4="" data-v-1739428d="" id="header-area"
					class="header">
					<div data-v-7aa1f9b4="" class="header-banner-wrap">
						<!---->
					</div>
					<form name="paging">
						<input type="hidden" name="tagMain01" value="">
						<input type="hidden" name="itemCode01" value="">
						<input type="hidden" name="tagSub01" value="">
					</form>
					<input type="hidden" value="${member.name }" id="memberName">
					<input type="hidden" value="${member.email }" id="memberEmail">
					<input type="hidden" value="${member.phone }" id="memberPhone">
					<input type="hidden" value="${list[0].paymentItem }" id="productsName">
					<input type="hidden" value="${fn:length(list)}" id="productsNum">
					<input type="hidden" value="${vo.paymentDeliveryTypeCheck }" id="paymentDeliveryTypeCheck"> <!-- 배송방법 0, 1 -->
					<input type="hidden" value="${vo.paymentRealFinalPrice }" id="productsFinalPrice"> <!-- 최종 결제 금액 -->
					<input type="hidden" value="${vo.paymentFinalSalePrice }" id="paymentFinalSalePrice"> <!-- 상품 할인 금액 (콤마있음) -->
					<input type="hidden" value="${vo.paymentShippingAddress1 }" id="productsFinalShippingAddress1"> <!-- 집코드 -->
					<input type="hidden" value="${vo.paymentShippingAddress2 }" id="productsFinalShippingAddress2"> <!-- 상세 주소 -->
					<input type="hidden" value="1" id="samePerson">
					<input type="hidden" value="1" id="orderListOpenClose">
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
											<a href="myPayInfo.do" id="nickname" data-v-30697495>${member.name } <span data-v-30697495>님</span></a>
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
								<a data-v-7aa1f9b4="" href="javascript:page_move(100);" class="item">정기구독
								</a><a data-v-7aa1f9b4="" href="javascript:page_move(200);" class="item">샐러드 </a><a
									data-v-7aa1f9b4="" href="javascript:page_move(300);" class="item">샌드위치·랩
								</a><a data-v-7aa1f9b4="" href="javascript:page_move(1);" class="item">초코베리머치
								</a><a data-v-7aa1f9b4="" href="event.do" class="item">이벤트 </a><a
									data-v-7aa1f9b4="" href="/fcospot" class="item">프코스팟 </a>
							</div>
							<div data-v-7aa1f9b4="" class="header__menus-side">
								<a data-v-7aa1f9b4="" href="search.do" class="search-logo"><img
									data-v-7aa1f9b4="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_search_gray.PNG"
									alt="메뉴 검색" class="search-logo-img"
									style="width: 30px; height: 30px;">
									<div data-v-7aa1f9b4="">검색</div></a> <a data-v-7aa1f9b4=""
									href="basket.do" class="cart-logo-wrap item"><div
										data-v-7aa1f9b4="" alt="프레시코드 장바구니" class="cart-logo empty">
										<!---->
									</div> <!----> 장바구니 </a> <a data-v-7aa1f9b4="" href="order.do" class="item"><div
										data-v-7aa1f9b4="" class="icon-order"></div> 바로주문 </a>
							</div>
						</nav>
						<div data-v-7aa1f9b4="" class="header__side">
							<a data-v-7aa1f9b4="" href="search.do" class="search-logo"><img
								data-v-7aa1f9b4="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_search_gray.PNG"
								alt="메뉴 검색" class="search-logo-img"
								style="width: 30px; height: 30px;"></a> <a data-v-7aa1f9b4=""
								href="basket.do" class="cart-logo-wrap item"><div style="width: 24px; height: 24px;"
									data-v-7aa1f9b4="" alt="프레시코드 장바구니" class="cart-logo empty">
									<!---->
								</div></a>
							<nav data-v-7aa1f9b4="" class="header__toggle-button">
								<button data-v-7aa1f9b4="" type="button">
									<img data-v-7aa1f9b4=""
										src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_menu.PNG" alt="user-menu"
										style="width: 30px; height: 30px;">
								</button>
							</nav>
						</div>
					</div>
					<!---->
					<!---->
					<!---->
					<!---->
				</header>
				<!---->
				<div data-v-1739428d="" class="container">
					<div data-v-8f2f8136="" data-v-1739428d=""
						class="checkout-container">
						<article data-v-8f2f8136="" class="checkout">
							<div data-v-8f2f8136="" class="checkout__header">
								<h2 data-v-8f2f8136="" class="header">주문/결제하기</h2>
							</div>
							<div data-v-8f2f8136="">
								<section data-v-8f2f8136="" class="checkout__items">
									<header data-v-8f2f8136="" class="row--v-center">
										<h3 data-v-8f2f8136="" class="col checkout__section-title">주문상품정보</h3>
										<button data-v-8f2f8136="" type="button">
											<span data-v-8f2f8136="" class="row--v-center"><svg
													data-v-8f2f8136="" xmlns="http://www.w3.org/2000/svg"
													width="24" height="24" viewBox="0 0 24 24"
													aria-labelledby="arrow-up-1" role="presentation"
													class="icon" style="width: 20px; height: 15px;">
													<g fill="none" fill-rule="evenodd"> <path
														fill="currentColor" fill-rule="nonzero"
														d="M3.455 16.362a.5.5 0 0 1-.69-.724l8.946-8.5a.5.5 0 0 1 .689 0l8.944 8.5a.5.5 0 0 1-.688.724l-8.6-8.172-8.601 8.172z"></path></g></svg></span>
										</button>
									</header>
									<!---->
									<div data-v-8f2f8136="" class="products">
										<ul data-v-8f2f8136="">
											<li data-v-8f2f8136="">
												<div data-v-8f2f8136="" class="products-delivery-date-wrap">
													<div data-v-8f2f8136="" class="products-delivery-date-left">수령일</div>
													<div data-v-8f2f8136=""
														class="products-delivery-date-right">${vo.paymentDeliveryDate }</div>
												</div>
												<ul data-v-8f2f8136="" class="items">
													<c:forEach var="list1" items="${list }">
														<li data-v-8f2f8136="" class="row">
															<div data-v-8f2f8136="" class="col info">
																<strong data-v-8f2f8136="">${list1.paymentItem }</strong>
																<span data-v-8f2f8136="">일회용품(포크+물티슈) - ${list1.paymentDisposable }</span>
															</div>
															<div data-v-8f2f8136="" class="count">
																<em data-v-8f2f8136="">${list1.paymentItemQuantity }</em>개
															</div>
															<div data-v-8f2f8136="" class="price">
																<em data-v-8f2f8136="">${list1.paymentPrice }</em>원
															</div>
														</li>
													</c:forEach>
												</ul>
											</li>
										</ul>
										<table data-v-8f2f8136="">
											<colgroup data-v-8f2f8136="">
												<col data-v-8f2f8136="" width="100px">
												<col data-v-8f2f8136="" width="270px">
												<col data-v-8f2f8136="" width="45px">
												<col data-v-8f2f8136="" width="*">
												<col data-v-8f2f8136="" width="*">
												<col data-v-8f2f8136="" width="*">
												<col data-v-8f2f8136="" width="*">
											</colgroup>
											<thead data-v-8f2f8136="">
												<tr data-v-8f2f8136="">
													<th data-v-8f2f8136="" scope="col">수령일</th>
													<th data-v-8f2f8136="" scope="col">주문상품</th>
													<th data-v-8f2f8136="" scope="col">수량</th>
													<th data-v-8f2f8136="" scope="col" class="right">가격</th>
													<th data-v-8f2f8136="" scope="col" class="right">할인금액
													</th>
													<th data-v-8f2f8136="" scope="col" class="right">배송비</th>
													<th data-v-8f2f8136="" scope="col" class="right">결제예상금액</th>
												</tr>
											</thead>
											<tbody data-v-8f2f8136="">
												<c:forEach var="list1" items="${list }" varStatus="i">
													<c:if test="${i.index == 0 }">
														<tr data-v-8f2f8136="">
															<td data-v-8f2f8136="" rowspan="${fn:length(list)}" class="date left">
																${vo.paymentDeliveryDate }</td>
															<td data-v-8f2f8136="" class="bd left">
																<strong data-v-8f2f8136="" class="title">${list1.paymentItem }</strong>
																<div data-v-8f2f8136="" class="option">일회용품(포크+물티슈) ${list1.paymentDisposable }</div>
															</td>
															<td data-v-8f2f8136="" class="qry">${list1.paymentItemQuantity }</td>
															<td data-v-8f2f8136="" class="price right">
																<em data-v-8f2f8136="">${list1.paymentPrice }</em>원
															</td>
															<td data-v-8f2f8136="" class="price right">
																<em data-v-8f2f8136="">- ${list1.paymentSalePrice }</em>원
															</td>
															<td data-v-8f2f8136="" rowspan="2" class="price right">
																<em data-v-8f2f8136="">${vo.paymentDeliveryPrice }</em>원
															</td>
															<td data-v-8f2f8136="" rowspan="2" class="price-total right">${vo.paymentPredictionPrice }원</td>
														</tr>
													</c:if>
													<c:if test="${i.index > 0 }">
														<tr data-v-8f2f8136="">
															<!---->
															<td data-v-8f2f8136="" class="bd left">
																<strong data-v-8f2f8136="" class="title">${list1.paymentItem }</strong>
																<div data-v-8f2f8136="" class="option">일회용품(포크+물티슈) ${list1.paymentDisposable }</div>
															</td>
															<td data-v-8f2f8136="" class="qry">${list1.paymentItemQuantity }</td>
															<td data-v-8f2f8136="" class="price right">
																<em data-v-8f2f8136="">${list1.paymentPrice }</em>원
															</td>
															<td data-v-8f2f8136="" class="price right">
																<em data-v-8f2f8136="">- ${list1.paymentSalePrice }</em>원
															</td>
														</tr>
													</c:if>
												</c:forEach>
												
											</tbody>
										</table>
									</div>
								</section>
								<section data-v-8f2f8136="" class="checkout__person">
									<div data-v-8f2f8136="" class="wrap">
										<div data-v-8f2f8136="" class="buyer">
											<h3 data-v-8f2f8136="" class="checkout__section-title">주문자
												정보</h3>
											<dl data-v-8f2f8136="" class="row--v-center">
												<dt data-v-8f2f8136="">보내는 분</dt>
												<dd data-v-8f2f8136="" class="col">신준혁</dd>
											</dl>
											<dl data-v-8f2f8136="" class="row--v-center">
												<dt data-v-8f2f8136="">이메일</dt>
												<dd data-v-8f2f8136="" class="col">tjdtls690@naver.com</dd>
											</dl>
											<dl data-v-8f2f8136="" class="row--v-center">
												<dt data-v-8f2f8136="">연락처</dt>
												<dd data-v-8f2f8136="" class="col">01057113386</dd>
											</dl>
										</div>
										<div data-v-8f2f8136="" class="receiver">
											<header data-v-8f2f8136=""
												class="row--v-center row--h-between">
												<h3 data-v-8f2f8136="" class="checkout__section-title">받는
													사람 정보</h3>
											</header>
											<div data-v-8f2f8136="">
												<fieldset data-v-8f2f8136="" class="form-fieldset">
													<legend data-v-8f2f8136="">받는 사람 정보 입력 폼</legend>
													<input data-v-8bb17226="" data-v-8f2f8136="" id="xx"
														type="text" name="xx" placeholder="받는분 이름을 입력해주세요"
														maxlength="50" autocorrect="off" autocapitalize="off"
														class="form-text" value="${member.name }"
														style="height: 47px; margin-bottom: 10px;"> <input
														data-v-8bb17226="" data-v-8f2f8136="" id="yy" type="tel" value="${member.phone }"
														name="yy" placeholder="연락처를 입력해주세요" minlength="9"
														maxlength="12" autocorrect="off" autocapitalize="off"
														class="form-text" style="height: 47px;">
												</fieldset>
												<label data-v-8f2f8136=""
													class="row--v-center same-with-order-wrap"><label
													data-v-2673f877="" data-v-8f2f8136="" class="form-checkbox"><input
														data-v-2673f877="" type="checkbox" value="false">
														<span data-v-2673f877=""><svg data-v-2673f877=""
																xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
																<path data-v-2673f877="" fill="currentColor"
																	fill-rule="nonzero"
																	d="M8.489 13.597l7.304-7.304a1 1 0 0 1 1.414 1.414l-8 8a1 1 0 0 1-1.403.011l-4-3.875a1 1 0 1 1 1.392-1.436l3.293 3.19z"></path></svg></span></label>
													<span data-v-8f2f8136="">주문자 정보와 같습니다.</span></label>
											</div>
										</div>
									</div>
								</section>
								<section data-v-8f2f8136=""
									class="checkout__delivery checkout-column__delivery">
									<header data-v-8f2f8136="">
										<h3 data-v-8f2f8136="" class="checkout__section-title">배송정보</h3>
										<span data-v-8f2f8136="" class="time-info">주문 변경 및 취소는
											<b style="font-weight: normal; color: #35ad73;">수령일 하루 전
												오후 3시까지 가능</b>
										</span>
										<div data-v-8f2f8136="" class="delivery">
											<dl data-v-8f2f8136="" class="row">
												<dt data-v-8f2f8136="">배송 방법</dt>
												<dd data-v-8f2f8136="" class="col">${vo.paymentDeliveryType }</dd>
											</dl>
											<dl data-v-8f2f8136="" class="row">
												<dt data-v-8f2f8136="">배송 예정일</dt>
												<dd data-v-8f2f8136="" class="col">
													<b data-v-8f2f8136="">${vo.paymentPredictionDate }</b>
													<div data-v-8f2f8136="" class="detail-address">${vo.paymentPredictionDateSummary }</div>
												</dd>
											</dl>
											<dl data-v-8f2f8136="" class="row">
												<dt data-v-8f2f8136="">배송지</dt>
												<dd data-v-8f2f8136="" class="col">
													${vo.paymentShippingAddress1 }<span data-v-8f2f8136="" class="detail-address">${vo.paymentShippingAddress2 }</span>
												</dd>
											</dl>
											<input type="hidden" class="deliveryZipcodeCode" value="${vo.paymentShippingAddress3 }">
										</div>
									</header>
								</section>
								<!---->
								
								<c:if test="${vo.paymentDeliveryTypeCheck == 0 }">
									<section data-v-8f2f8136="" class="checkout__method">
										<div data-v-8f2f8136="" class="info-wrap">
											<h3 data-v-8f2f8136="" class="checkout__section-title">출입방법</h3>
											<span data-v-8f2f8136="" class="info-hover-icon"></span>
											<!---->
										</div>
										<div data-v-8f2f8136="" class="method__checks">
											<span data-v-615e9308="" data-v-8f2f8136=""
												class="form-select"
												style="height: 46px; margin-bottom: 10px;"><select
												data-v-615e9308=""><option data-v-615e9308=""
														value="" disabled="disabled" selected="selected">선택하기</option>
													<option data-v-8f2f8136="" data-v-615e9308=""
														value="자유출입 가능">자유출입 가능</option>
													<option data-v-8f2f8136="" data-v-615e9308=""
														value="공동현관 비밀번호">공동현관 비밀번호</option>
													<option data-v-8f2f8136="" data-v-615e9308=""
														value="경비실 호출">경비실 호출</option>
													<option data-v-8f2f8136="" data-v-615e9308="" value="세대 호출">세대
														호출</option>
													<option data-v-8f2f8136="" data-v-615e9308=""
														value="경비실 배송">경비실 배송</option>
													<option data-v-8f2f8136="" data-v-615e9308=""
														value="무인택배함 배송">무인택배함 배송</option>
													<option data-v-8f2f8136="" data-v-615e9308="" value="기타사항">기타사항</option></select>
												<svg data-v-615e9308="" viewBox="0 0 12 7"
													xmlns="http://www.w3.org/2000/svg">
													<polygon data-v-615e9308="" id="Triangle" fill="#C9CACC"
														points="6 0 12 7 7.84372567e-14 7"></polygon></svg></span> <input
												data-v-8bb17226="" data-v-8f2f8136="" type="text"
												name="xxxx" placeholder="" maxlength="50" autocorrect="off"
												autocapitalize="off" class="form-text"
												style="height: 46px; margin-bottom: 10px;">
										</div>
										<div data-v-8f2f8136="" class="added-form">
											<p data-v-8f2f8136="" class="added-form-info">공동현관 및
												무인택배함 비밀번호는 조합 방식 및 순서( #, 호출버튼) 와 함께 자세히 기재해주세요.</p>
											<!---->
										</div>
									</section>
								</c:if>
								<c:if test="${vo.paymentDeliveryTypeCheck == 1 }">
									<section data-v-8f2f8136="" class="checkout__method">
										<div data-v-8f2f8136="" class="info-wrap">
											<h3 data-v-8f2f8136="" class="checkout__section-title">배송메모</h3>
										</div>
										<div data-v-8f2f8136="" class="method__checks parcel">
											<input data-v-8bb17226="" data-v-8f2f8136="" type="text"
												name="xxxx" placeholder="배송메모를 입력해주세요." maxlength="50"
												autocorrect="off" autocapitalize="off" class="form-text"
												style="height: 46px; margin-bottom: 10px;">
										</div>
										<div data-v-8f2f8136="" class="method">
											<div data-v-8f2f8136="" class="disposable-checkbox-wrap">
												<input data-v-8f2f8136="" id="reuseDeliveryMsgFlag-checkbox"
													type="checkbox" name="reuseDeliveryMsgFlag"
													class="disposable-checkbox"> <label
													data-v-8f2f8136="" for="reuseDeliveryMsgFlag-checkbox"
													class="disposable-checkbox-label"><span
													data-v-8f2f8136="" class="disposable-checkbox-text">
														다음에도 사용하기 </span></label>
											</div>
										</div>
									</section>
								</c:if>
								
								<!---->
								<div data-v-8f2f8136="" class="checkout-column">
									<div data-v-8f2f8136="" class="checkout-column__payment">
										
										<section data-v-8f2f8136="" class="checkout__coupoint">
											<div data-v-8f2f8136="" class="coupon">
												<h3 data-v-8f2f8136="" class="checkout__section-title">할인
													쿠폰</h3>
												<button data-v-8f2f8136="" type="button">
													<span data-v-8f2f8136="" class="row--v-center"><em
														data-v-8f2f8136="" class="col coupon__not-use">내 쿠폰
															0장</em> <svg data-v-8f2f8136=""
															xmlns="http://www.w3.org/2000/svg" width="24" height="24"
															viewBox="0 0 24 24" aria-labelledby="arrow-right-1"
															role="presentation" class="icon">
															<g fill="none" fill-rule="evenodd"> <path
																stroke="currentColor" stroke-linecap="round"
																stroke-linejoin="round" d="M10 6l5.964 5.964-5.964 6"></path></g></svg></span>
												</button>
											</div>
											<div data-v-8f2f8136="" class="point">
												<h3 data-v-8f2f8136="" class="checkout__section-title">포인트
													사용</h3>
												<div data-v-8f2f8136="" class="point-wrap row--v-center">
													<span data-v-8f2f8136="" class="point__input"><input
														data-v-8bb17226="" data-v-8f2f8136="" id="pp" type="tel" value="0"
														name="pp" placeholder="포인트를 입력해주세요" autocorrect="off"
														autocapitalize="off" class="form-text" max="0"
														style="height: 46px; text-align: right;"> <i
														data-v-8f2f8136="">P</i></span>
													<button data-v-a1c889e0="" data-v-8f2f8136="" type="button"
														title=""
														class="button button--side-padding button--size-small"
														style="width: 80px; height: 46px; margin-left: 10px; border-radius: 2px;">
														<span data-v-a1c889e0="" class="button__wrap">전액사용</span>
													</button>
												</div>
												<dl data-v-8f2f8136="" class="row--v-center point__use">
													<dt data-v-8f2f8136="" class="col label">사용 가능한 포인트</dt>
													<dd data-v-8f2f8136="" class="num">0 P</dd>
												</dl>
											</div>
											<!---->
										</section>
									</div>
									<div data-v-8f2f8136="" class="checkout-column">
										<section data-v-8f2f8136="" class="checkout__result">
											<h3 data-v-8f2f8136="" class="checkout__section-title">결제
												금액</h3>
											<div data-v-8f2f8136="" class="bd">
												<div data-v-8f2f8136="">
													<dl data-v-8f2f8136="" class="row--v-center row--h-between">
														<dt data-v-8f2f8136="">상품 금액</dt>
														<dd data-v-8f2f8136="">
															<em data-v-8f2f8136="">${vo.paymentFinalPrice }</em> 원
														</dd>
													</dl>
													<dl data-v-8f2f8136=""
														class="row--v-center row--h-between discount">
														<dt data-v-8f2f8136="">상품 할인</dt>
														<dd data-v-8f2f8136="">
															<em data-v-8f2f8136="">- ${vo.paymentFinalSalePrice }</em> 원
														</dd>
													</dl>
												</div>
												<div data-v-8f2f8136="">
													<dl data-v-8f2f8136="" class="row--v-center row--h-between">
														<dt data-v-8f2f8136="">쿠폰 사용</dt>
														<dd data-v-8f2f8136="">
															<em data-v-8f2f8136=""> 0</em> 원
														</dd>
													</dl>
													<dl data-v-8f2f8136="" class="row--v-center row--h-between">
														<dt data-v-8f2f8136="">포인트 사용</dt>
														<dd data-v-8f2f8136="">
															<em data-v-8f2f8136=""> 0</em> 원
														</dd>
													</dl>
													<dl data-v-8f2f8136="" class="row--v-center row--h-between">
														<dt data-v-8f2f8136="">배송비</dt>
														<dd data-v-8f2f8136="">
															<em data-v-8f2f8136="">${vo.paymentFinalDeliveryPrice }</em> 원
														</dd>
													</dl>
													<dl data-v-8f2f8136=""
														class="row--v-center row--h-between delivery-fee-info-wrap"
														style="color: red;">
														<div data-v-8f2f8136="" class="delivery-fee-title-wrap">
															<dt data-v-8f2f8136="">배송비 할인</dt>
															<span data-v-8f2f8136="" class="info-hover-icon"></span>
														</div>
														<!---->
														<dd data-v-8f2f8136="">
															<em data-v-8f2f8136="">- ${vo.paymentFinalDeliverySalePrice }</em> 원
														</dd>
													</dl>
													<!---->
												</div>
												<!---->
												<dl data-v-8f2f8136="" class="row--v-end row--h-between">
													<dt data-v-8f2f8136="">최종 결제금액</dt>
													<dd data-v-8f2f8136="">
														<b data-v-8f2f8136="">${vo.paymentRealFinalPrice } 원</b>
													</dd>
												</dl>
											</div>
										</section>
										<div data-v-8f2f8136="" class="row--v-center checkout__agree">
											<label data-v-8f2f8136="" class="row--v-center col"><label
												data-v-2673f877="" data-v-8f2f8136="" class="form-checkbox"><input
													data-v-2673f877="" type="checkbox" value="false"> <span
													data-v-2673f877=""><svg data-v-2673f877=""
															xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
															<path data-v-2673f877="" fill="currentColor"
																fill-rule="nonzero"
																d="M8.489 13.597l7.304-7.304a1 1 0 0 1 1.414 1.414l-8 8a1 1 0 0 1-1.403.011l-4-3.875a1 1 0 1 1 1.392-1.436l3.293 3.19z"></path></svg></span></label>
												<span data-v-8f2f8136="" class="col">개인정보 수집·이용 동의
													(필수)</span></label> <a data-v-8f2f8136="" href="#">내용보기</a>
										</div>
										<!---->
										<nav data-v-8f2f8136="" class="nav checkout__nav"
											style="margin-bottom: 0px;">
											<button data-v-a1c889e0="" data-v-8f2f8136="" type="button"
												title="" class="button button--size-large" id="pay-btn2"
												style="border-radius: 2px; font-size: 16px;">
												<span data-v-a1c889e0="" class="button__wrap">결제하기</span>
											</button>
										</nav>
									</div>
								</div>
							</div>
							<!---->
							<!---->
							<!---->
							<!---->
							<!---->
						</article>
					</div>
				</div>
				<!---->
			</main>
		</div>
	</div>
	<a class="custom-ch-btn" style="display: none">문의하기</a>
</body>
</html>