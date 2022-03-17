<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}/resources/purchase"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프레시코드 - 프리미엄 샐러드 배달 서비스</title>
  <link href="${path }/style.css" rel="stylesheet" type="text/css" />
  <link href="${path }/style2.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script type="text/javascript">
$(function() { 
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
});
</script>

</head>
<body >
	<noscript data-n-head="ssr" data-hid="gtm-noscript" data-pbody="true">
		<iframe src="https://www.googletagmanager.com/ns.html?id=GTM-WWVZF4F&" height="0" width="0" style="display:none;visibility:hidden" title="gtm"></iframe>
	</noscript>
	<div data-server-rendered="true" id="__nuxt">
		<div id="__layout">
			<main class="viewport-none-footer" data-v-1739428d>
				<header data-v-7aa1f9b4="" data-v-1739428d="" id="header-area"
					class="header">
					<div data-v-7aa1f9b4="" class="header-banner-wrap">
						<!---->
					</div>
					<div data-v-7aa1f9b4="" id="header__body" class="header__body">
						<div data-v-7aa1f9b4="" class="header__top">
							<a data-v-7aa1f9b4="" href="/info" class="header__top-left"></a>
							<div data-v-7aa1f9b4="" class="header__top-right">
								<a data-v-7aa1f9b4="" href="/mypage/orders" class="">신준혁 <span
									data-v-7aa1f9b4="">님</span></a> <span data-v-7aa1f9b4="">1:1문의</span>
								<a data-v-7aa1f9b4="" href="https://forms.gle/92o1ctx6U4CYe2yF9"
									target="_blank">B2B 신청</a>
							</div>
						</div>
						<!---->
						<div data-v-7aa1f9b4="" class="header__logo">
							<a data-v-7aa1f9b4="" href="/" class="nuxt-link-active"></a>
							<!---->
						</div>
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
								</a><a data-v-7aa1f9b4="" href="/event" class="item">이벤트 </a><a
									data-v-7aa1f9b4="" href="/fcospot" class="item">프코스팟 </a>
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
									</div> <!----> 장바구니 </a> <a data-v-7aa1f9b4="" href="/order"
									class="item nuxt-link-active"><div data-v-7aa1f9b4=""
										class="icon-order"></div> 바로주문 </a>
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
					<!---->
					<!---->
					<!---->
					<!---->
				</header>
				<!----> 
			<div class="container" data-v-1739428d>
				<div class="checkout-container" data-v-8f2f8136 data-v-1739428d>
					<article class="checkout" data-v-8f2f8136>
						<div class="checkout__header" data-v-8f2f8136>
							<h2 class="header" data-v-8f2f8136>주문/결제하기</h2>
						</div> 
						<div data-v-8f2f8136>
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
											<li data-v-8f2f8136=""><div data-v-8f2f8136=""
													class="products-delivery-date-wrap">
													<div data-v-8f2f8136="" class="products-delivery-date-left">수령일</div>
													<div data-v-8f2f8136=""
														class="products-delivery-date-right">2022-01-27</div>
												</div>
												<ul data-v-8f2f8136="" class="items">
													<li data-v-8f2f8136="" class="row"><div
															data-v-8f2f8136="" class="col info">
															<strong data-v-8f2f8136="">산펠레그리노 탄산수 500ml/1개</strong>
														</div>
														<div data-v-8f2f8136="" class="count">
															<em data-v-8f2f8136="">7</em>개
														</div>
														<div data-v-8f2f8136="" class="price">
															<em data-v-8f2f8136="">13,300</em>원
														</div></li>
												</ul></li>
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
												<tr data-v-8f2f8136="">
													<td data-v-8f2f8136="" rowspan="1" class="date left">
														2022/01/27</td>
													<td data-v-8f2f8136="" class="bd left"><strong
														data-v-8f2f8136="" class="title">산펠레그리노 탄산수
															500ml/1개</strong></td>
													<td data-v-8f2f8136="" class="qry">7</td>
													<td data-v-8f2f8136="" class="price right"><em
														data-v-8f2f8136="">13,300</em>원</td>
													<td data-v-8f2f8136="" class="price right"><em
														data-v-8f2f8136=""> 0</em>원</td>
													<td data-v-8f2f8136="" rowspan="1" class="price right"><em
														data-v-8f2f8136="">0</em>원</td>
													<td data-v-8f2f8136="" rowspan="1"
														class="price-total right">13,300원</td>
												</tr>
											</tbody>
										</table>
									</div>
								</section>
								<section class="checkout__person" data-v-8f2f8136>
								<div class="wrap" data-v-8f2f8136>
									<div class="buyer" data-v-8f2f8136>
										<h3 class="checkout__section-title" data-v-8f2f8136>주문자 정보</h3> 
										<dl class="row--v-center" data-v-8f2f8136>
											<dt data-v-8f2f8136>보내는 분</dt> 
											<dd class="col" data-v-8f2f8136>신준혁</dd>
										</dl> 
										<dl class="row--v-center" data-v-8f2f8136>
											<dt data-v-8f2f8136>이메일</dt> 
											<dd class="col" data-v-8f2f8136>tjdtls690@naver.com</dd>
										</dl> 
										<dl class="row--v-center" data-v-8f2f8136>
											<dt data-v-8f2f8136>연락처</dt> 
											<dd class="col" data-v-8f2f8136>01057113386</dd>
										</dl>
									</div> 
									<div class="receiver" data-v-8f2f8136>
										<header class="row--v-center row--h-between" data-v-8f2f8136>
											<h3 class="checkout__section-title" data-v-8f2f8136>받는 사람 정보</h3>
										</header> 
										<div data-v-8f2f8136>
											<fieldset class="form-fieldset" data-v-8f2f8136>
												<legend data-v-8f2f8136>받는 사람 정보 입력 폼</legend> 
												<input id="xx" type="text" name="xx" placeholder="받는분 이름을 입력해주세요" maxlength="50" autocorrect="off" autocapitalize="off" class="form-text" 
													style="height:47px;margin-bottom:10px;" data-v-8bb17226 data-v-8f2f8136> 
												<input id="yy" type="tel" name="yy" placeholder="연락처를 입력해주세요" minlength="9" maxlength="12" autocorrect="off" 
													autocapitalize="off" class="form-text" style="height:47px;" data-v-8bb17226 data-v-8f2f8136>
											</fieldset> 
											<label class="row--v-center same-with-order-wrap" data-v-8f2f8136>
												<label class="form-checkbox" data-v-2673f877 data-v-8f2f8136>
													<input type="checkbox" checked="checked" data-v-2673f877> 
													<span data-v-2673f877>
														<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" data-v-2673f877>
															<path fill="currentColor" fill-rule="nonzero" d="M8.489 13.597l7.304-7.304a1 1 0 0 1 1.414 1.414l-8 8a1 1 0 0 1-1.403.011l-4-3.875a1 1 0 1 1 1.392-1.436l3.293 3.19z" data-v-2673f877></path>
														</svg>
													</span>
												</label> 
												<span data-v-8f2f8136>주문자 정보와 같습니다.</span>
											</label>
										</div>
									</div>
								</div>
							</section> 
							<section class="checkout__delivery checkout-column__delivery" data-v-8f2f8136>
								<header data-v-8f2f8136>
									<h3 class="checkout__section-title" data-v-8f2f8136>배송정보</h3> 
									<span class="time-info" data-v-8f2f8136></span> 
									<div class="delivery" data-v-8f2f8136>
										<dl class="row" data-v-8f2f8136>
											<dt data-v-8f2f8136>배송 방법</dt> 
											<dd class="col" data-v-8f2f8136></dd>
										</dl> 
										<dl class="row" data-v-8f2f8136>
											<dt data-v-8f2f8136>배송 예정일시</dt> 
											<dd class="col" data-v-8f2f8136>
												<b data-v-8f2f8136> 00:00-00:00</b> 
												<div class="detail-address" data-v-8f2f8136>예정보다 빠르게 배송될 수 있습니다
													<span style="white-space: nowrap;" data-v-8f2f8136>(배송 후 문자 안내)</span>
												</div>
											</dd>
										</dl> 
										<dl class="row" data-v-8f2f8136>
											<dt data-v-8f2f8136>배송지</dt> 
											<dd class="col" data-v-8f2f8136>
												<span class="detail-address" data-v-8f2f8136> </span>
											</dd>
										</dl>
									</div>
								</header>
							</section> 
							<!----> 
							<!----> 
							<!----> 
							<div class="checkout-column" data-v-8f2f8136>
								<div class="checkout-column__payment" data-v-8f2f8136>
