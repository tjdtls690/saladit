<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<div data-v-3f3398e6="" class="add-items-confirm-list">
	<c:forEach var="saveItemCode" items="${saveItemCode }" varStatus="i">
		<div data-v-3f3398e6="" class="confirm-list">
			<input type="hidden" value="${saveTagMain[i.index]}/${saveItemCode }/${saveitemSizeSummary[i.index]}">
			<input type="hidden" value="${savePrice[i.index]}">
			<div data-v-3f3398e6="" class="confirm-list-delete">
				<p data-v-3f3398e6="" class="except4">삭제</p>
			</div>
			<div data-v-3f3398e6="" class="order-menu-temp-name">${saveItemName[i.index] } / ${saveItemSize[i.index] }</div>
			<div data-v-3f3398e6="" class="except5"
				style="display: flex; align-items: center; justify-content: space-between; margin-top: 8px;">
				<div data-v-3f3398e6="" class="order-menu-temp-detail-badge"></div>
				<div data-v-3f3398e6="" class="order-menu-temp-price">
					<c:if test="${empty savePriceSub[i.index] }">
						<span data-v-3f3398e6="" class="except6">${savePrice[i.index] }원</span>
					</c:if>
					<c:if test="${not empty savePriceSub[i.index] }">
						<span data-v-3f3398e6="" class="order-menu-temp-discount">${savePriceSub[i.index] }</span>
						<span data-v-3f3398e6="" class="except6">${savePrice[i.index] }원</span>
					</c:if>
				</div>
			</div>
		</div>
	</c:forEach>
</div>