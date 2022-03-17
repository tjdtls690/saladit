<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<div class="order-selected-item-list" data-v-064d23aa="">
	<div data-v-064d23aa="" class="order-selected-item-list-header">
		<div data-v-064d23aa="" class="order-selected-item-list-header-left">
			<p data-v-064d23aa="" class="header-title">상품 선택</p>
		</div>
		<div data-v-064d23aa="" class="header-btn">전체 삭제</div>
	</div>
	<div data-v-064d23aa="" style="display: flex; flex-wrap: wrap; width: 100%;">
		
		<c:forEach var="saveItemCode" items="${saveItemCode }" varStatus="i">
			<section data-v-003a3d21="" data-v-064d23aa="" class="selected-item">
				<header data-v-003a3d21="" class="row--wrap selected-item-header">
					<div data-v-003a3d21="" class="row row--h-between col-12">
						<div data-v-003a3d21="">
							<h3 data-v-003a3d21="">${saveItemName[i.index] } / ${saveItemSize[i.index] }</h3>
							<p data-v-003a3d21="" class="content-info">
								<!---->
							</p>
						</div>
						<div data-v-003a3d21="">
							<input type="hidden" value="${saveTagMain[i.index]}/${saveItemCode }/${saveitemSizeSummary[i.index]}">
							<button data-v-003a3d21="" type="button" class="delete-menu-btn">
								삭제</button>
						</div>
					</div>
					<div data-v-003a3d21="" class="selected-item-header__body">
						<nav data-v-003a3d21="">
							<nav data-v-4ba0dee4="" data-v-003a3d21=""
								class="form-number quantity">
								<input type="hidden" value="${saveTagMain[i.index]}/${saveItemCode }/${saveitemSizeSummary[i.index]}">
								<input type="hidden" value="${fn:replace(savePrice[i.index], ',', '') / saveitemQuantity[i.index]}">
								<input type="hidden" value="${fn:replace(savePriceSub[i.index], ',', '') / saveitemQuantity[i.index]}">
								<button data-v-4ba0dee4="" type="button"
									class="form-number__control">
									<svg data-v-4ba0dee4="" xmlns="http://www.w3.org/2000/svg"
										viewBox="0 0 24 24">
										<g data-v-4ba0dee4="" fill="none" fill-rule="evenodd">
										<path data-v-4ba0dee4="" fill="currentColor"
											d="M7 11.5h10v1H7z"></path></g></svg>
								</button>
								<span data-v-4ba0dee4="" class="form-number__input">
									<input data-v-4ba0dee4="" type="number" min="1" max="100" step="1" value="${saveitemQuantity[i.index] }">
								</span>
								<button data-v-4ba0dee4="" type="button"
									class="form-number__control">
									<svg data-v-4ba0dee4="" xmlns="http://www.w3.org/2000/svg"
										viewBox="0 0 24 24">
										<g data-v-4ba0dee4="" fill="none" fill-rule="evenodd">
										<path data-v-4ba0dee4="" fill="currentColor"
											d="M11.5 11.5V6h1v5.5H18v1h-5.5V18h-1v-5.5H6v-1h5.5z"></path></g></svg>
								</button>
							</nav>
						</nav>
						<div data-v-003a3d21=""
							class="selected-item-price-wrap row row--v-end">
							<c:if test="${fn:replace(savePriceSub[i.index], ',', '') == 0 }">
								<p data-v-003a3d21="" class="selected-item-price">
									<em data-v-003a3d21="">${savePrice[i.index] }원</em>
								</p>
							</c:if>
							<c:if test="${fn:replace(savePriceSub[i.index], ',', '') != 0}">
								<div data-v-003a3d21="" class="selected-item-discount">
									${savePriceSub[i.index] }</div>
								<p data-v-003a3d21="" class="selected-item-price">
									<em data-v-003a3d21="">${savePrice[i.index] }원</em>
								</p>
							</c:if>
							
						</div>
					</div>
				</header>
				<div data-v-003a3d21="" class="selected-item-options">
					<dl data-v-003a3d21="" class="row--v-center">
						<label data-v-003a3d21="" class="row--v-center">
							<div data-v-7e133ddb="" data-v-003a3d21="">
								<div data-v-7e133ddb="" class="checkbox-wrap basic">
									<label data-v-7e133ddb="" class="">
									<input data-v-7e133ddb="" id="" type="checkbox" name="" value="1">
										<div data-v-7e133ddb="" class="check-svg default">
										<c:if test="${saveDisposable[i.index] != 0 }"> 
											<img data-v-7e133ddb="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_order-checkbox-on.svg">
											<img data-v-7e133ddb="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_order-checkbox-off.svg">
										</c:if>
										<c:if test="${saveDisposable[i.index] == 0 }">
											<img data-v-7e133ddb="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_order-checkbox-off.svg">
											<img data-v-7e133ddb="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_order-checkbox-on.svg">
										</c:if>
										</div> <span data-v-7e133ddb="" class="checkbox-label"></span></label>
								</div>
							</div> 
							<span data-v-003a3d21="" style="color: rgb(61, 61, 61); font-size: 14px;">일회용품(포크+물티슈)</span></label>
					</dl>
				</div>
				<c:if test="${saveDisposable[i.index] != 0 }">
					<div data-v-003a3d21="" class="selected-item-selected-options">
						<div data-v-003a3d21=""
							class="row--v-end row--h-between selected-item-selected-options__price">
							<div data-v-003a3d21="" style="width: 130px;">
								<nav data-v-4ba0dee4="" data-v-003a3d21=""
									class="form-number quantity">
									<input type="hidden" value="${saveTagMain[i.index]}/${saveItemCode }/${saveitemSizeSummary[i.index]}">
									<input type="hidden" value="${fn:replace(savePrice[i.index], ',', '')}">
									<input type="hidden" value="${fn:replace(savePriceSub[i.index], ',', '')}">
									<button data-v-4ba0dee4="" type="button"
										class="form-number__control">
										<svg data-v-4ba0dee4="" xmlns="http://www.w3.org/2000/svg"
											viewBox="0 0 24 24">
											<g data-v-4ba0dee4="" fill="none" fill-rule="evenodd">
											<path data-v-4ba0dee4="" fill="currentColor"
												d="M7 11.5h10v1H7z"></path></g></svg>
									</button>
									<span data-v-4ba0dee4="" class="form-number__input">
											<input data-v-4ba0dee4="" type="number" min="1" max="100" step="1" value="${saveDisposable[i.index] }">
									</span>
									<button data-v-4ba0dee4="" type="button"
										class="form-number__control">
										<svg data-v-4ba0dee4="" xmlns="http://www.w3.org/2000/svg"
											viewBox="0 0 24 24">
											<g data-v-4ba0dee4="" fill="none" fill-rule="evenodd">
											<path data-v-4ba0dee4="" fill="currentColor"
												d="M11.5 11.5V6h1v5.5H18v1h-5.5V18h-1v-5.5H6v-1h5.5z"></path></g></svg>
									</button>
								</nav>
							</div>
							<p data-v-003a3d21="">
								<em data-v-003a3d21="" style="font-style: normal;"><fmt:formatNumber value="${saveDisposable[i.index] * 100 }" pattern="#,###" />원</em>
							</p>
						</div>
					</div>
				</c:if>
				<c:if test="${saveDisposable[i.index] == 0 }">
					<div data-v-003a3d21="" class="selected-item-selected-options" style="display:none">
						<div data-v-003a3d21=""
							class="row--v-end row--h-between selected-item-selected-options__price">
							<div data-v-003a3d21="" style="width: 130px;">
								<nav data-v-4ba0dee4="" data-v-003a3d21=""
									class="form-number quantity">
									<input type="hidden" value="${saveTagMain[i.index]}/${saveItemCode }/${saveitemSizeSummary[i.index]}">
									<input type="hidden" value="${fn:replace(savePrice[i.index], ',', '')}">
									<input type="hidden" value="${fn:replace(savePriceSub[i.index], ',', '')}">
									<button data-v-4ba0dee4="" type="button"
										class="form-number__control">
										<svg data-v-4ba0dee4="" xmlns="http://www.w3.org/2000/svg"
											viewBox="0 0 24 24">
											<g data-v-4ba0dee4="" fill="none" fill-rule="evenodd">
											<path data-v-4ba0dee4="" fill="currentColor"
												d="M7 11.5h10v1H7z"></path></g></svg>
									</button>
									<span data-v-4ba0dee4="" class="form-number__input">
											<input data-v-4ba0dee4="" type="number" min="1" max="100" step="1" value="${saveDisposable[i.index] }">
									</span>
									<button data-v-4ba0dee4="" type="button"
										class="form-number__control">
										<svg data-v-4ba0dee4="" xmlns="http://www.w3.org/2000/svg"
											viewBox="0 0 24 24">
											<g data-v-4ba0dee4="" fill="none" fill-rule="evenodd">
											<path data-v-4ba0dee4="" fill="currentColor"
												d="M11.5 11.5V6h1v5.5H18v1h-5.5V18h-1v-5.5H6v-1h5.5z"></path></g></svg>
									</button>
								</nav>
							</div>
							<p data-v-003a3d21="">
								<em data-v-003a3d21="" style="font-style: normal;"><fmt:formatNumber value="${saveDisposable[i.index] * 100 }" pattern="#,###" />원</em>
							</p>
						</div>
					</div>
				</c:if>
			</section>
		</c:forEach>
		
	</div>
	<div data-v-064d23aa="" class="order-selected-item" style="flex-basis: 50%;">
		<button data-v-064d23aa="" type="button" class="add">
			<div data-v-064d23aa="">
				<span data-v-064d23aa="" style="white-space: nowrap;">추가하기</span>
			</div>
		</button>
	</div>
</div>