<!-- 									<section class="checkout__payment" data-v-8f2f8136> -->
<!-- 										<h3 class="checkout__section-title" data-v-8f2f8136>결제수단</h3>  -->
<!-- 										<div class="method" data-v-8f2f8136> -->
<!-- 											<div class="row--v-center method__item method__item--fco selected" data-v-8f2f8136> -->
<!-- 												<label id="pay-card" class="row--v-center col" data-v-8f2f8136> -->
<!-- 													<input type="radio" name="pay" value="card" checked="checked" class="check" data-v-8f2f8136>  -->
<!-- 													<span data-v-8f2f8136>프코 간편결제</span> -->
<!-- 												</label> -->
<!-- 											</div>  -->
<!-- 											<div class="row--v-center method__item method__item--fco" data-v-8f2f8136> -->
<!-- 												<label id="pay-payco" class="row--v-center col" data-v-8f2f8136> -->
<!-- 													<input type="radio" name="pay" value="payco" class="check" data-v-8f2f8136>  -->
<!-- 													<span data-v-8f2f8136>페이코 간편결제</span> -->
<!-- 												</label> -->
<!-- 											</div>  -->
<!-- 											<div class="row--v-center method__item method__item--fco" data-v-8f2f8136> -->
<!-- 												<label id="pay-unpaid-card" class="row--v-center col" data-v-8f2f8136> -->
<!-- 													<input type="radio" name="pay" value="unpaid-card" class="check" data-v-8f2f8136>  -->
<!-- 													<span data-v-8f2f8136>신용카드</span> -->
<!-- 												</label> -->
<!-- 											</div>  -->
<!-- 											<div class="row--v-center method__item method__item--fco" data-v-8f2f8136> -->
<!-- 												<label id="pay-unpaid-kakao" class="row--v-center col" data-v-8f2f8136> -->
<!-- 													<input type="radio" name="pay" value="unpaid-kakao" class="check" data-v-8f2f8136>  -->
<!-- 													<span data-v-8f2f8136>카카오 간편결제</span> -->
<!-- 												</label> -->
<!-- 											</div>  -->
<!-- 											<div class="row--v-center method__item method__item--fco" data-v-8f2f8136> -->
<!-- 												<label id="pay-toss" class="row--v-center col" data-v-8f2f8136> -->
<!-- 													<input type="radio" name="pay" value="toss" class="check" data-v-8f2f8136>  -->
<!-- 													<span data-v-8f2f8136>토스 간편결제</span> -->
<!-- 												</label> -->
<!-- 											</div>  -->
<!-- 											<div class="row--v-center method__item method__item--fco" data-v-8f2f8136> -->
<!-- 												<label id="pay-unpaid-bank" class="row--v-center col" data-v-8f2f8136> -->
<!-- 													<input type="radio" name="pay" value="unpaid-bank" class="check" data-v-8f2f8136>  -->
<!-- 													<span data-v-8f2f8136>계좌이체</span> -->
<!-- 												</label> -->
<!-- 											</div>  -->
<!-- 											  -->
<!-- 											<div class="row--v-center fcopay" data-v-8f2f8136> -->
<!-- 											  -->
<!-- 												<button type="button" title="" class="button button--side-padding button--size-small" style="height:46px;border-radius:2px;flex:1 1 0;" 
<!-- 													data-v-a1c889e0 data-v-8f2f8136> -->
<!-- 													<span class="button__wrap" data-v-a1c889e0>카드 등록</span> -->
<!-- 												</button> -->
<!-- 											</div> -->
<!-- 										</div> -->
<!-- 									</section>  -->
									<section class="checkout__coupoint" data-v-8f2f8136>
										<div class="coupon" data-v-8f2f8136>
											<h3 class="checkout__section-title" data-v-8f2f8136>할인 쿠폰</h3> 
											<button type="button" data-v-8f2f8136>
												<span class="row--v-center" data-v-8f2f8136>
													<em class="col coupon__not-use" data-v-8f2f8136>내 쿠폰 0장</em> 
													<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" aria-labelledby="arrow-right-1" 
														role="presentation" class="icon" data-v-8f2f8136>
														<g fill="none" fill-rule="evenodd"> 
															<path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" d="M10 6l5.964 5.964-5.964 6"></path>
														</g>
													</svg>
												</span>
											</button>
										</div> 
										<div class="point" data-v-8f2f8136>
											<h3 class="checkout__section-title" data-v-8f2f8136>포인트 사용</h3> 
											<div class="point-wrap row--v-center" data-v-8f2f8136>
												<span class="point__input" data-v-8f2f8136>
													<input id="pp" type="tel" name="pp" placeholder="포인트를 입력해주세요" autocorrect="off" autocapitalize="off" max="NaN" value="0" class="form-text" 
														style="height:46px;text-align:right;" data-v-8bb17226 data-v-8f2f8136> 
													<i data-v-8f2f8136>P</i>
												</span> 
												<button type="button" title="" class="button button--side-padding button--size-small" style="width:80px; height:46px; margin-left:10px; 
													border-radius:2px;" data-v-a1c889e0 data-v-8f2f8136>
												<span class="button__wrap" data-v-a1c889e0>전액사용</span>
												</button>
											</div> 
											<dl class="row--v-center point__use" data-v-8f2f8136>
												<dt class="col label" data-v-8f2f8136>사용 가능한 포인트</dt> 
												<dd class="num" data-v-8f2f8136>0 P</dd>
											</dl>
										</div> 
										<!---->
									</section>
								</div>
								<div class="checkout-column" data-v-8f2f8136>
									<section class="checkout__result" data-v-8f2f8136>
										<h3 class="checkout__section-title" data-v-8f2f8136>결제금액</h3>
										<div class="bd" data-v-8f2f8136>
											<div data-v-8f2f8136>
												<dl class="row--v-center row--h-between" data-v-8f2f8136>
													<dt data-v-8f2f8136>상품 금액</dt>
													<dd data-v-8f2f8136>
														<em data-v-8f2f8136>0</em> 원
													</dd>
												</dl>
												<dl class="row--v-center row--h-between discount"
													data-v-8f2f8136>
													<dt data-v-8f2f8136>상품 할인</dt>
													<dd data-v-8f2f8136>
														<em data-v-8f2f8136> 0</em> 원
													</dd>
												</dl>
											</div>
											<div data-v-8f2f8136>
												<dl class="row--v-center row--h-between" data-v-8f2f8136>
													<dt data-v-8f2f8136>쿠폰 사용</dt>
													<dd data-v-8f2f8136>
														<em data-v-8f2f8136> 0</em> 원
													</dd>
												</dl>
												<dl class="row--v-center row--h-between" data-v-8f2f8136>
													<dt data-v-8f2f8136>포인트 사용</dt>
													<dd data-v-8f2f8136>
														<em data-v-8f2f8136> 0</em> 원
													</dd>
												</dl>
												<dl class="row--v-center row--h-between" data-v-8f2f8136>
													<dt data-v-8f2f8136>배송비</dt>
													<dd data-v-8f2f8136>
														<em data-v-8f2f8136>0</em> 원
													</dd>
												</dl>
												<dl
													class="row--v-center row--h-between delivery-fee-info-wrap"
													style="color: red;" data-v-8f2f8136>
													<div class="delivery-fee-title-wrap" data-v-8f2f8136>
														<dt data-v-8f2f8136>배송비 할인</dt>
														<span class="info-hover-icon" data-v-8f2f8136></span>
													</div>
													<!---->
													<dd data-v-8f2f8136>
														<em data-v-8f2f8136> 0</em> 원
													</dd>
												</dl>
												<!---->
											</div>
											<!---->
											<dl class="row--v-end row--h-between" data-v-8f2f8136>
												<dt data-v-8f2f8136>최종 결제금액</dt>
												<dd data-v-8f2f8136>
													<b data-v-8f2f8136>0 원</b>
												</dd>
											</dl>
										</div>
									</section>
									<div class="row--v-center checkout__agree" data-v-8f2f8136>
										<label class="row--v-center col" data-v-8f2f8136>
											<label class="form-checkbox" data-v-2673f877 data-v-8f2f8136>
												<input type="checkbox" data-v-2673f877> 
												<span data-v-2673f877>
													<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" data-v-2673f877>
														<path fill="currentColor" fill-rule="nonzero" 
															d="M8.489 13.597l7.304-7.304a1 1 0 0 1 1.414 1.414l-8 8a1 1 0 0 1-1.403.011l-4-3.875a1 1 0 1 1 1.392-1.436l3.293 3.19z" data-v-2673f877></path>
													</svg>
												</span>
											</label> 
											<span class="col" data-v-8f2f8136>개인정보 수집·이용 동의 (필수)</span>
										</label> 
										<a href="#" data-v-8f2f8136>내용보기</a>
									</div>
									<!---->
									<nav class="nav checkout__nav" style="margin-bottom: 0;" data-v-8f2f8136>
										<button type="button" title="" id="pay-btn2" class="button button--size-large" style="border-radius: 2px; font-size: 16px;" data-v-a1c889e0 data-v-8f2f8136>
											<span class="button__wrap" data-v-a1c889e0>결제하기</span>
											<script type="text/javascript">
										          $(".button__wrap").click(function () {
										           var IMP = window.IMP;
										           IMP.init('imp80414894');
										           IMP.request_pay({
										            pg: 'inicis', 
										            pay_method: 'card',
										            merchant_uid: 'merchant_' + new Date().getTime(),
										            name: '샐러드',
										            //결제창에서 보여질 이름
										            amount: 200,
										            //가격
										            buyer_email: 'tjdtls690@naver.com',
										            buyer_name: '신준혁',
										            buyer_tel: '010-5711-3386',
										            buyer_addr: '청라',
										            buyer_postcode: '123-456',
										            m_redirect_url: 'orderSu?member_number=4' //결제 끝나고 랜딩되는 페이지 
										           }, function (rsp) {
										            console.log(rsp);
										            if (rsp.success) {
											            var msg = '결제가 완료되었습니다.\n';
											            msg += '고유ID : ' + rsp.imp_uid;
											            msg += '\n상점 거래ID : ' + rsp.merchant_uid;
											            msg += '\n결제 금액 : ' + rsp.paid_amount;
											            msg += '\n카드 승인번호 : ' + rsp.apply_num;
											            location.href="orderSu?member_number=4";
										            } else {
											            var msg = '결제에 실패하였습니다.\n';
											            msg += '에러내용 : ' + rsp.error_msg;
										            }
										            alert(msg);
										           });
											});
										</script>
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
<script>window.__NUXT__=(function(a,b,c,d,e,f,g,h,i,j,k,l,m,n,o){return {layout:"default-none-footer",data:[{appPayUrl:"https:\u002F\u002Fwww.freshcode.me\u002Forder\u002Fcheckout-app?isApp=true&orderFlag=general&cartFlag=false",orderFlag:"general",contextId:g,cancelMsg:g,gs25:b}],error:b,state:{appFirstLaunch:a,appCheck:a,appData:b,appVersion:b,appPermission:a,showChTalk:a,isRoot:a,userAgent:"Mozilla\u002F5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\u002F537.36 (KHTML, like Gecko) Chrome\u002F97.0.4692.71 Safari\u002F537.36",deviceId:b,devicePlatform:b,user:{id:271132,email:"tjdtls690@naver.com",name:h,nickname:h,tel:"01057113386",gender:"male",birth:"1993-07-12",comName:d,job:d,point:c,confirmEmail:a,confirmTel:e,newsletterEmail:a,newsletterSms:a,newsletterPush:b,promoCode:"1sby67m4cf",promoCount:c,deliveryCount:c,couponCount:c,reviewCount:c,cartCount:c,isAdmin:a,signinDate:"2022-01-11 19:03:29",signinMethod:"kakao",signupDate:"2022-01-11 15:48:53",authority:"[\"user\"]",service080:a,auth:o,isSignup:b},userInfo:{point:c,couponCount:c,deliveryDateCount:c,cartCount:c,menuReviewCount:c,completeMenuCount:c,isFirstOrder:e,unconfirmedNotiCount:c,orderCount:c,totalPayAmount:b,notCanceledOrderTypes:[]},Authorization:o,orderMenus:[],orderMenusTemp:[],layout:{headerLine:e},userUpdateAccessAuthority:a,currentPageOGInfo:b,payOrderInfo:b,selectDetail:[],readMenu:b,orderInfo:{},menuPageActiveTab:c,isFirstOrder:a,unavailableQuantity:{isUnavailable:a,list:[]},itemsForAddCartMsg:[],cartItems:[],orderItemsFromCart:[],cartModalObj:{isVisible:a,menu:b},checkedOptions:[],visibleBanner:a,loading:a,friendInvitationPoint:i,emailAgreePoint:"2,000",reviewPointObj:{subsNormal:"1,000",subsPic:i,generalNormal:"100",generalPic:"300"},categoryItems:[{id:c,name:"전체보기",path:"\u002Fmenu",isNew:a,isHidden:a},{id:1,name:"정기배송",path:"\u002Fmenu\u002Fsubscription",isNew:a,isHidden:a},{id:2,name:"샐러드",path:"\u002Fmenu\u002Fsalad",isNew:a,isHidden:a},{id:3,name:"랩·샌드위치",path:"\u002Fmenu\u002Fsalad-wrap",isNew:a,isHidden:a},{id:4,name:"도시락·간편식",path:"\u002Fmenu\u002Fmeal",isNew:a,isHidden:a},{id:5,name:"세트상품",path:"\u002Fmenu\u002Fset",isNew:a,isHidden:a},{id:6,name:"간식",path:"\u002Fmenu\u002Fsnack",isNew:a,isHidden:a},{id:7,name:"음료",path:"\u002Fmenu\u002Fdrink",isNew:a,isHidden:a},{id:8,name:"할인기획전",path:"\u002Fmenu\u002Fevent",isNew:a,isHidden:a},{id:9,name:"오픈예정",path:"\u002Fmenu\u002Fsoon",isNew:a,isHidden:a},{id:10,name:"죽·스프",path:"\u002Fmenu\u002Fsoup",isNew:a,isHidden:a}],allMenusSpreadFlag:a,isKakaoInApp:a,headerHeight:50,diy:{targetDiyOrderMenu:b,targetDiyOrderMenuFilterOption:b,targetDiyOrderMenuDetail:b,customOrder:b,customOrderContext:b,customOrderSelectedDates:b,saved:b,selectedSubMenu:{menuId:b,selected:a,size:"Medium",selectedWeek:b,subStartDates:[],startDate:d,startDay:d,discountRate:c,menuTypes:[],optionMenuTypes:[],menus:[],sum:c,subDeliveryDates:[],pickupDays:[]}},cart:{unavailableQuantity:{isUnavailable:a,list:[]},itemsForAddCartMsg:[],cartItems:[],orderItemsFromCart:[],cartModalObj:{isVisible:a,menu:b}},delivery:{deliveryFeeObj:{spot:c,trialSpot:j,quick:j,morning:k,parcel:k},freeDeliveryAmountObj:{spot:c,trialSpot:l,quick:l,morning:m,parcel:m},minOrderAmountObj:{spot:n,trialSpot:n,quick:f,morning:f,parcel:f}},destination:{userSpots:[],userDests:[],isDinner:a,delivery:d,orderType:d},loadingSpinner:{isLoading:a},menu:{salad:b,wrap:b,snack:b,bundle:b,sub:b,set:b,meal:b,drink:b,soup:b,eventMenu:b,soonMenu:b,menuOrigin:b,loading:a,nonMenus:[222,237,258,388,505],deliveryTypeForDefault:"spot"},spot:{}},serverRendered:e}}(false,null,0,"",true,10000,void 0,"신준혁","3,000",4000,3500,40000,35000,6000,"Basic MjcxMTMyOjlkNDgyYTZkMDNlODRkYWJiNmFjNTZlODg5YjZhOTU3"));</script><script src="/_nuxt/7f98a0d92154100f473a.js" defer></script><script src="/_nuxt/82186e2369e23d362989.js" defer></script><script src="/_nuxt/f4c6f09994f4d1e74c4c.js" defer></script><script src="/_nuxt/ed2dabba8c2241055485.js" defer></script><script src="/_nuxt/1e223beabb284bcb3343.js" defer></script><script src="/_nuxt/e690efc2bdcea93bb1f9.js" defer></script><script src="/_nuxt/605fbd701ca096ca4a89.js" defer></script><script src="/_nuxt/36eaadcb8a6fbe10d38e.js" defer></script><script src="/_nuxt/8538008e36d3bf94fc00.js" defer></script>
<script src="https://web.nicepay.co.kr/v3/webstd/js/nicepay-2.0.js" type="text/javascript"></script>
<script type="text/javascript" src="https://wcs.naver.net/wcslog.js" id="wcs-log"></script>
<script async type="text/javascript" id="wcs"></script>
</body>

