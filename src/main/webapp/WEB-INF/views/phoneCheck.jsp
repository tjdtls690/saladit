<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div data-v-5781a129="" class="form-field-group">
	<div data-v-5781a129="" class="row">
		<div data-v-5781a129="" class="col">
			<input data-v-8bb17226="" data-v-5781a129="" type="tel" name="f_tel"
				placeholder="" autocorrect="off" autocapitalize="off" id="f_tel"
				class="form-text" value="${phone }">
		</div>
		<div data-v-5781a129="" class="col-4">
			<button data-v-a1c889e0="" data-v-5781a129="" type="button" title=""
				class="button" id="phoneCheck">
				<span data-v-a1c889e0="" class="button__wrap">재요청</span>
			</button>
		</div>
	</div>
	<div data-v-5781a129="" class="row">
		<div data-v-5781a129="" class="col">
			<input data-v-8bb17226="" data-v-5781a129="" type="tel" id="certification"
				name="f_tel_code" placeholder="" autocorrect="off"
				autocapitalize="off" class="form-text">
		</div>
		<div data-v-5781a129="" class="col-4">
			<button data-v-a1c889e0="" data-v-5781a129="" type="button" title=""
				class="button" id="certificationBtn">
				<span data-v-a1c889e0="" class="button__wrap">인증하기</span>
			</button>
		</div>
	</div>
	<!---->
</div>
<input type="hidden" class="validation" name="phoneCheckValue" id="phoneCheckValue" value="0">