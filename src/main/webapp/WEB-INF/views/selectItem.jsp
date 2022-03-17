<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!--  단품상세페이지의 드롭다운 리스트 -->
<!--  단품상세페이지의 드롭다운 리스트 -->
<!--  단품상세페이지의 드롭다운 리스트 -->
<c:if test="${tagMain != 800 and tagMain != 700 }" >
	<!-- 'L' 사이즈 없는 단품 -->
	<c:if test="${empty detail.item_price_l}">
			<li data-v-5b7f52e9="">
				<div data-v-5b7f52e9="" class="detail-wrap" >
					<div data-v-5b7f52e9="" class="detail-name-and-badge">
						<span data-v-5b7f52e9="" id="미디움">미디움 (M)</span>
<!-- 						<span data-v-5b7f52e9="">&nbsp(M)</span> -->
	<!-- 					<span data-v-5b7f52e9="" class="detail-badge">(굿바일 7% 할인)</span> -->
					</div> 
					<div data-v-5b7f52e9="" class="detail-price" >
						<c:if test="${ not empty detail.item_price_m_sub }">
							<span data-v-5b7f52e9="" class="discount-price" >${detail.item_price_m_sub }원</span>
						</c:if> 
						<span data-v-5b7f52e9="" id="1001" >${detail.item_price_m }원</span>
					</div>
				</div>
			</li>
	</c:if>
	<!--  'L' 사이즈 포함하는 단품 -->
	<c:if test="${not empty detail.item_price_l}">
			<li data-v-5b7f52e9="">
				<div data-v-5b7f52e9="" class="detail-wrap">
					<div data-v-5b7f52e9="" class="detail-name-and-badge">
						<span data-v-5b7f52e9="" id="미디움">미디움 (M)</span>
<!-- 						<span data-v-5b7f52e9="">&nbsp(M)</span>  -->
	<!-- 					<span data-v-5b7f52e9="" class="detail-badge">(굿바일 7% 할인)</span> -->
					</div> 
					<div data-v-5b7f52e9="" class="detail-price">
						<c:if test="${ not empty detail.item_price_m_sub}">
							<span data-v-5b7f52e9="" class="discount-price">${detail.item_price_m_sub }원</span>
						</c:if> 
						<span data-v-5b7f52e9="" id="1001">${detail.item_price_m }원</span>
					</div>
				</div>
			</li>
			<li data-v-5b7f52e9="">
				<div data-v-5b7f52e9="" class="detail-wrap">
					<div data-v-5b7f52e9="" class="detail-name-and-badge">
						<span data-v-5b7f52e9="" id="라지">라지 (L)</span> 
<!-- 						<span data-v-5b7f52e9="">&nbsp(L)</span>  -->
	<!-- 					<span data-v-5b7f52e9="" class="detail-badge">(굿바일 7% 할인)</span> -->
					</div> 
					<div data-v-5b7f52e9="" class="detail-price">
						<c:if test="${ not empty detail.item_price_l_sub}">
							<span data-v-5b7f52e9="" class="discount-price">${detail.item_price_l_sub }원</span>
						</c:if> 
						<span data-v-5b7f52e9="" id="1002">${detail.item_price_l }원</span>
					</div>
				</div>
			</li>
	<!-- 		item_code로 각 항목마다 추가 제품을 넣을수있다. -->
	</c:if>
</c:if>
<c:if test="${tagMain == 700 or tagMain == 800 }">
	<!-- 'L' 사이즈 없는 단품 -->
	<c:if test="${empty detail.item_price_l}">
			<li data-v-5b7f52e9="">
				<div data-v-5b7f52e9="" class="detail-wrap" >
					<div data-v-5b7f52e9="" class="detail-name-and-badge">
						<span data-v-5b7f52e9="" id="미디움">1ea</span>
<!-- 						<span data-v-5b7f52e9="">&nbsp(M)</span> -->
	<!-- 					<span data-v-5b7f52e9="" class="detail-badge">(굿바일 7% 할인)</span> -->
					</div> 
					<div data-v-5b7f52e9="" class="detail-price" >
						<c:if test="${ not empty detail.item_price_m_sub }">
							<span data-v-5b7f52e9="" class="discount-price" >${detail.item_price_m_sub }원</span>
						</c:if> 
						<span data-v-5b7f52e9="" id="1001" >${detail.item_price_m }원</span>
					</div>
				</div>
			</li>
	</c:if>
	<!--  'L' 사이즈 포함하는 단품 -->
	<c:if test="${not empty detail.item_price_l}">
			<li data-v-5b7f52e9="">
				<div data-v-5b7f52e9="" class="detail-wrap">
					<div data-v-5b7f52e9="" class="detail-name-and-badge">
						<span data-v-5b7f52e9="" id="미디움">1ea</span>
<!-- 						<span data-v-5b7f52e9="">&nbsp(M)</span>  -->
	<!-- 					<span data-v-5b7f52e9="" class="detail-badge">(굿바일 7% 할인)</span> -->
					</div> 
					<div data-v-5b7f52e9="" class="detail-price">
						<c:if test="${ not empty detail.item_price_m_sub}">
							<span data-v-5b7f52e9="" class="discount-price">${detail.item_price_m_sub }원</span>
						</c:if> 
						<span data-v-5b7f52e9="" id="1001">${detail.item_price_m }원</span>
					</div>
				</div>
			</li>
			<li data-v-5b7f52e9="">
				<div data-v-5b7f52e9="" class="detail-wrap">
					<div data-v-5b7f52e9="" class="detail-name-and-badge">
						<span data-v-5b7f52e9="" id="라지">1box</span> 
<!-- 						<span data-v-5b7f52e9="">&nbsp(L)</span>  -->
	<!-- 					<span data-v-5b7f52e9="" class="detail-badge">(굿바일 7% 할인)</span> -->
					</div> 
					<div data-v-5b7f52e9="" class="detail-price">
						<c:if test="${ not empty detail.item_price_l_sub}">
							<span data-v-5b7f52e9="" class="discount-price">${detail.item_price_l_sub }원</span>
						</c:if> 
						<span data-v-5b7f52e9="" id="1002">${detail.item_price_l }원</span>
					</div>
				</div>
			</li>
	<!-- 		item_code로 각 항목마다 추가 제품을 넣을수있다. -->
	</c:if>
</c:if>