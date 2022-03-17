<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}/resources/secondEvent"/>
<!DOCTYPE html>
<html class="">
<head>

<title>프레시코드- 신선하게 샐러드 구독</title>
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
	href="/fc-favicon-16.png" sizes="16x16">
<link data-n-head="ssr" rel="icon" type="image/x-icon"
	href="/fc-favicon-24.png" sizes="24x24">
<link data-n-head="ssr" rel="icon" type="image/x-icon"
	href="/fc-favicon-32.png" sizes="32x32">
<link data-n-head="ssr" rel="icon" type="image/x-icon"
	href="/fc-favicon-57.png" sizes="57x57">
<link data-n-head="ssr" rel="icon" type="image/x-icon"
	href="/fc-favicon-120.png" sizes="120x120">
<link data-n-head="ssr" rel="icon" type="image/x-icon"
	href="/fc-favicon-152.png" sizes="152x152">
<link data-n-head="ssr" rel="icon" type="image/x-icon"
	href="/fc-favicon-196.png" sizes="196x196">
 <link href="${path}/style.css" rel="stylesheet" type="text/css" />
 <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script type="text/javascript">
$(function() {
	var lastScrollTop = 0, delta = 100;
	$(window).scroll(function(event) {
		var st = $(this).scrollTop();
		if (Math.abs(lastScrollTop - st) > delta)
			return;
		if ((st > lastScrollTop) && (lastScrollTop > 0)) {
			if (window.innerWidth > 1023) {
				$(".header").css("top", "-120px");
			} else {
				$(".header").css("top", "0px");
			}
		} else {
			$(".header").css("top", "0px");
		}
		lastScrollTop = st;
	});
	
	$('#deliveryCouponPack').click(function(){
		var userCode = $('#userCode').val();
		if(userCode == "") {
			location.href = "login.do";
		}else {
			$.ajax({
				url : 'coupon06.do',
				dataType : 'html',
				success : function(htmlOut){
					$('body').append(htmlOut);
				}
			})
		}
	})
	
	$('.btn.md.small, .btn.rt.small').click(function(){			
		var userCode = $('#userCode').val();
		var coupon_code = $(this).attr('id');
		console.log(coupon_code);
		if(userCode == "") {
			location.href = "login.do";
		}else {
			$.ajax({
				url : 'coupon02.do',
				dataType : 'html',
				type : 'post',
				data : {
					"userCode" : userCode,
					"coupon_code" : coupon_code
				},
				success : function(htmlOut){
					$('body').append(htmlOut);
				}
			})
		}
	})
	
	$(document).on('click', '#closeModal', function(){
		$('.swal2-container').detach();
	})
	
});
function page_move(tagNum){
    var f = document.paging; //폼 name
    f.tagMain01.value = tagNum; //POST방식으로 넘기고 싶은 값
    f.action="tapPage.do";//이동할 페이지
    f.method="post";//POST방식
    f.submit();
    console.log("tagNum");
}

