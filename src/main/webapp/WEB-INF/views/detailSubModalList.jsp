<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<ul data-v-4837bb91="" class="toggle-drop-down">
	<c:forEach var="modal" items="${modal }">
		<li data-v-4837bb91="" class="">
			<div data-v-4837bb91="" class="detail-name-and-badge">
				<span data-v-4837bb91="" class="detail-name-and-badge-name-area">
					${modal.item_name }
				</span>
				<!---->
				<span data-v-4837bb91="" class="detail-price">
					<span data-v-4837bb91="">${modal.item_price_m }</span>
				</span>
			</div>
		</li>
	</c:forEach>
</ul>