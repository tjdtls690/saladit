<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}/resources/myPayDetailInfo"/>
<!DOCTYPE html>
<html class="">
<head>

<title>샐러딧 - 프리미엄 샐러드 배달 서비스</title>
<meta data-n-head="ssr" charset="utf-8">
<meta data-n-head="ssr" name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1.0, minimal-ui, viewport-fit=cover, user-scalable=no">
<meta data-n-head="ssr" data-hid="subject" name="subject"
	content="프레시코드 - 프리미엄 샐러드 배달 서비스">
<meta data-n-head="ssr" data-hid="author" name="author"
	content="https://www.freshcode.me">
<meta data-n-head="ssr" data-hid="og:type" property="og:type"
	content="website">
<meta data-n-head="ssr" data-hid="og:url" property="og:url"
	content="https://www.freshcode.me">
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
<link href="${path}/style.css" rel="stylesheet" type="text/css" />
<link href="${path}/style2.css?ver=1" rel="stylesheet" type="text/css" />
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
	 $(document).on('click', '.btn-order', function(){
			$(location).attr("href", "order.do");
		})
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

		var lastScrollTop = 0,
	    	delta = 90;
	    	$(window).scroll(function(event){
	    		var st = $(this).scrollTop();
	    		if(Math.abs(lastScrollTop - st) <= delta) return;
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
	    	
	    $('#logout').click(function(){
		    $.ajax({
		    	url : 'logout.do',
		    	dataType : 'html',
		    	success : function(htmlOut){
		    		$('body').append(htmlOut);
		    	}
		    })
		})
		    	
		$(document).on('click', '#closeModal', function(){
		   	$('.swal2-container').detach();
		})
 })
</script>
<style>	
a[data-v-7aa1f9b44]{
    position: left;
    bottom: 20px;
    right: 20px;
    width: 150px;
    height: 50px;
    opacity: .9;
    background-image: url(https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_Delivery-on-Header.gif);
    background-repeat: no-repeat;
    background-size: 150px;
    background-position: 100%;
}

</style>	
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
						<input type="hidden" name="itemCode01" value="">
						<input type="hidden" name="tagSub01" value="">
					</form>
					<div data-v-7aa1f9b4="" id="header__body" class="header__body">
						<div data-v-7aa1f9b4="" class="header__top">
							<a data-v-7aa1f9b44="" href="#" class="header__top-left"></a>
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
								</a><a data-v-7aa1f9b4="" href="javascript:page_move(600);" class="item">세트상품 </a>
									<a data-v-7aa1f9b4="" href="event.do" class="item">이벤트 </a>
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
				<div class="container" data-v-0f5971ec="">
					<div data-v-421abad8="" data-v-ae81dc8e="" data-v-0f5971ec=""
						class="mypage-layout">
						<div data-v-3e2784be="" data-v-421abad8=""
							class="mypage-header mypage-layout__header">
							<div data-v-3e2784be="" class="mypage-header-info">
								<div data-v-3e2784be=""
									class="col row row--v-center mypage-header-info__profile">
									<figure data-v-3e2784be="">
										<img data-v-3e2784be="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_ico-leaf.svg" alt="">
									</figure>
									<div data-v-3e2784be="">
										<strong data-v-3e2784be="">${member.name }</strong> <span
											data-v-3e2784be="">${member.email }</span>
									</div>
								</div>
								<div data-v-3e2784be="" class="mypage-header-info__meta">
									<p data-v-3e2784be="">
										<span data-v-3e2784be="">배송예정</span> <a data-v-3e2784be=""
											href="myDelivery.do" class=""><em data-v-3e2784be="">${deliveryNum }</em></a>
									</p>
								</div>
								<div data-v-3e2784be="" class="mypage-header-info__meta">
									<p data-v-3e2784be="">
										<span data-v-3e2784be="">포인트</span> <a data-v-3e2784be=""
											href="myPointSearch.do" class=""><em data-v-3e2784be=""><fmt:formatNumber value="${point }" pattern="#,###" /></em></a>
									</p>
								</div>
								<div data-v-3e2784be="" class="mypage-header-info__meta">
									<p data-v-3e2784be="">
										<span data-v-3e2784be="">보유 쿠폰</span> <a data-v-3e2784be=""
											href="myCouponSearch.do" class=""><em data-v-3e2784be="">${couponNum }</em></a>
									</p>
								</div>
							</div>
						</div>
						<div data-v-421abad8="" class="mypage-layout__container-wrap">
							<div data-v-421abad8="" class="mypage-layout__container">
								<aside data-v-421abad8="" class="mypage-layout__side">
									<aside data-v-e99f4992="" data-v-421abad8=""
										class="mypage-side">
										<h2 data-v-e99f4992="">마이페이지</h2>
										<ul data-v-e99f4992="">
											<li data-v-e99f4992=""><a data-v-e99f4992=""
												href="myPayInfo.do" aria-current="page"
												class="nuxt-link-exact-active nuxt-link-active">주문/결제 내역</a></li>
											<li data-v-e99f4992=""><a data-v-e99f4992=""
												href="myDelivery.do" class="">배송현황</a></li>
											<li data-v-e99f4992=""><a data-v-e99f4992=""
												href="myBesongji.do" aria-current="page">배송지 관리</a></li>
											<li data-v-e99f4992=""><a data-v-e99f4992=""
												href="myPointSearch.do" class="">포인트 조회</a></li>
											<li data-v-e99f4992=""><a data-v-e99f4992=""
												href="myCouponSearch.do" class="">쿠폰 조회</a></li>
											<li data-v-e99f4992=""><a data-v-e99f4992=""
												href="myReviewSearch.do" class="">나의 후기</a></li>
											<li data-v-e99f4992=""><a data-v-e99f4992=""
												href="myMemberModify.do" class="">회원정보 수정</a></li>
											<li data-v-e99f4992=""><a data-v-e99f4992="" href="#" id="logout">로그아웃</a></li>
										</ul>
									</aside>
								</aside>
								<div data-v-421abad8="" class="mypage-layout__body">
									<article data-v-ae81dc8e="" data-v-421abad8="" class="order">
										<header data-v-2c0651a8="" data-v-ae81dc8e=""
											class="row--v-center page-header" data-v-421abad8="">
											<!---->
											<!---->
											<h2 data-v-2c0651a8="" class="col">주문/결제 상세내역</h2>
											<!---->
										</header>
										<section data-v-ae81dc8e="" data-v-421abad8=""
											class="order-items">
											<header data-v-ae81dc8e="" data-v-421abad8=""
												class="row--v-center order-items__header">
												<h2 data-v-ae81dc8e="" data-v-421abad8="" class="col">주문상품</h2>
