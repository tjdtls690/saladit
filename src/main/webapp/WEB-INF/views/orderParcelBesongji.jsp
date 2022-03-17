<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<button data-v-064d23aa="" type="button">
	<span data-v-064d23aa="" class="row--v-center row--h-between">
		<c:if test="${fn:length(list) == 0}">
			<span data-v-064d23aa="" class="col ta-left">전국 모든 지역 택배배송지 선택</span>
			<input type="hidden" value="0" id="addressCheck">
		</c:if> 
		<c:if test="${fn:length(list) > 0}">
			<c:forEach var="memberZipcode" items="${list }">
				<c:if test="${memberZipcode.member_default_address == 'y' }">
					<span data-v-064d23aa="" class="col ta-left">
						<b data-v-064d23aa="" class="subject">
							<span data-v-064d23aa="">${memberZipcode.member_shipping_address }</span>
						</b> 
						<span data-v-064d23aa="" class="description">${memberZipcode.member_address } ${memberZipcode.member_detail_address }</span>
						<input type="hidden" value="${memberZipcode.member_zipcode_code }">
						<input type="hidden" value="1" id="addressCheck">
					</span>
				</c:if>
			</c:forEach>
		</c:if>
		<i data-v-064d23aa="" class="ico">
			<svg data-v-064d23aa="" xmlns="http://www.w3.org/2000/svg" width="24" height="24"
				viewBox="0 0 24 24" aria-labelledby="arrow-right-1"
				role="presentation" class="icon">
				<g fill="none" fill-rule="evenodd"> 
					<path stroke="currentColor"
					stroke-linecap="round" stroke-linejoin="round"
					d="M10 6l5.964 5.964-5.964 6"></path>
				</g>
			</svg>
		</i>
	</span>
</button>