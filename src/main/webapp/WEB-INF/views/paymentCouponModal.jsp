<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<div data-v-23a4f1d5="" data-v-8f2f8136="" class="modal">
	<div data-v-8f2f8136="" class="modal-wrap modal-wrap--full">
		<div data-v-8f2f8136="" class="modal-wrap__body">
			<article data-v-32405de0="" data-v-8f2f8136="" class="select-coupon">
				<div data-v-32405de0="" class="select-coupon__wrap">
					<h2 data-v-32405de0="" class="row--v-center select-coupon__title">
						쿠폰함
						<button data-v-32405de0="" type="button"
							class="button-popup-close">
							<i data-v-32405de0="">
							<svg data-v-32405de0=""
									xmlns="http://www.w3.org/2000/svg" width="24" height="24"
									viewBox="0 0 24 24" aria-labelledby="close" role="presentation"
									class="icon">
									<g fill="none" fill-rule="evenodd"> <path
										fill="currentColor" fill-rule="evenodd"
										d="M12.707 12l7.647 7.646a.5.5 0 0 1-.708.708L12 12.707l-7.646 7.647a.5.5 0 0 1-.708-.708L11.293 12 3.646 4.354a.5.5 0 1 1 .708-.708L12 11.293l7.646-7.647a.5.5 0 0 1 .708.708L12.707 12z"></path></g></svg></i>
						</button>
					</h2>
					<div data-v-32405de0="" class="select-coupon__bar">
						<span data-v-32405de0="" class="except1">보유 쿠폰 ${fn:length(list)} 장 | 사용가능 쿠폰 0 장</span>
						<nav data-v-32405de0=""></nav>
					</div>
					<div data-v-32405de0="" class="select-coupon__body">
						<c:if test="${fn:length(list) == 0}">
							<div data-v-6b53621a="" data-v-32405de0="" class="error-list">
								<p data-v-6b53621a="" class="except1">사용 가능한 쿠폰이 없습니다.</p>
							</div>
						</c:if>
						<c:if test="${fn:length(list) > 0}">
							<ul data-v-32405de0="">
							
								<c:forEach var="list1" items="${list }">
									<c:if test="${list1.coupon_code == 1 }">
										<li data-v-32405de0="">
											<label data-v-799a696b="" data-v-32405de0="" class="row select-coupon-item disabled">
												<span data-v-799a696b="" class="select-coupon-item__check">
													<label data-v-2673f877="" data-v-799a696b="" class="form-checkbox form-checkbox--disabled">
														<input data-v-2673f877="" type="checkbox" disabled="disabled" value="false"> 
														<span data-v-2673f877="">
															<svg data-v-2673f877="" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
																<path data-v-2673f877="" fill="currentColor" fill-rule="nonzero" d="M8.489 13.597l7.304-7.304a1 1 0 0 1 1.414 1.414l-8 8a1 1 0 0 1-1.403.011l-4-3.875a1 1 0 1 1 1.392-1.436l3.293 3.19z"></path>
															</svg>
														</span>
													</label>
												</span>
												<span data-v-799a696b="" class="col select-coupon-item__body">
													<strong data-v-799a696b="" class="select-coupon-item__title">
														${list1.coupon_type } 
													</strong> 
													<span data-v-799a696b="" class="select-coupon-item__description"> 
															사용 가능 메뉴 : 치킨 타코 샐러드
														<p data-v-799a696b="">${list1.coupon_explain } </p>
													</span> <!----> 
													<span data-v-799a696b="" class="select-coupon-item__price">
														<em data-v-799a696b="">100</em>원 할인 
													</span> <!----> 
													<span data-v-799a696b="" class="select-coupon-item__date">
		<!-- 													<em data-v-799a696b="">2022.03.30</em>까지  -->
													</span>
												</span>
											</label>
										</li>
									</c:if>
									<c:if test="${list1.coupon_code == 2 }">
										<li data-v-32405de0="">
											<label data-v-799a696b="" data-v-32405de0="" class="row select-coupon-item disabled">
												<span data-v-799a696b="" class="select-coupon-item__check">
													<label data-v-2673f877="" data-v-799a696b="" class="form-checkbox form-checkbox--disabled">
														<input data-v-2673f877="" type="checkbox" disabled="disabled" value="false"> 
														<span data-v-2673f877="">
															<svg data-v-2673f877="" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
																<path data-v-2673f877="" fill="currentColor" fill-rule="nonzero" d="M8.489 13.597l7.304-7.304a1 1 0 0 1 1.414 1.414l-8 8a1 1 0 0 1-1.403.011l-4-3.875a1 1 0 1 1 1.392-1.436l3.293 3.19z"></path>
															</svg>
														</span>
													</label>
												</span>
												<span data-v-799a696b="" class="col select-coupon-item__body">
													<strong data-v-799a696b="" class="select-coupon-item__title">
														${list1.coupon_type } 
													</strong> 
													<span data-v-799a696b="" class="select-coupon-item__description"> 
															사용 가능 메뉴 : 정기구독 상품
														<p data-v-799a696b="">${list1.coupon_explain } </p>
													</span> <!----> 
													<span data-v-799a696b="" class="select-coupon-item__price">
														<em data-v-799a696b="">50</em>% 할인 
													</span> <!----> 
													<span data-v-799a696b="" class="select-coupon-item__date">
	<!-- 													<em data-v-799a696b="">2022.03.30</em>까지  -->
													</span>
												</span>
											</label>
										</li>
									</c:if>
									<c:if test="${list1.coupon_code == 3 }">
										<li data-v-32405de0="">
											<label data-v-799a696b="" data-v-32405de0="" class="row select-coupon-item disabled">
												<span data-v-799a696b="" class="select-coupon-item__check">
													<label data-v-2673f877="" data-v-799a696b="" class="form-checkbox form-checkbox--disabled">
														<input data-v-2673f877="" type="checkbox" disabled="disabled" value="false"> 
														<span data-v-2673f877="">
															<svg data-v-2673f877="" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
																<path data-v-2673f877="" fill="currentColor" fill-rule="nonzero" d="M8.489 13.597l7.304-7.304a1 1 0 0 1 1.414 1.414l-8 8a1 1 0 0 1-1.403.011l-4-3.875a1 1 0 1 1 1.392-1.436l3.293 3.19z"></path>
															</svg>
														</span>
													</label>
												</span>
												<span data-v-799a696b="" class="col select-coupon-item__body">
													<strong data-v-799a696b="" class="select-coupon-item__title">
														${list1.coupon_type } 
													</strong> 
													<span data-v-799a696b="" class="select-coupon-item__description"> 
															사용 가능 메뉴 : 세트 상품
														<p data-v-799a696b="">${list1.coupon_explain } </p>
													</span> <!----> 
													<span data-v-799a696b="" class="select-coupon-item__price">
														<em data-v-799a696b="">5000</em>원 할인 
													</span> <!----> 
													<span data-v-799a696b="" class="select-coupon-item__date">
		<!-- 													<em data-v-799a696b="">2022.03.30</em>까지  -->
													</span>
												</span>
											</label>
										</li>
									</c:if>
									<c:if test="${list1.coupon_code == 4 }">
										<li data-v-32405de0="">
											<label data-v-799a696b="" data-v-32405de0="" class="row select-coupon-item disabled">
												<span data-v-799a696b="" class="select-coupon-item__check">
													<label data-v-2673f877="" data-v-799a696b="" class="form-checkbox form-checkbox--disabled">
														<input data-v-2673f877="" type="checkbox" disabled="disabled" value="false"> 
														<span data-v-2673f877="">
															<svg data-v-2673f877="" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
																<path data-v-2673f877="" fill="currentColor" fill-rule="nonzero" d="M8.489 13.597l7.304-7.304a1 1 0 0 1 1.414 1.414l-8 8a1 1 0 0 1-1.403.011l-4-3.875a1 1 0 1 1 1.392-1.436l3.293 3.19z"></path>
															</svg>
														</span>
													</label>
												</span>
												<span data-v-799a696b="" class="col select-coupon-item__body">
													<strong data-v-799a696b="" class="select-coupon-item__title">
														${list1.coupon_type } 
													</strong> 
													<span data-v-799a696b="" class="select-coupon-item__description"> 
															사용 가능 메뉴 : 닭가슴살 세트
														<p data-v-799a696b="">${list1.coupon_explain } </p>
													</span> <!----> 
													<span data-v-799a696b="" class="select-coupon-item__price">
														<em data-v-799a696b="">15</em>% 할인 
													</span> <!----> 
													<span data-v-799a696b="" class="select-coupon-item__date">
		<!-- 													<em data-v-799a696b="">2022.03.30</em>까지  -->
													</span>
												</span>
											</label>
										</li>
									</c:if>
									<c:if test="${list1.coupon_code == 5 }">
										<li data-v-32405de0="">
											<label data-v-799a696b="" data-v-32405de0="" class="row select-coupon-item disabled">
												<span data-v-799a696b="" class="select-coupon-item__check">
													<label data-v-2673f877="" data-v-799a696b="" class="form-checkbox form-checkbox--disabled">
														<input data-v-2673f877="" type="checkbox" disabled="disabled" value="false"> 
														<span data-v-2673f877="">
															<svg data-v-2673f877="" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
																<path data-v-2673f877="" fill="currentColor" fill-rule="nonzero" d="M8.489 13.597l7.304-7.304a1 1 0 0 1 1.414 1.414l-8 8a1 1 0 0 1-1.403.011l-4-3.875a1 1 0 1 1 1.392-1.436l3.293 3.19z"></path>
															</svg>
														</span>
													</label>
												</span>
												<span data-v-799a696b="" class="col select-coupon-item__body">
													<strong data-v-799a696b="" class="select-coupon-item__title">
														${list1.coupon_type } 
													</strong> 
													<span data-v-799a696b="" class="select-coupon-item__description"> 
															사용 가능 메뉴 : 넛트드링크 또는 그래놀라 세트
														<p data-v-799a696b="">${list1.coupon_explain } </p>
													</span> <!----> 
													<span data-v-799a696b="" class="select-coupon-item__price">
														<em data-v-799a696b="">20</em>% 할인 
													</span> <!----> 
													<span data-v-799a696b="" class="select-coupon-item__date">
	<!-- 													<em data-v-799a696b="">2022.03.30</em>까지  -->
													</span>
												</span>
											</label>
										</li>
									</c:if>
									<c:if test="${list1.coupon_code == 6 }">
										<li data-v-32405de0="">
											<label data-v-799a696b="" data-v-32405de0="" class="row select-coupon-item disabled">
												<span data-v-799a696b="" class="select-coupon-item__check">
													<label data-v-2673f877="" data-v-799a696b="" class="form-checkbox form-checkbox--disabled">
														<input data-v-2673f877="" type="checkbox" disabled="disabled" value="false"> 
														<span data-v-2673f877="">
															<svg data-v-2673f877="" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
																<path data-v-2673f877="" fill="currentColor" fill-rule="nonzero" d="M8.489 13.597l7.304-7.304a1 1 0 0 1 1.414 1.414l-8 8a1 1 0 0 1-1.403.011l-4-3.875a1 1 0 1 1 1.392-1.436l3.293 3.19z"></path>
															</svg>
														</span>
													</label>
												</span>
												<span data-v-799a696b="" class="col select-coupon-item__body">
													<strong data-v-799a696b="" class="select-coupon-item__title">
														${list1.coupon_type } 
													</strong> 
													<span data-v-799a696b="" class="select-coupon-item__description"> 
															사용 가능 메뉴 : 프코한끼 도시락
														<p data-v-799a696b="">${list1.coupon_explain } </p>
													</span> <!----> 
													<span data-v-799a696b="" class="select-coupon-item__price">
														<em data-v-799a696b="">20</em>% 할인 
													</span> <!----> 
													<span data-v-799a696b="" class="select-coupon-item__date">
	<!-- 													<em data-v-799a696b="">2022.03.30</em>까지  -->
													</span>
												</span>
											</label>
										</li>
										</c:if>
										<c:if test="${list1.coupon_code == 7 }">
											<li data-v-32405de0="">
												<label data-v-799a696b="" data-v-32405de0="" class="row select-coupon-item disabled">
													<span data-v-799a696b="" class="select-coupon-item__check">
														<label data-v-2673f877="" data-v-799a696b="" class="form-checkbox form-checkbox--disabled">
															<input data-v-2673f877="" type="checkbox" disabled="disabled" value="false"> 
															<span data-v-2673f877="">
																<svg data-v-2673f877="" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
																	<path data-v-2673f877="" fill="currentColor" fill-rule="nonzero" d="M8.489 13.597l7.304-7.304a1 1 0 0 1 1.414 1.414l-8 8a1 1 0 0 1-1.403.011l-4-3.875a1 1 0 1 1 1.392-1.436l3.293 3.19z"></path>
																</svg>
															</span>
														</label>
													</span>
													<span data-v-799a696b="" class="col select-coupon-item__body">
														<strong data-v-799a696b="" class="select-coupon-item__title">
															${list1.coupon_type } 
														</strong> 
														<span data-v-799a696b="" class="select-coupon-item__description"> 
																사용 가능 메뉴 : 모든 제품
															<p data-v-799a696b="">${list1.coupon_explain } </p>
														</span> <!----> 
														<span data-v-799a696b="" class="select-coupon-item__price">
															<em data-v-799a696b="">1000</em>원 할인 
														</span> <!----> 
														<span data-v-799a696b="" class="select-coupon-item__date">
		<!-- 													<em data-v-799a696b="">2022.03.30</em>까지  -->
														</span>
													</span>
												</label>
											</li>
										</c:if>
										<c:if test="${list1.coupon_code == 8 }">
											<li data-v-32405de0="">
												<label data-v-799a696b="" data-v-32405de0="" class="row select-coupon-item disabled">
													<span data-v-799a696b="" class="select-coupon-item__check">
														<label data-v-2673f877="" data-v-799a696b="" class="form-checkbox form-checkbox--disabled">
															<input data-v-2673f877="" type="checkbox" disabled="disabled" value="false"> 
															<span data-v-2673f877="">
																<svg data-v-2673f877="" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
																	<path data-v-2673f877="" fill="currentColor" fill-rule="nonzero" d="M8.489 13.597l7.304-7.304a1 1 0 0 1 1.414 1.414l-8 8a1 1 0 0 1-1.403.011l-4-3.875a1 1 0 1 1 1.392-1.436l3.293 3.19z"></path>
																</svg>
															</span>
														</label>
													</span>
													<span data-v-799a696b="" class="col select-coupon-item__body">
														<strong data-v-799a696b="" class="select-coupon-item__title">
															${list1.coupon_type } 
														</strong> 
														<span data-v-799a696b="" class="select-coupon-item__description"> 
																사용 가능 메뉴 : 모든 제품
															<p data-v-799a696b="">${list1.coupon_explain } </p>
														</span> <!----> 
														<span data-v-799a696b="" class="select-coupon-item__price">
															<em data-v-799a696b="">2000</em>원 할인 
														</span> <!----> 
														<span data-v-799a696b="" class="select-coupon-item__date">
		<!-- 													<em data-v-799a696b="">2022.03.30</em>까지  -->
														</span>
													</span>
											</label>
										</li>
									</c:if>
									<c:if test="${list1.coupon_code == 9 }">
										<li data-v-32405de0="">
											<label data-v-799a696b="" data-v-32405de0="" class="row select-coupon-item disabled">
												<span data-v-799a696b="" class="select-coupon-item__check">
													<label data-v-2673f877="" data-v-799a696b="" class="form-checkbox form-checkbox--disabled">
														<input data-v-2673f877="" type="checkbox" disabled="disabled" value="false"> 
														<span data-v-2673f877="">
															<svg data-v-2673f877="" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
																<path data-v-2673f877="" fill="currentColor" fill-rule="nonzero" d="M8.489 13.597l7.304-7.304a1 1 0 0 1 1.414 1.414l-8 8a1 1 0 0 1-1.403.011l-4-3.875a1 1 0 1 1 1.392-1.436l3.293 3.19z"></path>
															</svg>
														</span>
													</label>
												</span>
												<span data-v-799a696b="" class="col select-coupon-item__body">
													<strong data-v-799a696b="" class="select-coupon-item__title">
														${list1.coupon_type } 
													</strong> 
													<span data-v-799a696b="" class="select-coupon-item__description"> 
															사용 가능 메뉴 : 모든 제품
														<p data-v-799a696b="">${list1.coupon_explain } </p>
													</span> <!----> 
													<span data-v-799a696b="" class="select-coupon-item__price">
														<em data-v-799a696b="">3000</em>원 할인 
													</span> <!----> 
													<span data-v-799a696b="" class="select-coupon-item__date">
	<!-- 													<em data-v-799a696b="">2022.03.30</em>까지  -->
													</span>
												</span>
											</label>
										</li>
									</c:if>
									<c:if test="${list1.coupon_code == 10 }">
										<li data-v-32405de0="">
											<label data-v-799a696b="" data-v-32405de0="" class="row select-coupon-item disabled">
												<span data-v-799a696b="" class="select-coupon-item__check">
													<label data-v-2673f877="" data-v-799a696b="" class="form-checkbox form-checkbox--disabled">
														<input data-v-2673f877="" type="checkbox" disabled="disabled" value="false"> 
														<span data-v-2673f877="">
															<svg data-v-2673f877="" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
																<path data-v-2673f877="" fill="currentColor" fill-rule="nonzero" d="M8.489 13.597l7.304-7.304a1 1 0 0 1 1.414 1.414l-8 8a1 1 0 0 1-1.403.011l-4-3.875a1 1 0 1 1 1.392-1.436l3.293 3.19z"></path>
															</svg>
														</span>
													</label>
												</span>
												<span data-v-799a696b="" class="col select-coupon-item__body">
													<strong data-v-799a696b="" class="select-coupon-item__title">
														${list1.coupon_type } 
													</strong> 
													<span data-v-799a696b="" class="select-coupon-item__description"> 
															사용 가능 메뉴 : 모든 제품
														<p data-v-799a696b="">${list1.coupon_explain } </p>
													</span> <!----> 
													<span data-v-799a696b="" class="select-coupon-item__price">
														<em data-v-799a696b="">4000</em>원 할인 
													</span> <!----> 
													<span data-v-799a696b="" class="select-coupon-item__date">
	<!-- 													<em data-v-799a696b="">2022.03.30</em>까지  -->
													</span>
												</span>
											</label>
										</li>
									</c:if>
									<c:if test="${list1.coupon_code == 11 }">
										<li data-v-32405de0="">
											<label data-v-799a696b="" data-v-32405de0="" class="row select-coupon-item disabled">
												<span data-v-799a696b="" class="select-coupon-item__check">
													<label data-v-2673f877="" data-v-799a696b="" class="form-checkbox form-checkbox--disabled">
														<input data-v-2673f877="" type="checkbox" disabled="disabled" value="false"> 
														<span data-v-2673f877="">
															<svg data-v-2673f877="" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
																<path data-v-2673f877="" fill="currentColor" fill-rule="nonzero" d="M8.489 13.597l7.304-7.304a1 1 0 0 1 1.414 1.414l-8 8a1 1 0 0 1-1.403.011l-4-3.875a1 1 0 1 1 1.392-1.436l3.293 3.19z"></path>
															</svg>
														</span>
													</label>
												</span>
												<span data-v-799a696b="" class="col select-coupon-item__body">
													<strong data-v-799a696b="" class="select-coupon-item__title">
														${list1.coupon_type } 
													</strong> 
													<span data-v-799a696b="" class="select-coupon-item__description"> 
															사용 가능 메뉴 : 새벽 배송
														<p data-v-799a696b="">${list1.coupon_explain } </p>
													</span> <!----> 
													<span data-v-799a696b="" class="select-coupon-item__price">
														<em data-v-799a696b="">8000</em>원 할인 
													</span> <!----> 
													<span data-v-799a696b="" class="select-coupon-item__date">
	<!-- 													<em data-v-799a696b="">2022.03.30</em>까지  -->
													</span>
												</span>
											</label>
										</li>
									</c:if>
									<c:if test="${list1.coupon_code == 12 }">
										<li data-v-32405de0="">
											<label data-v-799a696b="" data-v-32405de0="" class="row select-coupon-item disabled">
												<span data-v-799a696b="" class="select-coupon-item__check">
													<label data-v-2673f877="" data-v-799a696b="" class="form-checkbox form-checkbox--disabled">
														<input data-v-2673f877="" type="checkbox" disabled="disabled" value="false"> 
														<span data-v-2673f877="">
															<svg data-v-2673f877="" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
																<path data-v-2673f877="" fill="currentColor" fill-rule="nonzero" d="M8.489 13.597l7.304-7.304a1 1 0 0 1 1.414 1.414l-8 8a1 1 0 0 1-1.403.011l-4-3.875a1 1 0 1 1 1.392-1.436l3.293 3.19z"></path>
															</svg>
														</span>
													</label>
												</span>
												<span data-v-799a696b="" class="col select-coupon-item__body">
													<strong data-v-799a696b="" class="select-coupon-item__title">
														${list1.coupon_type } 
													</strong> 
													<span data-v-799a696b="" class="select-coupon-item__description"> 
															사용 가능 메뉴 : 택배 배송
														<p data-v-799a696b="">${list1.coupon_explain } </p>
													</span> <!----> 
													<span data-v-799a696b="" class="select-coupon-item__price">
														<em data-v-799a696b="">8000</em>원 할인 
													</span> <!----> 
													<span data-v-799a696b="" class="select-coupon-item__date">
	<!-- 													<em data-v-799a696b="">2022.03.30</em>까지  -->
													</span>
												</span>
											</label>
										</li>
									</c:if>
									<c:if test="${list1.coupon_code == 13 }">
										<li data-v-32405de0="">
											<label data-v-799a696b="" data-v-32405de0="" class="row select-coupon-item disabled">
												<span data-v-799a696b="" class="select-coupon-item__check">
													<label data-v-2673f877="" data-v-799a696b="" class="form-checkbox form-checkbox--disabled">
														<input data-v-2673f877="" type="checkbox" disabled="disabled" value="false"> 
														<span data-v-2673f877="">
															<svg data-v-2673f877="" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
																<path data-v-2673f877="" fill="currentColor" fill-rule="nonzero" d="M8.489 13.597l7.304-7.304a1 1 0 0 1 1.414 1.414l-8 8a1 1 0 0 1-1.403.011l-4-3.875a1 1 0 1 1 1.392-1.436l3.293 3.19z"></path>
															</svg>
														</span>
													</label>
												</span>
												<span data-v-799a696b="" class="col select-coupon-item__body">
													<strong data-v-799a696b="" class="select-coupon-item__title">
														${list1.coupon_type } 
													</strong> 
													<span data-v-799a696b="" class="select-coupon-item__description"> 
															사용 가능 메뉴 : 정기 구독 상품
														<p data-v-799a696b="">${list1.coupon_explain } </p>
													</span> <!----> 
													<span data-v-799a696b="" class="select-coupon-item__price">
														<em data-v-799a696b="">15</em>% 할인 
													</span> <!----> 
													<span data-v-799a696b="" class="select-coupon-item__date">
	<!-- 													<em data-v-799a696b="">2022.03.30</em>까지  -->
													</span>
												</span>
											</label>
										</li>
									</c:if>
									<c:if test="${list1.coupon_code == 14 }">
										<li data-v-32405de0="">
											<label data-v-799a696b="" data-v-32405de0="" class="row select-coupon-item disabled">
												<span data-v-799a696b="" class="select-coupon-item__check">
													<label data-v-2673f877="" data-v-799a696b="" class="form-checkbox form-checkbox--disabled">
														<input data-v-2673f877="" type="checkbox" disabled="disabled" value="false"> 
														<span data-v-2673f877="">
															<svg data-v-2673f877="" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
																<path data-v-2673f877="" fill="currentColor" fill-rule="nonzero" d="M8.489 13.597l7.304-7.304a1 1 0 0 1 1.414 1.414l-8 8a1 1 0 0 1-1.403.011l-4-3.875a1 1 0 1 1 1.392-1.436l3.293 3.19z"></path>
															</svg>
														</span>
													</label>
												</span>
												<span data-v-799a696b="" class="col select-coupon-item__body">
													<strong data-v-799a696b="" class="select-coupon-item__title">
														${list1.coupon_type } 
													</strong> 
													<span data-v-799a696b="" class="select-coupon-item__description"> 
															사용 가능 메뉴 : 택배 배송
														<p data-v-799a696b="">${list1.coupon_explain } </p>
													</span> <!----> 
													<span data-v-799a696b="" class="select-coupon-item__price">
														<em data-v-799a696b="">전액</em> 할인 
													</span> <!----> 
													<span data-v-799a696b="" class="select-coupon-item__date">
	<!-- 													<em data-v-799a696b="">2022.03.30</em>까지  -->
													</span>
												</span>
											</label>
										</li>
									</c:if>
								</c:forEach>
								
							</ul>
						</c:if>
					</div>
				</div>
				<nav data-v-32405de0="" class="select-coupon__nav">
					<button data-v-a1c889e0="" data-v-32405de0="" type="button"
						title="" class="button button--size-large" style="height: 64px;">
						<span data-v-a1c889e0="" class="button__wrap">선택완료</span>
					</button>
				</nav>
			</article>
		</div>
	</div>
</div>