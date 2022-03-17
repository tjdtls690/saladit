<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<c:if test="${check == 0 }">
	<path fill="currentColor" fill-rule="nonzero"
		d="M3.455 8.138a.5.5 0 0 0-.69.724l8.946 8.5a.5.5 0 0 0 .689 0l8.944-8.5a.5.5 0 0 0-.688-.724l-8.6 8.172-8.601-8.172z"></path>
</c:if>

<c:if test="${check == 1 }">
	<path fill="currentColor" fill-rule="nonzero"
		d="M3.455 16.362a.5.5 0 0 1-.69-.724l8.946-8.5a.5.5 0 0 1 .689 0l8.944 8.5a.5.5 0 0 1-.688.724l-8.6-8.172-8.601 8.172z"></path>
</c:if>