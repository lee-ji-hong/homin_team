<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="root" value="/" />
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	function basketProduct(no) {
		var d = {no : no}
		
		$.ajax({
			url : "basketProduct",
			type : "POST",
			data : JSON.stringify(d),
			contentType : "application/json; charset=utf-8",
			dataType : 'json',
			success : function(result) {
				alert(result.msg);
			},
			error : function() {
				alert(result.msg);
			}
		})
	}
	
	function deleteProduct() {
		document.getElementById("product_name").innerHTML="";
		document.getElementById("price").innerHTML="";
	}
	
</script>

<style>
#product {
	float: left;
}
</style>

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
<div id="product">
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
		<div>
			<input type="button" value="장바구니에 담기" onclick="basketProduct('${pr.product_no }' );">
		</div>
	</c:forEach>
</div>
<div id="basket">
	<h3>장바구니</h3>
	<table style="width: 450;">
		<thead>
			<tr>
				<td>제품명</td><td>대여료(월)</td><td>취소</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td id="product_name"></td><td id="price"></td><td><input type="button" value="삭제" onclick="deleteProduct()"></td>
			</tr>
			<tr>
				<td colspan="3" align="center"> <input type="button" value="결제"> </td>
			</tr>
		</tbody>
	</table>
</div>