<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="root" value="/" />

<c:choose>
	<c:when test="${category eq dryer }">
		<div>건조기</div>
	</c:when>
	<c:when test="${category eq waterpurifier }">
		<div>정수기</div>
	</c:when>
	<c:when test="${category eq aircleaner }">
		<div>공기청정기</div>
	</c:when>
	<c:when test="${category eq washmachine }">
		<div>식기세척기</div>
	</c:when>
	<c:when test="${category eq microwave }">
		<div>전기레인지</div>
	</c:when>
	<c:otherwise>
		<div>얼음정수기 냉장고</div>
	</c:otherwise>
</c:choose>
<c:import url="/${category }" />