function coupon_page(){
	var userCode = $('#userCode').val();
	if(userCode == "") {
		location.href = "login.do";
	}else {
		var f = document.couponPage;
		f.promoCode.value = "신선하게샐러드구독";
		f.action="myCouponSearch2.do";
		f.method="post";
		f.submit();
		console.log(f.couponPage.value);
	}
}
</script>
</head>
<body class="" style="padding-right: 0px;">
	<noscript data-n-head="ssr" data-hid="gtm-noscript" data-pbody="true">
		<iframe src="https://www.googletagmanager.com/ns.html?id=GTM-WWVZF4F&"
			height="0" width="0" style="display: none; visibility: hidden"
			title="gtm"></iframe>
	</noscript>
	<input type="hidden" value="${member.memberCode }" id="userCode">
	<div id="__nuxt">
		<div id="__layout">
			<main data-v-0f5971ec="" class="viewport">
				<header data-v-7aa1f9b4="" data-v-0f5971ec="" id="header-area"
					class="header">
					<div data-v-7aa1f9b4="" class="header-banner-wrap">
						<!---->
					</div>
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
								<span data-v-7aa1f9b4="">1:1문의</span>
								<a data-v-7aa1f9b4="" href="https://forms.gle/92o1ctx6U4CYe2yF9" target="_blank">B2B 신청</a>
							</div>
						</div>
						<!---->
						<div data-v-7aa1f9b4="" class="header__logo">
							<a data-v-7aa1f9b4="" href="/" class="nuxt-link-active"></a>
							<!---->
						</div>
						<form name="paging">
							<input type="hidden" name="tagMain01" value="">
						</form>
						<form name="couponPage">
							<input type="hidden" name="promoCode" value="">
						</form>
						<nav data-v-7aa1f9b4="" class="header__menus">
							<div data-v-7aa1f9b4="">
								<div data-v-7aa1f9b4="" class="dropdown">
									<span data-v-7aa1f9b4="" class="item">전체 카테고리</span>
									<div data-v-7aa1f9b4="" class="dropdown">
										<ul data-v-7aa1f9b4="">
											<li data-v-7aa1f9b4=""><a data-v-7aa1f9b4=""
												href="/menu" class=""> 전체보기 </a></li>
											<li data-v-7aa1f9b4=""><a data-v-7aa1f9b4=""
												href="/menu/salad" class=""> 샐러드 </a></li>
											<li data-v-7aa1f9b4=""><a data-v-7aa1f9b4=""
												href="/menu/subscription" class="new"> 정기구독 </a></li>
											<li data-v-7aa1f9b4=""><a data-v-7aa1f9b4=""
												href="/menu/salad-wrap" class="new"> 샌드위치·랩 </a></li>
											<li data-v-7aa1f9b4=""><a data-v-7aa1f9b4=""
												href="/menu/meal" class="new"> 도시락·간편식 </a></li>
											<li data-v-7aa1f9b4=""><a data-v-7aa1f9b4=""
												href="/menu/soup" class=""> 죽·스프 </a></li>
											<li data-v-7aa1f9b4=""><a data-v-7aa1f9b4=""
												href="/menu/set" class="new"> 세트상품 </a></li>
											<li data-v-7aa1f9b4=""><a data-v-7aa1f9b4=""
												href="/menu/snack" class="new"> 간식 </a></li>
											<li data-v-7aa1f9b4=""><a data-v-7aa1f9b4=""
												href="/menu/drink" class="new"> 음료 </a></li>
											<li data-v-7aa1f9b4=""><a data-v-7aa1f9b4=""
												href="/menu/event" class="new"> 프코 편의점 </a></li>
											<li data-v-7aa1f9b4=""><a data-v-7aa1f9b4=""
												href="/menu/soon" class=""> 오픈예정 </a></li>
										</ul>
									</div>
								</div>
								<a data-v-7aa1f9b4="" href="/menu/subscription" class="item">정기구독
								</a><a data-v-7aa1f9b4="" href="/menu/salad" class="item">샐러드 </a><a
									data-v-7aa1f9b4="" href="/menu/salad-wrap" class="item">샌드위치·랩
								</a><a data-v-7aa1f9b4="" href="/menu/event" class="item">프코 편의점
								</a><a data-v-7aa1f9b4="" href="/event"
									class="item nuxt-link-active">이벤트 </a><a data-v-7aa1f9b4=""
									href="/fcospot" class="item">프코스팟 </a>
							</div>
							<div data-v-7aa1f9b4="" class="header__menus-side">
								<a data-v-7aa1f9b4="" href="/search" class="search-logo"><img
									data-v-7aa1f9b4="" src="/images/ic-navi-search@3x.png"
									alt="메뉴 검색" class="search-logo-img"
									style="width: 24px; height: 24px;">
									<div data-v-7aa1f9b4="">검색</div></a> <a data-v-7aa1f9b4=""
									href="/cart" class="cart-logo-wrap item"><div
										data-v-7aa1f9b4="" alt="프레시코드 장바구니" class="cart-logo">
										<div data-v-7aa1f9b4="" class="cart-logo-count">3</div>
									</div> <!----> 장바구니 </a> <a data-v-7aa1f9b4="" href="/order" class="item"><div
										data-v-7aa1f9b4="" class="icon-order"></div> 바로주문 </a>
							</div>
						</nav>
						<div data-v-7aa1f9b4="" class="header__side">
							<a data-v-7aa1f9b4="" href="/search" class="search-logo"><img
								data-v-7aa1f9b4="" src="/images/ic-navi-search@3x.png"
								alt="메뉴 검색" class="search-logo-img"
								style="width: 24px; height: 24px;"></a> <a data-v-7aa1f9b4=""
								href="/cart" class="cart-logo-wrap item"><div
									data-v-7aa1f9b4="" alt="프레시코드 장바구니" class="cart-logo">
									<div data-v-7aa1f9b4="" class="cart-logo-count">3</div>
								</div></a>
							<nav data-v-7aa1f9b4="" class="header__toggle-button">
								<button data-v-7aa1f9b4="" type="button">
									<img data-v-7aa1f9b4=""
										src="/images/header-img/menu_new@2x.png" alt="user-menu"
										style="width: 24px; height: 24px;">
								</button>
							</nav>
						</div>
					</div>
					<div data-v-7aa1f9b4="" class="mobile-nav js-mobile-nav">
						<div data-v-7aa1f9b4="" class="mobile-nav-wrap">
							<div data-v-7aa1f9b4="" class="mobile-nav-scroll">
								<ul data-v-7aa1f9b4="" class="mobile-nav-contents">
									<li data-v-7aa1f9b4="" class="mobile-nav-contents-item"><a
										data-v-7aa1f9b4="" href="/menu" class=""> 전체 메뉴 </a></li>
									<li data-v-7aa1f9b4="" class="mobile-nav-contents-item"><a
										data-v-7aa1f9b4="" href="/menu/subscription" class="">
											정기구독 </a></li>
									<li data-v-7aa1f9b4="" class="mobile-nav-contents-item"><a
										data-v-7aa1f9b4="" href="/menu/event" class=""> 프코 편의점 </a></li>
									<li data-v-7aa1f9b4="" class="mobile-nav-contents-item"><a
										data-v-7aa1f9b4="" href="/info" class=""> 배송안내 </a></li>
									<li data-v-7aa1f9b4="" class="mobile-nav-contents-item"><a
										data-v-7aa1f9b4="" href="/fcospot" class=""> 프코스팟 </a></li>
								</ul>
							</div>
							<div data-v-7aa1f9b4="" class="all-menus-container"
								style="display: none;">
								<div data-v-7aa1f9b4="" class="all-menus-list-wrap">
									<ul data-v-7aa1f9b4="" class="all-menus-list js-all-menus-list">
										<li data-v-7aa1f9b4="" class="all-menus-item"><a
											data-v-7aa1f9b4="" href="/menu"
											class="js-all-menus-item-link-0 all-menus-item-link">
												전체보기 </a></li>
										<li data-v-7aa1f9b4="" class="all-menus-item"><a
											data-v-7aa1f9b4="" href="/menu/salad"
											class="js-all-menus-item-link-2 all-menus-item-link"> 샐러드
										</a></li>
										<li data-v-7aa1f9b4="" class="all-menus-item"><a
											data-v-7aa1f9b4="" href="/menu/subscription"
											class="js-all-menus-item-link-1 all-menus-item-link new">
												정기구독 </a></li>
										<li data-v-7aa1f9b4="" class="all-menus-item"><a
											data-v-7aa1f9b4="" href="/menu/salad-wrap"
											class="js-all-menus-item-link-3 all-menus-item-link new">
												샌드위치·랩 </a></li>
										<li data-v-7aa1f9b4="" class="all-menus-item"><a
											data-v-7aa1f9b4="" href="/menu/meal"
											class="js-all-menus-item-link-4 all-menus-item-link new">
												도시락·간편식 </a></li>
										<li data-v-7aa1f9b4="" class="all-menus-item"><a
											data-v-7aa1f9b4="" href="/menu/soup"
											class="js-all-menus-item-link-10 all-menus-item-link">
												죽·스프 </a></li>
										<li data-v-7aa1f9b4="" class="all-menus-item"><a
											data-v-7aa1f9b4="" href="/menu/set"
											class="js-all-menus-item-link-5 all-menus-item-link new">
												세트상품 </a></li>
										<li data-v-7aa1f9b4="" class="all-menus-item"><a
											data-v-7aa1f9b4="" href="/menu/snack"
											class="js-all-menus-item-link-6 all-menus-item-link new">
												간식 </a></li>
										<li data-v-7aa1f9b4="" class="all-menus-item"><a
											data-v-7aa1f9b4="" href="/menu/drink"
											class="js-all-menus-item-link-7 all-menus-item-link new">
												음료 </a></li>
										<li data-v-7aa1f9b4="" class="all-menus-item"><a
											data-v-7aa1f9b4="" href="/menu/event"
											class="js-all-menus-item-link-8 all-menus-item-link new">
												프코 편의점 </a></li>
										<li data-v-7aa1f9b4="" class="all-menus-item"><a
											data-v-7aa1f9b4="" href="/menu/soon"
											class="js-all-menus-item-link-9 all-menus-item-link">
												오픈예정 </a></li>
									</ul>
								</div>
								<div data-v-7aa1f9b4="" class="all-menus-shadow"></div>
								<div data-v-7aa1f9b4="" class="all-menus-arrow-wrap">
									<img data-v-7aa1f9b4="" src="/images/icon-arrow-down@2x.png"
										alt="" class="all-menus-arrow">
								</div>
							</div>
						</div>
					</div>
					<!---->
					<!---->
					<!---->
				</header>
				<div data-v-0f5971ec="" class="container"
					style="padding-top: 182px;">
					<div data-v-25f49d6b="" data-v-0f5971ec="" class="container">
						<img data-v-25f49d6b=""
							src="https://freshcode.s3.ap-northeast-2.amazonaws.com/img/2022-02-brand-film/01.png">
						<div data-v-25f49d6b="" class="youtube">
							<iframe id="youtube-player-1" frameborder="0" allowfullscreen="1"
								allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
								title="YouTube video player" width="100%" height="360"
								src="https://www.youtube.com/embed/gT8h3jRKNt8?start=1&amp;autoplay=1&amp;enablejsapi=1&amp;origin=https%3A%2F%2Fwww.freshcode.me&amp;widgetid=1"
								data-gtm-yt-inspected-1_19="true"></iframe>
						</div>
						<img data-v-25f49d6b=""
							src="https://freshcode.s3.ap-northeast-2.amazonaws.com/img/2022-02-brand-film/02.png">
						<div data-v-25f49d6b="" class="btn-wrap">
							<img data-v-25f49d6b=""
								src="https://freshcode.s3.ap-northeast-2.amazonaws.com/img/2022-02-brand-film/03.png">
							<div data-v-25f49d6b="" class="btn"></div>
						</div>
						<img data-v-25f49d6b=""
							src="https://freshcode.s3.ap-northeast-2.amazonaws.com/img/2022-02-brand-film/04.png">
						<div data-v-25f49d6b="" class="btn-wrap">
							<img data-v-25f49d6b=""
								src="https://freshcode.s3.ap-northeast-2.amazonaws.com/img/2022-02-brand-film/05.png">
							<div data-v-25f49d6b="" class="btn lt" onclick="coupon_page()"></div>
							<div data-v-25f49d6b="" class="btn rt"></div>
						</div>
						<img data-v-25f49d6b=""
							src="https://freshcode.s3.ap-northeast-2.amazonaws.com/img/2022-02-brand-film/06.png">
						<div data-v-25f49d6b="" class="btn-wrap">
							<img data-v-25f49d6b=""
								src="https://freshcode.s3.ap-northeast-2.amazonaws.com/img/2022-02-brand-film/07.png">
							<div data-v-25f49d6b="" class="btn lt small"></div>
							<div data-v-25f49d6b="" class="btn md small" id="11"></div>
							<div data-v-25f49d6b="" class="btn rt small" id="12"></div>
						</div>
						<img data-v-25f49d6b=""
							src="https://freshcode.s3.ap-northeast-2.amazonaws.com/img/2022-02-brand-film/08.png">
						<div data-v-25f49d6b="" class="btn-wrap">
							<img data-v-25f49d6b=""
								src="https://freshcode.s3.ap-northeast-2.amazonaws.com/img/2022-02-brand-film/09.png">
							<div data-v-25f49d6b="" class="btn-bar" id="deliveryCouponPack"></div>
						</div>
						<img data-v-25f49d6b=""
							src="https://freshcode.s3.ap-northeast-2.amazonaws.com/img/2022-02-brand-film/10.png">
						<div data-v-25f49d6b="" class="btn-wrap">
							<img data-v-25f49d6b=""
								src="https://freshcode.s3.ap-northeast-2.amazonaws.com/img/2022-02-brand-film/11.png">
							<div data-v-25f49d6b="" class="btn-bar" onclick="page_move(100)"></div>
						</div>
						<img data-v-25f49d6b=""
							src="https://freshcode.s3.ap-northeast-2.amazonaws.com/img/2022-02-brand-film/12.png">
					</div>
				</div>
				<div data-v-0f5971ec="" class="btn-order-wrap">
					<p data-v-0f5971ec="" class="tooltip">'바로 주문'으로 간편하게!</p>
					<div data-v-0f5971ec="" class="btn-order"></div>
				</div>
				<footer data-v-438b4fe4="" data-v-0f5971ec="" class="footer">
					<div data-v-438b4fe4="" class="footer__wrap">
						<h2 data-v-438b4fe4="" class="footer__logo">
							<img data-v-438b4fe4="" src="/images/logo-20211111.png"
								alt="FRESHCODE">
							<div data-v-438b4fe4="" class=""></div>
						</h2>
						<div data-v-438b4fe4="" class="footer__body">
							<nav data-v-438b4fe4="" class="footer__menus">
								<div data-v-438b4fe4="" class="footer__menus-item">
									<a data-v-438b4fe4="" href="#">FAQ</a> <a data-v-438b4fe4=""
										href="/terms" class="">이용약관</a> <a data-v-438b4fe4=""
										href="/privacy" class="">개인정보처리방침</a>
								</div>
								<div data-v-438b4fe4="" class="footer__menus-item">
									<a data-v-438b4fe4="" href="#">제휴문의</a> <a data-v-438b4fe4=""
										href="#">채용문의</a> <a data-v-438b4fe4="" href="#">케이터링 문의</a>
								</div>
							</nav>
							<address data-v-438b4fe4="" class="footer__cs">
								<h3 data-v-438b4fe4="">프코고객센터</h3>
								<div data-v-438b4fe4="" class="cs-time">
									<div data-v-438b4fe4="" class="btn-channel-talk">1:1 문의하기</div>
									<div data-v-438b4fe4="" class="cs-time__inner">
										<div data-v-438b4fe4="">
											<div data-v-438b4fe4="" class="cs-time-text">
												<b data-v-438b4fe4="">평일</b>
												<p data-v-438b4fe4="">9:00 - 18:00 (점심시간 13:00 - 14:00)</p>
											</div>
											<div data-v-438b4fe4="" class="cs-time-text">
												<b data-v-438b4fe4="">토요일</b>
												<p data-v-438b4fe4="">
													9:00 - 13:00 <span data-v-438b4fe4="">&nbsp;(홈페이지
														채팅문의만 운영)</span>
												</p>
											</div>
										</div>
										<div data-v-438b4fe4="">
											<div data-v-438b4fe4="" class="cs-time-text">
												<b data-v-438b4fe4="">공휴일</b>
												<p data-v-438b4fe4="">휴무</p>
											</div>
											<div data-v-438b4fe4="" class="cs-time-text">
												<b data-v-438b4fe4="">고객센터</b>
												<p data-v-438b4fe4="">1644-4559</p>
											</div>
										</div>
									</div>
								</div>
							</address>
							<address data-v-438b4fe4="" class="footer__address hide">
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
							<address data-v-438b4fe4="" class="footer__address help hide">
								<p data-v-438b4fe4="">
									<b data-v-438b4fe4="">제휴문의</b><a data-v-438b4fe4=""
										href="mailto:biz@freshcode.me">biz@freshcode.me</a>
								</p>
								<p data-v-438b4fe4="">
									<b data-v-438b4fe4="">카카오ID</b><a data-v-438b4fe4="" href="#">@프레시코드-freshcode</a>
								</p>
								<p data-v-438b4fe4="">
									<b data-v-438b4fe4="">단체주문문의</b><a data-v-438b4fe4=""
										href="mailto:order@freshcode.me">order@freshcode.me</a>
								</p>
							</address>
							<aside data-v-438b4fe4="" class="footer__side">
								<p data-v-438b4fe4="" class="footer__copyright hide">
									ⓒ 2020. FreshCode, Inc. All Rights Reserved<br
										data-v-438b4fe4="">프레시코드가 제공하는 UI/UX, 프로그램, 콘텐츠, 디자인 등은
									특허법, 저작권법, 부정경쟁방지법 등에 의해 보호 받고 있습니다.<br data-v-438b4fe4="">무단
									복제, 유사한 변형, 사용 등에 대하여는 법적 책임이 있음을 알려드립니다.
								</p>
								<div data-v-438b4fe4="" class="footer__sns-wrap">
									<nav data-v-438b4fe4="" class="footer__sns">
										<img data-v-438b4fe4="" src="/images/instagram@2x.png"
											title="instagram" class=""><img data-v-438b4fe4=""
											src="/images/facebook@2x.png" title="facebook" class=""><img
											data-v-438b4fe4="" src="/images/youtube@3x.png"
											title="youtube" class=""><img data-v-438b4fe4=""
											src="/images/group-21@2x.png" title="blog" class=""><img
											data-v-438b4fe4="" src="/images/blog-post@2x.png"
											title="Naver post" class=""><img data-v-438b4fe4=""
											src="/images/kakao-channel@2x.png" title="kakao channel"
											class="">
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
</body>
</html>