<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:if test="${check == 0 }">
	<div data-v-2f05bf52="" data-v-1739428d="" class="side-nav">
		<div data-v-2f05bf52="" class="side-nav__overlay"></div>
		<aside data-v-2f05bf52="" class="side-nav__wrap">
			<div data-v-2f05bf52="" class="side-nav__body">
				<div data-v-78a0edfc="" data-v-2f05bf52="" class="side-nav-guest">
					<figure data-v-78a0edfc="" class="side-nav-guest__logo">
						<img data-v-78a0edfc=""
							src="https://saladits3.s3.ap-northeast-2.amazonaws.com/banner/logo.PNG"
							alt="FRESHCODE" width="120">
					</figure>
					<p data-v-78a0edfc="" class="side-nav-guest__description">프리미엄
						샐러드 배송</p>
					<nav data-v-78a0edfc="" class="side-nav-guest__nav">
						<div data-v-78a0edfc="" class="row--gutter">
							<div data-v-78a0edfc="" class="col">
								<button data-v-a1c889e0="" data-v-78a0edfc="" type="button"
									title="" class="button" onclick="location.href='login.do'">
									<span data-v-a1c889e0="" class="button__wrap">로그인</span>
								</button>
							</div>
							<div data-v-78a0edfc="" class="col">
								<button data-v-a1c889e0="" data-v-78a0edfc="" type="button"
									title="" class="button button--outline2" onclick="location.href='signup.do'">
									<span data-v-a1c889e0="" class="button__wrap">회원가입</span>
								</button>
							</div>
						</div>
					</nav>
				</div>
				<nav data-v-1fc516f9="" data-v-2f05bf52=""
					class="nav-menus side-nav__menus">
					<ul data-v-1fc516f9="">
						<li data-v-1fc516f9="" id="sideEvent"><span data-v-1fc516f9="">이벤트</span></li>
						<li data-v-1fc516f9="" id="sideBasket"><span data-v-1fc516f9="">장바구니</span></li>
	<!-- 					<li data-v-1fc516f9=""><span data-v-1fc516f9="">1:1 문의하기</span></li> -->
						<!---->
					</ul>
				</nav>
			</div>
		</aside>
	</div>
</c:if>
<c:if test="${check == 1 }">
	<div data-v-2f05bf52="" data-v-0f5971ec="" class="side-nav">
		<div data-v-2f05bf52="" class="side-nav__overlay"></div>
		<aside data-v-2f05bf52="" class="side-nav__wrap">
			<div data-v-2f05bf52="" class="side-nav__body side-nav__body--member">
				<div data-v-93cadc98="" data-v-2f05bf52="" class="side-nav-member">
					<header data-v-93cadc98="" class="side-nav-member__header">
						<strong data-v-93cadc98="">${member.name }</strong>
						<p data-v-93cadc98="">${member.email }</p>
						<div data-v-93cadc98="" class="row--v-center meta">
							<dl data-v-93cadc98=""
								class="col row row--v-center row--h-between">
								<dt data-v-93cadc98="">0</dt>
								<dd data-v-93cadc98="">배송예정</dd>
							</dl>
							<dl data-v-93cadc98=""
								class="col row row--v-center row--h-between">
								<dt data-v-93cadc98="">0</dt>
								<dd data-v-93cadc98="">포인트</dd>
							</dl>
							<dl data-v-93cadc98=""
								class="col row row--v-center row--h-between">
								<dt data-v-93cadc98="">0</dt>
								<dd data-v-93cadc98="">쿠폰</dd>
							</dl>
						</div>
					</header>
					<hr data-v-93cadc98="" class="side-nav-member__line">
					<div data-v-93cadc98="" class="side-nav-member__nav">
						<nav data-v-93cadc98="" class="row--v-center items">
							<div data-v-93cadc98="" class="col-4 item">
								<a data-v-93cadc98="" href="myPayInfo.do" class=""><figure
										data-v-93cadc98="">
										<img data-v-93cadc98=""
											src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_Drawer_Order+List.png" alt="history">
									</figure> <span data-v-93cadc98="">주문내역</span></a>
							</div>
							<div data-v-93cadc98="" class="col-4 item">
								<a data-v-93cadc98="" href="myDelivery.do" class=""><figure
										data-v-93cadc98="">
										<img data-v-93cadc98=""
											src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_Drawer_Delivery+State.png"
											alt="delivery">
										<!---->
									</figure> <span data-v-93cadc98="">배송현황</span></a>
							</div>
							<div data-v-93cadc98="" class="col-4 item">
								<a data-v-93cadc98="" href="myBesongji.do" class=""><figure
										data-v-93cadc98="">
										<img data-v-93cadc98=""
											src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_Drawer_Locate+Mng.png" alt="spot">
									</figure> <span data-v-93cadc98="">배송지 관리</span></a>
							</div>
							<div data-v-93cadc98="" class="col-4 item">
								<a data-v-93cadc98="" href="myPointSearch.do" class=""><figure
										data-v-93cadc98="">
										<img data-v-93cadc98=""
											src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_Drawer_Point.png" alt="point">
									</figure> <span data-v-93cadc98="">포인트 조회</span></a>
							</div>
							<div data-v-93cadc98="" class="col-4 item">
								<a data-v-93cadc98="" href="myCouponSearch.do" class=""><figure
										data-v-93cadc98="">
										<img data-v-93cadc98=""
											src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_Drawer_Coupon.png" alt="coupon">
										<em data-v-93cadc98="">1</em>
									</figure> <span data-v-93cadc98="">쿠폰 조회</span></a>
							</div>
							<div data-v-93cadc98="" class="col-4 item">
								<a data-v-93cadc98="" href="myReviewSearch.do" class=""><figure
										data-v-93cadc98="">
										<img data-v-93cadc98=""
											src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_Drawer_Review.png" alt="review">
										<!---->
									</figure> <span data-v-93cadc98="">나의 후기</span></a>
							</div>
						</nav>
					</div>
<!-- 					<a data-v-93cadc98="" href="#" class=""><div -->
<!-- 							data-v-93cadc98="" class="side-nav-member__banner"> -->
<!-- 							<strong data-v-93cadc98="">친구 초대하고 </strong> <span -->
<!-- 								data-v-93cadc98="">3,000포인트 받자!</span> -->
<!-- 						</div></a> -->
				</div>
				<nav data-v-1fc516f9="" data-v-2f05bf52=""
					class="nav-menus side-nav__menus">
					<ul data-v-1fc516f9="">
						<li data-v-1fc516f9="" onclick="location.href='event.do'"><span data-v-1fc516f9="">이벤트</span></li>
						<li data-v-1fc516f9="" onclick="location.href='basket.do'"><span data-v-1fc516f9="">장바구니</span></li>
<!-- 						<li data-v-1fc516f9="" onclick="location.href='kakaoLogin.do'"><span data-v-1fc516f9="">1:1 -->
<!-- 								문의하기</span></li> -->
						<li data-v-1fc516f9="" onclick="location.href='myMemberModify.do'"><span data-v-1fc516f9="">
								회원정보 수정 </span></li>
						<li data-v-1fc516f9="" class="logout"><span
							data-v-1fc516f9="">로그아웃</span></li>
					</ul>
				</nav>
			</div>
		</aside>
	</div>
</c:if>