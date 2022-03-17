<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<ul data-v-3f3398e6="">
	<c:forEach var="item" items="${itemInfo }">
		<li data-v-3f3398e6=""><div data-v-3f3398e6=""
				class="add-items-group-body-contents">
				<div data-v-3f3398e6="" class="content-img-wrap">
					<img data-v-3f3398e6="" class="modal-list-img"
						src="${item.item_image }">
					<!---->
				</div>
				<div data-v-3f3398e6="" class="content-wrap"
					style="flex-direction: column;">
					<div data-v-3f3398e6="" class="content-left">
						<p data-v-3f3398e6="" class="content-name">${item.item_name }
						</p>
						<div data-v-3f3398e6="" class="content-price-wrap">
							<c:if test="${empty item.item_price_m_sub }">
								<p data-v-3f3398e6="" class="content-discounted-price">
									${item.item_price_m }원&nbsp;&nbsp;</p>
							</c:if>
							<c:if test="${not empty item.item_price_m_sub }">
								<p data-v-3f3398e6="" class="content-discounted-price">
									${item.item_price_m }원&nbsp;~&nbsp;</p>
								<p data-v-3f3398e6="" class="content-price">${item.item_price_m_sub }원</p>
								<!---->
							</c:if>
						</div>
						<p data-v-3f3398e6="" class="content-info">
							<!---->
							<!---->
						</p>
					</div>
					<div data-v-3f3398e6="" class="content-right"
						style="text-align: right; margin: 0px;">
						<div data-v-5b7f52e9="" data-v-3f3398e6=""
							style="width: 100%; margin-top: 5px;">
							<div data-v-5b7f52e9="" class="dropdown-btn">
								<input type="hidden" value="${item.item_tag_main }">
								<input type="hidden" value="${item.item_code }">
								<div data-v-5b7f52e9="" class="button dropdown">
									<div data-v-5b7f52e9="" class="dropdown-content">
										<span data-v-5b7f52e9=""> 선택 </span>
									</div>
									<div data-v-5b7f52e9="" class="dropdown-icon">
										<img data-v-5b7f52e9="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_arrow_down_s.png"
											alt="드롭다운 화살표" class="dropdown-icon">
									</div>
								</div>
								<!---->
							</div>
						</div>
					</div>
				</div>
			</div>
		</li>
	</c:forEach>
</ul>