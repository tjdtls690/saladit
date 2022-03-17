<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path"
	value="${pageContext.request.contextPath}/resources/writeReview" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>프레시코드 - 프리미엄 샐러드 배달 서비스</title>
<link href="${path}/writeReview.css" rel="stylesheet" type="text/css" />
<link href="${path}/writeReview2.css" rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script type="text/javascript">
	$(function(){
		$('.star-rating').children('.star').on('click', function(){
			var star = $(this).attr('for');
			document.review_form.star.value = $('.star-rating').children('input#' + star).val();
		})
	});
</script>
<!-- <meta data-n-head="ssr" charset="utf-8"> -->
<!-- <meta data-n-head="ssr" name="viewport" -->
<!-- 	content="width=device-width, initial-scale=1, maximum-scale=1.0, minimal-ui, viewport-fit=cover, user-scalable=no"> -->
<!-- <meta data-n-head="ssr" data-hid="title" name="title" -->
<!-- 	content="프레시코드 - 프리미엄 샐러드 배달 서비스"> -->
<!-- <meta data-n-head="ssr" data-hid="subject" name="subject" -->
<!-- 	content="프레시코드 - 프리미엄 샐러드 배달 서비스"> -->
<!-- <meta data-n-head="ssr" data-hid="description" name="description" -->
<!-- 	content="프코스팟은 무료배송. 오늘 주문하면 내일 아침 새벽배송. 맛있는 샐러드 도시락을 신선>하게 배달합니다. 다이어트 샐러드도 역시 프레시코드."> -->
<!-- <meta data-n-head="ssr" data-hid="keywords" name="keywords" -->
<!-- 	content="프레시코드, 새벽배송, 샐러드, 신선배달"> -->
<!-- <meta data-n-head="ssr" data-hid="author" name="author" -->
<!-- 	content="https://www.freshcode.me"> -->
<!-- <meta data-n-head="ssr" data-hid="og:title" property="og:title" -->
<!-- 	content="프레시코드 - 프리미엄 샐러드 배달 서비스"> -->
<!-- <meta data-n-head="ssr" data-hid="og:description" -->
<!-- 	property="og:description" content="undefined"> -->
<!-- <meta data-n-head="ssr" data-hid="og:type" property="og:type" -->
<!-- 	content="website"> -->
<!-- <meta data-n-head="ssr" data-hid="og:url" property="og:url" -->
<!-- 	content="https://www.freshcode.me"> -->
<!-- <meta data-n-head="ssr" data-hid="og:image" property="og:image" -->
<!-- 	content="https://s3.ap-northeast-2.amazonaws.com/freshcode/img/seo/main.png"> -->
<!-- <meta data-n-head="ssr" data-hid="og:site_name" property="og:site_name" -->
<!-- 	content="프레시코드 - 프리미엄 샐러드 배달 서비스"> -->
</head>
<body>
	<noscript data-n-head="ssr" data-hid="gtm-noscript" data-pbody="true">
		<iframe src="https://www.googletagmanager.com/ns.html?id=GTM-WWVZF4F&"
			height="0" width="0" style="display: none; visibility: hidden"
			title="gtm"></iframe>
	</noscript>
	<div id="__nuxt">
		<div id="__layout">
			<main data-v-0f5971ec="" class="viewport">
				<header data-v-30697495="" data-v-0f5971ec="" id="header-area"
					class="header hidden">
					<div data-v-30697495="" class="header-banner-wrap">
						<!---->
					</div>
					<div data-v-30697495="" id="header__body" class="header__body">
						<div data-v-30697495="" class="header__top">
							<a data-v-30697495="" href="/info" class="header__top-left"></a>
							<div data-v-30697495="" class="header__top-right">
								<a data-v-30697495="" href="/mypage/orders" class="">신준혁 <span
									data-v-30697495="">님</span></a> <span data-v-30697495="">1:1문의</span>
								<a data-v-30697495="" href="https://forms.gle/92o1ctx6U4CYe2yF9"
									target="_blank">B2B 신청</a>
							</div>
						</div>
						<!---->
						<div data-v-30697495="" class="header__logo">
							<a data-v-30697495="" href="/" class="nuxt-link-active"></a>
							<!---->
						</div>
						<nav data-v-30697495="" class="header__menus">
							<div data-v-30697495="">
								<div data-v-30697495="" class="dropdown">
									<span data-v-30697495="" class="item">전체 카테고리</span>
									<div data-v-30697495="" class="dropdown">
										<ul data-v-30697495="">
											<li data-v-30697495=""><a data-v-30697495=""
												href="/menu" class=""> 전체보기 </a></li>
											<li data-v-30697495=""><a data-v-30697495=""
												href="/menu/salad" class=""> 샐러드 </a></li>
											<li data-v-30697495=""><a data-v-30697495=""
												href="/menu/subscription" class="new"> 정기구독 </a></li>
											<li data-v-30697495=""><a data-v-30697495=""
												href="/menu/salad-wrap" class="new"> 샌드위치·랩 </a></li>
											<li data-v-30697495=""><a data-v-30697495=""
												href="/menu/meal" class="new"> 도시락·간편식 </a></li>
											<li data-v-30697495=""><a data-v-30697495=""
												href="/menu/soup" class=""> 죽·스프 </a></li>
											<li data-v-30697495=""><a data-v-30697495=""
												href="/menu/set" class="new"> 세트상품 </a></li>
											<li data-v-30697495=""><a data-v-30697495=""
												href="/menu/snack" class="new"> 간식 </a></li>
											<li data-v-30697495=""><a data-v-30697495=""
												href="/menu/drink" class="new"> 음료 </a></li>
											<li data-v-30697495=""><a data-v-30697495=""
												href="/menu/event" class="new"> 베리베리머치 </a></li>
											<li data-v-30697495=""><a data-v-30697495=""
												href="/menu/soon" class=""> 오픈예정 </a></li>
										</ul>
									</div>
								</div>
								<a data-v-30697495="" href="/menu/subscription" class="item">정기구독
								</a><a data-v-30697495="" href="/menu/salad" class="item">샐러드 </a><a
									data-v-30697495="" href="/menu/salad-wrap" class="item">샌드위치·랩
								</a><a data-v-30697495="" href="/menu/event" class="item">베리베리머치
								</a><a data-v-30697495="" href="/event" class="item">이벤트 </a><a
									data-v-30697495="" href="/fcospot" class="item">프코스팟 </a>
							</div>
							<div data-v-30697495="" class="header__menus-side">
								<a data-v-30697495="" href="/search" class="search-logo"><img
									data-v-30697495="" src="/images/ic-navi-search@3x.png"
									alt="메뉴 검색" class="search-logo-img"
									style="width: 24px; height: 24px;">
									<div data-v-30697495="">검색</div></a> <a data-v-30697495=""
									href="/cart" class="cart-logo-wrap item"><div
										data-v-30697495="" alt="프레시코드 장바구니" class="cart-logo empty">
										<!---->
									</div> <!----> 장바구니 </a> <a data-v-30697495="" href="/order" class="item"><div
										data-v-30697495="" class="icon-order"></div> 바로주문 </a>
							</div>
						</nav>
						<div data-v-30697495="" class="header__side">
							<a data-v-30697495="" href="/search" class="search-logo"><img
								data-v-30697495="" src="/images/ic-navi-search@3x.png"
								alt="메뉴 검색" class="search-logo-img"
								style="width: 24px; height: 24px;"></a> <a data-v-30697495=""
								href="/cart" class="cart-logo-wrap item"><div
									data-v-30697495="" alt="프레시코드 장바구니" class="cart-logo empty">
									<!---->
								</div></a>
							<nav data-v-30697495="" class="header__toggle-button">
								<button data-v-30697495="" type="button">
									<img data-v-30697495=""
										src="/images/header-img/menu_new@2x.png" alt="user-menu"
										style="width: 24px; height: 24px;">
								</button>
							</nav>
						</div>
					</div>
					<!---->
					<!---->
					<!---->
					<!---->
				</header>
				<div data-v-0f5971ec="" class="container">
					<div data-v-421abad8="" data-v-89f34e0a="" data-v-0f5971ec=""
						class="mypage-layout">
						<div data-v-3e2784be="" data-v-421abad8=""
							class="mypage-header mypage-layout__header">
							<div data-v-3e2784be="" class="mypage-header-info">
								<div data-v-3e2784be=""
									class="col row row--v-center mypage-header-info__profile">
									<figure data-v-3e2784be="">
										<img data-v-3e2784be="" src="/images/ico-leaf.svg" alt="">
									</figure>
									<div data-v-3e2784be="">
										<strong data-v-3e2784be="">신준혁</strong> <span
											data-v-3e2784be="">tjdtls690@naver.com</span>
									</div>
								</div>
								<div data-v-3e2784be="" class="mypage-header-info__meta">
									<p data-v-3e2784be="">
										<span data-v-3e2784be="">배송예정</span> <a data-v-3e2784be=""
											href="/mypage/delivery" class=""><em data-v-3e2784be="">0</em></a>
									</p>
								</div>
								<div data-v-3e2784be="" class="mypage-header-info__meta">
									<p data-v-3e2784be="">
										<span data-v-3e2784be="">포인트</span> <a data-v-3e2784be=""
											href="/mypage/points" class=""><em data-v-3e2784be="">0</em></a>
									</p>
								</div>
								<div data-v-3e2784be="" class="mypage-header-info__meta">
									<p data-v-3e2784be="">
										<span data-v-3e2784be="">보유 쿠폰</span> <a data-v-3e2784be=""
											href="/mypage/coupons" class=""><em data-v-3e2784be="">0</em></a>
									</p>
								</div>
							</div>
							<div data-v-3e2784be="" class="mypage-header-invite">
								<div data-v-3e2784be="" class="mypage-header-invite__wrap">
									<div data-v-3e2784be="" class="mypage-header-invite__message">
										<a data-v-3e2784be="" href="/mypage/invite" class=""><p
												data-v-3e2784be="" class="title">친구 초대하고 친구랑 같이 포인트
												적립하세요!</p>
											<p data-v-3e2784be="" class="msg">
												<span data-v-3e2784be="">친구가 내 추천코드로 가입하면 친구에게 3,000
													포인트!</span><br data-v-3e2784be=""> <span data-v-3e2784be="">친구가
													첫 주문하면 나한테도 3,000 포인트 선물이!</span>
											</p></a>
									</div>
									<div data-v-3e2784be="" class="mypage-header-invite__share">
										<div data-v-3e2784be="" class="code">
											<strong data-v-3e2784be="">내 추천코드</strong>
											<code data-v-3e2784be="">1sby67m4cf</code>
										</div>
										<div data-v-3e2784be="" class="share">
											<strong data-v-3e2784be="">공유하기</strong>
											<div data-v-3e2784be="" class="share__body">
												<div data-v-3e2784be="">
													<span data-v-3e2784be="" tabindex="0"
														data-link="#share-facebook"
														class="button share-button-mypage-header"><span
														class="row--v-center"><img
															src="/images/ico-share-facebook.svg" alt=""> <em
															class="col">페이스북</em></span></span>
												</div>
												<div data-v-3e2784be="">
													<button data-v-3e2784be="" type="button">
														<span data-v-3e2784be="" class="row--v-center"><img
															data-v-3e2784be="" src="/images/ico-share-link.svg"
															alt=""> <em data-v-3e2784be="" class="col">링크복사</em></span>
													</button>
												</div>
											</div>
										</div>
									</div>
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
												href="/mypage/orders" class="">주문/결제 내역</a></li>
											<li data-v-e99f4992=""><a data-v-e99f4992=""
												href="/mypage/delivery" class="">배송현황</a></li>
											<li data-v-e99f4992=""><a data-v-e99f4992=""
												href="/mypage/destination" class="">배송지 관리</a></li>
											<li data-v-e99f4992=""><a data-v-e99f4992=""
												href="/mypage/spot-req" class="">프코스팟신청 현황</a></li>
											<li data-v-e99f4992=""><a data-v-e99f4992=""
												href="/mypage/cards" class="">카드 관리</a></li>
											<li data-v-e99f4992=""><a data-v-e99f4992=""
												href="/mypage/invite" class="">친구 초대</a></li>
											<li data-v-e99f4992=""><a data-v-e99f4992=""
												href="/mypage/points" class="">포인트 조회</a></li>
											<li data-v-e99f4992=""><a data-v-e99f4992=""
												href="/mypage/coupons" class="">쿠폰 조회</a></li>
											<li data-v-e99f4992=""><a data-v-e99f4992=""
												href="/mypage/review" class="nuxt-link-active">나의 후기</a></li>
											<li data-v-e99f4992=""><a data-v-e99f4992=""
												href="/user/password" class="">회원정보 수정</a></li>
											<li data-v-e99f4992=""><a data-v-e99f4992="" href="#">로그아웃</a></li>
										</ul>
									</aside>
								</aside>
								<div data-v-421abad8="" class="mypage-layout__body">
									<article data-v-89f34e0a="" data-v-421abad8=""
										class="review-write">
										<header data-v-2c0651a8="" data-v-89f34e0a=""
											class="row--v-center page-header" data-v-421abad8="">
											<!---->
											<!---->
											<h2 data-v-2c0651a8="" class="col">후기 작성</h2>
											<!---->
										</header>
										<div data-v-89f34e0a="" data-v-421abad8="" class="drawer-wrap">
											<div data-v-89f34e0a="" data-v-421abad8=""
												class="row row--v-center row--v-center"
												style="background: rgb(80, 80, 80);">
												<div data-v-89f34e0a="" data-v-421abad8=""
													class="col-12 row row--h-between row--v-center"
													style="height: 40px; cursor: pointer; flex-wrap: nowrap;">
													<em data-v-89f34e0a="" data-v-421abad8=""
														class="drawer-title">지금 후기를 작성해주시면 <span
														data-v-89f34e0a="" data-v-421abad8=""
														style="color: rgb(245, 163, 36);">최대 300원의 포인트</span>를
														적립해드려요!
													</em>
													<!---->
													<svg data-v-89f34e0a="" xmlns="http://www.w3.org/2000/svg"
														width="24" height="24" viewBox="0 0 24 24"
														aria-labelledby="arrow-down-1" role="presentation"
														class="icon" data-v-421abad8=""
														style="padding-right: 16px; color: white;">
														<g fill="none" fill-rule="evenodd"> <path
															fill="currentColor" fill-rule="nonzero"
															d="M3.455 8.138a.5.5 0 0 0-.69.724l8.946 8.5a.5.5 0 0 0 .689 0l8.944-8.5a.5.5 0 0 0-.688-.724l-8.6 8.172-8.601-8.172z"></path></g></svg>
												</div>
												<!---->
											</div>
										</div>
										<div data-v-290d27aa="" data-v-89f34e0a=""
											class="review-item review-write__item" data-v-421abad8=""
											style="border: 1px solid rgb(231, 231, 231); padding: 24px; margin: 3px 0px 0px;">
											<p data-v-290d27aa="" class="review-item__date">
												배송완료 <em data-v-290d27aa="">2022/01/26</em>
											</p>
											<div data-v-290d27aa="" class="row--v-center">
												<div data-v-290d27aa="" href="#" target="_blank"
													class="col-12 col--lg review-item__body">
													<dl data-v-290d27aa="" class="row">
														<dt data-v-290d27aa="">
															<figure data-v-290d27aa=""
																style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/origin/267_20210427171253&quot;);"></figure>
														</dt>
														<dd data-v-290d27aa="" class="col">
															<strong data-v-290d27aa="">[키토제니] 방탄커피 / 1개입</strong>
														</dd>
													</dl>
												</div>
												<!---->
											</div>
										</div>
										<form name="review_form" data-v-89f34e0a="" data-v-421abad8="" method="post" action="insertReview.do">
											<input name="itemNum" type="hidden" value="10"/>
											<input name="star" type="hidden" value=""/>
											<input name="userName" type="hidden" value="신준혁"/>
											<div data-v-89f34e0a="" data-v-421abad8=""
												class="review-write__rating">
												<h3 data-v-89f34e0a="" data-v-421abad8="">만족도는 어느정도
													였나요?</h3>
												<p data-v-89f34e0a="" data-v-421abad8="">터치하여 별점을 선택해주세요</p>
												<div data-v-89f34e0a="" data-v-421abad8="" class="star">
													
													<div class="star-wrap">
														<div class="star-rating">
															<input type="radio" id="5-stars" name="rating" value="5"/>
															<label for="5-stars" class="star">★</label>
															<input type="radio" id="4-stars" name="rating" value="4"/>
															<label for="4-stars" class="star">★</label>
															<input type="radio" id="3-stars" name="rating" value="3"/>
															<label for="3-stars" class="star">★</label>
															<input type="radio" id="2-stars" name="rating" value="2"/>
															<label for="2-stars" class="star">★</label>
															<input type="radio" id="1-star" name="rating" value="1"/>
															<label for="1-star" class="star">★</label>
														</div>
													</div>
												</div>
											</div>
											<div data-v-89f34e0a="" data-v-421abad8=""
												class="review-write__comment">
												<div data-v-89f34e0a="" data-v-421abad8="" class="form">
													<textarea data-v-8bb17226="" data-v-89f34e0a="" name="content"
														id="form-review-textarea"
														placeholder="
