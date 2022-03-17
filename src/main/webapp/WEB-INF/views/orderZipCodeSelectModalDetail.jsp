<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<article data-v-130d71ec="" data-v-267e36be="" class="address-index"
	title="배송지 선택">
	<header data-v-2c0651a8="" data-v-130d71ec=""
		class="row--v-center page-header address-index__header page-header--padding page-header--modal">
		<!---->
		<button data-v-2c0651a8="" type="button"
			class="button-popup-close page-header__close">
			<i data-v-2c0651a8=""><svg data-v-2c0651a8=""
					xmlns="http://www.w3.org/2000/svg" width="24" height="24"
					viewBox="0 0 24 24" aria-labelledby="close" role="presentation"
					class="icon">
					<g fill="none" fill-rule="evenodd"> <path
						fill="currentColor" fill-rule="evenodd"
						d="M12.707 12l7.647 7.646a.5.5 0 0 1-.708.708L12 12.707l-7.646 7.647a.5.5 0 0 1-.708-.708L11.293 12 3.646 4.354a.5.5 0 1 1 .708-.708L12 11.293l7.646-7.647a.5.5 0 0 1 .708.708L12.707 12z"></path></g></svg></i>
		</button>
		<h2 data-v-2c0651a8="" class="col">배송지 선택</h2>
		<!---->
	</header>
	<div data-v-130d71ec="" id="address-index__body"
		class="address-index__body">
		<div data-v-130d71ec="" class="address-index__index">
			<c:if test="${fn:length(list) == 0}">
				<div data-v-6b53621a="" data-v-130d71ec="" class="error-list">
					<p data-v-6b53621a="" class="except1">등록된 배송지가 없습니다.</p>
				</div>
			</c:if>
			<c:if test="${fn:length(list) > 0}">
				<ul data-v-130d71ec="" class="except1">
					<c:forEach var="memberZipcode" items="${list }">
						<c:if test="${memberZipcode.member_default_address == 'y' }">
							<li data-v-130d71ec="" class="except1">
								<div data-v-464718a6="" data-v-130d71ec="" class="item except1">
									<div data-v-464718a6="" class="row--v-center item__head">
										<div data-v-464718a6="" class="col name-wrap">
											<strong data-v-464718a6="" class="except1">${memberZipcode.member_shipping_address }</strong>
										</div>
										<p data-v-464718a6="" class="except1">
											<span data-v-7f86e76e="" data-v-464718a6=""
												class="round-text">기본 배송지</span>
										</p>
									</div>
									<p data-v-464718a6="" class="item__address">${memberZipcode.member_address } ${memberZipcode.member_detail_address }</p>
									<nav data-v-464718a6="" class="row item__nav">
										<div data-v-464718a6="" class="except1">
											<button data-v-a1c889e0="" data-v-464718a6="" type="button"
												title=""
												class="button button--side-padding button--size-small">
												<span data-v-a1c889e0="" class="button__wrap delivery_select">선택</span>
											</button>
										</div>
										<!---->
									</nav>
								</div>
								<input type="hidden" value="${memberZipcode.member_zipcode_code }">
							</li>
						</c:if>
					</c:forEach>
					<c:forEach var="memberZipcode" items="${list }">
						<c:if test="${memberZipcode.member_default_address == 'n' }">
							<li data-v-130d71ec="" class="except1">
								<div data-v-464718a6="" data-v-130d71ec="" class="item except1">
									<div data-v-464718a6="" class="row--v-center item__head">
										<div data-v-464718a6="" class="col name-wrap">
											<strong data-v-464718a6="" class="except1">${memberZipcode.member_shipping_address }</strong>
										</div>
										
									</div>
									<p data-v-464718a6="" class="item__address">${memberZipcode.member_address } ${memberZipcode.member_detail_address }</p>
									<nav data-v-464718a6="" class="row item__nav">
										<div data-v-464718a6="" class="except1">
											<button data-v-a1c889e0="" data-v-464718a6="" type="button"
												title=""
												class="button button--side-padding button--size-small">
												<span data-v-a1c889e0="" class="button__wrap delivery_select">선택</span>
											</button>
										</div>
										<div data-v-464718a6="" class="main-destination-select-btn">
											<button data-v-a1c889e0="" data-v-464718a6="" type="button"
												title=""
												class="button button--side-padding button--size-small button--outline2">
												<span data-v-a1c889e0="" class="button__wrap delivery_default_select">기본 배송지로 설정</span>
											</button>
										</div>
									</nav>
								</div>
								<input type="hidden" value="${memberZipcode.member_zipcode_code }">
							</li>
						</c:if>
					</c:forEach>
				</ul>
			</c:if>
		</div>
	</div>
	<nav data-v-130d71ec="" class="address-index__nav">
		<button data-v-a1c889e0="" data-v-130d71ec="" type="button"
			title="" class="button button--size-large-mobile">
			<span data-v-a1c889e0="" class="button__wrap">배송지 추가</span>
		</button>
	</nav>
</article>