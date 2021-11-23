<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<c:url var="root" value="/" />
<div>
	<c:forEach var="wash" items="${category }">
	<div style="width: 250px; height: 500px;">
		<div>
			<img src="${root }resources/image/wash/${wash.product_filename}" style="width: 200px; height: 300px;">
		</div>
		<div>
			<div>${wash.product_no }</div>
			<div>${wash.product_name }</div>
			<div>
				<div>
					<span>월</span> <span>가격</span> <span>원</span>
				</div>
			</div>
		</div>
	</div>
	</c:forEach>
</div>