[일반상품] 텍스트후기: 100 포인트 / 사진후기: 300 포인트
[정기배송] 텍스트후기: 1,000 포인트 / 이미지후기: 3,000 포인트

<공통 조건>
- 후기 작성 후 조건에 부합할 시 포인트가 자동 지급
- 후기 내용은 띄어쓰기를 포함한 글자 수로 체크
- 비방성, 광고글, 문의사항 후기는 관리자 임의로 삭제 가능
- 상품을 교환하여 후기를 수정하거나 추가 작성하는 경우 적립금 미지급
- 사진이 자사 제품과 무관할 경우 자동 지급된 포인트 삭제 및 미지급의 불이익이 발생할 수 있음"
														maxlength="1000" rows="10"
														class="form__input form-text form-text--textarea"
														data-v-421abad8=""></textarea>
													<p data-v-89f34e0a="" data-v-421abad8=""
														class="form__count">
														<span data-v-89f34e0a="" data-v-421abad8="" class="msg">30자만
															더 쓰면 포인트 적립 조건 충족!</span> 0/1000
													</p>
												</div>
											</div>
											<div data-v-89f34e0a="" data-v-421abad8=""
												class="review-write__upload-photo">
												<div data-v-89f34e0a="" data-v-421abad8="" class="tooltip">
													<span data-v-89f34e0a="" data-v-421abad8=""
														class="tooltip-text">사진과 함께 등록 시 300원 적립! </span>
													<!---->
												</div>
												<h3 data-v-89f34e0a="" data-v-421abad8="">사진 등록</h3>
												<p data-v-89f34e0a="" data-v-421abad8="">사진은 2장까지 등록
													가능해요</p>
												<div data-v-89f34e0a="" data-v-421abad8=""
													class="row--h-center files">
													<label data-v-89f34e0a="" data-v-421abad8=""> <input
														data-v-89f34e0a="" data-v-421abad8="" type="file"
														accept="image/*"> <i data-v-89f34e0a=""
														data-v-421abad8=""> <svg data-v-89f34e0a=""
																xmlns="http://www.w3.org/2000/svg" width="24"
																height="24" viewBox="0 0 24 24" aria-labelledby="plus"
																role="presentation" class="icon" data-v-421abad8="">
																<g fill="none" fill-rule="evenodd"> 
																	<path fill="currentColor" fill-rule="evenodd"
																	d="M13 11h9v2h-9v9h-2v-9H2v-2h9V2h2v9z"></path>
																</g>
															</svg>
													</i>
													</label>
												</div>
												<p data-v-89f34e0a="" data-v-421abad8=""
													style="font-size: 12px; font-weight: 300; color: rgb(246, 100, 62);">
													자사 제품과 무관한 사진 첨부 시 통보 없이<br data-v-89f34e0a=""
														data-v-421abad8=""> 후기 삭제 및 포인트 회수가 진행 될 수 있습니다.
												</p>
											</div>
											<div data-v-89f34e0a="" data-v-421abad8=""
												class="footer-drawer-wrap">
												<div data-v-89f34e0a="" data-v-421abad8=""
													class="row row--v-center row--v-center"
													style="background: rgb(244, 245, 246);">
													<div data-v-89f34e0a="" data-v-421abad8=""
														class="col-12 row row--h-between row--v-center"
														style="height: 64px; cursor: pointer; border: 1px solid rgb(231, 231, 231);">
														<em data-v-89f34e0a="" data-v-421abad8=""
															class="footer-drawer-title">포인트 적립 유의사항</em>
														<svg data-v-89f34e0a="" xmlns="http://www.w3.org/2000/svg"
															width="24" height="24" viewBox="0 0 24 24"
															aria-labelledby="arrow-up-1" role="presentation"
															class="icon" data-v-421abad8=""
															style="padding-right: 16px;">
															<g fill="none" fill-rule="evenodd"> <path
																fill="currentColor" fill-rule="nonzero"
																d="M3.455 16.362a.5.5 0 0 1-.69-.724l8.946-8.5a.5.5 0 0 1 .689 0l8.944 8.5a.5.5 0 0 1-.688.724l-8.6-8.172-8.601 8.172z"></path></g></svg>
													</div>
													<div data-v-89f34e0a="" data-v-421abad8=""
														class="col-12 footer-drawer-contents">
														<ul data-v-89f34e0a="" data-v-421abad8="">
															<li data-v-89f34e0a="" data-v-421abad8="">
																[샐러드/건강간식/세트 상품] 수령일 기준 7일 내 제품만 등록 가능</li>
															<li data-v-89f34e0a="" data-v-421abad8="">[정기배송 상품]
																2회 수령 후 30일 내 등록 가능</li>
															<li data-v-89f34e0a="" data-v-421abad8="">후기 작성일 기준
																2-3일 내 적립금 자동 지급(영업일 외 명절 및 공휴일은 지연될 수 있음)</li>
															<li data-v-89f34e0a="" data-v-421abad8="">상품마다 개별
																작성건만 해당 가능</li>
															<li data-v-89f34e0a="" data-v-421abad8="">사진 후기는 자사
																제품 사진에 한 함</li>
															<li data-v-89f34e0a="" data-v-421abad8="">비방성, 광고글,
																문의사항 후기는 관리자 임의로 삭제될 수 있음</li>
															<li data-v-89f34e0a="" data-v-421abad8="">상품 교환하여
																후기를 수정하거나 추가 작성하는 경우 추가 적립금 미지급</li>
														</ul>
													</div>
												</div>
											</div>
											<nav data-v-89f34e0a="" data-v-421abad8=""
												class="review-write__nav">
												<div data-v-89f34e0a="" data-v-421abad8=""
													class="row--gutter">
													<div data-v-89f34e0a="" data-v-421abad8="" class="col">
														<button data-v-a1c889e0="" data-v-89f34e0a=""
															type="button" title="" class="button button--outline"
															data-v-421abad8="">
															<span data-v-a1c889e0="" class="button__wrap">취소</span>
														</button>
													</div>
													<div class="col">
														<button data-v-a1c889e0="" 
															type="submit" class="button" >
															<span>등록</span>
														</button>
													</div>
												</div>
											</nav>
										</form>
									</article>
									<!---->
								</div>
							</div>
						</div>
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
	<script>window.__NUXT__=(function(a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p){return {layout:"default-none-footer",data:[{checkedNever:a,spotId:b,subFlag:b,cartFlag:a,gs:b,cafe:b,method:b}],error:b,state:{appFirstLaunch:a,appCheck:a,appData:b,appVersion:b,appPermission:a,showChTalk:a,isRoot:a,userAgent:"Mozilla\u002F5.0 (Linux; Android 6.0; Nexus 5 Build\u002FMRA58N) AppleWebKit\u002F537.36 (KHTML, like Gecko) Chrome\u002F97.0.4692.99 Mobile Safari\u002F537.36",deviceId:b,devicePlatform:b,user:{id:271132,email:"tjdtls690@naver.com",name:i,nickname:i,tel:"01057113386",gender:"male",birth:"1993-07-12",comName:d,job:d,point:c,confirmEmail:a,confirmTel:f,newsletterEmail:a,newsletterSms:a,newsletterPush:b,promoCode:"1sby67m4cf",promoCount:c,deliveryCount:c,couponCount:c,reviewCount:c,cartCount:c,isAdmin:a,signinDate:"2022-01-25 07:41:23",signinMethod:"kakao",signupDate:"2022-01-11 15:48:53",authority:"[\"user\"]",service080:a,auth:g,isSignup:b},userInfo:{point:c,couponCount:c,deliveryDateCount:c,cartCount:c,menuReviewCount:c,completeMenuCount:h,isFirstOrder:a,unconfirmedNotiCount:c,orderCount:p,totalPayAmount:14310,notCanceledOrderTypes:["user"]},Authorization:g,orderMenus:[],orderMenusTemp:[],layout:{headerLine:f},userUpdateAccessAuthority:a,currentPageOGInfo:b,payOrderInfo:b,selectDetail:[],readMenu:b,orderInfo:{},menuPageActiveTab:c,isFirstOrder:a,unavailableQuantity:{isUnavailable:a,list:[]},itemsForAddCartMsg:[],cartItems:[],orderItemsFromCart:[],cartModalObj:{isVisible:a,menu:b},checkedOptions:[],visibleBanner:a,loading:a,friendInvitationPoint:j,emailAgreePoint:"2,000",reviewPointObj:{subsNormal:"1,000",subsPic:j,generalNormal:"100",generalPic:"300"},categoryItems:[{id:c,name:"전체보기",path:"\u002Fmenu",isNew:a,isHidden:a},{id:p,name:"정기배송",path:"\u002Fmenu\u002Fsubscription",isNew:a,isHidden:a},{id:2,name:"샐러드",path:"\u002Fmenu\u002Fsalad",isNew:a,isHidden:a},{id:h,name:"랩·샌드위치",path:"\u002Fmenu\u002Fsalad-wrap",isNew:a,isHidden:a},{id:4,name:"도시락·간편식",path:"\u002Fmenu\u002Fmeal",isNew:a,isHidden:a},{id:5,name:"세트상품",path:"\u002Fmenu\u002Fset",isNew:a,isHidden:a},{id:6,name:"간식",path:"\u002Fmenu\u002Fsnack",isNew:a,isHidden:a},{id:7,name:"음료",path:"\u002Fmenu\u002Fdrink",isNew:a,isHidden:a},{id:8,name:"할인기획전",path:"\u002Fmenu\u002Fevent",isNew:a,isHidden:a},{id:9,name:"오픈예정",path:"\u002Fmenu\u002Fsoon",isNew:a,isHidden:a},{id:10,name:"죽·스프",path:"\u002Fmenu\u002Fsoup",isNew:a,isHidden:a}],allMenusSpreadFlag:a,isKakaoInApp:a,headerHeight:50,diy:{targetDiyOrderMenu:b,targetDiyOrderMenuFilterOption:b,targetDiyOrderMenuDetail:b,customOrder:b,customOrderContext:b,customOrderSelectedDates:b,saved:b,selectedSubMenu:{menuId:b,selected:a,size:"Medium",selectedWeek:b,subStartDates:[],startDate:d,startDay:d,discountRate:c,menuTypes:[],optionMenuTypes:[],menus:[],sum:c,subDeliveryDates:[],pickupDays:[]}},cart:{unavailableQuantity:{isUnavailable:a,list:[]},itemsForAddCartMsg:[],cartItems:[],orderItemsFromCart:[],cartModalObj:{isVisible:a,menu:b}},delivery:{deliveryFeeObj:{spot:c,trialSpot:k,quick:k,morning:l,parcel:l},freeDeliveryAmountObj:{spot:c,trialSpot:m,quick:m,morning:n,parcel:n},minOrderAmountObj:{spot:o,trialSpot:o,quick:e,morning:e,parcel:e}},destination:{userSpots:[],userDests:[],isDinner:a,delivery:d,orderType:d},loadingSpinner:{isLoading:a},menu:{salad:b,wrap:b,snack:b,bundle:b,sub:b,set:b,meal:b,drink:b,soup:b,eventMenu:b,soonMenu:b,menuOrigin:b,loading:a,nonMenus:[222,237,258,388,505],deliveryTypeForDefault:"spot"},spot:{}},serverRendered:f}}(false,null,0,"",10000,true,"Basic MjcxMTMyOjlkNDgyYTZkMDNlODRkYWJiNmFjNTZlODg5YjZhOTU3",3,"신준혁","3,000",4000,3500,40000,35000,6000,1));</script>
	<script src="/_nuxt/e601fc7af504e3420b41.js" defer=""></script>
	<script src="/_nuxt/82186e2369e23d362989.js" defer=""></script>
	<script src="/_nuxt/a7d257487f2c2bc0d3d9.js" defer=""></script>
	<script src="/_nuxt/ed2dabba8c2241055485.js" defer=""></script>
	<script src="/_nuxt/e690efc2bdcea93bb1f9.js" defer=""></script>
	<script src="/_nuxt/605fbd701ca096ca4a89.js" defer=""></script>
	<script src="/_nuxt/36eaadcb8a6fbe10d38e.js" defer=""></script>
	<script src="/_nuxt/8538008e36d3bf94fc00.js" defer=""></script>
	<script src="https://web.nicepay.co.kr/v3/webstd/js/nicepay-2.0.js"
		type="text/javascript"></script>
	<script type="text/javascript" src="https://wcs.naver.net/wcslog.js"
		id="wcs-log"></script>



	<a class="custom-ch-btn" style="display: none">문의하기</a>
	<form name="payForm" id="payForm" method="post" action=""
		accept-charset="UTF-8" style="display: none"></form>

	<form name="payFormMobile" id="payFormMobile" target="_self"
		method="post"
		action="https://web.nicepay.co.kr/v3/smart/smartPayment.jsp"
		accept-charset="euc-kr" style="display: none"></form>

	<!-- Enliple Tracker Start -->
	<script type="text/javascript">!function(e,n,t,c,o){e.enp=e.enp||function(){(e.enp.q=e.enp.q||[]).push(arguments)},(c=n.createElement(t)).async=!0,c.defer=!0,c.src="https://cdn.megadata.co.kr/dist/prod/enp_tracker_self_hosted.min.js",(o=n.getElementsByTagName(t)[0]).parentNode.insertBefore(c,o)}(window,document,"script"),enp("create","common","freshcode",{device:"B"}),enp("send","common","freshcode")</script>
	<!-- Enliple Tracker End -->





	<script type="text/javascript" src="/javascript/check-browser.js"></script>
	<script type="text/javascript" src="/javascript/channel-plugin.js"></script>

	<script>function nicepayStart(){goPay(document.payForm)}function nicepaySubmit(){document.payForm.submit()}function nicepayClose(){alert("결제를 취소 하였습니다."),document.getElementById("payForm").innerHTML="",document.getElementById("pay-btn1").removeAttribute("disabled"),document.getElementById("pay-btn1").classList.remove("button--disabled"),document.getElementById("pay-btn2").removeAttribute("disabled"),document.getElementById("pay-btn2").classList.remove("button--disabled")}function getTomorrow(){var e=new Date,t=e.getTime()+60*e.getTimezoneOffset()*1e3,n=new Date(t+324e5),o=n.getFullYear().toString(),i=(n.getMonth()+1).toString(),a=(n.getDate()+1).toString();return i.length<2&&(i="0"+i),a.length<2&&(a="0"+a),o+i+a}function nicepayMobileStart(){document.payFormMobile.submit()}</script>

	<script src="https://nsp.pay.naver.com/sdk/js/naverpay.min.js"></script>

	<script type="text/javascript"
		src="https://appleid.cdn-apple.com/appleauth/static/jsapi/appleid/1/en_US/appleid.auth.js"></script>


	<div id="ch-plugin" style="display: block;">
		<div id="ch-plugin-core">
			<style data-styled="active" data-styled-version="5.1.1"></style>
			<div data-ch-testid="launcher" hidden=""
				class="Launcherstyled__Wrapper-oef45p-0 lcJxsD" style="">
				<div class="Launcherstyled__LauncherIconWrapper-oef45p-1 hgRlbE">
					<div
						class="LauncherIconstyled__LauncherWrapper-mnslcf-0 fjRePZ launcherIcon">
						<div style="position: absolute; inset: 0px; margin: auto;">
							<img
								src="https://cf.channel.io/asset/plugin/images/shadow-body.png"
								role="presentation" alt=""
								class="InnerIconstyled__Icon-sc-197h5bb-0 bIHfMr LauncherIconstyled__Bubble-mnslcf-1 cRwgrT"
								color="#27b06e" width="36" height="36" defaultopacity="1"
								hoveredopacity="1" margintop="0" marginright="0"
								marginbottom="0" marginleft="0" style="position: absolute;">
							<svg width="36" height="36" viewBox="0 0 48 48" fill="none"
								xmlns="http://www.w3.org/2000/svg"
								class="InnerIconstyled__Icon-sc-197h5bb-0 bIHfMr LauncherIconstyled__Bubble-mnslcf-1 cRwgrT"
								color="#27b06e" defaultOpacity="1" hoveredOpacity="1"
								margintop="0" marginright="0" marginbottom="0" marginleft="0"
								style="position: absolute;">
								<path fill="#27b06e" fill-opacity="0.6"
									d="M24 6C14.0589 6 6 14.0589 6 24C6 33.9411 14.0589 42 24 42C26.5503 42 28.9767 41.4696 31.175 40.5132C32.4937 39.9394 33.9715 39.7362 35.3397 40.1796L39.7048 41.5942C40.8697 41.9717 41.9717 40.8697 41.5942 39.7048L40.1796 35.3397C39.7362 33.9715 39.9394 32.4937 40.5132 31.175C41.4696 28.9767 42 26.5503 42 24C42 14.0589 33.9411 6 24 6Z"></path></svg>
							<img
								src="https://cf.channel.io/asset/plugin/images/gradient-body.png"
								role="presentation" alt=""
								class="InnerIconstyled__Icon-sc-197h5bb-0 bIHfMr LauncherIconstyled__Bubble-mnslcf-1 cRwgrT"
								color="#27b06e" width="36" height="36" defaultopacity="1"
								hoveredopacity="1" margintop="0" marginright="0"
								marginbottom="0" marginleft="0" style="position: absolute;">
							<svg width="36" height="36" viewBox="0 0 48 48" fill="none"
								xmlns="http://www.w3.org/2000/svg"
								class="InnerIconstyled__Icon-sc-197h5bb-0 bIHfMr LauncherIconstyled__Bubble-mnslcf-1 cRwgrT"
								color="#27b06e" defaultOpacity="1" hoveredOpacity="1"
								margintop="0" marginright="0" marginbottom="0" marginleft="0"
								style="position: absolute;">
								<g filter="url(#filter0_i)">
								<path fill="white" fill-opacity="0.01"
									d="M24 6C14.0589 6 6 14.0589 6 24C6 33.9411 14.0589 42 24 42C26.5503 42 28.9767 41.4696 31.175 40.5132C32.4937 39.9394 33.9715 39.7362 35.3397 40.1796L39.7048 41.5942C40.8697 41.9717 41.9717 40.8697 41.5942 39.7048L40.1796 35.3397C39.7362 33.9715 39.9394 32.4937 40.5132 31.175C41.4696 28.9767 42 26.5503 42 24C42 14.0589 33.9411 6 24 6Z"></path></g>
								<defs>
								<filter id="filter0_i" x="4" y="2" width="38" height="40"
									filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB">
								<feFlood flood-opacity="0" result="BackgroundImageFix"></feFlood>
								<feBlend mode="normal" in="SourceGraphic"
									in2="BackgroundImageFix" result="shape"></feBlend>
								<feColorMatrix in="SourceAlpha" type="matrix"
									values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 127 0"
									result="hardAlpha"></feColorMatrix>
								<feOffset dx="-2" dy="-4"></feOffset>
								<feGaussianBlur stdDeviation="4"></feGaussianBlur>
								<feComposite in2="hardAlpha" operator="arithmetic" k2="-1"
									k3="1"></feComposite>
								<feColorMatrix type="matrix"
									values="0 0 0 0 0.15294117647058825 0 0 0 0 0.6901960784313725 0 0 0 0 0.43137254901960786 0 0 0 0.2 0"></feColorMatrix>
								<feBlend mode="normal" in2="shape" result="effect1_innerShadow"></feBlend></filter></defs></svg>
							<svg width="36" height="36" viewBox="0 0 48 48" fill="none"
								xmlns="http://www.w3.org/2000/svg"
								class="InnerIconstyled__Icon-sc-197h5bb-0 bIHfMr LauncherIconstyled__Bubble-mnslcf-1 cRwgrT"
								color="#27b06e" defaultOpacity="1" hoveredOpacity="1"
								margintop="0" marginright="0" marginbottom="0" marginleft="0"
								style="position: absolute;">
								<g filter="url(#filter0_f)">
								<path fill="white" fill-opacity="0.15"
									d="M19.8462 20.1538C19.8462 22.448 19.2404 24.3077 17.4231 24.3077C15.6058 24.3077 15 22.448 15 20.1538C15 17.8597 15.6058 16 17.4231 16C19.2404 16 19.8462 17.8597 19.8462 20.1538Z"></path>
								<path fill="white" fill-opacity="0.15"
									d="M24.0001 29.8462C21.201 29.8462 19.7599 27.5828 19.3109 25.9843C19.1615 25.4526 19.6016 25.0001 20.1539 25.0001H27.8462C28.3985 25.0001 28.8386 25.4526 28.6893 25.9843C28.2402 27.5828 26.7992 29.8462 24.0001 29.8462Z"></path>
								<path fill="white" fill-opacity="0.15"
									d="M30.5768 24.3077C32.3941 24.3077 32.9999 22.448 32.9999 20.1538C32.9999 17.8597 32.3941 16 30.5768 16C28.7595 16 28.1537 17.8597 28.1537 20.1538C28.1537 22.448 28.7595 24.3077 30.5768 24.3077Z"></path></g>
								<path fill="#27b06e"
									d="M19.8462 19.1538C19.8462 21.448 19.2404 23.3077 17.4231 23.3077C15.6058 23.3077 15 21.448 15 19.1538C15 16.8597 15.6058 15 17.4231 15C19.2404 15 19.8462 16.8597 19.8462 19.1538Z"></path>
								<path fill="#17113F" fill-opacity="0.7"
									d="M19.8462 19.1538C19.8462 21.448 19.2404 23.3077 17.4231 23.3077C15.6058 23.3077 15 21.448 15 19.1538C15 16.8597 15.6058 15 17.4231 15C19.2404 15 19.8462 16.8597 19.8462 19.1538Z"></path>
								<path fill="#27b06e"
									d="M24.0001 28.8462C21.201 28.8462 19.7599 26.5828 19.3109 24.9843C19.1615 24.4526 19.6016 24.0001 20.1539 24.0001H27.8462C28.3985 24.0001 28.8386 24.4526 28.6893 24.9843C28.2402 26.5828 26.7992 28.8462 24.0001 28.8462Z"></path>
								<path fill="#17113F" fill-opacity="0.7"
									d="M24.0001 28.8462C21.201 28.8462 19.7599 26.5828 19.3109 24.9843C19.1615 24.4526 19.6016 24.0001 20.1539 24.0001H27.8462C28.3985 24.0001 28.8386 24.4526 28.6893 24.9843C28.2402 26.5828 26.7992 28.8462 24.0001 28.8462Z"></path>
								<path fill="#27b06e"
									d="M30.5768 23.3077C32.3941 23.3077 32.9999 21.448 32.9999 19.1538C32.9999 16.8597 32.3941 15 30.5768 15C28.7595 15 28.1537 16.8597 28.1537 19.1538C28.1537 21.448 28.7595 23.3077 30.5768 23.3077Z"></path>
								<path fill="#17113F" fill-opacity="0.7"
									d="M30.5768 23.3077C32.3941 23.3077 32.9999 21.448 32.9999 19.1538C32.9999 16.8597 32.3941 15 30.5768 15C28.7595 15 28.1537 16.8597 28.1537 19.1538C28.1537 21.448 28.7595 23.3077 30.5768 23.3077Z"></path>
								<defs>
								<filter id="filter0_f" x="13" y="14" width="21.9999"
									height="17.8462" filterUnits="userSpaceOnUse"
									color-interpolation-filters="sRGB">
								<feFlood flood-opacity="0" result="BackgroundImageFix"></feFlood>
								<feBlend mode="normal" in="SourceGraphic"
									in2="BackgroundImageFix" result="shape"></feBlend>
								<feGaussianBlur stdDeviation="1" result="effect1_foregroundBlur"></feGaussianBlur></filter></defs></svg>
						</div>
						<div data-ch-testid="badge" hidden=""
							class="Badgestyled__Badge-sc-1ztqq4-0 LauncherIconstyled__Badge-mnslcf-2 iJZSEV">0</div>
					</div>
				</div>
			</div>
		</div>
		<div id="ch-plugin-script" style="display: none"
			class="ch-messenger-hidden">
			<iframe id="ch-plugin-script-iframe"
				style="position: relative !important; height: 100%; width: 100% !important; border: none !important;"
				data-gtm-yt-inspected-1_19="true"></iframe>
		</div>
	</div>
	<script type="text/javascript" id="">fbq("trackCustom","SearchKeyword",{search_string:google_tag_manager["GTM-WWVZF4F"].macro(6)});</script>
	<script type="text/javascript" id="">!function(b,e,f,g,a,c,d){b.fbq||(a=b.fbq=function(){a.callMethod?a.callMethod.apply(a,arguments):a.queue.push(arguments)},b._fbq||(b._fbq=a),a.push=a,a.loaded=!0,a.version="2.0",a.queue=[],c=e.createElement(f),c.async=!0,c.src=g,d=e.getElementsByTagName(f)[0],d.parentNode.insertBefore(c,d))}(window,document,"script","https://connect.facebook.net/en_US/fbevents.js");fbq("init","1891781027718758");</script>
	<script type="text/javascript" id="">fbq("track","PageView");</script>
	<noscript>
		<img height="1" width="1" style="display: none"
			src="https://www.facebook.com/tr?id=1891781027718758&amp;ev=PageView&amp;noscript=1">
	</noscript>
	<script type="text/javascript" id="">(function(g,c){function k(a,f){a.prototype[f]=function(){this._q.push([f].concat(Array.prototype.slice.call(arguments,0)));return this}}function l(a){function f(m){a[m]=function(){a._q.push([m].concat(Array.prototype.slice.call(arguments,0)))}}for(var h=0;h<n.length;h++)f(n[h])}var d=g.amplitude||{_q:[],_iq:{}},b=c.createElement("script");b.type="text/javascript";b.integrity="sha384-cukXwabQy+j/QA1+RqiXSzxhgQg5Rrn3zVszlwH3pWj/bXJxlA8Ge7NhcD6vP2Ik";b.crossOrigin="anonymous";b.async=!0;b.src="https://cdn.amplitude.com/libs/amplitude-7.1.0-min.gz.js";
b.onload=function(){g.amplitude.runQueuedFunctions||console.log("[Amplitude] Error: could not load SDK")};c=c.getElementsByTagName("script")[0];c.parentNode.insertBefore(b,c);b=function(){this._q=[];return this};c="add append clearAll prepend set setOnce unset".split(" ");for(var e=0;e<c.length;e++)k(b,c[e]);d.Identify=b;b=function(){this._q=[];return this};c=["setProductId","setQuantity","setPrice","setRevenueType","setEventProperties"];for(e=0;e<c.length;e++)k(b,c[e]);d.Revenue=b;var n="init logEvent logRevenue setUserId setUserProperties setOptOut setVersionName setDomain setDeviceId enableTracking setGlobalUserProperties identify clearUserProperties setGroup logRevenueV2 regenerateDeviceId groupIdentify onInit logEventWithTimestamp logEventWithGroups setSessionId resetSessionId".split(" ");
l(d);d.getInstance=function(a){a=(a&&0!==a.length?a:"$default_instance").toLowerCase();d._iq.hasOwnProperty(a)||(d._iq[a]={_q:[]},l(d._iq[a]));return d._iq[a]};g.amplitude=d})(window,document);amplitude.getInstance().init("b0c55cafb2647021ff77b3457def2cbe",null,{includeGclid:!0,includeUtm:!0,includeReferrer:!0,saveParamsReferrerOncePerSession:!1});</script>
	<div id="criteo-tags-div" style="display: none;"></div>
	<style data-styled="active" data-styled-version="5.1.1"></style>
	<script type="text/javascript" id="">fbq("trackCustom","Order - Enter");</script>
	<script type="text/javascript" id="">amplitude.getInstance().logEvent("Order - Enter",{spotId:"undefined"});amplitude.getInstance().setUserId("25162");</script>
	<script type="text/javascript" id="">!function(b,e,f,g,a,c,d){b.fbq||(a=b.fbq=function(){a.callMethod?a.callMethod.apply(a,arguments):a.queue.push(arguments)},b._fbq||(b._fbq=a),a.push=a,a.loaded=!0,a.version="2.0",a.queue=[],c=e.createElement(f),c.async=!0,c.src=g,d=e.getElementsByTagName(f)[0],d.parentNode.insertBefore(c,d))}(window,document,"script","https://connect.facebook.net/en_US/fbevents.js");fbq("init","1891781027718758");</script>
	<script type="text/javascript" id="">amplitude.getInstance().logEvent("Mypage - Orders - Enter");</script>
	<script type="text/javascript" id="">!function(b,e,f,g,a,c,d){b.fbq||(a=b.fbq=function(){a.callMethod?a.callMethod.apply(a,arguments):a.queue.push(arguments)},b._fbq||(b._fbq=a),a.push=a,a.loaded=!0,a.version="2.0",a.queue=[],c=e.createElement(f),c.async=!0,c.src=g,d=e.getElementsByTagName(f)[0],d.parentNode.insertBefore(c,d))}(window,document,"script","https://connect.facebook.net/en_US/fbevents.js");fbq("init","1891781027718758");</script>
	<script type="text/javascript" id="">amplitude.getInstance().logEvent("Mypage - Review - Enter");</script>
	<script type="text/javascript" id="">!function(b,e,f,g,a,c,d){b.fbq||(a=b.fbq=function(){a.callMethod?a.callMethod.apply(a,arguments):a.queue.push(arguments)},b._fbq||(b._fbq=a),a.push=a,a.loaded=!0,a.version="2.0",a.queue=[],c=e.createElement(f),c.async=!0,c.src=g,d=e.getElementsByTagName(f)[0],d.parentNode.insertBefore(c,d))}(window,document,"script","https://connect.facebook.net/en_US/fbevents.js");fbq("init","1891781027718758");</script>
	<script type="text/javascript" id="">amplitude.getInstance().logEvent("Mypage - Review - Write Page");</script>
	<script type="text/javascript" defer="" id="wcs">
          var _nasa= {};
                          
          if (!wcs_add) var wcs_add={};
          wcs_add["wa"]="s_396f73cd4419";
          if (!_nasa) var _nasa={};
          wcs.inflow();
          wcs_do(_nasa);
        </script>
</body>
</html>