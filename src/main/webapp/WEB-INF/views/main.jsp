<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<c:set var="path" value="${pageContext.request.contextPath}/resources/main"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
<title>샐러딧 - 샐러드 구독·건강간편식 프리미엄 배송 서비스</title>
<meta data-n-head="ssr" charset="utf-8">
<meta data-n-head="ssr" name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, minimal-ui, viewport-fit=cover, user-scalable=no">
<meta data-n-head="ssr" data-hid="subject" name="subject" content="프레시코드 - 프리미엄 샐러드 배달 서비스">
<meta data-n-head="ssr" data-hid="author" name="author" content="https://www.freshcode.me">
<meta data-n-head="ssr" data-hid="og:site_name" property="og:site_name" content="프레시코드 - 프리미엄 샐러드 배달 서비스">
<meta data-n-head="ssr" data-hid="fb:app_id" property="fb:app_id" content="323001348061168">
<meta data-n-head="ssr" data-hid="title" name="title" content="프레시코드 - 샐러드 구독·건강간편식 프리미엄  배송 서비스">
<meta data-n-head="ssr" data-hid="description" name="description" content="프리미엄 샐러드 구독 서비스부터 매일 즐길 건강한 한끼 식사 샐러드,건강간편식 배송까지 식단관리가 편해지는 프레시코드에서 건강한 일상을 가장 편하게 즐겨보세요. ">
<meta data-n-head="ssr" data-hid="og:title" property="og:title" content="프레시코드 - 샐러드 구독·건강간편식 프리미엄  배송 서비스">
<meta data-n-head="ssr" data-hid="og:description" property="og:description" content="프리미엄 샐러드 구독 서비스부터 매일 즐길 건강한 한끼 식사 샐러드,건강간편식 배송까지 식단관리가 편해지는 프레시코드에서 건강한 일상을 가장 편하게 즐겨보세요. ">
<meta data-n-head="ssr" data-hid="og:type" property="og:type" content="website">
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
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"> -->

<link href="${path}/css1/style.css" rel="stylesheet" type="text/css" />
  <link rel="stylesheet" href="${path}/css/bootstrap.css?ver=1">
  <link href="${path}/css1/style2.css?ver=3" rel="stylesheet" type="text/css" />
  <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
  <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">
function page_move(tagNum){
    var f = document.paging; //폼 name
    f.tagMain01.value = tagNum; //POST방식으로 넘기고 싶은 값
    f.action="tapPage.do";//이동할 페이지
    f.method="post";//POST방식
    f.submit();
}

