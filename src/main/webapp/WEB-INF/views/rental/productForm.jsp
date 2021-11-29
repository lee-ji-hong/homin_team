<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="root" value="/" />
<link rel="stylesheet" href="${root }resources/swiper/swiper.min.css">  
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/rental.css" />

<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.8.js"></script>


<style>

.swiper-button-next {
	background: url(/godiva/img/common/next.png) no-repeat;
	background-size: 50% auto;
	background-position: center;
}

.swiper-button-prev {
	background: url(/godiva/img/common/prev.png) no-repeat;
}

.swiper-button-next::after, .swiper-button-prev::after {
	display: none;
}
</style>

<div class="rental-detail-header">

 	<ul>
 		<li>
 		<a href="${root}index?formpath=home ">홈</a>
 		</li>
 		<li> > </li>
<c:choose>

	<c:when test="${category eq 'dryer' }">	
		<li ><a>건조기</a></li>
	</c:when>
	<c:when test="${category eq 'waterpurifier' }">
		<li ><a>정수기</a></li>
	</c:when>
	<c:when test="${category eq 'aircleaner' }">
		<li ><a>공기청정기</a></li>
	</c:when>
	<c:when test="${category eq 'washmachine' }">
		<li ><a>식기세척기</a></li>
	</c:when>
	<c:when test="${category eq 'microwave' }">
		<li ><a>전기레인지</a></li>
	</c:when>
	<c:otherwise>
		<li class="rental-header-text"><a>얼음정수기 냉장고</a></li>
	</c:otherwise>

</c:choose>
	<li> > </li>
	<li><a href="">현재 상품</a></li>
	</ul>
</div>

<section class="product_detailpg_wrap">
	<div class="product_selling">
			<div class="swiper-container" >
				<div class="swiper-wrapper">
					<div class="swiper-slide">
						<img src="${root }resources/image/${product.classification }/${product.product_filename}">
					</div>	
				</div>
			</div>
			<div class="swiper-button-prev"></div>
			<div class="swiper-button-next"></div>
			<div class="swiper-pagination" style="width: 300px;"></div>
			<script src="${root }resources/swiper/swiper.min.js"></script>
		
	</div>	
	
	<div class="product_selling_text">
			<div class="product_selling_text_header">
				<p>${product.product_no }</p>
				<h2>
					<span>${product.product_name }</span>
				</h2>		
			</div>		
			<div class="product_selling_text_body">
				
				<p style="margin-top: 20px;">대충 여기에 제품 설명.</p>
			
			<div class="product_selling_text_body_ch1">
				<span>#연관 태그</span>
			</div>
		 
			<div class="product_selling_text_comment">
				<div class="selling_text_comment_1">
					<p>계약 기간</p><p>2년</p>
				</div>
				<div class="selling_text_comment_1">
					<p>방문 주기</p><p>6개월마다 1회</p>
				</div>
				<div class="selling_text_comment_1">
					<p style="margin-right: 75px;">월 이용 요금</p><p>${product.price }</p>
				</div>
			
			</div>
				<div class="product_selling_text_btn">
					<div class="product_selling_text_btn_a">
						<button   class="product_selling_text_btn_bt1" id="check_module" type="button" onclick = "location.href='${root}index?formpath=productOrder&prodNo=${product.product_no }'">이용 신청</button>
					</div>
					<div class="product_selling_text_btn_b">
						<button  class="product_selling_text_btn_bt2" type="button">장바구니 담기</button>
					</div>
				</div>
				
			</div>
	  </div>
	
	
	
</section>
			
<div class="product_detailpg_contents">
	<ul>
	<li>상품정보</li>
	<li>리뷰</li>
	<li>배송환불</li>
	</ul>
	</div>	

<script>
	var mySwiper = new Swiper('.swiper-container', {
		navigation : {
			prevEl : '.swiper-button-prev',
			nextEl : '.swiper-button-next',
		},
		/* autoplay : {
			delay : 2000,
			disableOnInteraction: false,
		}, */
		pagination : {
			el : '.swiper-pagination',
			type : 'bullets',
			clickable : true,
		},
	});
</script>