<!-- 												<div data-v-ae81dc8e="" data-v-421abad8="" -->
<!-- 													class="row row--v-center row--gutter"> -->
<!-- 													<div data-v-ae81dc8e="" data-v-421abad8="" class="col"> -->
<!-- 														<button data-v-a1c889e0="" data-v-ae81dc8e="" -->
<!-- 															type="button" title="" disabled="disabled" -->
<!-- 															class="button button--side-padding button--size-small button--disabled2 button--outline2" -->
<!-- 															data-v-421abad8=""> -->
<!-- 															<span data-v-a1c889e0="" class="button__wrap"> -->
<!-- 																주문취소 </span> -->
<!-- 														</button> -->
<!-- 													</div> -->
<!-- 													<div data-v-ae81dc8e="" data-v-421abad8="" class="col"> -->
<!-- 														<button data-v-a1c889e0="" data-v-ae81dc8e="" -->
<!-- 															type="button" title="" disabled="disabled" -->
<!-- 															class="button button--side-padding button--size-small button--disabled2 button--outline2" -->
<!-- 															data-v-421abad8=""> -->
<!-- 															<span data-v-a1c889e0="" class="button__wrap"> -->
<!-- 																주문수정 </span> -->
<!-- 														</button> -->
<!-- 													</div> -->
<!-- 												</div> -->
											</header>
											<div data-v-ae81dc8e="" data-v-421abad8=""
												class="order-items__body">
												<!---->
												<div data-v-1b1887ad="" data-v-ae81dc8e=""
													class="order-items-group" data-v-421abad8="">
													<div data-v-1b1887ad=""
														class="row--v-center row--h-between order-items-group__head ">
														<!---->
														<div data-v-1b1887ad=""
															class="text-color-key text-wrapper">
															<span data-v-1b1887ad="" class="text-status"><c:if test="${vo.payment_delivery_condition eq null}">
																배송준비중
															</c:if>
															<c:if test="${vo.payment_delivery_condition ne null }">
																${vo.payment_delivery_condition}
															</c:if>
																${vo.payment_date }</span>
															<div data-v-1b1887ad="" class="invoice-wrapper">
																<span data-v-1b1887ad="" class="invoice-label">운송장번호</span>
																<span data-v-1b1887ad="" class="invoice-text">${vo.payment_code }</span>
															</div>
														</div>
													</div>
													<ul data-v-1b1887ad="">
													
														<c:forEach var="list1" items="${list1 }" varStatus="i">
															<li data-v-1b1887ad=""><section data-v-51586166=""
																	data-v-1b1887ad="" class="order-item">
																	<header data-v-51586166=""
																		class="row--v-center order-item__header">
																		<figure data-v-51586166="" class="">
																			<i data-v-51586166=""
																				style="background-image: url(&quot;${list2[i.index].item_image}&quot;);">image</i>
																		</figure>
																		<div data-v-51586166="" class="col">
																			<h3 data-v-51586166="" class="">${list1.payment_item_mapping_item_name_size }</h3>
																		</div>
																		<div data-v-51586166=""
																			class="row--v-center row--h-end order-item__info info-right">
																			<span data-v-51586166=""><em data-v-51586166="">${list1.payment_item_mapping_item_quantity }</em>
																				개</span> <span data-v-51586166=""><em
																				data-v-51586166=""><fmt:formatNumber value="${list1.payment_item_mapping_item_price }" pattern="#,###" /></em> 원</span>
																			<!---->
																		</div>
																	</header>
																</section>
															</li>
														</c:forEach>
														
													</ul>
												</div>
											</div>
										</section>
										<div data-v-ae81dc8e="" data-v-421abad8=""
											class="order__fields">
											<hr data-v-ae81dc8e="" data-v-421abad8="" class="line-bold">
											<section data-v-ae81dc8e="" data-v-421abad8=""
												class="order-field">
												<h2 data-v-ae81dc8e="" data-v-421abad8="">주문정보</h2>
												<div data-v-ae81dc8e="" data-v-421abad8=""
													class="order-field__body">
													<dl data-v-ae81dc8e="" data-v-421abad8=""
														class="row--v-center">
														<dt data-v-ae81dc8e="" data-v-421abad8="">주문번호</dt>
														<dd data-v-ae81dc8e="" data-v-421abad8="" class="col ">${vo.payment_code }</dd>
													</dl>
													<dl data-v-ae81dc8e="" data-v-421abad8=""
														class="row--v-center">
														<dt data-v-ae81dc8e="" data-v-421abad8="">주문상태</dt>
														<dd data-v-ae81dc8e="" data-v-421abad8="" class="col ">
															<c:if test="${vo.payment_delivery_condition eq null}">
																배송준비중
															</c:if>
															<c:if test="${vo.payment_delivery_condition ne null }">
																${vo.payment_delivery_condition}
															</c:if></dd>
													</dl>
													<dl data-v-ae81dc8e="" data-v-421abad8=""
														class="row--v-center">
														<dt data-v-ae81dc8e="" data-v-421abad8="">주문(결제)일시</dt>
														<dd data-v-ae81dc8e="" data-v-421abad8="" class="col">
															${vo.payment_now_date }</dd>
													</dl>
												</div>
											</section>
											<hr data-v-ae81dc8e="" data-v-421abad8="" class="line-bold">
											<section data-v-ae81dc8e="" data-v-421abad8=""
												class="order-field">
												<div data-v-ae81dc8e="" data-v-421abad8=""
													style="display: flex; flex-direction: row; align-items: center; justify-content: space-between;">
													<h2 data-v-ae81dc8e="" data-v-421abad8="">배송정보</h2>
													<nav data-v-ae81dc8e="" data-v-421abad8="">
														<!---->
													</nav>
												</div>
												<div data-v-ae81dc8e="" data-v-421abad8=""
													class="order-field__body">
													<dl data-v-ae81dc8e="" data-v-421abad8=""
														class="row--v-center">
														<dt data-v-ae81dc8e="" data-v-421abad8="">받는분</dt>
														<dd data-v-ae81dc8e="" data-v-421abad8="" class="col">${vo.payment_recipient }</dd>
													</dl>
													<dl data-v-ae81dc8e="" data-v-421abad8=""
														class="row--v-center">
														<dt data-v-ae81dc8e="" data-v-421abad8="">연락처</dt>
														<dd data-v-ae81dc8e="" data-v-421abad8="" class="col">${vo.payment_recipient_phone }</dd>
													</dl>
													<dl data-v-ae81dc8e="" data-v-421abad8=""
														class="row--v-center">
														<dt data-v-ae81dc8e="" data-v-421abad8="">배송방법</dt>
														<c:if test="${vo.payment_delivery_type == 0 }">
															<dd data-v-ae81dc8e="" data-v-421abad8="" class="col">새벽배송</dd>
														</c:if>
														<c:if test="${vo.payment_delivery_type == 1 }">
															<dd data-v-ae81dc8e="" data-v-421abad8="" class="col">택배배송</dd>
														</c:if>
													</dl>
													<dl data-v-ae81dc8e="" data-v-421abad8=""
														class="row--v-center row--h-between">
														<dt data-v-ae81dc8e="" data-v-421abad8="">배송주소</dt>
														<dd data-v-ae81dc8e="" data-v-421abad8="" class="col">
															(${vo.payment_zipcode })${vo.payment_address }</dd>
													</dl>
													<!---->
													<dl data-v-ae81dc8e="" data-v-421abad8=""
														class="row--v-center">
														<c:if test="${vo.payment_delivery_type == 0 }">
															<dt data-v-ae81dc8e="" data-v-421abad8="">출입방법</dt>
															<dd data-v-ae81dc8e="" data-v-421abad8="" class="col none-delivery-msg">${vo.payment_memo }</dd>
														</c:if>
														<c:if test="${vo.payment_delivery_type == 1 }">
															<dt data-v-ae81dc8e="" data-v-421abad8="">배송메모</dt>
															<dd data-v-ae81dc8e="" data-v-421abad8="" class="col none-delivery-msg">${vo.payment_memo }</dd>
														</c:if>
													</dl>
													<!---->
												</div>
											</section>
											<hr data-v-ae81dc8e="" data-v-421abad8="" class="line-bold">
											<section data-v-ae81dc8e="" data-v-421abad8=""
												class="order-field">
												<h2 data-v-ae81dc8e="" data-v-421abad8="">결제정보</h2>
												<div data-v-ae81dc8e="" data-v-421abad8=""
													class="order-field__body">
													<dl data-v-ae81dc8e="" data-v-421abad8=""
														class="row--v-center row--h-between">
														<dt data-v-ae81dc8e="" data-v-421abad8="">상품금액</dt>
														<dd data-v-ae81dc8e="" data-v-421abad8="">
															<em data-v-ae81dc8e="" data-v-421abad8=""><fmt:formatNumber value="${vo.payment_price }" pattern="#,###" /></em>원
														</dd>
													</dl>
													<dl data-v-ae81dc8e="" data-v-421abad8=""
														class="row--v-center row--h-between">
														<dt data-v-ae81dc8e="" data-v-421abad8="">배송비</dt>
														<dd data-v-ae81dc8e="" data-v-421abad8="">
															<em data-v-ae81dc8e="" data-v-421abad8=""><fmt:formatNumber value="${vo.payment_delivery_price }" pattern="#,###" /></em>원
														</dd>
													</dl>
													<dl data-v-ae81dc8e="" data-v-421abad8=""
														class="row--v-center row--h-between">
														<dt data-v-ae81dc8e="" data-v-421abad8="">합계</dt>
														<dd data-v-ae81dc8e="" data-v-421abad8="">
															<em data-v-ae81dc8e="" data-v-421abad8=""><fmt:formatNumber value="${vo.payment_sum_price }" pattern="#,###" /></em>원
														</dd>
													</dl>
													<hr data-v-ae81dc8e="" data-v-421abad8="">
													<dl data-v-ae81dc8e="" data-v-421abad8=""
														class="row--v-center row--h-between">
														<dt data-v-ae81dc8e="" data-v-421abad8="">쿠폰 사용</dt>
														<dd data-v-ae81dc8e="" data-v-421abad8="">
															<em data-v-ae81dc8e="" data-v-421abad8=""><fmt:formatNumber value="${vo.payment_coupon_price }" pattern="#,###" /></em>원
														</dd>
													</dl>
													<dl data-v-ae81dc8e="" data-v-421abad8=""
														class="row--v-center row--h-between">
														<dt data-v-ae81dc8e="" data-v-421abad8="">포인트 사용</dt>
														<dd data-v-ae81dc8e="" data-v-421abad8="">
															<em data-v-ae81dc8e="" data-v-421abad8=""><fmt:formatNumber value="${vo.payment_point_price }" pattern="#,###" /></em>원
														</dd>
													</dl>
													<dl data-v-ae81dc8e="" data-v-421abad8=""
														class="row--v-center row--h-between">
														<dt data-v-ae81dc8e="" data-v-421abad8="">상품 할인</dt>
														<dd data-v-ae81dc8e="" data-v-421abad8="">
															<em data-v-ae81dc8e="" data-v-421abad8="">- <fmt:formatNumber value="${vo.payment_sail_price }" pattern="#,###" /></em>원
														</dd>
													</dl>
													<!---->
													<hr data-v-ae81dc8e="" data-v-421abad8="">
													<dl data-v-ae81dc8e="" data-v-421abad8=""
														class="row--v-center row--h-between">
														<dt data-v-ae81dc8e="" data-v-421abad8="">결제금액</dt>
														<dd data-v-ae81dc8e="" data-v-421abad8="">
															<b data-v-ae81dc8e="" data-v-421abad8=""><fmt:formatNumber value="${vo.payment_final_price }" pattern="#,###" /></b>원
														</dd>
													</dl>
													<!---->
												</div>
												<nav data-v-ae81dc8e="" data-v-421abad8=""
													class="row--v-center row--h-center order-field__nav">
													<button data-v-a1c889e0="" data-v-ae81dc8e="" type="button"
														title="" onclick="location.href='myPayInfo.do'"
														class="button button-list button--inline button--side-padding"
														data-v-421abad8="">
														<span data-v-a1c889e0="" class="button__wrap">목록으로
														</span>
													</button>
													<!---->
												</nav>
											</section>
											<!---->
										</div>
										<!---->
										<!---->
										<!---->
									</article>
									<!---->
									<!---->
									<!---->
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="btn-order-wrap" data-v-0f5971ec="">
					<p data-v-0f5971ec="" class="tooltip">'바로 주문'으로 간편하게!</p>
					<div class="btn-order" data-v-0f5971ec=""></div>
				</div>
				<footer class="footer" data-v-438b4fe4="" data-v-0f5971ec="">
					<div class="footer__wrap" data-v-438b4fe4="">
						<h2 class="footer---logo" data-v-438b4fe4="">
							<img class="footer--logo" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/banner/logo.PNG" alt="SALAD:IT" data-v-438b4fe4=""> 
							<div data-v-438b4fe4=""></div>
						</h2> 
						<div class="footer__body" data-v-438b4fe4="">
							<address class="footer__cs" data-v-438b4fe4="">
								<h3 data-v-438b4fe4="">샐러딧고객센터</h3> 
								<div class="cs-time" data-v-438b4fe4="">
									<div class="btn-channel-talk" data-v-438b4fe4="">1:1 문의하기</div> 
									<div class="cs-time__inner" data-v-438b4fe4="">
										<div data-v-438b4fe4="">
											<div id="sa04" class="cs-time-text" data-v-438b4fe4="">
												<b data-v-438b4fe4="">평일</b> 
												<p data-v-438b4fe4="">9:00 - 18:00 (점심시간 13:00 - 14:00)</p>
											</div> 
											<div id="sa03" class="cs-time-text" data-v-438b4fe4="">
												<b data-v-438b4fe4="">토요일</b> 
												<p data-v-438b4fe4="">9:00 - 13:00
		                  							<span data-v-438b4fe4=""> (홈페이지 채팅문의만 운영)</span>
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
		                  	<address class="footer__address hide" data-v-438b4fe4="">
		                  		<p data-v-438b4fe4=""><b data-v-438b4fe4="">대표</b>신준혁</p> 
		                  		<p data-v-438b4fe4=""><b data-v-438b4fe4="">주소</b> <span data-v-438b4fe4="">서울특별시 성동구 왕십리로 115, 헤이그라운드 서울숲점 7층</span></p> 
		                  		<p data-v-438b4fe4=""><b data-v-438b4fe4="">사업자등록번호</b>883-81-00307</p> 
		                  		<p data-v-438b4fe4=""><b data-v-438b4fe4="">통신판매업신고</b>제 2016-서울용산-00657</p>
		                  	</address> 
		                  	<address class="footer__address help hide" data-v-438b4fe4="">
		                  		<p data-v-438b4fe4=""><b data-v-438b4fe4="">제휴문의</b><a href="mailto:biz@freshcode.me" data-v-438b4fe4="">biz@saladit.me</a></p> 
		                  		<p data-v-438b4fe4=""><b data-v-438b4fe4="">카카오ID</b><a href="#" data-v-438b4fe4="">@샐러딧-saladit</a></p> 
		                  		<p data-v-438b4fe4=""><b data-v-438b4fe4="">단체주문문의</b><a href="mailto:order@freshcode.me" data-v-438b4fe4="">order@saladit.me</a></p>
		                  	</address> 
		                  	<aside class="footer__side" data-v-438b4fe4="">
		                  		<p class="footer__copyright hide" data-v-438b4fe4="">
						          ⓒ 2020. Saladit, Inc. All Rights Reserved<br data-v-438b4fe4="">샐러딧이
						          제공하는 UI/UX, 프로그램, 콘텐츠, 디자인 등은 특허법, 저작권법,
						          부정경쟁방지법 등에 의해 보호 받고 있습니다.<br data-v-438b4fe4="">무단 복제, 유사한
						          변형, 사용 등에 대하여는 법적 책임이 있음을 알려드립니다.
						        </p> 
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
</body>
</html>