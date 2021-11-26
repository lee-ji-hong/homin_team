<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/rental.css" />
<c:url var="root" value="/" />
<div class="rental-header">
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
<c:forEach var="pr" items="${product }">
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD

	<div  class="main-product-list" onclick="location.href='${root}index?formpath=product&prodNo=${pr.product_no }'">
		<div class="main-product-list-in">
			<ul>
				<li>
					<div class="main-product-text ">
						<div class="main-product-tex-in ">
							<img src="${root }resources/image/${pr.classification }/${pr.product_filename}" >
						</div>
						<div>
							<div class="pro-category">${pr.product_no }</div>
							<div class="pro-name">${pr.product_name }</div>
							<div class="pro-price">
								<div>
									<span>월</span> <span>가격</span> <span>원</span>
								</div>
							</div>
						</div>
					</div>	
				</li>	
			</ul>
=======
=======
>>>>>>> parent of 7f20390 (렌탈페이지 수정)
=======
>>>>>>> parent of 7f20390 (렌탈페이지 수정)
	<div style="width: 250px; height: 500px;" onclick="location.href='${root}index?formpath=product&prodNo=${pr.product_no }'">
		<div>
			<img src="${root }resources/image/${pr.classification }/${pr.product_filename}" style="width: 200px; height: 300px;">
		</div>
		<div>
			<div>${pr.product_no }</div>
			<div>${pr.product_name }</div>
			<div>
				<div>
<<<<<<< HEAD
<<<<<<< HEAD
					<span>월</span> <span>가격</span> <span>${pr.price }원</span>
				</div>
			</div>
>>>>>>> main
=======
					<span>월</span> <span>가격</span> <span>원</span>
				</div>
			</div>
>>>>>>> parent of 7f20390 (렌탈페이지 수정)
=======
					<span>월</span> <span>가격</span> <span>원</span>
				</div>
			</div>
>>>>>>> parent of 7f20390 (렌탈페이지 수정)
		</div>
	</div>
	</c:forEach>