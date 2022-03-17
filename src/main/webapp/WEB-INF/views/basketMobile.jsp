<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
									<c:forEach var="basket" items="${Basket}" varStatus="stauts">
											<li data-v-7f39deaa="" class="mobile-body-item"><img
												data-v-7f39deaa="" src="https://www.freshcode.me/images/icon-exit@2x.png"
												alt="장바구니 메뉴 삭제" class="mobile-body-item-close">
												<section data-v-7f39deaa="" class="mobile-body-item-top">
													<div data-v-7f39deaa="" class="mobile-body-item-img-wrap">
														<img data-v-7f39deaa=""
															src="${basket.itemImage}"
															alt="메뉴 이미지" class="mobile-body-item-img">
													</div>
													<div data-v-7f39deaa="" class="mobile-body-item-text-wrap">
														<div data-v-7f39deaa="" class="mobile-body-item-title">
															${basket.itemName} </div>
														<div data-v-7f39deaa=""
															class="mobile-body-item-price-wrap">
															<div data-v-7f39deaa=""
																class="mobile-body-item-discounted-price">${basket.price}</div>
															<div data-v-7f39deaa="" class="mobile-body-item-price">
																${basket.priceSub}</div>
														</div>
													</div>
												</section>
										
												<section data-v-7f39deaa="" class="mobile-body-item-bottom">
													<div data-v-7f39deaa=""
														class="mobile-body-item-form-number-wrap">
														<nav data-v-4ba0dee4="" data-v-7f39deaa=""
															class="form-number">
															<button data-v-4ba0dee4="" type="button"
																class="form-number__control mobile_minusbtn">
																<input type="hidden" value="${basket.itemCode}" id="itemCode" />
																<input type="hidden" value="${basket.price}" id="price" />
																<input type="hidden" value="${basket.itemSize}" id="itemSize" />
																<input type="hidden" value="${member.memberCode}" id="memberCode" />
																<svg data-v-4ba0dee4=""
																	xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
																	<g data-v-4ba0dee4="" fill="none" fill-rule="evenodd">
																	<path data-v-4ba0dee4="" fill="currentColor"
																		d="M7 11.5h10v1H7z"></path></g></svg>
															</button>
															
															<span data-v-4ba0dee4="" class="form-number__input mobile"><input
																data-v-4ba0dee4=""  type="number" min="1" class="haha"
																max="9999" step="1" value="${basket.amount}" ></span>
															<button data-v-4ba0dee4="" type="button"
																class="form-number__control mobile_plusbtn">																
																<input type="hidden" value="${basket.itemCode}" id="itemCode" />
																<input type="hidden" value="${basket.price}" id="price" />
																<input type="hidden" value="${member.memberCode}" id="memberCode" />
																<svg data-v-4ba0dee4=""
																	xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
																	<g data-v-4ba0dee4="" fill="none" fill-rule="evenodd">
																	<path data-v-4ba0dee4="" fill="currentColor"
																		d="M11.5 11.5V6h1v5.5H18v1h-5.5V18h-1v-5.5H6v-1h5.5z"></path></g></svg>
															</button>
														</nav>
													</div>
													<div data-v-7f39deaa="" 
														class="mobile-body-item-bottom-price">${basket.subTotal } 원</div>
												</section>
											</li>
												<c:set var="mobile_total" value="${mobile_total + basket.subTotal }" />
												<c:choose>
													<c:when test="${basket.priceSub eq 0}"> 
														<c:set var="mobile_subTotal" value="${mobile_subTotal + (basket.price*basket.amount)}" />
													</c:when>
													<c:when test="${basket.priceSub ne 0}">
														<c:set var="mobile_subTotal" value="${mobile_subTotal + (basket.priceSub*basket.amount) }" />
														<c:set var="mobile_dcTotal" value="${mobile_dcTotal + ((basket.priceSub - basket.price) * basket.amount)}" />
													</c:when>
												</c:choose>
											</c:forEach>
									