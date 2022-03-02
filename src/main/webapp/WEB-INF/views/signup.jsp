<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}/resources/signup" />
<!DOCTYPE html>
<html class="">
<head>

<title>salad:it-signup</title>
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
<meta data-n-head="ssr" data-hid="og:url" property="og:url"
	content="https://www.freshcode.me">
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
<link rel="stylesheet" href="${path }/style.css?ver=1">
<link rel="stylesheet" href="${path }/style2.css?ver=1">
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<!-- content에 자신의 OAuth2.0 클라이언트ID를 넣습니다. -->
<meta name ="google-signin-client_id" content="913977077783-na046o5f1kj357fl44qnt29vcljft4ht.apps.googleusercontent.com">
<script src="https://apis.google.com/js/api:client.js"></script>
<script type="text/javascript">
 function page_move(tagNum){
    var f = document.paging; //폼 name
    f.tagMain01.value = tagNum; //POST방식으로 넘기고 싶은 값
    f.action="tapPage.do";//이동할 페이지
    f.method="post";//POST방식
    f.submit();
}
 
 var googleUser = {};
 var startApp = function() {
   gapi.load('auth2', function(){
     // Retrieve the singleton for the GoogleAuth library and set up the client.
     auth2 = gapi.auth2.init({
       client_id: '913977077783-na046o5f1kj357fl44qnt29vcljft4ht.apps.googleusercontent.com',
       cookiepolicy: 'single_host_origin',
       // Request scopes in addition to 'profile' and 'email'
       //scope: 'additional_scope'
     });
     attachSignin(document.getElementById('customBtn'));
   });
 };

 function attachSignin(element) {
var name = "";
var email = "";
   console.log(element.id);
   auth2.attachClickHandler(element, {},
       function(googleUser) {
          name = googleUser.getBasicProfile().getName() // 얘네들이 반환 값
       email = googleUser.getBasicProfile().getEmail()
         console.log(googleUser);
          var form = document.createElement('form'); // 폼객체 생성
          var objs;
          objs = document.createElement('input'); // 값이 들어있는 녀석의 형식
          objs.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
          objs.setAttribute('name', 'name'); // 객체이름
          objs.setAttribute('value', name); //객체값
          form.appendChild(objs);
          var objs1;
          objs1 = document.createElement('input'); // 값이 들어있는 녀석의 형식
          objs1.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
          objs1.setAttribute('name', 'email'); // 객체이름
          objs1.setAttribute('value', email); //객체값
          form.appendChild(objs1);
          form.setAttribute('method', 'post'); //get,post 가능
          form.setAttribute('action', "googleLogin.do"); //보내는 url
          document.body.appendChild(form);
          form.submit();

       }, function(error) {
         alert(JSON.stringify(error, undefined, 2));
       });
 }
 
 function enterKey(){ 
	loginForm.submit();
 }


$(function(){
	$('.first-order-banner').on('click', function(){
		$(location).attr( "href" , "firstEvent01.do" );
	})
	
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
})
</script>
</head>
<body>
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
											<a href="/mypage/orders" id="nickname" data-v-30697495>${member.name } <span data-v-30697495>님</span></a>
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
					<article data-v-932ef6fa="" data-v-1739428d="" class="signup">
						<header data-v-932ef6fa="" class="signup__header">
							<h2 data-v-932ef6fa="">
								<img data-v-932ef6fa="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/banner/logo.PNG"
									alt="FRESHCODE">
							</h2>
							<p data-v-932ef6fa="">프리미엄 샐러드 배송</p>
						</header>
						<nav data-v-932ef6fa="">
							<button data-v-d3dff3a6="" id="login-gtm-kakao" type="button"
								class="kakao-login-custom-btn" onclick="location.href='kakaoLogin.do' ">
								<div data-v-d3dff3a6="" class="kakao-logo"></div>
								<span data-v-d3dff3a6="">카카오로 3초만에 시작하기</span>
							</button>
							<img data-v-d3dff3a6=""
								src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_login_event_logo.jpg"
								alt="첫 주문 혜택 페이지로 가기" class="first-order-banner">
							<div data-v-932ef6fa="" class="divider">
								<span data-v-932ef6fa="">OR</span>
							</div>
							<button data-v-a1c889e0="" data-v-932ef6fa="" type="button"
								title="" class="button signup__register-btn" onClick="location.href='signupWrite.do'">
								<span data-v-a1c889e0="" class="button__wrap">이메일로 가입하기</span>
							</button>
							<!-- In the callback, you would hide the gSignInWrapper element on a successful sign in -->
							<div id="gSignInWrapper">
								<div id="customBtn" class="customGPlusSignIn">
									<span class="icon"></span> <span class="buttonText">Google</span>
								</div>
								<script>startApp();</script>
							</div>
						</nav>
					</article>
				</div>
				<!---->
			</main>
		</div>
	</div>
	



	<a class="custom-ch-btn" style="display: none">문의하기</a>
</body>
</html>