<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/rental.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/index.css" />
<c:url var="root" value="/" />
<div class="rental-header">
		<!-- 배너 -->
		<c:choose>

			<c:when test="${category eq 'dryer' }">
				<div class="top_img_banner">
					<img src="https://pubfiles.lghomin.com/files/images/00/035912ef3d3e4fac974b2aacf41e910e/4f0342ca0cdc424f9a454ce787af35d3.jpg">
				</div>
			</c:when>
			<c:when test="${category eq 'waterpurifier' }">
				<div class="top_img_banner">
					<img src="https://pubfiles.lghomin.com/files/images/00/6c15fe5489144368885504b7a9a672a8/6d4aa27735544d298ba165d506899a14.jpg">
				</div>
			</c:when>
			<c:when test="${category eq 'aircleaner' }">
				<div class="top_img_banner">
					<img src="https://pubfiles.lghomin.com/files/images/00/dd66c1517ebd4f2b909a99870f6f8ff4/08d07575b1a1413ba98fa691a984098c.jpg">
				</div>
			</c:when>
			<c:when test="${category eq 'washmachine' }">
				<div class="top_img_banner">
					<img src="https://pubfiles.lghomin.com/files/images/00/2ba228e1c37345f8b8824bef4ada2d97/d8cab035e69d4694831cda2911475795.jpg">
				</div>
			</c:when>
			<c:when test="${category eq 'microwave' }">
				<div class="top_img_banner">
					<img src="https://pubfiles.lghomin.com/files/images/00/48a73c48097541b78d8e5e48e0f95c49/46f36aaf44924daca8dda5109b74a544.jpg">
				</div>
			</c:when>
			<c:otherwise>
				<div class="top_img_banner">
					<img src="https://pubfiles.lghomin.com/files/images/00/c9198319b01f4ddab705b708de5eec54/ab23b92bdb1040b7a9dcbde96f3d4ff9.jpg">
				</div>
			</c:otherwise>
		
		</c:choose>
		
		<!-- 카테고리 -->
		<div class="lent_option-wrap" style="padding:0;">
		
			<div class="lent_option_box">
				<div><a href = "${root }index?formpath=rental&category=dryer"><img src = "${root }resources/image/1.png"></a></div>
				<div><p>건조기</p></div>
			</div>
			<div class="lent_option_box">
				<div><a href = "${root }index?formpath=rental&category=waterpurifier"><img src = "${root }resources/image/2.png"></a></div>
				<div><p>정수기</p></div>
			</div>
			<div class="lent_option_box">
				<div><a href = "${root }index?formpath=rental&category=aircleaner"><img src = "${root }resources/image/3.png"></a></div>
				<div><p>공기청정기</p></div>
			</div>
			<div class="lent_option_box">
				<div><a href = "${root }index?formpath=rental&category=washmachine"><img src = "${root }resources/image/4.png"></a></div>
				<div><p>식기세척기</p></div>
			</div>
			<div class="lent_option_box">
				<div><a href = "${root }index?formpath=rental&category=microwave"><img src = "${root }resources/image/5.png"></a></div>
				<div><p>전기레인지</p></div>
			</div>
			<div class="lent_option_box">
				<div><a href = "${root }index?formpath=rental&category=refrigerator"><img src = "${root }resources/image/6.png"></a></div>
				<div><p>얼음정수기냉장고</p></div>
			</div>
		
		</div>	
		
<c:choose>

	<c:when test="${category eq 'dryer' }">	
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

<section class="container-home-section">
<c:forEach var="pr" items="${product }">
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
		</div>
	</div>
</c:forEach>
</section>