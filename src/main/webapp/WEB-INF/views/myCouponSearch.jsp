<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}/resources/myCouponSearch"/>
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
	    
	    var url = window.location.pathname;
	    
	    if(url == '/web/myCouponSearch2.do') {
	    	$('#f_coupon_number').val('신선하게샐러드구독');
	    } else {
	    	$('#f_coupon_number').val('');
	    }
	    
		$('.button.button--side-padding').click(function(){	
			var couponName = $('#f_coupon_number').val();
			console.log(couponName);
			$.ajax({
				url : 'subscribeCoupon.do',
				dataType : 'html',
				data : {
					'couponName' : couponName,
				},
				success : function(htmlOut){
					$('body').append(htmlOut);
				}
			})
		})

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
	});

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
				<div class="container" style="padding-top: 182px;"
					data-v-0f5971ec="">
					<div data-v-421abad8="" data-v-31b582a4="" data-v-0f5971ec=""
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
										<strong data-v-3e2784be="">${member.name }</strong> <span
											data-v-3e2784be="">${member.email }</span>
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
											href="/mypage/coupons" aria-current="page"
											class="nuxt-link-exact-active nuxt-link-active"><em
											data-v-3e2784be="">1</em></a>
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
												href="myPayInfo.do" aria-current="page"
												class="nuxt-link-exact-active nuxt-link-active">주문/결제 내역</a></li>
											<li data-v-e99f4992=""><a data-v-e99f4992=""
												href="myDelivery.do" class="">배송현황</a></li>
											<li data-v-e99f4992=""><a data-v-e99f4992=""
												href="myBesongji.do" aria-current="page"
												class="nuxt-link-exact-active nuxt-link-active">배송지 관리</a></li>
											<li data-v-e99f4992=""><a data-v-e99f4992=""
												href="myPointSearch.do" class="">포인트 조회</a></li>
											<li data-v-e99f4992=""><a data-v-e99f4992=""
												href="myCouponSearch.do" class="">쿠폰 조회</a></li>
											<li data-v-e99f4992=""><a data-v-e99f4992=""
												href="myReviewSearch.do" class="">나의 후기</a></li>
											<li data-v-e99f4992=""><a data-v-e99f4992=""
												href="myMemberModify.do" class="">회원정보 수정</a></li>
											<li data-v-e99f4992=""><a data-v-e99f4992="" href="#">로그아웃</a></li>
										</ul>
									</aside>
								</aside>
								<div data-v-421abad8="" class="mypage-layout__body">
									<article data-v-31b582a4="" data-v-421abad8=""
										class="mypage-coupons">
										<header data-v-2c0651a8="" data-v-31b582a4=""
											class="row--v-center page-header" data-v-421abad8="">
											<!---->
											<!---->
											<h2 data-v-2c0651a8="" class="col">쿠폰 조회</h2>
											<!---->
										</header>
										<div data-v-31b582a4="" data-v-421abad8=""
											class="mypage-coupons-sms">
											문자 수신에 동의하실 경우 프레시코드의 깜짝 쿠폰 혜택을 우대 제공해드리며, <b
												data-v-31b582a4="" data-v-421abad8="">다양한 이벤트 소식과 쿠폰 지급
												내용은 문자/카카오 알림톡을 통해 안내드립니다.</b>
											<div data-v-31b582a4="" data-v-421abad8="" class="row">
												<label data-v-31b582a4="" data-v-421abad8=""
													class="row--v-center"><label data-v-2673f877=""
													data-v-31b582a4="" class="form-checkbox" data-v-421abad8=""><input
														data-v-2673f877="" type="checkbox" value="false">
														<span data-v-2673f877=""><svg data-v-2673f877=""
																xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
																<path data-v-2673f877="" fill="currentColor"
																	fill-rule="nonzero"
																	d="M8.489 13.597l7.304-7.304a1 1 0 0 1 1.414 1.414l-8 8a1 1 0 0 1-1.403.011l-4-3.875a1 1 0 1 1 1.392-1.436l3.293 3.19z"></path></svg></span></label>
													<span data-v-31b582a4="" data-v-421abad8=""
													style="cursor: pointer;">SMS 수신 동의하고 이벤트 소식과 쿠폰 혜택
														받기 </span></label>
											</div>
										</div>
										<div data-v-31b582a4="" data-v-421abad8=""
											class="mypage-coupons-register">
											<p data-v-31b582a4="" data-v-421abad8=""
												class="mypage-coupons-register__label">
												<label data-v-31b582a4="" data-v-421abad8=""
													for="f_coupon_number">쿠폰 등록</label>
											</p>
											<div data-v-31b582a4="" data-v-421abad8=""
												class="row mypage-coupons-register__field">
												<div data-v-31b582a4="" data-v-421abad8="" class="col">
													
															<input data-v-8bb17226="" data-v-31b582a4="" value=""
														id="f_coupon_number" type="text" name="f_coupon_number"
														placeholder="쿠폰번호를 입력해 주세요" autocorrect="off"
														autocapitalize="off" class="form-text" data-v-421abad8="">
												
												</div>
												<div data-v-31b582a4="" data-v-421abad8="">
													<button data-v-a1c889e0="" data-v-31b582a4="" type="button"
														title="" class="button button--side-padding"
														data-v-421abad8="">
														<span data-v-a1c889e0="" class="button__wrap">등록</span>
													</button>
												</div>
											</div>
										</div>
										<hr data-v-31b582a4="" data-v-421abad8=""
											class="line-bold mypage-coupons__line">
										<div data-v-31b582a4="" data-v-421abad8=""
											class="mypage-coupons__index">
											<ul data-v-31b582a4="" data-v-421abad8="">
											<c:forEach var="couponDetail" items="${couponDetail }">
												<li data-v-31b582a4="" data-v-421abad8=""><div
														data-v-31b582a4="" data-v-421abad8=""
														class="mypage-coupons-item">
														<div data-v-31b582a4="" data-v-421abad8=""
															class="mypage-coupons-item__body">
															<strong data-v-31b582a4="" data-v-421abad8="">
															${couponDetail.coupon_type}</strong>
															<span data-v-31b582a4=""
																data-v-421abad8="">${couponDetail.coupon_explain }</span>
															<span data-v-31b582a4="" data-v-421abad8="">사용
																가능 메뉴: 정기배송/전체 상품</span>
														</div>
														<div data-v-31b582a4="" data-v-421abad8=""
															class="mypage-coupons-item__info">
															<p data-v-31b582a4="" data-v-421abad8="" class="price">
																<em data-v-31b582a4="" data-v-421abad8="">50</em> %
															</p>
															<p data-v-31b582a4="" data-v-421abad8="" class="date">
																<em data-v-31b582a4="" data-v-421abad8="">2022.03.06
																</em> 까지
															</p>
														</div>
													</div>
												</li>
												</c:forEach>
											</ul>
										</div>
										<div data-v-20ad18c6="" data-v-31b582a4=""
											class="nav-paginate-wrap mypage-coupons__paginate"
											data-v-421abad8="">
											<div data-v-20ad18c6="" class="nav-paginate-wrap__mobile">
												<nav data-v-43f58a9c="" data-v-20ad18c6=""
													class="nav-paginate">
													<a data-v-43f58a9c="" href="#"
														class="nav-paginate__dir nav-paginate-dir-prev"
														style="opacity: 0.2;"><img data-v-43f58a9c=""
														src="/images/arrow-left@2x.png" alt="이전 페이지"
														class="nav-arrow arrow-left"></a> <strong
														data-v-43f58a9c="">1</strong> <a data-v-43f58a9c=""
														href="#" class="nav-paginate__dir nav-paginate-dir-next"
														style="opacity: 0.2;"><img data-v-43f58a9c=""
														src="/images/arrow-right@2x.png" alt="다음 페이지"
														class="nav-arrow arrow-right"></a>
												</nav>
											</div>
											<div data-v-20ad18c6="" class="nav-paginate-wrap__desktop">
												<nav data-v-43f58a9c="" data-v-20ad18c6=""
													class="nav-paginate">
													<a data-v-43f58a9c="" href="#"
														class="nav-paginate__dir nav-paginate-dir-prev"
														style="opacity: 0.2;"><img data-v-43f58a9c=""
														src="/images/arrow-left@2x.png" alt="이전 페이지"
														class="nav-arrow arrow-left"></a> <strong
														data-v-43f58a9c="">1</strong> <a data-v-43f58a9c=""
														href="#" class="nav-paginate__dir nav-paginate-dir-next"
														style="opacity: 0.2;"><img data-v-43f58a9c=""
														src="/images/arrow-right@2x.png" alt="다음 페이지"
														class="nav-arrow arrow-right"></a>
												</nav>
											</div>
										</div>
									</article>
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
						<h2 class="footer__logo" data-v-438b4fe4="">
							<img src="/images/logo-20211111.png" alt="FRESHCODE"
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
	<script>window.__NUXT__=(function(a,b,c,d,e,f,g,h,i,j,k,l){return {layout:"default",data:[{}],error:b,state:{appFirstLaunch:a,appCheck:a,appData:b,appVersion:b,appPermission:a,showChTalk:a,isRoot:a,userAgent:"Mozilla\u002F5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\u002F537.36 (KHTML, like Gecko) Chrome\u002F98.0.4758.102 Safari\u002F537.36",deviceId:b,devicePlatform:b,user:b,userInfo:b,Authorization:b,orderMenus:[],orderMenusTemp:[],layout:{headerLine:g},userUpdateAccessAuthority:a,currentPageOGInfo:b,payOrderInfo:b,selectDetail:[],readMenu:b,orderInfo:{},menuPageActiveTab:c,isFirstOrder:a,unavailableQuantity:{isUnavailable:a,list:[]},itemsForAddCartMsg:[],cartItems:[],orderItemsFromCart:[],cartModalObj:{isVisible:a,menu:b},checkedOptions:[],visibleBanner:a,loading:a,friendInvitationPoint:f,emailAgreePoint:"2,000",reviewPointObj:{subsNormal:"1,000",subsPic:f,generalNormal:"100",generalPic:"300"},categoryItems:[{id:c,name:"전체보기",path:"\u002Fmenu",isNew:a,isHidden:a},{id:1,name:"정기배송",path:"\u002Fmenu\u002Fsubscription",isNew:a,isHidden:a},{id:2,name:"샐러드",path:"\u002Fmenu\u002Fsalad",isNew:a,isHidden:a},{id:3,name:"랩·샌드위치",path:"\u002Fmenu\u002Fsalad-wrap",isNew:a,isHidden:a},{id:4,name:"도시락·간편식",path:"\u002Fmenu\u002Fmeal",isNew:a,isHidden:a},{id:5,name:"세트상품",path:"\u002Fmenu\u002Fset",isNew:a,isHidden:a},{id:6,name:"간식",path:"\u002Fmenu\u002Fsnack",isNew:a,isHidden:a},{id:7,name:"음료",path:"\u002Fmenu\u002Fdrink",isNew:a,isHidden:a},{id:8,name:"할인기획전",path:"\u002Fmenu\u002Fevent",isNew:a,isHidden:a},{id:9,name:"오픈예정",path:"\u002Fmenu\u002Fsoon",isNew:a,isHidden:a},{id:10,name:"죽·스프",path:"\u002Fmenu\u002Fsoup",isNew:a,isHidden:a}],allMenusSpreadFlag:a,isKakaoInApp:a,headerHeight:91,diy:{targetDiyOrderMenu:b,targetDiyOrderMenuFilterOption:b,targetDiyOrderMenuDetail:b,customOrder:b,customOrderContext:b,customOrderSelectedDates:b,saved:b,selectedSubMenu:{menuId:b,selected:a,size:"Medium",selectedWeek:b,subStartDates:[],startDate:d,startDay:d,discountRate:c,menuTypes:[],menus:[],sum:c,subDeliveryDates:[],pickupDays:[]}},cart:{unavailableQuantity:{isUnavailable:a,list:[]},itemsForAddCartMsg:[],cartItems:[],orderItemsFromCart:[],cartModalObj:{isVisible:a,menu:b}},delivery:{deliveryFeeObj:{spot:c,trialSpot:l,quick:l,morning:h,parcel:h},freeDeliveryAmountObj:{spot:c,trialSpot:i,quick:i,morning:j,parcel:j},minOrderAmountObj:{spot:k,trialSpot:k,quick:e,morning:e,parcel:e}},destination:{userSpots:[],userDests:[],isDinner:a,delivery:d,orderType:d},loadingSpinner:{isLoading:a},menu:{salad:b,wrap:b,snack:b,bundle:b,sub:b,set:b,meal:b,drink:b,soup:b,eventMenu:b,soonMenu:b,menuOrigin:b,loading:a,nonMenus:[222,237,258,388,505],deliveryTypeForDefault:"spot"},spot:{}},serverRendered:g}}(false,null,0,"",10000,"3,000",true,3500,40000,35000,6000,4000));</script>
	<script src="/_nuxt/83dd8ec97f9296165ae2.js" defer=""></script>
	<script src="/_nuxt/761c3228d6adda6202cd.js" defer=""></script>
	<script src="/_nuxt/3362e14b4289b945ed12.js" defer=""></script>
	<script src="/_nuxt/37c103fc93c8b873cd8b.js" defer=""></script>
	<script src="/_nuxt/605fbd701ca096ca4a89.js" defer=""></script>
	<script src="/_nuxt/36eaadcb8a6fbe10d38e.js" defer=""></script>
	<script src="/_nuxt/8538008e36d3bf94fc00.js" defer=""></script>
	<script src="https://web.nicepay.co.kr/v3/webstd/js/nicepay-2.0.js"
		type="text/javascript"></script>
	<script type="text/javascript" src="https://wcs.naver.net/wcslog.js"
		id="wcs-log"></script>



	<a class="custom-ch-btn" style="display: none">문의하기</a>
</body>
</html>