$(function() {
	
	setInterval(function() {
		$('#rightButton01').trigger("click");
	}, 5000);
	
	setInterval(function() {
		$('#rightButton02').trigger("click");
	}, 5000);
	
	
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
    
    $(document).on('click', '.mdLink', function(){
    	var itemCode = $(this).children('#itemCode').val();
    	var tagMain = $(this).children('#tagMain').val();
    	var tagSub = $(this).children('#tagSub').val();
    	
    	var f = document.paging;
    	var code = $(this).children('#itemCode').attr('value');
    	var tag = $(this).children('#tagMain').attr('value');
    	var tagSub = $(this).children('#tagSub').attr('value');
    	f.tagMain01.value = tagMain;
    	f.itemCode01.value = itemCode;
    	f.tagSub01.value = tagSub;
    	f.action="detail.do"; // 상세페이지 url 로 연결만 시키기
    	f.method="post";
    	f.submit();
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
	
	$(document).on('click', '.swiper-slide', function(){ 
 		var f = document.paging;
 		var code = $(this).children('#itemCode').attr('value');
 		var tag = $(this).children('#tagMain').attr('value');
 		var tagSub = $(this).children('#tagSub').attr('value');
 		f.tagMain01.value = tag;
 		f.itemCode01.value = code;
 		f.itemSub01.value = tagSub;
 		alert(code);
 		f.action="detail.do"; 
 		f.method="post";
 		f.submit();
 	})
});

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
</head>
	<body >
		<div data-server-rendered="true" id="__nuxt">
			<div id="__layout">
				<main class="viewport" data-v-0f5971ec>
					<header id="header-area" class="header" data-v-30697495 data-v-0f5971ec>
						<div class="header-banner-wrap" data-v-30697495><!----></div> 
						<div id="header__body" class="header__body" data-v-30697495>
							<div class="header__top" data-v-30697495>
								<a href="/info" class="header__top-left" data-v-30697495></a> 
								<div class="header__top-right" data-v-30697495>
									<c:choose>
										<c:when test="${empty member.gender}">
											<a href="signup.do" data-v-30697495="">회원가입</a>
											<a data-v-30697495="" href="login.do">로그인</a>
										</c:when>
										<c:otherwise>
											<a href="myPayInfo.do" id="nickname" data-v-30697495>${member.name } <span data-v-30697495>님</span></a>
										</c:otherwise>
									</c:choose>
									<span data-v-30697495>1:1문의</span> 
									<a href="https://forms.gle/92o1ctx6U4CYe2yF9" target="_blank" data-v-30697495>B2B 신청</a>
								</div>
							</div> <!----> 
							<div class="header__logo" data-v-30697495>
								<a data-v-30697495="" href="main.do" class="nuxt-link-active">
									
								</a> <!---->
							</div> 
							<form name="paging">
								<input type="hidden" name="tagMain01" value="">
								<input type="hidden" name="itemCode01" value="">
								<input type="hidden" name="tagSub01" value="">
							</form>
							<nav class="header__menus" data-v-30697495>
								<div data-v-30697495>
									<div class="dropdown" data-v-30697495>
										<span class="item" data-v-30697495>
											전체 카테고리
										</span> 
										<div class="dropdown" data-v-30697495>
											<ul data-v-30697495>
												<li data-v-30697495>
													<a href="javascript:page_move(0);" data-v-30697495>전체보기</a>
												</li>
												<li data-v-30697495>
													<a href="javascript:page_move(100);" data-v-30697495>정기배송</a>
												</li>
												<li data-v-30697495>
													<a href="javascript:page_move(200);" data-v-30697495>샐러드</a>
												</li>
												<li data-v-30697495>
													<a href="javascript:page_move(300);" data-v-30697495>랩·샌드위치</a>
												</li>
												<li data-v-30697495>
													<a href="javascript:page_move(400);" data-v-30697495>도시락·간편식</a>
												</li>
												<li data-v-30697495>
													<a href="javascript:page_move(600);" data-v-30697495>세트상품</a>
												</li>
												<li data-v-30697495>
													<a href="javascript:page_move(700);" data-v-30697495>간식</a>
												</li>
												<li data-v-30697495>
													<a href="javascript:page_move(800);" data-v-30697495>음료</a>
												</li>
												<li data-v-30697495>
													<a href="javascript:page_move(1);" data-v-30697495>초코베리머치</a>
												</li>
<!-- 												<li data-v-30697495> -->
<!-- 													<a href="/menu/soon" data-v-30697495>오픈예정</a> -->
<!-- 												</li> -->
												<li data-v-30697495>
													<a href="javascript:page_move(500);" data-v-30697495>죽·스프</a>
												</li>
											</ul>
										</div>
									</div> 
									<a href="javascript:page_move(100);" class="item" data-v-30697495>정기배송</a>
									<a href="javascript:page_move(200);" class="item" data-v-30697495>샐러드</a>
									<a href="javascript:page_move(300);" class="item" data-v-30697495>랩·샌드위치</a>
									<a href="javascript:page_move(1);" class="item" data-v-30697495>초코베리머치</a>
									<a href="event.do" class="item" data-v-30697495>이벤트</a>
									<a href="purchase.do" class="item" data-v-30697495>프코스팟</a>
								</div> 
								<div class="header__menus-side" data-v-30697495>
									<a href="search.do" class="search-logo" data-v-30697495>
										<img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_search_gray.PNG" alt="메뉴 검색" class="search-logo-img" style="width: 30px; height: 30px;" data-v-30697495> 
										<div data-v-30697495>검색</div>
									</a> 
									<a href="basket.do" class="cart-logo-wrap item" data-v-30697495>
										<img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_baguni.PNG" alt="프레시코드 장바구니" class="cart-logo empty" style="width: 24px; height: 24px;" data-v-30697495>
							          장바구니
							        </a> 
							        <a href="order.do" class="item" data-v-30697495>
							        <img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_pay.PNG" class="icon-order" style="width: 24px; height: 24px;" data-v-30697495>
							          바로주문
							        </a>
							    </div>
							   </nav> 
							   <div class="header__side" data-v-30697495>
							   		<a href="search.do" class="search-logo" data-v-30697495>
							   			<img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_search_gray.PNG" alt="메뉴 검색" class="search-logo-img" style="width: 30px; height: 30px;" data-v-30697495></a>
							   		</a> 
							   		<a href="basket.do" class="cart-logo-wrap item" data-v-30697495>
							   			<img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_baguni.PNG" alt="프레시코드 장바구니" class="cart-logo empty" style="width: 24px; height: 24px;" data-v-30697495>
							   		</a> 
							   		<nav class="header__toggle-button" data-v-30697495>
							   			<button type="button" data-v-30697495>
							   				<img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_menu.PNG" alt="user-menu" style="width: 30px; height: 30px;" data-v-30697495>
							   			</button>
							   		</nav>
								</div>
						</div> 
						<div class="mobile-nav js-mobile-nav" data-v-30697495>
							<div class="mobile-nav-wrap" data-v-30697495>
								<div class="mobile-nav-scroll" data-v-30697495>
									<ul class="mobile-nav-contents" data-v-30697495>
										<li class="mobile-nav-contents-item" data-v-30697495>
											<a href="javascript:page_move(0);" data-v-30697495>
								              전체 메뉴
								            </a>
								        </li>
								        <li class="mobile-nav-contents-item" data-v-30697495>
								        	<a href="javascript:page_move(100);" data-v-30697495>
								              정기배송
								            </a>
								        </li>
								        <li class="mobile-nav-contents-item" data-v-30697495>
								        	<a href="javascript:page_move(1);" data-v-30697495>
								              초코베리머치
								            </a>
								        </li>
								        <li class="mobile-nav-contents-item" data-v-30697495>
								        	<a href="/info" data-v-30697495>
								              배송안내
								            </a>
								        </li>
								        <li class="mobile-nav-contents-item" data-v-30697495>
								        	<a href="/fcospot" data-v-30697495>
								              프코스팟
								            </a>
								        </li>
								    </ul>
								</div> 
								<div class="all-menus-container" style="display:none;" data-v-30697495>
									<div class="all-menus-list-wrap" data-v-30697495>
										<ul class="all-menus-list js-all-menus-list" data-v-30697495>
											<li class="all-menus-item" data-v-30697495>
												<a href="javascript:page_move(0);" class="js-all-menus-item-link-0 all-menus-item-link" data-v-30697495>
								                  전체보기
								                </a>
								            </li>
								            <li class="all-menus-item" data-v-30697495><a href="javascript:page_move(100);" class="js-all-menus-item-link-1 all-menus-item-link" data-v-30697495>
								                  정기배송
								                </a>
								            </li>
								            <li class="all-menus-item" data-v-30697495><a href="javascript:page_move(200);" class="js-all-menus-item-link-2 all-menus-item-link" data-v-30697495>
								                  샐러드
								                </a>
								            </li>
								            <li class="all-menus-item" data-v-30697495><a href="javascript:page_move(300);" class="js-all-menus-item-link-3 all-menus-item-link" data-v-30697495>
								                  랩·샌드위치
								                </a>
								            </li>
								            <li class="all-menus-item" data-v-30697495><a href="javascript:page_move(400);" class="js-all-menus-item-link-4 all-menus-item-link" data-v-30697495>
								                  도시락·간편식
								                </a>
								            </li>
								            <li class="all-menus-item" data-v-30697495><a href="javascript:page_move(600);" class="js-all-menus-item-link-5 all-menus-item-link" data-v-30697495>
								                  세트상품
								                </a>
								            </li>
								            <li class="all-menus-item" data-v-30697495><a href="javascript:page_move(700);" class="js-all-menus-item-link-6 all-menus-item-link" data-v-30697495>
								                  간식
								                </a>
								            </li>
								            <li class="all-menus-item" data-v-30697495><a href="javascript:page_move(800);" class="js-all-menus-item-link-7 all-menus-item-link" data-v-30697495>
								                  음료
								                </a>
								            </li>
								            <li class="all-menus-item" data-v-30697495><a href="javascript:page_move(1);" class="js-all-menus-item-link-8 all-menus-item-link" data-v-30697495>
								                  초코베리머치
								                </a>
								            </li>
<!-- 								            <li class="all-menus-item" data-v-30697495><a href="/menu/soon" class="js-all-menus-item-link-9 all-menus-item-link" data-v-30697495> -->
<!-- 								                  오픈예정 -->
<!-- 								                </a> -->
<!-- 								            </li> -->
								            <li class="all-menus-item" data-v-30697495><a href="javascript:page_move(500);" class="js-all-menus-item-link-10 all-menus-item-link" data-v-30697495>
								                  죽·스프
								                </a>
								            </li>
								        </ul>
								    </div> 
								    <div class="all-menus-shadow" data-v-30697495></div> 
								    <div class="all-menus-arrow-wrap" data-v-30697495>
								    	<img src="/images/icon-arrow-down@2x.png" alt class="all-menus-arrow" data-v-30697495>
								   	</div>
								</div>
							</div>
						</div> 
						<!----> 
						<!----> 
						<!---->
					</header> 
						<div class="home" id="home" data-v-75a55e4e data-v-0f5971ec>
							<div id="myCarousel" class="carousel slide" data-interval="false" data-bs-wrap="true">
						      <ol class="carousel-indicators">
						          <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						         <li data-target="#myCarousel" data-slide-to="1"></li>
						         <li data-target="#myCarousel" data-slide-to="2"></li>
						         <li data-target="#myCarousel" data-slide-to="3"></li>
						         <li data-target="#myCarousel" data-slide-to="4"></li>
						      </ol>
						      <div class="carousel-inner" >
						         <div class="item active">
						            <img id="slide01" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/banner/slide01.PNG">
						            <img id="slide01_1" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/banner/slide01_1.PNG">
						         </div>
						         <div class="item">
						            <img id="slide02" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/banner/slide02.PNG">
						            <img id="slide02_1" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/banner/slide02_1.PNG">
						         </div>
						         <div class="item">
						            <img id="slide03" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/banner/slide03.PNG">
						            <img id="slide03_1" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/banner/slide03_1.PNG">
						         </div>
						         <div class="item">
						            <img id="slide04" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/banner/slide04.PNG">
						            <img id="slide04_1" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/banner/slide04_1.PNG">
						         </div>
						         <div class="item">
						            <img id="slide05" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/banner/slide05.PNG">
						            <img id="slide05_1" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/banner/slide05_1.PNG">
						         </div>
						      </div>
						       <a class="left carousel-control" href="#myCarousel" data-slide="prev">
						         <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						         <span class="sr-only">Previous</span>
						      </a>
						      <a class="right carousel-control" id="rightButton01" href="#myCarousel" role="button" data-slide="next">
						         <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						         <span class="sr-only">Next</span>
						      </a>
						   </div>
							<section class="home-items" data-v-7b0f70b9 data-v-75a55e4e>
								<div id="md-pick" data-v-7b0f70b9>
									<header class="row--v-center home-items__header"
										data-v-7b0f70b9>
										<h2 data-v-7b0f70b9>MD 추천</h2>
									</header>
								   <div id="pCarousel" class="carousel slide" data-interval="false" data-bs-wrap="true">
								      <div class="carousel-inner">
										      <c:forEach var="item" items="${mdInfo }" varStatus="i">
										      	<c:if test="${i.count % 3 == 1 }">
										      		<c:if test="${i.count == 1 }">
										      			<div class="item active">
										      		</c:if>
										      		<c:if test="${i.count != 1 }">
										      			<div class="item">
										      		</c:if>
										      		<div class="section">
										               <div class="row">
										               <div class="col-sm-3" style="text-align:left;">
										               	  <a href='javascript:void(0);' class="mdLink">
										               	  	    <input type="hidden" value="${item.itemCode }" id="itemCode">
																<input type="hidden" value="${item.tagMain }" id="tagMain">
																<input type="hidden" value="${item.tagSub }" id="tagSub">
											                  <img id="MD0${i.count }" src="${item.itemImage }" width="320">
											                  <img id="MD0${i.count }_1" src="${item.itemImage }" width="250">
										              	  </a>
										              </div>
									                  <div class="rest"></div>
										      	</c:if>
										      	<c:if test="${i.count % 3 == 2 }">
										      	  <div class="col-sm-3" style="text-align:left;">
										      	  	  <a href='javascript:void(0);' class="mdLink">
										      	  	  			<input type="hidden" value="${item.itemCode }" id="itemCode">
																<input type="hidden" value="${item.tagMain }" id="tagMain">
																<input type="hidden" value="${item.tagSub }" id="tagSub">
									                  	  <img id="MD0${i.count }" src="${item.itemImage }" width="320">
										                  <img id="MD0${i.count }_1" src="${item.itemImage }" width="250">
									                  </a>
								                  </div>
								                  <div class="rest"></div>
										      	</c:if>
										      	<c:if test="${i.count % 3 == 0 }">
										      		<div class="col-sm-3" style="text-align:left;">
										      			<a href='javascript:void(0);' class="mdLink">
										      					<input type="hidden" value="${item.itemCode }" id="itemCode">
																<input type="hidden" value="${item.tagMain }" id="tagMain">
																<input type="hidden" value="${item.tagSub }" id="tagSub">
										                  	  <img id="MD0${i.count }" src="${item.itemImage }" width="320">
											                  <img id="MD0${i.count }_1" src="${item.itemImage }" width="250">
										                </a>
									                  </div>
													<div class="rest"></div>
									               </div>
									               <c:forEach var="item2" items="${mdInfo }" varStatus="j" begin="${i.index-2 }" end="${i.index }">
									               		<c:if test="${j.count % 3 == 1 || j.count % 3 == 2 }">
									               		<a href='javascript:void(0);' class="mdLink">
									               			<input type="hidden" value="${item2.itemCode }" id="itemCode">
															<input type="hidden" value="${item2.tagMain }" id="tagMain">
															<input type="hidden" value="${item2.tagSub }" id="tagSub">
									               			<div id="a${j.count }" class="col-sm-3" style="text-align:left;"><h4>${item2.itemName }<br><b>${item2.itemPriceM }원 ~ </b><del>${item2.itemPriceMSub }</del><br></h4>
											               		<span data-v-15082832="" class="for-loop-cloned-item-244"><img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/banner/starinfo.PNG">${item2.starAvg }</span>
												                <span data-v-15082832="" class="for-loop-cloned-item-244"><img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/banner/reviewinfo.PNG">${item2.reviewCount }</span>
											               </div>
											            </a>
											               <div class="col-sm-1"></div>
									               		</c:if>
									               		<c:if test="${j.count % 3 == 0 }">
									               		<a href='javascript:void(0);' class="mdLink">
									               			<input type="hidden" value="${item2.itemCode }" id="itemCode">
															<input type="hidden" value="${item2.tagMain }" id="tagMain">
															<input type="hidden" value="${item2.tagSub }" id="tagSub">
									               			<div id="a${j.count }" class="col-sm-3" style="text-align:left;"><h4>${item2.itemName }<br><b>${item2.itemPriceM }원 ~ </b><del>${item2.itemPriceMSub }</del></h4>
											               		<span data-v-15082832="" class="for-loop-cloned-item-244"><img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/banner/starinfo.PNG">${item2.starAvg }</span>
												                <span data-v-15082832="" class="for-loop-cloned-item-244"><img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/banner/reviewinfo.PNG">${item2.reviewCount }</span>
											               </div>
											            </a>
											               <div class="col-sm-1"></div>
												            </div>
												         </div>
									               		</c:if>
									               </c:forEach>
										      	</c:if>
										      	<a class="left carousel-control" href="#pCarousel"data-slide="prev">
									               <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
									               <span class="sr-only">Previous</span>
									            </a> 
									            <a class="right carousel-control" id="rightButton02" href="#pCarousel" role="button" data-slide="next"> 
									               <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
									               <span class="sr-only">Next</span>
									            </a>
										      </c:forEach>
										      <c:if test="${fn:length(mdInfo) % 3 == 1 }">
										      <div class="col-sm-3" style="text-align:left;">
								                  	  <img id="MD02" src="" width="320">
									                  <img id="MD02_1" src="" width="250">
								                  </div>
												<div class="rest"></div>
												<div class="col-sm-3" style="text-align:left;">
								                  	  <img id="MD03" src="" width="320">
									                  <img id="MD03_1" src="" width="250">
								                  </div>
												<div class="rest"></div>
										      </div>
										      <a href='javascript:void(0);' class="mdLink">
							               			<input type="hidden" value="${mdInfo[fn:length(mdInfo)-1].itemCode }" id="itemCode">
													<input type="hidden" value="${mdInfo[fn:length(mdInfo)-1].tagMain }" id="tagMain">
													<input type="hidden" value="${mdInfo[fn:length(mdInfo)-1].tagSub }" id="tagSub">
										      		<div id="a1" class="col-sm-3" style="text-align:left;"><h4>${mdInfo[fn:length(mdInfo)-1].itemName }<br><b>${mdInfo[fn:length(mdInfo)-1].itemPriceM }원 ~ </b><del>${mdInfo[fn:length(mdInfo)-1].itemPriceMSub }</del></h4>
									               		<span data-v-15082832="" class="for-loop-cloned-item-244"><img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/banner/starinfo.PNG">${mdInfo[fn:length(mdInfo)-1].starAvg }</span>
										                <span data-v-15082832="" class="for-loop-cloned-item-244"><img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/banner/reviewinfo.PNG">${mdInfo[fn:length(mdInfo)-1].reviewCount }</span>
									               </div>
								               </a>
										      </c:if>
										      <c:if test="${fn:length(mdInfo) % 3 == 2 }">
										      		<div class="col-sm-3" style="text-align:left;">
									                  	  <img id="MD03" src="" width="320">
										                  <img id="MD03_1" src="" width="250">
									                  </div>
													<div class="rest"></div>
													</div>
													<a href='javascript:void(0);' class="mdLink">
								               			<input type="hidden" value="${mdInfo[fn:length(mdInfo)-2].itemCode }" id="itemCode">
														<input type="hidden" value="${mdInfo[fn:length(mdInfo)-2].tagMain }" id="tagMain">
														<input type="hidden" value="${mdInfo[fn:length(mdInfo)-2].tagSub }" id="tagSub">
											      		<div id="a1" class="col-sm-3" style="text-align:left;"><h4>${mdInfo[fn:length(mdInfo)-2].itemName }<br><b>${mdInfo[fn:length(mdInfo)-2].itemPriceM }원 ~ </b><del>${mdInfo[fn:length(mdInfo)-2].itemPriceMSub }</del></h4>
										               		<span data-v-15082832="" class="for-loop-cloned-item-244"><img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/banner/starinfo.PNG">${mdInfo[fn:length(mdInfo)-2].starAvg }</span>
											                <span data-v-15082832="" class="for-loop-cloned-item-244"><img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/banner/reviewinfo.PNG">${mdInfo[fn:length(mdInfo)-2].reviewCount }</span>
										               </div>
									               </a>
									               <div class="col-sm-1"></div>
									               <a href='javascript:void(0);' class="mdLink">
								               			<input type="hidden" value="${mdInfo[fn:length(mdInfo)-1].itemCode }" id="itemCode">
														<input type="hidden" value="${mdInfo[fn:length(mdInfo)-1].tagMain }" id="tagMain">
														<input type="hidden" value="${mdInfo[fn:length(mdInfo)-1].tagSub }" id="tagSub">
										               <div id="a2" class="col-sm-3" style="text-align:left;"><h4>${mdInfo[fn:length(mdInfo)-1].itemName }<br><b>${mdInfo[fn:length(mdInfo)-1].itemPriceM }원 ~ </b><del>${mdInfo[fn:length(mdInfo)-1].itemPriceMSub }</del></h4>
										               		<span data-v-15082832="" class="for-loop-cloned-item-244"><img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/banner/starinfo.PNG">${mdInfo[fn:length(mdInfo)-1].starAvg }</span>
											                <span data-v-15082832="" class="for-loop-cloned-item-244"><img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/banner/reviewinfo.PNG">${mdInfo[fn:length(mdInfo)-1].reviewCount }</span>
										               </div>
										            </a>
										      </c:if>
<!-- 								            <a class="left carousel-control" href="#pCarousel"data-slide="prev"> -->
<!-- 								               <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> -->
<!-- 								               <span class="sr-only">Previous</span> -->
<!-- 								            </a>  -->
<!-- 								            <a class="right carousel-control" id="rightButton02" href="#pCarousel" role="button" data-slide="next">  -->
<!-- 								               <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span> -->
<!-- 								               <span class="sr-only">Next</span> -->
<!-- 								            </a> -->
								   </div>

								</div>
							</section>
							<section class="home-fcospot" data-v-cadb2ac2 data-v-75a55e4e>
								<div data-v-cadb2ac2>
									<header class="home-fcospot__header" data-v-cadb2ac2>
										<h2 data-v-cadb2ac2>점심·저녁 원하는 시간에 ‘프코스팟/퀵배송’</h2>
										<p data-v-cadb2ac2>당일 생산, 당일 배송으로 신선하게 이용하는</p>
										<p data-v-cadb2ac2>프레시코드만의 특별한 프리미엄 서비스</p>
									</header>
									<div class="home-fcospot__guide" data-v-cadb2ac2>
										<a href="/fcospot" data-v-cadb2ac2>
											<div id="search-fcospot" class="row item" style="margin-right: 0px; margin-left: 0px;" data-v-cadb2ac2>
												<span class="search-fcospot-placeholder" data-v-cadb2ac2>0개의
													무료배송 프코스팟 찾기</span>
											</div>
										</a>
									</div>
								</div>
								<div class="home-fcospot__guide" data-v-cadb2ac2>
									<a href="/info?tab=isSpot" class="item carousel-item public"
										data-v-cadb2ac2>
										<div class="carousel-item-wrap"
											style="background-image: url(/images/how-to-use-public@3x.png);"
											data-v-cadb2ac2>
											<div class="carousel-item-title public" data-v-cadb2ac2>
												<span class="carousel-item-title-span public"
													data-v-cadb2ac2>프코스팟 배송</span>
											</div>
											<div class="carousel-item-text" data-v-cadb2ac2>점심·저녁
												원하는 시간에 픽업하는</div>
											<div class="carousel-item-bold-text" data-v-cadb2ac2>프레시코드만의
												거점배송 서비스</div>
											<div class="carousel-item-small-text" data-v-cadb2ac2>언제나
												배송비 무료 | 점심·저녁배송</div>
										</div>
										<div class="fcospot-count public" data-v-cadb2ac2>이용 가능
											스팟 0개</div>
									</a> <a href="/info?tab=isQuick" class="item carousel-item quick"
										data-v-cadb2ac2>
										<div class="carousel-item-wrap"
											style="background-image: url(/images/how-to-use-quick@3x.png);"
											data-v-cadb2ac2>
											<div class="carousel-item-title quick" data-v-cadb2ac2>
												<span class="carousel-item-title-span quick" data-v-cadb2ac2>퀵배송</span>
											</div>
											<div class="carousel-item-bold-text" data-v-cadb2ac2>이용할
												수 있는 프코스팟이 없을 때</div>
											<div class="carousel-item-text" data-v-cadb2ac2>희망지로
												점심·저녁 배송받는 방법</div>
											<div class="carousel-item-small-text" data-v-cadb2ac2>4만원
												이상 배송비 무료 | 점심·저녁배송</div>
										</div> <!---->
									</a>
								</div>
							</section>
<!-- 							<div class="home__fcospot-body" data-v-75a55e4e> -->
<!-- 								<article class="fcospot-hot-index home__fcospot-body__hot" -->
<!-- 									data-v-fd187c54 data-v-75a55e4e> -->
<!-- 									<div class="fcospot-hot-index__wrap" data-v-fd187c54 -->
<!-- 										data-v-fd187c54> -->
<!-- 										<header data-v-fd187c54="" class="fcospot-hot-index__header"> -->
<!-- 											<h2 data-v-fd187c54="">NEW! 새롭게 오픈한 프코스팟</h2> -->
<!-- 										</header> -->
<!-- 										<div data-v-fd187c54="" class="fcospot-hot-index__list" -->
<!-- 											style=""> -->
<!-- 											<div data-v-fd187c54=""> -->
<!-- 												<span id="carousel_prev_5cb0pz8jg4f" style="display: none;"></span> -->
<!-- 												<div id="carousel_7fg4dan8lj3" -->
<!-- 													class="owl-carousel owl-theme owl-loaded owl-drag"> -->
<!-- 													<div class="owl-stage-outer"> -->
<!-- 														<div class="owl-stage" -->
<!-- 															style="transform: translate3d(-1124px, 0px, 0px); transition: all 0s ease 0s; width: 4496px;"> -->
<!-- 															<div class="owl-item cloned" -->
<!-- 																style="width: 269px; margin-right: 12px;"> -->
<!-- 																<div data-v-fd187c54="" class="fcospot-hot-item__cover"> -->
<!-- 																	<a data-v-fd187c54="" href="/spot/2615" -->
<!-- 																		class="fcospot-hot-item"><div data-v-fd187c54="" -->
<!-- 																			class="row"> -->
<!-- 																			<figure data-v-fd187c54="" -->
<!-- 																				class="fcospot-hot-item__image"> -->
<!-- 																				<i data-v-fd187c54="" -->
<!-- 																					style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/spot/origin/2615_20211026154256&quot;);">image</i> -->
<!-- 																			</figure> -->
<!-- 																			<div data-v-fd187c54="" -->
<!-- 																				class="col fcospot-hot-item__body"> -->
<!-- 																				<div data-v-fd187c54="" class="row state"> -->
<!-- 																					<em data-v-4a52f726="" data-v-fd187c54="" -->
<!-- 																						class="box-text box-text--color-key box-text--size-large">퍼블릭</em> -->
<!-- 																					 -->
<!-- 																				</div> -->
<!-- 																				<strong data-v-fd187c54="">과일소쿠리</strong> <span -->
<!-- 																					data-v-fd187c54="">[퍼블릭]파크뷰자이 상가 1층</span> -->
<!-- 																				 -->
<!-- 																				<em data-v-fd187c54="" class="custom-margin">16명이 -->
<!-- 																					이용중이에요</em> -->
<!-- 																			</div> -->
<!-- 																		</div></a> -->
<!-- 																</div> -->
<!-- 															</div> -->
<!-- 															<div class="owl-item cloned" -->
<!-- 																style="width: 269px; margin-right: 12px;"> -->
<!-- 																<div data-v-fd187c54="" class="fcospot-hot-item__cover"> -->
<!-- 																	<a data-v-fd187c54="" href="/spot/2652" -->
<!-- 																		class="fcospot-hot-item"><div data-v-fd187c54="" -->
<!-- 																			class="row"> -->
<!-- 																			<figure data-v-fd187c54="" -->
<!-- 																				class="fcospot-hot-item__image"> -->
<!-- 																				<i data-v-fd187c54="" -->
<!-- 																					style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/spot/origin/2652_20211118145252&quot;);">image</i> -->
<!-- 																			</figure> -->
<!-- 																			<div data-v-fd187c54="" -->
<!-- 																				class="col fcospot-hot-item__body"> -->
<!-- 																				<div data-v-fd187c54="" class="row state"> -->
<!-- 																					<em data-v-4a52f726="" data-v-fd187c54="" -->
<!-- 																						class="box-text box-text--color-key box-text--size-large">퍼블릭</em> -->
<!-- 																					 -->
<!-- 																				</div> -->
<!-- 																				<strong data-v-fd187c54="">무화당키친</strong> <span -->
<!-- 																					data-v-fd187c54="">당이 없어지는 무화당</span> -->
<!-- 																				 -->
<!-- 																				<em data-v-fd187c54="" class="custom-margin">8명이 -->
<!-- 																					이용중이에요</em> -->
<!-- 																			</div> -->
<!-- 																		</div></a> -->
<!-- 																</div> -->
<!-- 															</div> -->
<!-- 															<div class="owl-item cloned" -->
<!-- 																style="width: 269px; margin-right: 12px;"> -->
<!-- 																<div data-v-fd187c54="" class="fcospot-hot-item__cover"> -->
<!-- 																	<a data-v-fd187c54="" href="/spot/2635" -->
<!-- 																		class="fcospot-hot-item"><div data-v-fd187c54="" -->
<!-- 																			class="row"> -->
<!-- 																			<figure data-v-fd187c54="" -->
<!-- 																				class="fcospot-hot-item__image"> -->
<!-- 																				<i data-v-fd187c54="" -->
<!-- 																					style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/spot/origin/2635_20211104192707&quot;);">image</i> -->
<!-- 																			</figure> -->
<!-- 																			<div data-v-fd187c54="" -->
<!-- 																				class="col fcospot-hot-item__body"> -->
<!-- 																				<div data-v-fd187c54="" class="row state"> -->
<!-- 																					<em data-v-4a52f726="" data-v-fd187c54="" -->
<!-- 																						class="box-text box-text--color-key box-text--size-large">퍼블릭</em> -->
<!-- 																					 -->
<!-- 																				</div> -->
<!-- 																				<strong data-v-fd187c54="">장군커피</strong> <span -->
<!-- 																					data-v-fd187c54="">방산시장 커피맛집</span> -->
<!-- 																				 -->
<!-- 																				<em data-v-fd187c54="" class="custom-margin">10명이 -->
<!-- 																					이용중이에요</em> -->
<!-- 																			</div> -->
<!-- 																		</div></a> -->
<!-- 																</div> -->
<!-- 															</div> -->
<!-- 															<div class="owl-item cloned" -->
<!-- 																style="width: 269px; margin-right: 12px;"> -->
<!-- 																<div data-v-fd187c54="" class="fcospot-hot-item__cover"> -->
<!-- 																	<a data-v-fd187c54="" href="/spot/2624" -->
<!-- 																		class="fcospot-hot-item"><div data-v-fd187c54="" -->
<!-- 																			class="row"> -->
<!-- 																			<figure data-v-fd187c54="" -->
<!-- 																				class="fcospot-hot-item__image"> -->
<!-- 																				<i data-v-fd187c54="" -->
<!-- 																					style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/spot/origin/2624_20211101160206&quot;);">image</i> -->
<!-- 																			</figure> -->
<!-- 																			<div data-v-fd187c54="" -->
<!-- 																				class="col fcospot-hot-item__body"> -->
<!-- 																				<div data-v-fd187c54="" class="row state"> -->
<!-- 																					<em data-v-4a52f726="" data-v-fd187c54="" -->
<!-- 																						class="box-text box-text--color-key box-text--size-large">퍼블릭</em> -->
<!-- 																					 -->
<!-- 																				</div> -->
<!-- 																				<strong data-v-fd187c54="">이엠파워 피트니스 대치점</strong> <span -->
<!-- 																					data-v-fd187c54="">프라이빗 1:1 PT</span> -->
<!-- 																				 -->
<!-- 																				<em data-v-fd187c54="" class="custom-margin">15명이 -->
<!-- 																					이용중이에요</em> -->
<!-- 																			</div> -->
<!-- 																		</div></a> -->
<!-- 																</div> -->
<!-- 															</div> -->
<!-- 															<div class="owl-item active" -->
<!-- 																style="width: 269px; margin-right: 12px;"> -->
<!-- 																<div data-v-fd187c54="" class="fcospot-hot-item__cover"> -->
<!-- 																	<a data-v-fd187c54="" href="/spot/2672" -->
<!-- 																		class="fcospot-hot-item"><div data-v-fd187c54="" -->
<!-- 																			class="row"> -->
<!-- 																			<figure data-v-fd187c54="" -->
<!-- 																				class="fcospot-hot-item__image"> -->
<!-- 																				<i data-v-fd187c54="" -->
<!-- 																					style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/spot/origin/2672_20211124182257&quot;);">image</i> -->
<!-- 																			</figure> -->
<!-- 																			<div data-v-fd187c54="" -->
<!-- 																				class="col fcospot-hot-item__body"> -->
<!-- 																				<div data-v-fd187c54="" class="row state"> -->
<!-- 																					<em data-v-4a52f726="" data-v-fd187c54="" -->
<!-- 																						class="box-text box-text--color-key box-text--size-large">퍼블릭</em> -->
<!-- 																					 -->
<!-- 																				</div> -->
<!-- 																				<strong data-v-fd187c54="">카페스토리웨이 본사사옥점</strong> <span -->
<!-- 																					data-v-fd187c54="">프코스팟 스토리웨이 카페</span> -->
<!-- 																				 -->
<!-- 																				<em data-v-fd187c54="" class="custom-margin">44명이 -->
<!-- 																					이용중이에요</em> -->
<!-- 																			</div> -->
<!-- 																		</div></a> -->
<!-- 																</div> -->
<!-- 															</div> -->
<!-- 															<div class="owl-item active" -->
<!-- 																style="width: 269px; margin-right: 12px;"> -->
<!-- 																<div data-v-fd187c54="" class="fcospot-hot-item__cover"> -->
<!-- 																	<a data-v-fd187c54="" href="/spot/2673" -->
<!-- 																		class="fcospot-hot-item"><div data-v-fd187c54="" -->
<!-- 																			class="row"> -->
<!-- 																			<figure data-v-fd187c54="" -->
<!-- 																				class="fcospot-hot-item__image"> -->
<!-- 																				<i data-v-fd187c54="" -->
<!-- 																					style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/spot/origin/2673_20211124182120&quot;);">image</i> -->
<!-- 																			</figure> -->
<!-- 																			<div data-v-fd187c54="" -->
<!-- 																				class="col fcospot-hot-item__body"> -->
<!-- 																				<div data-v-fd187c54="" class="row state"> -->
<!-- 																					<em data-v-4a52f726="" data-v-fd187c54="" -->
<!-- 																						class="box-text box-text--color-key box-text--size-large">퍼블릭</em> -->
<!-- 																					 -->
<!-- 																				</div> -->
<!-- 																				<strong data-v-fd187c54="">영등포역 3층 트리핀</strong> <span -->
<!-- 																					data-v-fd187c54="">철도역 프코스팟</span> -->
<!-- 																				 -->
<!-- 																				<em data-v-fd187c54="" class="custom-margin">31명이 -->
<!-- 																					이용중이에요</em> -->
<!-- 																			</div> -->
<!-- 																		</div></a> -->
<!-- 																</div> -->
<!-- 															</div> -->
<!-- 															<div class="owl-item active" -->
<!-- 																style="width: 269px; margin-right: 12px;"> -->
<!-- 																<div data-v-fd187c54="" class="fcospot-hot-item__cover"> -->
<!-- 																	<a data-v-fd187c54="" href="/spot/2671" -->
<!-- 																		class="fcospot-hot-item"><div data-v-fd187c54="" -->
<!-- 																			class="row"> -->
<!-- 																			<figure data-v-fd187c54="" -->
<!-- 																				class="fcospot-hot-item__image"> -->
<!-- 																				<i data-v-fd187c54="" -->
<!-- 																					style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/spot/origin/2671_20211124182246&quot;);">image</i> -->
<!-- 																			</figure> -->
<!-- 																			<div data-v-fd187c54="" -->
<!-- 																				class="col fcospot-hot-item__body"> -->
<!-- 																				<div data-v-fd187c54="" class="row state"> -->
<!-- 																					<em data-v-4a52f726="" data-v-fd187c54="" -->
<!-- 																						class="box-text box-text--color-key box-text--size-large">퍼블릭</em> -->
<!-- 																					 -->
<!-- 																				</div> -->
<!-- 																				<strong data-v-fd187c54="">압구정로데오역 카페스토리웨이</strong> -->
<!-- 																				<span data-v-fd187c54="">철도역 프코스팟</span> -->
<!-- 																				 -->
<!-- 																				<em data-v-fd187c54="" class="custom-margin">26명이 -->
<!-- 																					이용중이에요</em> -->
<!-- 																			</div> -->
<!-- 																		</div></a> -->
<!-- 																</div> -->
<!-- 															</div> -->
<!-- 															<div class="owl-item active" -->
<!-- 																style="width: 269px; margin-right: 12px;"> -->
<!-- 																<div data-v-fd187c54="" class="fcospot-hot-item__cover"> -->
<!-- 																	<a data-v-fd187c54="" href="/spot/2573" -->
<!-- 																		class="fcospot-hot-item"><div data-v-fd187c54="" -->
<!-- 																			class="row"> -->
<!-- 																			<figure data-v-fd187c54="" -->
<!-- 																				class="fcospot-hot-item__image"> -->
<!-- 																				<i data-v-fd187c54="" -->
<!-- 																					style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/spot/origin/2573_20210923105553&quot;);">image</i> -->
<!-- 																			</figure> -->
<!-- 																			<div data-v-fd187c54="" -->
<!-- 																				class="col fcospot-hot-item__body"> -->
<!-- 																				<div data-v-fd187c54="" class="row state"> -->
<!-- 																					<em data-v-4a52f726="" data-v-fd187c54="" -->
<!-- 																						class="box-text box-text--color-key box-text--size-large">퍼블릭</em> -->
<!-- 																					 -->
<!-- 																				</div> -->
<!-- 																				<strong data-v-fd187c54="">커피인류 삼성도심점</strong> <span -->
<!-- 																					data-v-fd187c54="">음료구매 시 취식가능</span> -->
<!-- 																				 -->
<!-- 																				<em data-v-fd187c54="" class="custom-margin">53명이 -->
<!-- 																					이용중이에요</em> -->
<!-- 																			</div> -->
<!-- 																		</div></a> -->
<!-- 																</div> -->
<!-- 															</div> -->
<!-- 															<div class="owl-item" -->
<!-- 																style="width: 269px; margin-right: 12px;"> -->
<!-- 																<div data-v-fd187c54="" class="fcospot-hot-item__cover"> -->
<!-- 																	<a data-v-fd187c54="" href="/spot/2615" -->
<!-- 																		class="fcospot-hot-item"><div data-v-fd187c54="" -->
<!-- 																			class="row"> -->
<!-- 																			<figure data-v-fd187c54="" -->
<!-- 																				class="fcospot-hot-item__image"> -->
<!-- 																				<i data-v-fd187c54="" -->
<!-- 																					style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/spot/origin/2615_20211026154256&quot;);">image</i> -->
<!-- 																			</figure> -->
<!-- 																			<div data-v-fd187c54="" -->
<!-- 																				class="col fcospot-hot-item__body"> -->
<!-- 																				<div data-v-fd187c54="" class="row state"> -->
<!-- 																					<em data-v-4a52f726="" data-v-fd187c54="" -->
<!-- 																						class="box-text box-text--color-key box-text--size-large">퍼블릭</em> -->
<!-- 																					 -->
<!-- 																				</div> -->
<!-- 																				<strong data-v-fd187c54="">과일소쿠리</strong> <span -->
<!-- 																					data-v-fd187c54="">[퍼블릭]파크뷰자이 상가 1층</span> -->
<!-- 																				 -->
<!-- 																				<em data-v-fd187c54="" class="custom-margin">16명이 -->
<!-- 																					이용중이에요</em> -->
<!-- 																			</div> -->
<!-- 																		</div></a> -->
<!-- 																</div> -->
<!-- 															</div> -->
<!-- 															<div class="owl-item" -->
<!-- 																style="width: 269px; margin-right: 12px;"> -->
<!-- 																<div data-v-fd187c54="" class="fcospot-hot-item__cover"> -->
<!-- 																	<a data-v-fd187c54="" href="/spot/2652" -->
<!-- 																		class="fcospot-hot-item"><div data-v-fd187c54="" -->
<!-- 																			class="row"> -->
<!-- 																			<figure data-v-fd187c54="" -->
<!-- 																				class="fcospot-hot-item__image"> -->
<!-- 																				<i data-v-fd187c54="" -->
<!-- 																					style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/spot/origin/2652_20211118145252&quot;);">image</i> -->
<!-- 																			</figure> -->
<!-- 																			<div data-v-fd187c54="" -->
<!-- 																				class="col fcospot-hot-item__body"> -->
<!-- 																				<div data-v-fd187c54="" class="row state"> -->
<!-- 																					<em data-v-4a52f726="" data-v-fd187c54="" -->
<!-- 																						class="box-text box-text--color-key box-text--size-large">퍼블릭</em> -->
<!-- 																					 -->
<!-- 																				</div> -->
<!-- 																				<strong data-v-fd187c54="">무화당키친</strong> <span -->
<!-- 																					data-v-fd187c54="">당이 없어지는 무화당</span> -->
<!-- 																				 -->
<!-- 																				<em data-v-fd187c54="" class="custom-margin">8명이 -->
<!-- 																					이용중이에요</em> -->
<!-- 																			</div> -->
<!-- 																		</div></a> -->
<!-- 																</div> -->
<!-- 															</div> -->
<!-- 															<div class="owl-item" -->
<!-- 																style="width: 269px; margin-right: 12px;"> -->
<!-- 																<div data-v-fd187c54="" class="fcospot-hot-item__cover"> -->
<!-- 																	<a data-v-fd187c54="" href="/spot/2635" -->
<!-- 																		class="fcospot-hot-item"><div data-v-fd187c54="" -->
<!-- 																			class="row"> -->
<!-- 																			<figure data-v-fd187c54="" -->
<!-- 																				class="fcospot-hot-item__image"> -->
<!-- 																				<i data-v-fd187c54="" -->
<!-- 																					style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/spot/origin/2635_20211104192707&quot;);">image</i> -->
<!-- 																			</figure> -->
<!-- 																			<div data-v-fd187c54="" -->
<!-- 																				class="col fcospot-hot-item__body"> -->
<!-- 																				<div data-v-fd187c54="" class="row state"> -->
<!-- 																					<em data-v-4a52f726="" data-v-fd187c54="" -->
<!-- 																						class="box-text box-text--color-key box-text--size-large">퍼블릭</em> -->
<!-- 																					 -->
<!-- 																				</div> -->
<!-- 																				<strong data-v-fd187c54="">장군커피</strong> <span -->
<!-- 																					data-v-fd187c54="">방산시장 커피맛집</span> -->
<!-- 																				 -->
<!-- 																				<em data-v-fd187c54="" class="custom-margin">10명이 -->
<!-- 																					이용중이에요</em> -->
<!-- 																			</div> -->
<!-- 																		</div></a> -->
<!-- 																</div> -->
<!-- 															</div> -->
<!-- 															<div class="owl-item" -->
<!-- 																style="width: 269px; margin-right: 12px;"> -->
<!-- 																<div data-v-fd187c54="" class="fcospot-hot-item__cover"> -->
<!-- 																	<a data-v-fd187c54="" href="/spot/2624" -->
<!-- 																		class="fcospot-hot-item"><div data-v-fd187c54="" -->
<!-- 																			class="row"> -->
<!-- 																			<figure data-v-fd187c54="" -->
<!-- 																				class="fcospot-hot-item__image"> -->
<!-- 																				<i data-v-fd187c54="" -->
<!-- 																					style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/spot/origin/2624_20211101160206&quot;);">image</i> -->
<!-- 																			</figure> -->
<!-- 																			<div data-v-fd187c54="" -->
<!-- 																				class="col fcospot-hot-item__body"> -->
<!-- 																				<div data-v-fd187c54="" class="row state"> -->
<!-- 																					<em data-v-4a52f726="" data-v-fd187c54="" -->
<!-- 																						class="box-text box-text--color-key box-text--size-large">퍼블릭</em> -->
<!-- 																					 -->
<!-- 																				</div> -->
<!-- 																				<strong data-v-fd187c54="">이엠파워 피트니스 대치점</strong> <span -->
<!-- 																					data-v-fd187c54="">프라이빗 1:1 PT</span> -->
<!-- 																				 -->
<!-- 																				<em data-v-fd187c54="" class="custom-margin">15명이 -->
<!-- 																					이용중이에요</em> -->
<!-- 																			</div> -->
<!-- 																		</div></a> -->
<!-- 																</div> -->
<!-- 															</div> -->
<!-- 															<div class="owl-item cloned" -->
<!-- 																style="width: 269px; margin-right: 12px;"> -->
<!-- 																<div data-v-fd187c54="" class="fcospot-hot-item__cover"> -->
<!-- 																	<a data-v-fd187c54="" href="/spot/2672" -->
<!-- 																		class="fcospot-hot-item"><div data-v-fd187c54="" -->
<!-- 																			class="row"> -->
<!-- 																			<figure data-v-fd187c54="" -->
<!-- 																				class="fcospot-hot-item__image"> -->
<!-- 																				<i data-v-fd187c54="" -->
<!-- 																					style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/spot/origin/2672_20211124182257&quot;);">image</i> -->
<!-- 																			</figure> -->
<!-- 																			<div data-v-fd187c54="" -->
<!-- 																				class="col fcospot-hot-item__body"> -->
<!-- 																				<div data-v-fd187c54="" class="row state"> -->
<!-- 																					<em data-v-4a52f726="" data-v-fd187c54="" -->
<!-- 																						class="box-text box-text--color-key box-text--size-large">퍼블릭</em> -->
<!-- 																					 -->
<!-- 																				</div> -->
<!-- 																				<strong data-v-fd187c54="">카페스토리웨이 본사사옥점</strong> <span -->
<!-- 																					data-v-fd187c54="">프코스팟 스토리웨이 카페</span> -->
<!-- 																				 -->
<!-- 																				<em data-v-fd187c54="" class="custom-margin">44명이 -->
<!-- 																					이용중이에요</em> -->
<!-- 																			</div> -->
<!-- 																		</div></a> -->
<!-- 																</div> -->
<!-- 															</div> -->
<!-- 															<div class="owl-item cloned" -->
<!-- 																style="width: 269px; margin-right: 12px;"> -->
<!-- 																<div data-v-fd187c54="" class="fcospot-hot-item__cover"> -->
<!-- 																	<a data-v-fd187c54="" href="/spot/2673" -->
<!-- 																		class="fcospot-hot-item"><div data-v-fd187c54="" -->
<!-- 																			class="row"> -->
<!-- 																			<figure data-v-fd187c54="" -->
<!-- 																				class="fcospot-hot-item__image"> -->
<!-- 																				<i data-v-fd187c54="" -->
<!-- 																					style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/spot/origin/2673_20211124182120&quot;);">image</i> -->
<!-- 																			</figure> -->
<!-- 																			<div data-v-fd187c54="" -->
<!-- 																				class="col fcospot-hot-item__body"> -->
<!-- 																				<div data-v-fd187c54="" class="row state"> -->
<!-- 																					<em data-v-4a52f726="" data-v-fd187c54="" -->
<!-- 																						class="box-text box-text--color-key box-text--size-large">퍼블릭</em> -->
<!-- 																					 -->
<!-- 																				</div> -->
<!-- 																				<strong data-v-fd187c54="">영등포역 3층 트리핀</strong> <span -->
<!-- 																					data-v-fd187c54="">철도역 프코스팟</span> -->
<!-- 																				 -->
<!-- 																				<em data-v-fd187c54="" class="custom-margin">31명이 -->
<!-- 																					이용중이에요</em> -->
<!-- 																			</div> -->
<!-- 																		</div></a> -->
<!-- 																</div> -->
<!-- 															</div> -->
<!-- 															<div class="owl-item cloned" -->
<!-- 																style="width: 269px; margin-right: 12px;"> -->
<!-- 																<div data-v-fd187c54="" class="fcospot-hot-item__cover"> -->
<!-- 																	<a data-v-fd187c54="" href="/spot/2671" -->
<!-- 																		class="fcospot-hot-item"><div data-v-fd187c54="" -->
<!-- 																			class="row"> -->
<!-- 																			<figure data-v-fd187c54="" -->
<!-- 																				class="fcospot-hot-item__image"> -->
<!-- 																				<i data-v-fd187c54="" -->
<!-- 																					style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/spot/origin/2671_20211124182246&quot;);">image</i> -->
<!-- 																			</figure> -->
<!-- 																			<div data-v-fd187c54="" -->
<!-- 																				class="col fcospot-hot-item__body"> -->
<!-- 																				<div data-v-fd187c54="" class="row state"> -->
<!-- 																					<em data-v-4a52f726="" data-v-fd187c54="" -->
<!-- 																						class="box-text box-text--color-key box-text--size-large">퍼블릭</em> -->
<!-- 																					 -->
<!-- 																				</div> -->
<!-- 																				<strong data-v-fd187c54="">압구정로데오역 카페스토리웨이</strong> -->
<!-- 																				<span data-v-fd187c54="">철도역 프코스팟</span> -->
<!-- 																				 -->
<!-- 																				<em data-v-fd187c54="" class="custom-margin">26명이 -->
<!-- 																					이용중이에요</em> -->
<!-- 																			</div> -->
<!-- 																		</div></a> -->
<!-- 																</div> -->
<!-- 															</div> -->
<!-- 															<div class="owl-item cloned" -->
<!-- 																style="width: 269px; margin-right: 12px;"> -->
<!-- 																<div data-v-fd187c54="" class="fcospot-hot-item__cover"> -->
<!-- 																	<a data-v-fd187c54="" href="/spot/2573" -->
<!-- 																		class="fcospot-hot-item"><div data-v-fd187c54="" -->
<!-- 																			class="row"> -->
<!-- 																			<figure data-v-fd187c54="" -->
<!-- 																				class="fcospot-hot-item__image"> -->
<!-- 																				<i data-v-fd187c54="" -->
<!-- 																					style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/spot/origin/2573_20210923105553&quot;);">image</i> -->
<!-- 																			</figure> -->
<!-- 																			<div data-v-fd187c54="" -->
<!-- 																				class="col fcospot-hot-item__body"> -->
<!-- 																				<div data-v-fd187c54="" class="row state"> -->
<!-- 																					<em data-v-4a52f726="" data-v-fd187c54="" -->
<!-- 																						class="box-text box-text--color-key box-text--size-large">퍼블릭</em> -->
<!-- 																					 -->
<!-- 																				</div> -->
<!-- 																				<strong data-v-fd187c54="">커피인류 삼성도심점</strong> <span -->
<!-- 																					data-v-fd187c54="">음료구매 시 취식가능</span> -->
<!-- 																				 -->
<!-- 																				<em data-v-fd187c54="" class="custom-margin">53명이 -->
<!-- 																					이용중이에요</em> -->
<!-- 																			</div> -->
<!-- 																		</div></a> -->
<!-- 																</div> -->
<!-- 															</div> -->
<!-- 														</div> -->
<!-- 													</div> -->
<!-- 													<div class="owl-nav"> -->
<!-- 														<div class="owl-prev">next</div> -->
<!-- 														<div class="owl-next">prev</div> -->
<!-- 													</div> -->
<!-- 													<div class="owl-dots disabled"></div> -->
<!-- 												</div> -->
<!-- 												<span id="carousel_next_35nty5jc2s3"></span> -->
<!-- 											</div> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 									<div class="fcospot-hot-index__wrap" data-v-fd187c54 -->
<!-- 										data-v-fd187c54> -->
<!-- 										<div -->
<!-- 											style="display: flex; flex-direction: row; align-items: center; justify-content: center;" -->
<!-- 											data-v-fd187c54> -->
<!-- 											<div class="v-spinner" data-v-fd187c54> -->
<!-- 												<div class="v-pulse v-pulse1" -->
<!-- 													style="background-color: #35ad73; width: 15px; height: 15px; margin: 2px; border-radius: 100%; display: inline-block; animation-name: v-pulseStretchDelay; animation-duration: 0.75s; animation-iteration-count: infinite; animation-timing-function: cubic-bezier(.2, .68, .18, 1.08); animation-fill-mode: both; animation-delay: 0.12s;"></div> -->
<!-- 												<div class="v-pulse v-pulse2" -->
<!-- 													style="background-color: #35ad73; width: 15px; height: 15px; margin: 2px; border-radius: 100%; display: inline-block; animation-name: v-pulseStretchDelay; animation-duration: 0.75s; animation-iteration-count: infinite; animation-timing-function: cubic-bezier(.2, .68, .18, 1.08); animation-fill-mode: both; animation-delay: 0.24s;"></div> -->
<!-- 												<div class="v-pulse v-pulse3" -->
<!-- 													style="background-color: #35ad73; width: 15px; height: 15px; margin: 2px; border-radius: 100%; display: inline-block; animation-name: v-pulseStretchDelay; animation-duration: 0.75s; animation-iteration-count: infinite; animation-timing-function: cubic-bezier(.2, .68, .18, 1.08); animation-fill-mode: both; animation-delay: 0.36s;"></div> -->
<!-- 											</div> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 								</article> -->
<!-- 							</div> -->
<!-- 							<section class="home-fcospot delivery" data-v-54c9f38a -->
<!-- 								data-v-75a55e4e> -->
<!-- 								<div data-v-54c9f38a> -->
<!-- 									<header class="home-fcospot__header" data-v-54c9f38a> -->
<!-- 										<h2 data-v-54c9f38a>원하는 장소로 ‘새벽배송/택배배송’</h2> -->
<!-- 										<p data-v-54c9f38a>내 주변 프코스팟이 없을 경우 추천드리는 배송서비스</p> -->
<!-- 									</header> -->
<!-- 								</div> -->
<!-- 								<div class="home-fcospot__guide" data-v-54c9f38a> -->
<!-- 									<a href="/info?tab=isDawn" class="item carousel-item dawn" -->
<!-- 										data-v-54c9f38a> -->
<!-- 										<div class="carousel-item-wrap" -->
<!-- 											style="background-image: url(/images/how-to-use-dawn@3x.png);" -->
<!-- 											data-v-54c9f38a> -->
<!-- 											<div class="carousel-item-title dawn" data-v-54c9f38a> -->
<!-- 												<span class="carousel-item-title-span dawn" data-v-54c9f38a>새벽배송</span> -->
<!-- 											</div> -->
<!-- 											<div class="carousel-item-bold-text" data-v-54c9f38a>새벽과 -->
<!-- 												아침 사이에 집으로</div> -->
<!-- 											<div class="carousel-item-text" data-v-54c9f38a>주문한 상품을 -->
<!-- 												배송받는 방법</div> -->
<!-- 											<div class="carousel-item-small-text" data-v-54c9f38a>3만 -->
<!-- 												5천원 이상 배송비 무료 | 새벽배송</div> -->
<!-- 										</div> -->
<!-- 									</a> <a href="/info?tab=isParcel" class="item carousel-item parcel" -->
<!-- 										data-v-54c9f38a> -->
<!-- 										<div class="carousel-item-wrap" -->
<!-- 											style="background-image: url(/images/how-to-use-parcel@3x.png);" -->
<!-- 											data-v-54c9f38a> -->
<!-- 											<div class="carousel-item-title parcel" data-v-54c9f38a> -->
<!-- 												<span class="carousel-item-title-span parcel" -->
<!-- 													data-v-54c9f38a>택배배송</span> -->
<!-- 											</div> -->
<!-- 											<div class="carousel-item-bold-text" data-v-54c9f38a>전국 -->
<!-- 												모든 지역에서 원하는 장소로</div> -->
<!-- 											<div class="carousel-item-text" data-v-54c9f38a>주문한 상품을 -->
<!-- 												택배로 받는 배송방법</div> -->
<!-- 											<div class="carousel-item-small-text" data-v-54c9f38a>3만 -->
<!-- 												5천원 이상 배송비 무료 | 전국배송</div> -->
<!-- 										</div> -->
<!-- 									</a> -->
<!-- 								</div> -->
<!-- 							</section> -->
							<!---->
							<div id="bottom-banner" data-v-75a55e4e>
								
							</div>
							<!---->
						</div>
				<div class="btn-order-wrap" data-v-0f5971ec><!----> 
					<div class="btn-order" data-v-0f5971ec></div>
				</div> 
				<footer class="footer" data-v-438b4fe4 data-v-0f5971ec>
					<div class="footer__wrap" data-v-438b4fe4 >
						<h2 class="footer---logo" data-v-438b4fe4>
							<img class="footer--logo" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/banner/logo.PNG" alt="SALAD:IT" data-v-438b4fe4> 
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
						        		<img src="/images/instagram@2x.png" title="instagram" data-v-438b4fe4>
						        		<img src="/images/facebook@2x.png" title="facebook" data-v-438b4fe4>
						        		<img src="/images/youtube@3x.png" title="youtube" data-v-438b4fe4>
						        		<img src="/images/group-21@2x.png" title="blog" data-v-438b4fe4>
						        		<img src="/images/blog-post@2x.png" title="Naver post" data-v-438b4fe4>
						        		<img src="/images/kakao-channel@2x.png" title="kakao channel" data-v-438b4fe4>
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
</body>
	
	<a class="custom-ch-btn" style="display:none">문의하기</a>
<!-- 	<form name="payForm" id="payForm" method="post" action="" accept-charset="UTF-8" style="display:none"> -->
<!-- 	</form> -->
	
<!-- 	<form name="payFormMobile" id="payFormMobile" target="_self" method="post" action="https://web.nicepay.co.kr/v3/smart/smartPayment.jsp" accept-charset="euc-kr" style="display:none"> -->
<!-- 	</form> -->
	
<!-- 	<!-- Enliple Tracker Start --> -->
<!-- 	<script type="text/javascript">!function(e,n,t,c,o){e.enp=e.enp||function(){(e.enp.q=e.enp.q||[]).push(arguments)},(c=n.createElement(t)).async=!0,c.defer=!0,c.src="https://cdn.megadata.co.kr/dist/prod/enp_tracker_self_hosted.min.js",(o=n.getElementsByTagName(t)[0]).parentNode.insertBefore(c,o)}(window,document,"script"),enp("create","common","freshcode",{device:"B"}),enp("send","common","freshcode")</script>  -->
<!-- 	<!-- Enliple Tracker End --> -->
<!-- 	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script> -->
	<script src="${path }/js/bootstrap.js"></script>
</html>