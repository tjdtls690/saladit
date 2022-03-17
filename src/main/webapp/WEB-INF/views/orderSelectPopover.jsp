<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<div data-v-7605e1b2="" tabindex="-1"
	class="vc-popover-content direction-bottom vc-rounded-lg vc-text-sm vc-font-semibold vc-text-white vc-bg-gray-800 vc-border vc-border-gray-700 vc-p-1 vc-shadow slide-fade-enter-active slide-fade-enter-to">
	<div data-v-4a5f2beb="" class="vc-nav-container">
		<div data-v-3ca35a05="" class="vc-grid-container"
			style="grid-template-columns: repeat(3, 1fr); gap: 0px;">
			<div data-v-3ca35a05=""
				class="vc-grid-cell vc-grid-cell-row-1 vc-grid-cell-row--1 vc-grid-cell-col-1 vc-grid-cell-col--3"
				style="grid-area: 1/1/auto/auto;">
				<span data-v-3ca35a05="" role="button" tabindex="-1"
					class="vc-nav-arrow vc-flex vc-justify-center vc-items-center vc-mr-auto vc-leading-snug vc-rounded vc-border-2 vc-border-transparent hover:vc-bg-gray-900 focus:vc-border-indigo-600"><svg
						data-v-63f7b5ec="" width="20px" height="24px" viewBox="0 -1 16 34"
						class="vc-svg-icon" data-v-3ca35a05="">
						<path data-v-63f7b5ec=""
							d="M11.196 10c0 0.143-0.071 0.304-0.179 0.411l-7.018 7.018 7.018 7.018c0.107 0.107 0.179 0.268 0.179 0.411s-0.071 0.304-0.179 0.411l-0.893 0.893c-0.107 0.107-0.268 0.179-0.411 0.179s-0.304-0.071-0.411-0.179l-8.321-8.321c-0.107-0.107-0.179-0.268-0.179-0.411s0.071-0.304 0.179-0.411l8.321-8.321c0.107-0.107 0.268-0.179 0.411-0.179s0.304 0.071 0.411 0.179l0.893 0.893c0.107 0.107 0.179 0.25 0.179 0.411z"></path></svg></span>
			</div>
			<div data-v-3ca35a05=""
				class="vc-grid-cell vc-grid-cell-row-1 vc-grid-cell-row--1 vc-grid-cell-col-2 vc-grid-cell-col--2"
				style="grid-area: 1/2/auto/auto;">
				<span data-v-3ca35a05="" role="button" tabindex="0"
					class="vc-nav-title vc-grid-focus vc-text-indigo-100 vc-font-bold vc-leading-snug vc-px-2 vc-py-1 vc-rounded vc-border-2 vc-border-transparent hover:vc-bg-gray-900 focus:vc-border-indigo-600"
					style="white-space: nowrap;"> ${year } </span>
			</div>
			<div data-v-3ca35a05=""
				class="vc-grid-cell vc-grid-cell-row-1 vc-grid-cell-row--1 vc-grid-cell-col-3 vc-grid-cell-col--1"
				style="grid-area: 1/3/auto/auto;">
				<span data-v-3ca35a05="" role="button" tabindex="-1"
					class="vc-nav-arrow vc-flex vc-justify-center vc-items-center vc-ml-auto vc-leading-snug vc-rounded vc-border-2 vc-border-transparent hover:vc-bg-gray-900 focus:vc-border-indigo-600"><svg
						data-v-63f7b5ec="" width="20px" height="24px"
						viewBox="-5 -1 16 34" class="vc-svg-icon" data-v-3ca35a05="">
						<path data-v-63f7b5ec=""
							d="M10.625 17.429c0 0.143-0.071 0.304-0.179 0.411l-8.321 8.321c-0.107 0.107-0.268 0.179-0.411 0.179s-0.304-0.071-0.411-0.179l-0.893-0.893c-0.107-0.107-0.179-0.25-0.179-0.411 0-0.143 0.071-0.304 0.179-0.411l7.018-7.018-7.018-7.018c-0.107-0.107-0.179-0.268-0.179-0.411s0.071-0.304 0.179-0.411l0.893-0.893c0.107-0.107 0.268-0.179 0.411-0.179s0.304 0.071 0.411 0.179l8.321 8.321c0.107 0.107 0.179 0.268 0.179 0.411z"></path></svg></span>
			</div>
		</div>
		<div data-v-3ca35a05="" class="vc-grid-container"
			style="grid-template-columns: repeat(3, 1fr); gap: 2px 5px;">
			
			<c:forEach var="list1" items="${list }" varStatus="i">
				<c:if test="${check == 3 }">
					<c:if test="${i.count < solidCheckMonth }">
						<div data-v-3ca35a05=""
							class="vc-grid-cell vc-grid-cell-row-1 vc-grid-cell-row--4 vc-grid-cell-col-2 vc-grid-cell-col--2"
							style="grid-area: ${i.index / 3 + 1}/${i.index % 3 + 1}/auto/auto;">
							<span data-v-3ca35a05="" role="button" aria-label="2월 2000" id="${year }/${i.count}/00"
								class="vc-w-12 vc-font-semibold vc-cursor-pointer vc-text-center vc-leading-snug vc-py-1 vc-rounded vc-border-2 vc-border-transparent hover:vc-bg-gray-900 hover:vc-shadow-inner hover:vc-text-white focus:vc-border-indigo-600 vc-border-transparent vc-opacity-25 vc-pointer-events-none">
								${i.count }월 </span>
						</div>
					</c:if>
					<c:if test="${i.count >= solidCheckMonth }">
						<div data-v-3ca35a05=""
							class="vc-grid-cell vc-grid-cell-row-2 vc-grid-cell-row--3 vc-grid-cell-col-1 vc-grid-cell-col--3"
							style="grid-area: ${i.index / 3 + 1}/${i.index % 3 + 1}/auto/auto;">
							<span data-v-3ca35a05="" role="button" aria-label="4월 2000" id="${year }/${i.count}/00"
								class="vc-w-12 vc-font-semibold vc-cursor-pointer vc-text-center vc-leading-snug vc-py-1 vc-rounded vc-border-2 vc-border-transparent hover:vc-bg-gray-900 hover:vc-shadow-inner hover:vc-text-white focus:vc-border-indigo-600 vc-border-transparent">
								${i.count }월 </span>
						</div>
					</c:if>
				</c:if>
				
				
				
				<c:if test="${check == 1 }">
					<div data-v-3ca35a05=""
						class="vc-grid-cell vc-grid-cell-row-1 vc-grid-cell-row--4 vc-grid-cell-col-2 vc-grid-cell-col--2"
						style="grid-area: ${i.index / 3 + 1}/${i.index % 3 + 1}/auto/auto;">
						<span data-v-3ca35a05="" role="button" aria-label="2월 2000" id="${year }/${i.count}/00"
							class="vc-w-12 vc-font-semibold vc-cursor-pointer vc-text-center vc-leading-snug vc-py-1 vc-rounded vc-border-2 vc-border-transparent hover:vc-bg-gray-900 hover:vc-shadow-inner hover:vc-text-white focus:vc-border-indigo-600 vc-border-transparent vc-opacity-25 vc-pointer-events-none">
							${i.count }월 </span>
					</div>
				</c:if>
				
				
				<c:if test="${check == 2 }">
					<c:if test="${i.count == month }">
						<div data-v-3ca35a05=""
							class="vc-grid-cell vc-grid-cell-row-1 vc-grid-cell-row--4 vc-grid-cell-col-3 vc-grid-cell-col--1"
							style="grid-area: ${i.index / 3 + 1}/${i.index % 3 + 1}/auto/auto;">
							<span data-v-3ca35a05="" role="button" aria-label="3월 2000" id="${year }/${i.count}/00"
								class="vc-w-12 vc-font-semibold vc-cursor-pointer vc-text-center vc-leading-snug vc-py-1 vc-rounded vc-border-2 vc-border-transparent hover:vc-bg-gray-900 hover:vc-shadow-inner hover:vc-text-white focus:vc-border-indigo-600 vc-bg-indigo-100 vc-text-indigo-900 vc-border-transparent vc-font-bold vc-shadow vc-grid-focus">
								${i.count }월 </span>
						</div>
					</c:if>
					<c:if test="${i.count != month }">
						<div data-v-3ca35a05=""
							class="vc-grid-cell vc-grid-cell-row-2 vc-grid-cell-row--3 vc-grid-cell-col-1 vc-grid-cell-col--3"
							style="grid-area: ${i.index / 3 + 1}/${i.index % 3 + 1}/auto/auto;">
							<span data-v-3ca35a05="" role="button" aria-label="4월 2000" id="${year }/${i.count}/00"
								class="vc-w-12 vc-font-semibold vc-cursor-pointer vc-text-center vc-leading-snug vc-py-1 vc-rounded vc-border-2 vc-border-transparent hover:vc-bg-gray-900 hover:vc-shadow-inner hover:vc-text-white focus:vc-border-indigo-600 vc-border-transparent">
								${i.count }월 </span>
						</div>
					</c:if>
				</c:if>
			</c:forEach>
			

		</div>
	</div>
	<span data-v-7605e1b2=""
		class="vc-popover-caret direction-bottom align-center"></span>
</div>