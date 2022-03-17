<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:if test="${check != 0 }">
	<div data-v-6e61822c="" class="search-count-wrap">
		<span data-v-6e61822c="" class="search-count">검색결과 ${check}개</span>
	</div>
</c:if>
<c:if test="${not empty itemInfo}">
	<div data-v-6e61822c="" class="content-wrap">
		<div data-v-6e61822c="" class="search-result-wrap">
			<div data-v-6e61822c="">
				<ul data-v-6e61822c="" class="search-result-list">
					<c:forEach var="item" items="${itemInfo}">
						<li data-v-6e61822c="" class="search-result-item">
						<article
								data-v-15082832="" data-v-6e61822c=""
								class="item for-loop-cloned-item-601">
								<input type="hidden" value="${item.itemCode }" id="itemCode">
								<input type="hidden" value="${item.tagMain }" id="tagMain">
								<input type="hidden" value="${item.tagSub }" id="tagSub">
								<div data-v-15082832="" class="for-loop-cloned-item-601">
									<figure data-v-15082832=""
										class="item__image for-loop-cloned-item-601">
										<div data-v-15082832=""
											class="item-badge for-loop-cloned-item-601">
											<!---->
										</div>
										<img data-v-15082832="" src="${item.itemImage }"
											alt="${item.itemName }" title="${item.itemName }"
											class="for-loop-cloned-item-601">
										<!---->
									</figure>
									<div data-v-15082832=""
										class="item__body for-loop-cloned-item-601">
										<!---->
										<strong data-v-15082832="" class="for-loop-cloned-item-601">${item.itemName }</strong>
										<div data-v-15082832=""
											class="for-loop-cloned-item-601 options">
											<dl data-v-15082832=""
												class="for-loop-cloned-item-601 row--v">
												<dd data-v-15082832="" class="for-loop-cloned-item-601">
													<em data-v-15082832="" class="for-loop-cloned-item-601"><fmt:formatNumber value="${item.itemPriceM }" pattern="#,###" />원</em>~<span
														data-v-15082832="" class="for-loop-cloned-item-244">
														<c:if test="${item.itemPriceMSub ne ''}">
																<fmt:formatNumber value="${item.itemPriceMSub }" pattern="#,###" />
														</c:if>
														</span>
													<!---->
												</dd>
											</dl>
										</div>
										<span data-v-15082832="" class="for-loop-cloned-item-601">
											${item.itemSummary } </span>
										<div data-v-15082832=""
											class="item-bottom for-loop-cloned-item-601 row--v-center row--h-between">
											<div data-v-15082832=""
												class="for-loop-cloned-item-601 info-wrap">
												<span data-v-15082832=""
													class="for-loop-cloned-item-601 star-info">${item.starAvg }</span>
												<span data-v-15082832=""
													class="for-loop-cloned-item-601 review-info">${item.reviewCount }</span>
											</div>
											<div data-v-15082832=""
												class="row--v-center for-loop-cloned-item-601 tag-wrap">
												<div data-v-15082832=""
													class="for-loop-cloned-item-601 row--v-center"></div>
											</div>
										</div>
									</div>
								</div>
							</article></li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
</c:if>
