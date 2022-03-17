<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

	<div data-v-23a4f1d5="" data-v-49ba6df3="" data-v-32a18372="" class="modal">
		<div data-v-49ba6df3="" class="modal-wrap modal-wrap-full">
			<div data-v-49ba6df3="" class="modal-content-wrap">
				<header data-v-49ba6df3="">
					<div data-v-49ba6df3="">
						<h3 data-v-49ba6df3="">식단 확인 및 변경</h3>
						<span data-v-49ba6df3="" class="mobile icon-info"></span>
						<!---->
						<p data-v-49ba6df3="" class="desktop">2주치 식단이 반복되어 배송됩니다.</p>
					</div>
					<div data-v-49ba6df3="" class="btn-close"></div>
				</header>
				<section data-v-49ba6df3="" class="week-select-wrap">
					<ul data-v-49ba6df3="" class="week-item-list">
<!-- 몇주째 볼건지 크릭 -->					
						<c:forEach var="i" begin="1" end="${week }">
							<li data-v-51dd0058="" data-v-49ba6df3="" class="item-container">
								<div data-v-51dd0058="" class="item-wrap">
									<span data-v-51dd0058="" class="item-text">${i}주</span>							
								</div>
							</li>
						
						</c:forEach>

					</ul>
				</section>
				<!---->
				<div data-v-49ba6df3="" class="modal-contents">
					<section data-v-49ba6df3="" class="menu-select-wrap">
						<div data-v-49ba6df3="">
							<div data-v-49ba6df3="" class="menu-select-wrap__date">
								<p data-v-49ba6df3="">${day} ${day3 } / 1회차 배송</p>
							</div>
							<div data-v-49ba6df3="">
								<!---->
								<!---->
								<!---->
								<!---->
								<div data-v-49ba6df3="" class="menu-select-wrap__list">
									<h4 data-v-49ba6df3="">메인 메뉴</h4>
									<ul data-v-49ba6df3="">
<!--  샐러드 일때  -->
										<li data-v-49ba6df3="">
											<div data-v-4837bb91="" data-v-49ba6df3="" class="dropdown-btn-flex-wrap" selected-day="1">
												<div data-v-4837bb91="" class="dropdown-btn modal">
													<div data-v-4837bb91="" class="button dropdown">
														<div data-v-4837bb91="" class="selected-content">
															<span data-v-4837bb91="" class="selected-content-text">
																프렌치 발사믹 훈제연어 샐러드 라지 (L) </span>
															<!---->
														</div>
													</div>
													<!--여기에 리스트-->
												</div>
											</div>
										</li>
										<li data-v-49ba6df3="">
											<div data-v-4837bb91="" data-v-49ba6df3="" class="dropdown-btn-flex-wrap" selected-day="1">
												<div data-v-4837bb91="" class="dropdown-btn">
													<div data-v-4837bb91="" class="button dropdown">
														<div data-v-4837bb91="" class="selected-content">
															<span data-v-4837bb91="" class="selected-content-text">
																로스트 비프 샐러드 라지 (L) </span>
															<!---->
														</div>
													</div>
													<!---->
												</div>
											</div>
										</li>
										<li data-v-49ba6df3="">
											<div data-v-4837bb91="" data-v-49ba6df3="" class="dropdown-btn-flex-wrap" selected-day="1">
												<div data-v-4837bb91="" class="dropdown-btn">
													<div data-v-4837bb91="" class="button dropdown">
														<div data-v-4837bb91="" class="selected-content">
															<span data-v-4837bb91="" class="selected-content-text">
																마카로니 콥 샐러드 라지 (L) </span>
															<!---->
														</div>
													</div>
													<!---->
												</div>
											</div>
										</li>
<%-- 										<c:forEach var="showList" items="${showList }"> --%>
<%-- 											<input type="hidden" value="${showList.itemPriceM }"> --%>
<!-- 											<li data-v-49ba6df3=""> -->
<!-- 												<div data-v-4837bb91="" data-v-49ba6df3="" class="dropdown-btn-flex-wrap" selected-day="1"> -->
<!-- 													<div data-v-4837bb91="" class="dropdown-btn"> -->
<!-- 														<div data-v-4837bb91="" class="button dropdown"> -->
<!-- 															<div data-v-4837bb91="" class="selected-content"> -->
<!-- 																<span data-v-4837bb91="" class="selected-content-text"> -->
<%-- 																	${showList.itemName } </span> --%>
																
