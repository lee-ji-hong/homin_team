<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="root" value="/" />

<c:choose>
	<c:when test="${category eq 'dryer' }">
		<div>건조기</div>
	</c:when>
	<c:when test="${category eq 'waterpurifier' }">
		<div>정수기</div>
	</c:when>
	<c:when test="${category eq 'aircleaner' }">
		<div>공기청정기</div>
	</c:when>
	<c:when test="${category eq 'washmachine' }">
		<div>식기세척기</div>
	</c:when>
	<c:when test="${category eq 'microwave' }">
		<div>전기레인지</div>
	</c:when>
	<c:otherwise>
		<div>얼음정수기 냉장고</div>
	</c:otherwise>
</c:choose>
<%-- <c:import url="/${category }" /> --%>
<c:forEach var="pr" items="${product }">
	<div style="width: 250px; height: 500px;" onclick="location.href='${root}index?formpath=product&prodNo=${pr.product_no }'">
		<div>
			<img src="${root }resources/image/${pr.classification }/${pr.product_filename}" style="width: 200px; height: 300px;">
		</div>
		<div>
			<div>${pr.product_no }</div>
			<div>${pr.product_name }</div>
			<div>
				<div>
					<span>월</span> <span>가격</span> <span>${pr.price }원</span>
				</div>
			</div>
		</div>
	</div>
	</c:forEach>