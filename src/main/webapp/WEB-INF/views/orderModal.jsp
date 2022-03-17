<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<div data-v-09c23eb4="" data-v-064d23aa="" class="modal-wrap">
	<div data-v-09c23eb4="" class="modal-content-wrap">
		<header data-v-09c23eb4="" class="modal-header">
			<div data-v-064d23aa="" data-v-09c23eb4="" class="modal-header-slot">
				<div data-v-064d23aa="" data-v-09c23eb4=""
					class="modal-header-slot-close"></div>
				<div data-v-064d23aa="" data-v-09c23eb4=""
					class="modal-header-slot-title">상품 선택하기</div>
				<!---->
			</div>
		</header>
		<main data-v-09c23eb4=""
			class="modal-content modal-content-height-full"
			style="overflow-y: auto;">
			<article data-v-3f3398e6="" data-v-064d23aa="" class="add-items"
				shipping-tab="일반배송 주문 > 프코스팟배송" data-v-09c23eb4="">
				<div data-v-3f3398e6="" class="add-items-body"
					style="opacity: 1; pointer-events: auto;">
					<div data-v-3f3398e6="" class="add-items-tab-wrap">
						<div data-v-3f3398e6="" class="add-items-tab-scroll">
							<nav data-v-412c0194="" data-v-3f3398e6="" class="menu-tab">
								<div data-v-412c0194="" class="on">
									<input type="hidden" name="tagMain" value="200">
									<button data-v-412c0194="" type="button" class="order_modal_btn">
										<span data-v-412c0194="" class="order-modal-tab-name">샐러드</span>
									</button>
								</div>
								<div data-v-412c0194="" class="">
									<input type="hidden" name="tagMain" value="1">
									<button data-v-412c0194="" type="button" class="order_modal_btn">
										<span data-v-412c0194="" class="order-modal-tab-name">초코베리머치</span>
									</button>
								</div>
								<div data-v-412c0194="" class="">
									<input type="hidden" name="tagMain" value="300">
									<button data-v-412c0194="" type="button" class="order_modal_btn">
										<span data-v-412c0194="" class="order-modal-tab-name">샌드위치·랩</span>
									</button>
								</div>
								<div data-v-412c0194="" class="">
									<input type="hidden" name="tagMain" value="400">
									<button data-v-412c0194="" type="button" class="order_modal_btn">
										<span data-v-412c0194="" class="order-modal-tab-name">도시락·간편식</span>
									</button>
								</div>
								<div data-v-412c0194="" class="">
									<input type="hidden" name="tagMain" value="500">
									<button data-v-412c0194="" type="button" class="order_modal_btn">
										<span data-v-412c0194="" class="order-modal-tab-name">죽·스프</span>
									</button>
								</div>
								<div data-v-412c0194="" class="">
									<input type="hidden" name="tagMain" value="600">
									<button data-v-412c0194="" type="button" class="order_modal_btn">
										<span data-v-412c0194="" class="order-modal-tab-name">세트상품</span>
									</button>
								</div>
								<div data-v-412c0194="" class="">
									<input type="hidden" name="tagMain" value="700">
									<button data-v-412c0194="" type="button" class="order_modal_btn">
										<span data-v-412c0194="" class="order-modal-tab-name">간식</span>
									</button>
								</div>
								<div data-v-412c0194="" class="">
									<input type="hidden" name="tagMain" value="800">
									<button data-v-412c0194="" type="button" class="order_modal_btn">
										<span data-v-412c0194="" class="order-modal-tab-name">음료</span>
									</button>
								</div>
							</nav>
						</div>
					</div>
					<section data-v-3f3398e6="" class="add-items-group">
						<div data-v-3f3398e6="" class="add-items-group-body">
							<ul data-v-3f3398e6="">
								<c:forEach var="item" items="${itemInfo }">
									<li data-v-3f3398e6=""><div data-v-3f3398e6=""
											class="add-items-group-body-contents">
											<div data-v-3f3398e6="" class="content-img-wrap">
												<img data-v-3f3398e6="" class="modal-list-img"
													src="${item.item_image }">
												<!---->
											</div>
											<div data-v-3f3398e6="" class="content-wrap"
												style="flex-direction: column;">
												<div data-v-3f3398e6="" class="content-left">
													<p data-v-3f3398e6="" class="content-name">${item.item_name }
													</p>
													<div data-v-3f3398e6="" class="content-price-wrap">
														<c:if test="${empty item.item_price_m_sub }">
															<p data-v-3f3398e6="" class="content-discounted-price">
																${item.item_price_m }원&nbsp;&nbsp;</p>
														</c:if>
														<c:if test="${not empty item.item_price_m_sub }">
															<p data-v-3f3398e6="" class="content-discounted-price">
																${item.item_price_m }원&nbsp;~&nbsp;</p>
															<p data-v-3f3398e6="" class="content-price">${item.item_price_m_sub }원</p>
															<!---->
														</c:if>
													</div>
													<p data-v-3f3398e6="" class="content-info">
														<!---->
														<!---->
													</p>
												</div>
												<div data-v-3f3398e6="" class="content-right"
													style="text-align: right; margin: 0px;">
													<div data-v-5b7f52e9="" data-v-3f3398e6=""
														style="width: 100%; margin-top: 5px;">
														<div data-v-5b7f52e9="" class="dropdown-btn">
															<input type="hidden" value="${item.item_tag_main }">
															<input type="hidden" value="${item.item_code }">
															<div data-v-5b7f52e9="" class="button dropdown">
																<div data-v-5b7f52e9="" class="dropdown-content">
																	<span data-v-5b7f52e9="" class="except3"> 선택 </span>
																</div>
																<div data-v-5b7f52e9="" class="dropdown-icon">
																	<img data-v-5b7f52e9="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_arrow_down_s.png"
																		alt="드롭다운 화살표" class="dropdown-icon">
																</div>
															</div>
															<!---->
														</div>
													</div>
												</div>
											</div>
										</div>
									</li>
								</c:forEach>
								
								
								
							</ul>
						</div>
					</section>
				</div>
				<div data-v-3f3398e6="" class="add-items-footer">
					<div data-v-3f3398e6="" class="confirm-icon">
						<!---->
						<svg data-v-3f3398e6="" xmlns="http://www.w3.org/2000/svg"
							width="81" height="22" viewBox="0 0 81 22" class="hidden-save-open">
							<g data-v-3f3398e6="" fill="none" fill-rule="evenodd">
							<path data-v-3f3398e6="" fill="#F0F0F0" class="except2"
								d="M15.074 0h50.852a10 10 0 0 1 9.384 6.545L81 22H0L5.69 6.545A10 10 0 0 1 15.074 0z"></path> <path
								data-v-3f3398e6="" fill="#9B9B9B" fill-rule="nonzero" class="except1"
								stroke="#979797"
								d="M41 8.88l6.515 6.453a.58.58 0 0 0 .816 0 .568.568 0 0 0 0-.808l-6.923-6.858a.58.58 0 0 0-.816 0l-6.923 6.858a.568.568 0 0 0 0 .808.58.58 0 0 0 .816 0L41 8.88z"></path></g></svg>
					</div>
					<div data-v-3f3398e6="" class="add-items-content-wrap">
						<div data-v-3f3398e6="" class="add-items-selected">
							<p data-v-3f3398e6="" class="add-items-selected-text">선택하신 상품</p>
							<p data-v-3f3398e6="" class="count-and-price">0개 / 0원</p>
						</div>
						<!---->
					</div>
					<button data-v-a1c889e0="" data-v-3f3398e6="" type="button"
						title="" class="button button--size-large" style="height: 64px;">
						<span data-v-a1c889e0="" class="button__wrap">선택완료</span>
					</button>
				</div>
			</article>
			<!---->
		</main>
		<footer data-v-09c23eb4="" class="modal-footer footer-none"></footer>
	</div>
</div>