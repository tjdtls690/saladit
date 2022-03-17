<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:forEach var="item" items="${itemInfo }">
<li data-v-4c9a9e82="" class="col-6 col--lg-3">
<article
		data-v-15082832="" data-v-4c9a9e82=""
		class="item for-loop-cloned-item-244">
		<input type="hidden" value="${item.itemCode }" id="itemCode">
		<input type="hidden" value="${item.tagMain }" id="tagMain">
		<input type="hidden" value="${item.tagSub }" id="tagSub">
		<div data-v-15082832="" class="for-loop-cloned-item-244">
			<figure data-v-15082832=""
				class="item__image for-loop-cloned-item-244">
				<div data-v-15082832=""
					class="item-badge for-loop-cloned-item-244">
					<!---->
				</div>
				<img data-v-15082832=""
					src="${item.itemImage }"
					alt="${item.itemName } " title="${item.itemName } "
					class="for-loop-cloned-item-244">
			</figure>
			<div data-v-15082832=""
				class="item__body for-loop-cloned-item-244">
				<!---->
				<strong data-v-15082832=""
					class="for-loop-cloned-item-244">${item.itemName }</strong>
				<div data-v-15082832=""
					class="for-loop-cloned-item-244 options">
					<dl data-v-15082832=""
						class="for-loop-cloned-item-244 row--v">
						<dd data-v-15082832="" class="for-loop-cloned-item-244">
							<em data-v-15082832=""
								class="for-loop-cloned-item-244"><b>${item.itemPriceM }원</b></em>~ <span
								data-v-15082832="" class="for-loop-cloned-item-244">
								<c:if test="${item.itemPriceMSub ne ''}">
										${item.itemPriceMSub }
								</c:if>
								</span>
						</dd>
					</dl>
				</div>
				<span data-v-15082832="" class="for-loop-cloned-item-244">${item.itemSummary }</span>
				<div data-v-15082832=""
					class="item-bottom for-loop-cloned-item-244 row--v-center row--h-between">
					<div data-v-15082832=""
						class="for-loop-cloned-item-244 info-wrap">
						<span data-v-15082832=""
							class="for-loop-cloned-item-244 star-info">${item.starAvg }</span>
						<span data-v-15082832=""
							class="for-loop-cloned-item-244 review-info">${item.reviewCount }</span>
					</div>
					<div data-v-15082832=""
						class="row--v-center for-loop-cloned-item-244 tag-wrap">
						<div data-v-15082832=""
							class="for-loop-cloned-item-244 row--v-center">
<!-- 																		<div data-v-15082832="" -->
<!-- 																			class="for-loop-cloned-item-244 vegi-tag md-item-vegi-tag"> -->
<!-- 																			락토베지테리언</div> -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</article>
</li>
</c:forEach>