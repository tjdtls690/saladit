<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<article data-v-cf2fc18c="" data-v-267e36be="" class="add-confirm">
	<header data-v-2c0651a8="" data-v-cf2fc18c=""
		class="row--v-center page-header add-confirm__header page-header--padding page-header--modal">
		<nav data-v-2c0651a8="" class="page-header__nav-before">
			<button data-v-cf2fc18c="" data-v-2c0651a8=""
				class="add-confirm__back">
				<svg data-v-cf2fc18c="" xmlns="http://www.w3.org/2000/svg"
					width="24" height="24" viewBox="0 0 24 24"
					aria-labelledby="arrow-left-2" role="presentation" class="icon except1"
					data-v-2c0651a8="">
					<g fill="none" fill-rule="evenodd" class="except1"> <path fill="currentColor"
						fill-rule="evenodd" class="except1"
						d="M4.16 12.5l7.704 8.157a.5.5 0 0 1-.728.686l-8.5-9a.5.5 0 0 1 0-.686l8.5-9a.5.5 0 0 1 .728.686L4.16 11.5H21a.5.5 0 1 1 0 1H4.16z"></path></g></svg>
			</button>
		</nav>
		<button data-v-2c0651a8="" type="button"
			class="button-popup-close page-header__close">
			<i data-v-2c0651a8=""><svg data-v-2c0651a8=""
					xmlns="http://www.w3.org/2000/svg" width="24" height="24"
					viewBox="0 0 24 24" aria-labelledby="close" role="presentation"
					class="icon">
					<g fill="none" fill-rule="evenodd"> <path fill="currentColor"
						fill-rule="evenodd"
						d="M12.707 12l7.647 7.646a.5.5 0 0 1-.708.708L12 12.707l-7.646 7.647a.5.5 0 0 1-.708-.708L11.293 12 3.646 4.354a.5.5 0 1 1 .708-.708L12 11.293l7.646-7.647a.5.5 0 0 1 .708.708L12.707 12z"></path></g></svg></i>
		</button>
		<h2 data-v-2c0651a8="" class="col">주소 추가</h2>
		<!---->
	</header>
	<div data-v-cf2fc18c="" class="add-confirm__body">
		<p data-v-cf2fc18c="" class="add-confirm__address">
			<em data-v-cf2fc18c="" class="except1">${zonecode }</em> <span data-v-cf2fc18c="" class="except1">${addr }</span>
		</p>
		<form data-v-cf2fc18c="" class="add-confirm-form">
			<fieldset data-v-cf2fc18c="" class="form-fieldset">
				<legend data-v-cf2fc18c="">추가 주소옵션 입력 폼</legend>
				<div data-v-cf2fc18c="" class="add-confirm-form__address">
					<input data-v-8bb17226="" data-v-cf2fc18c="" type="text"
						name="f_addr_detail" placeholder="상세주소를 입력해주세요" autocorrect="off"
						autocapitalize="off" class="form-text">
				</div>
				<hr data-v-cf2fc18c="" class="except1">
				<div data-v-cf2fc18c="" class="form-field">
					<p data-v-cf2fc18c="" class="form-label">
						<label data-v-cf2fc18c="" for="f_dest_name" class="except1">배송지명</label>
					</p>
					<input data-v-8bb17226="" data-v-cf2fc18c="" id="f_dest_name"
						type="text" name="f_dest_name" placeholder="배송지명을 입력해주세요 ex) 우리집"
						autocorrect="off" autocapitalize="off" class="form-text">
				</div>
				<div data-v-cf2fc18c=""
					class="row--v-center add-confirm-form__set-default">
					<label data-v-2673f877="" data-v-cf2fc18c="" class="form-checkbox" class="except1"><input
						data-v-2673f877="" id="f_dest_is_main" type="checkbox"
						name="checkbox" value="false" class="except1"> <span data-v-2673f877="" class="except1"><svg class="except1 defaultBesongji2"
								data-v-2673f877="" xmlns="http://www.w3.org/2000/svg"
								viewBox="0 0 20 20">
								<path data-v-2673f877="" fill="currentColor" fill-rule="nonzero" class="except1"
									d="M8.489 13.597l7.304-7.304a1 1 0 0 1 1.414 1.414l-8 8a1 1 0 0 1-1.403.011l-4-3.875a1 1 0 1 1 1.392-1.436l3.293 3.19z"></path></svg></span></label>
					<label data-v-cf2fc18c="" for="f_dest_is_main" class="except1 defaultBesongji1">기본 배송지로 설정</label>
				</div>
			</fieldset>
			<nav data-v-cf2fc18c="" class="add-confirm-form__nav">
				<button data-v-a1c889e0="" data-v-cf2fc18c="" type="submit" title=""
					class="button button--size-large">
					<span data-v-a1c889e0="" class="button__wrap kakaoFinalRegistration">등록하기</span>
				</button>
			</nav>
		</form>
	</div>
</article>