<a class="custom-ch-btn" style="display:none">문의하기</a>
<form name="payForm" id="payForm" method="post" action="" accept-charset="UTF-8" style="display:none">
</form>

<form name="payFormMobile" id="payFormMobile" target="_self" method="post" action="https://web.nicepay.co.kr/v3/smart/smartPayment.jsp" accept-charset="euc-kr" style="display:none">
</form>

<!-- Enliple Tracker Start -->
<script type="text/javascript">
!function(e,n,t,c,o){e.enp=e.enp||function(){(e.enp.q=e.enp.q||[]).push(arguments)},(c=n.createElement(t)).async=!0,c.defer=!0,c.src="https://cdn.megadata.co.kr/dist/prod/enp_tracker_self_hosted.min.js",(o=n.getElementsByTagName(t)[0]).parentNode.insertBefore(c,o)}(window,document,"script"),enp("create","common","freshcode",{device:"B"}),enp("send","common","freshcode")
</script>
<!-- Enliple Tracker End -->

</html>



<script type="text/javascript" src="/javascript/check-browser.js"></script>
<script type="text/javascript" src="/javascript/channel-plugin.js"></script>

<script>function nicepayStart(){goPay(document.payForm)}function nicepaySubmit(){document.payForm.submit()}function nicepayClose(){alert("결제를 취소 하였습니다."),document.getElementById("payForm").innerHTML="",document.getElementById("pay-btn1").removeAttribute("disabled"),document.getElementById("pay-btn1").classList.remove("button--disabled"),document.getElementById("pay-btn2").removeAttribute("disabled"),document.getElementById("pay-btn2").classList.remove("button--disabled")}function getTomorrow(){var e=new Date,t=e.getTime()+60*e.getTimezoneOffset()*1e3,n=new Date(t+324e5),o=n.getFullYear().toString(),i=(n.getMonth()+1).toString(),a=(n.getDate()+1).toString();return i.length<2&&(i="0"+i),a.length<2&&(a="0"+a),o+i+a}function nicepayMobileStart(){document.payFormMobile.submit()}</script>

<script src="https://nsp.pay.naver.com/sdk/js/naverpay.min.js"></script>

<script type="text/javascript" src="https://appleid.cdn-apple.com/appleauth/static/jsapi/appleid/1/en_US/appleid.auth.js"></script>
