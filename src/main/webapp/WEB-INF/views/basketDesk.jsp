<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
			<c:forEach var="basket" items="${Basket}" varStatus="status">
											<li data-v-7f39deaa="" class="desktop-body-table-item"><section
													data-v-7f39deaa="" class="desktop-body-table-item-left">
													<div data-v-7f39deaa=""
														class="desktop-body-table-item-checkbox-wrap">
														<!-- check box -->
														<input type="checkbox" name="point-check" id="point-check" class ="point-check" checked='checked'>
<!-- 														<input data-v-7f39deaa="" id="table-item-checkbox-0" -->
<!-- 															checked name="selected-item" type="checkbox" -->
<!-- 															class="desktop-body-table-item-checkbox" -->
<!-- 															value="426"> -->
<!-- 															<label data-v-7f39deaa="" -->
<!-- 															for="table-item-checkbox-0" -->
<!-- 															class="desktop-body-table-item-checkbox-label"></label> -->
<%-- 															<input type="hidden" value="${basket.price}" class="check-price"/> --%>
<%-- 															<input type="hidden" value="${basket.priceSub}" class="check-priceSub" /> --%>
<%-- 															<input type="hidden" value="${basket.subTotal}" class="check-subTotal" /> --%>
<%-- 															<input type="hidden" value="${basket.amount}" class="check-amount" /> --%>
													</div>
													<div data-v-7f39deaa=""
														class="desktop-body-table-item-img-wrap">
														<img data-v-7f39deaa=""
															src="${basket.itemImage}"
															alt="데스크탑 장바구니 이미지" class="desktop-body-table-item-img">
													</div>
													<div data-v-7f39deaa=""
														class="desktop-body-table-item-title">${basket.itemName } / ${basket.itemSize}
													</div>
												</section>
												<section data-v-7f39deaa=""
													class="desktop-body-table-item-right">
													<div data-v-7f39deaa=""
														class="desktop-body-table-item-spinner-wrap">
														<nav data-v-4ba0dee4="" data-v-7f39deaa=""
															class="form-number">
															<button data-v-4ba0dee4="" type="button"
																class="form-number__control desk_minusbtn">
																<input type="hidden" value="${basket.itemCode}" id="itemCode"/>
																<input type="hidden" value="${basket.price}" id="price" />
																<input type="hidden" value="${basket.tagMain}" id="tagMain" />
																<input type="hidden" value="${basket.amount}" id="amount" />
																<input type="hidden" value="${basket.itemSize}" id="itemSize" />
																<input type="hidden" value="${member.memberCode}" id="memberCode" />
																
																<svg data-v-4ba0dee4=""
																	xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
																	<g data-v-4ba0dee4="" fill="none" fill-rule="evenodd">
																	<path data-v-4ba0dee4="" fill="currentColor"
																		d="M7 11.5h10v1H7z"></path></g></svg>
															</button>
															<span data-v-4ba0dee4="" class="form-number__input deskAmt"><input
																data-v-4ba0dee4=""  type="number" min="1" class="abcd"
																max="9999" step="1"  value="${basket.amount}"></span>
															<button data-v-4ba0dee4="" type="button" 
																class="form-number__control desk_plusbtn">
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
														class="desktop-body-table-item-price-wrap">
														<div data-v-7f39deaa=""
															class="desktop-body-table-item-price">${basket.priceSub }</div>
														<div data-v-7f39deaa=""
															class="desktop-body-table-item-discounted-price">
															${basket.price }</div>
													</div>
														<div data-v-7f39deaa="" id="desk-subtotal"
														class="desktop-body-table-item-total-price">${basket.subTotal}
														<input type="hidden" value = "${basket.subTotal}" class="bf_subtotal"/></div>
												</section></li>
												<c:set var="desk_total" value="${desk_total + basket.subTotal }" />
												<c:choose>
													<c:when test="${basket.priceSub eq 0}"> 
														<c:set var="desk_subTotal" value="${desk_subTotal + (basket.price*basket.amount)}" />
													</c:when>
													<c:when test="${basket.priceSub ne 0}">
														<c:set var="desk_subTotal" value="${desk_subTotal + (basket.priceSub*basket.amount) }" />
														<c:set var="desk_dcTotal" value="${desk_dcTotal + ((basket.priceSub - basket.price) * basket.amount)}" />
													</c:when>
												</c:choose>
											</c:forEach>