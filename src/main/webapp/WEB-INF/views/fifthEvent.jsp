<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}/resources/fifthEvent"/>
<!DOCTYPE html>
<html>
<head>

<title>프레시코드 - 전국 택배배송 서비스</title>
<meta data-n-head="ssr" charset="utf-8">
<meta data-n-head="ssr" name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1.0, minimal-ui, viewport-fit=cover, user-scalable=no">
<meta data-n-head="ssr" data-hid="subject" name="subject"
	content="프레시코드 - 프리미엄 샐러드 배달 서비스">
<meta data-n-head="ssr" data-hid="author" name="author"
	content="https://www.freshcode.me">
<meta data-n-head="ssr" data-hid="og:site_name" property="og:site_name"
	content="프레시코드 - 프리미엄 샐러드 배달 서비스">
<meta data-n-head="ssr" data-hid="fb:app_id" property="fb:app_id"
	content="323001348061168">
<meta data-n-head="ssr" data-hid="og:type" property="og:type"
	content="website">
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
	$('.btn.join').click(function(){
		location.href = "firstEvent.do";
	})
	
	$('.btn.freeDelivery').click(function(){
		var userCode = $('#userCode').val();
		console.log(userCode);
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
</script>
</head>
<body>
	<noscript data-n-head="ssr" data-hid="gtm-noscript" data-pbody="true">
		<iframe src="https://www.googletagmanager.com/ns.html?id=GTM-WWVZF4F&"
			height="0" width="0" style="display: none; visibility: hidden"
			title="gtm"></iframe>
	</noscript>
	<input type="hidden" value="${member.memberCode }" id="userCode">
	<div id="__nuxt">
		<div id="__layout">
			<main class="viewport" data-v-0f5971ec="">
				<header id="header-area" class="header" data-v-7aa1f9b4=""
					data-v-0f5971ec="">
					<div class="header-banner-wrap" data-v-7aa1f9b4="">
						<!---->
					</div>
					<div id="header__body" class="header__body" data-v-7aa1f9b4="">
						<div class="header__top" data-v-7aa1f9b4="">
							<a href="/info" class="header__top-left" data-v-7aa1f9b4=""></a>
							<div class="header__top-right" data-v-7aa1f9b4="">
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
								<a href="https://forms.gle/92o1ctx6U4CYe2yF9" target="_blank"
									data-v-7aa1f9b4="">B2B 신청</a>
							</div>
						</div>
						<!---->
						<div class="header__logo" data-v-7aa1f9b4="">
							<a href="/" class="nuxt-link-active" data-v-7aa1f9b4=""></a>
							<!---->
						</div>
						<nav class="header__menus" data-v-7aa1f9b4="">
							<div data-v-7aa1f9b4="">
								<div class="dropdown" data-v-7aa1f9b4="">
									<span class="item" data-v-7aa1f9b4="">전체 카테고리</span>
									<div class="dropdown" data-v-7aa1f9b4="">
										<ul data-v-7aa1f9b4="">
											<li data-v-7aa1f9b4=""><a href="/menu"
												data-v-7aa1f9b4="" class=""> 전체보기 </a></li>
											<li data-v-7aa1f9b4=""><a href="/menu/salad"
												data-v-7aa1f9b4="" class=""> 샐러드 </a></li>
											<li data-v-7aa1f9b4=""><a href="/menu/subscription"
												data-v-7aa1f9b4="" class="new"> 정기구독 </a></li>
											<li data-v-7aa1f9b4=""><a href="/menu/salad-wrap"
												data-v-7aa1f9b4="" class="new"> 샌드위치·랩 </a></li>
											<li data-v-7aa1f9b4=""><a href="/menu/meal"
												data-v-7aa1f9b4="" class="new"> 도시락·간편식 </a></li>
											<li data-v-7aa1f9b4=""><a href="/menu/soup"
												data-v-7aa1f9b4="" class=""> 죽·스프 </a></li>
											<li data-v-7aa1f9b4=""><a href="/menu/set"
												data-v-7aa1f9b4="" class="new"> 세트상품 </a></li>
											<li data-v-7aa1f9b4=""><a href="/menu/snack"
												data-v-7aa1f9b4="" class="new"> 간식 </a></li>
											<li data-v-7aa1f9b4=""><a href="/menu/drink"
												data-v-7aa1f9b4="" class="new"> 음료 </a></li>
											<li data-v-7aa1f9b4=""><a href="/menu/event"
												data-v-7aa1f9b4="" class="new"> 프코 편의점 </a></li>
											<li data-v-7aa1f9b4=""><a href="/menu/soon"
												data-v-7aa1f9b4="" class=""> 오픈예정 </a></li>
										</ul>
									</div>
								</div>
								<a href="/menu/subscription" class="item" data-v-7aa1f9b4="">정기구독
								</a><a href="/menu/salad" class="item" data-v-7aa1f9b4="">샐러드 </a><a
									href="/menu/salad-wrap" class="item" data-v-7aa1f9b4="">샌드위치·랩
								</a><a href="/menu/event" class="item" data-v-7aa1f9b4="">프코 편의점
								</a><a href="/event" class="item nuxt-link-active"
									data-v-7aa1f9b4="">이벤트 </a><a href="/fcospot" class="item"
									data-v-7aa1f9b4="">프코스팟 </a>
							</div>
							<div class="header__menus-side" data-v-7aa1f9b4="">
								<a href="/search" class="search-logo" data-v-7aa1f9b4=""><img
									src="/images/ic-navi-search@3x.png" alt="메뉴 검색"
									class="search-logo-img" style="width: 24px; height: 24px;"
									data-v-7aa1f9b4="">
									<div data-v-7aa1f9b4="">검색</div></a> <a href="/cart"
									class="cart-logo-wrap item" data-v-7aa1f9b4=""><div
										alt="프레시코드 장바구니" class="cart-logo" data-v-7aa1f9b4="">
										<div data-v-7aa1f9b4="" class="cart-logo-count">3</div>
									</div> <!----> 장바구니 </a> <a href="/order" class="item" data-v-7aa1f9b4=""><div
										class="icon-order" data-v-7aa1f9b4=""></div> 바로주문 </a>
							</div>
						</nav>
						<div class="header__side" data-v-7aa1f9b4="">
							<a href="/search" class="search-logo" data-v-7aa1f9b4=""><img
								src="/images/ic-navi-search@3x.png" alt="메뉴 검색"
								class="search-logo-img" style="width: 24px; height: 24px;"
								data-v-7aa1f9b4=""></a> <a href="/cart"
								class="cart-logo-wrap item" data-v-7aa1f9b4=""><div
									alt="프레시코드 장바구니" class="cart-logo" data-v-7aa1f9b4="">
									<div data-v-7aa1f9b4="" class="cart-logo-count">3</div>
								</div></a>
							<nav class="header__toggle-button" data-v-7aa1f9b4="">
								<button type="button" data-v-7aa1f9b4="">
									<img src="/images/header-img/menu_new@2x.png" alt="user-menu"
										style="width: 24px; height: 24px;" data-v-7aa1f9b4="">
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
				<div class="container" style="padding-top: 182px;"
					data-v-0f5971ec="">
					<div data-v-b6a844b8="" data-v-0f5971ec="" class="container">
						<img data-v-b6a844b8=""
							src="https://freshcode.s3.ap-northeast-2.amazonaws.com/img/2021-parcel/01.jpg">
						<div data-v-b6a844b8="" class="btn-wrap">
							<img data-v-b6a844b8=""
								src="https://freshcode.s3.ap-northeast-2.amazonaws.com/img/2021-parcel/02.jpg">
							<div data-v-b6a844b8="" class="btn freeDelivery" id="14"></div>
						</div>
						<img data-v-b6a844b8=""
							src="https://freshcode.s3.ap-northeast-2.amazonaws.com/img/2021-parcel/03.jpg">
						<div data-v-b6a844b8="" class="btn-wrap">
							<img data-v-b6a844b8=""
								src="https://freshcode.s3.ap-northeast-2.amazonaws.com/img/2021-parcel/04.jpg">
							<div data-v-b6a844b8="" class="btn join"></div>
						</div>
						<img data-v-b6a844b8=""
							src="https://freshcode.s3.ap-northeast-2.amazonaws.com/img/2021-parcel/05.jpg">
					</div>
				</div>
				<div class="btn-order-wrap" data-v-0f5971ec="">
					<p data-v-0f5971ec="" class="tooltip">'바로 주문'으로 간편하게!</p>
					<div class="btn-order" data-v-0f5971ec=""></div>
				</div>
				<footer class="footer" data-v-438b4fe4="" data-v-0f5971ec="">
					<div class="footer__wrap" data-v-438b4fe4="">
						<h2 class="footer__logo" data-v-438b4fe4="">
							<img src="/images/logo-20211111.png" alt="FRESHCODE"
								data-v-438b4fe4="">
							<div data-v-438b4fe4="" class=""></div>
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
							<address class="footer__address hide" data-v-438b4fe4="">
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
							<address class="footer__address help hide" data-v-438b4fe4="">
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
								<p class="footer__copyright hide" data-v-438b4fe4="">
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
</body>
</html>