<!-- 															</div> -->
<!-- 														</div> -->
														
<!-- 													</div> -->
<!-- 												</div> -->
<!-- 											</li>										 -->
<%-- 										</c:forEach> --%>
<!--   샐러드 일때   -->
									</ul>
								</div>

							</div>

						</div>
<!-- ----------------------------- -->						
<!-- -------- 위 아래 기준  --------- -->						
<!-- ----------------------------- -->						
						<div data-v-49ba6df3="">
							<div data-v-49ba6df3="" class="menu-select-wrap__date">
								<p data-v-49ba6df3="">2022. 03. 14 월 / 2회차 배송</p>
							</div>
							<div data-v-49ba6df3="">
								<!---->
								<!---->
								<!---->
								<!---->
								<div data-v-49ba6df3="" class="menu-select-wrap__list">
									<h4 data-v-49ba6df3="">메인 메뉴</h4>
									<ul data-v-49ba6df3="">
										<li data-v-49ba6df3="">	
											<div data-v-4837bb91="" data-v-49ba6df3="" class="dropdown-btn-flex-wrap"
												selected-day="1">
												<div data-v-4837bb91="" class="dropdown-btn modal">
													<div data-v-4837bb91="" class="button dropdown">
														<div data-v-4837bb91="" class="selected-content">
															<span data-v-4837bb91="" class="selected-content-text">
																프렌치 발사믹 훈제연어 샐러드 라지 (L) </span>
															<!---->
														</div>
													</div>
													<!---->
												</div>
											</div>
										</li>
										<li data-v-49ba6df3=""><div data-v-4837bb91=""
												data-v-49ba6df3="" class="dropdown-btn-flex-wrap"
												selected-day="1">
												<div data-v-4837bb91="" class="dropdown-btn modal">
													<div data-v-4837bb91="" class="button dropdown">
														<div data-v-4837bb91="" class="selected-content">
															<span data-v-4837bb91="" class="selected-content-text">
																로스트 비프 샐러드 라지 (L) </span>
															<!---->
														</div>
													</div>
													<!---->
												</div>
											</div></li>
										<li data-v-49ba6df3=""><div data-v-4837bb91=""
												data-v-49ba6df3="" class="dropdown-btn-flex-wrap"
												selected-day="1">
												<div data-v-4837bb91="" class="dropdown-btn modal">
													<div data-v-4837bb91="" class="button dropdown">
														<div data-v-4837bb91="" class="selected-content">
															<span data-v-4837bb91="" class="selected-content-text">
																마카로니 콥 샐러드 라지 (L) </span>
															<!---->
														</div>
													</div>
													<!---->
												</div>
											</div></li>
									</ul>
								</div>
								<div data-v-49ba6df3="" class="menu-select-wrap__divider"></div>
								<!---->


							</div>
							<footer data-v-49ba6df3="">
								<div data-v-49ba6df3="" class="total-wrap">
									<div data-v-49ba6df3="" class="total">
										<span data-v-49ba6df3="">1주차 상품 금액</span>
										<p data-v-49ba6df3="">
											<span data-v-49ba6df3="" class="origin-sum">58,900</span>57,133원
										</p>
									</div>
									<div data-v-49ba6df3="" class="total">
										<span data-v-49ba6df3="">배송비 / 횟수</span>
										<p data-v-49ba6df3="">
											<span data-v-49ba6df3="" class="free-delivery desktop">3만
												5천원 이상 무료배송!</span> 7,000원 / 2회 <span data-v-49ba6df3=""
												class="free-delivery mobile">3만 5천원 이상 무료배송!</span>
										</p>
									</div>
									<div data-v-49ba6df3="" class="total">
										<span data-v-49ba6df3="">상품 금액</span>
										<p data-v-49ba6df3="">113,393원</p>
									</div>
								</div>
								<div data-v-49ba6df3="" class="btn-wrap">
									<button data-v-a1c889e0="" data-v-49ba6df3="" type="button"
										title="" class="button btn btn-close button--outline4">
										<span data-v-a1c889e0="" class="button__wrap">닫기</span>
									</button>
									<button data-v-a1c889e0="" data-v-49ba6df3="" type="button"
										title="" class="button btn">
										<span data-v-a1c889e0="" class="button__wrap">저장</span>
									</button>
								</div>
							</footer>
						</div>
						<!---->
						<!---->
					</section>
				</div>
			</div>
		</div>
	</div>