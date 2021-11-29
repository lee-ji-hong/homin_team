<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/rental.css" />
<c:url var="root" value="/" />
<div class="rental-header">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	function basketProduct(no) {
		checkLogin();
		
		var d = {noTemp : no}
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
				alert("장바구니 추가 오류");
			}
		})
	}
	
	function checkLogin() {
		var id = '${sessionScope.id}';
		if (id == "") {
			alert('먼저 로그인해주세요');
			location.href='${root}index?formpath=login';
		} else {
			return;
		}
		
	}
	
</script>

<style>
#product {
	float: left;
}
</style>

<c:choose>

	<c:when test="${category eq 'dryer' }">
		<div class="top_img_banner">
			<img src="https://pubfiles.lghomin.com/files/images/00/6c15fe5489144368885504b7a9a672a8/6d4aa27735544d298ba165d506899a14.jpg">
		</div>
		<div class="rental-header-text">건조기</div>
		
	</c:when>
	<c:when test="${category eq 'waterpurifier' }">
		<div class="rental-header-text">정수기</div>
	</c:when>
	<c:when test="${category eq 'aircleaner' }">
		<div class="rental-header-text">공기청정기</div>
	</c:when>
	<c:when test="${category eq 'washmachine' }">
		<div class="rental-header-text">식기세척기</div>
	</c:when>
	<c:when test="${category eq 'microwave' }">
		<div class="rental-header-text">전기레인지</div>
	</c:when>
	<c:otherwise>
		<div class="rental-header-text">얼음정수기 냉장고</div>
	</c:otherwise>

</c:choose>
</div>

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