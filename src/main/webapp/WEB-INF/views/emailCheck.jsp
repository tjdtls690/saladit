<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${check == 1}">
	<p data-v-5781a129="" class="validation">사용할 수 있는 이메일주소입니다.</p>
	<input type="hidden" class="validation" name="emailCheck" id="emailCheck" value="1">
</c:if>
<c:if test="${check == 0 }">
	<p data-v-5781a129="" class="validation error">이메일 형식이 올바르지 않습니다.</p>
	<input type="hidden" class="validation" name="emailCheck" id="emailCheck" value="0">
</c:if>
<c:if test="${check == 2 }">
	<p data-v-5781a129="" class="validation error">카카오로 가입된 계정입니다. 카카오로 로그인해 주세요.</p>
	<input type="hidden" class="validation" name="emailCheck" id="emailCheck" value="0">
</c:if>
<c:if test="${check == 3 }">
	<p data-v-5781a129="" class="validation error">구글로 가입된 계정입니다. 구글로 로그인해 주세요.</p>
	<input type="hidden" class="validation" name="emailCheck" id="emailCheck" value="0">
</c:if>
<c:if test="${check == 4 }">
	<p data-v-5781a129="" class="validation error">샐러딧 이메일로 가입된 계정입니다. 샐러딧 이메일로 로그인해 주세요.</p>
	<input type="hidden" class="validation" name="emailCheck" id="emailCheck" value="0">
</c:if>