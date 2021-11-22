<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="root" value="/" />

<c:choose>
	<c:when test="${category eq dryer }">
		<div>건조기</div>
	</c:when>
	<c:when test="${category eq dryer }">
		<div>건조기</div>
	</c:when>
	<c:when test="${category eq dryer }">
		<div>건조기</div>
	</c:when>
	<c:when test="${category eq dryer }">
		<div>건조기</div>
	</c:when>
	<c:when test="${category eq dryer }">
		<div>건조기</div>
	</c:when>
</c:choose>
<c:import url="/${category }" />