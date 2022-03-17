<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

	<div data-v-2706028c="" class="selected-detail-wrap">
		<div data-v-2706028c="" class="selected-detail" style="margin-bottom: 8px;">
			<img data-v-2706028c=""  class="selected-detail__close img-fade-in" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/Logo_close.png">
			<div data-v-2706028c="" class="selected-detail__title">
				${name }
			</div>
			<div data-v-2706028c="" class="selected-detail__text">
				<span data-v-2706028c="" class="selected-detail__text-label">
					사이즈 - 
				</span> 
					${size }
			</div>
			<div data-v-2706028c="" class="selected-detail__text">
				<span data-v-2706028c="" class="selected-detail__text-label">
					기간 - 
				</span> 
					${week }주
			</div>
			<div data-v-2706028c="" class="selected-detail__text">
				<span data-v-2706028c="" class="selected-detail__text-label">
					시작(수령)일 - 
				</span> 
					${start } (${day}) 
					<c:if test="${day =='월' || day =='목'}">
						<span data-v-2706028c="">/ 월·목 수령</span>
					</c:if>
					<c:if test="${day =='화' || day =='금'}">
						<span data-v-2706028c="">/ 화·금 수령</span>
					</c:if>
					<c:if test="${day =='수' || day =='토'}">
						<span data-v-2706028c="">/ 수·토 수령</span>
					</c:if>
			</div>
		</div>
		<div data-v-2706028c="" class="select-detail-info-text-wrap">
			본 구성은 프코가 추천하는 식단으로 기본 세팅되어 있습니다. 
			<span data-v-2706028c="">상품 변경을 원하실 경우 자유롭게 메뉴를 변경해보세요.</span>
		</div>
		<button data-v-a1c889e0="" data-v-2706028c="" type="button" title="" class="button btn btn-close selected-detail__btn button--outline2">
			<span data-v-a1c889e0="" class="button__wrap">식단 확인 및 변경</span>
		</button>
	</div>