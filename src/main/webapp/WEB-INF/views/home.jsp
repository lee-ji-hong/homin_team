<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="root" value="/" />
<head>
<link rel="stylesheet" href="${root }resources/swiper/swiper.min.css">  
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css" />   
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/index.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/board.css" />

<style>
	.swiper-pagination-bullet {
		width: 12px;
		height: 12px;
		background: transparent;
		border: 1px solid purple;
		opacity: 1;
		margin-top: 15px;
		margin-left: 10px;
	}
	
	.swiper-pagination-bullet-active {
		width: 40px;
		transition: width .5s;
		border-radius: 5px;
		background: purple;
		border: 1px solid transparent;
	}
</style>
</head>
<body>
	<div>
		<div style="width: 1200px;">
			<div class="swiper-container" style="width: 100%;">
				<div class="swiper-wrapper">
					<div class="swiper-slide">
						<img src="${root }resources/image/test1.jpg" style="width: 100%;">
					</div>
					<div class="swiper-slide">
						<img src="${root }resources/image/test2.jpg" style="width: 100%;">
					</div>
					<div class="swiper-slide">
						<img src="${root }resources/image/test3.jpg" style="width: 100%;">
					</div>
				</div>
			</div>
			<div class="swiper-button-prev"></div>
			<div class="swiper-button-next"></div>
			<div class="swiper-pagination" style="width: 1200px;"></div>
			<script src="${root }resources/swiper/swiper.min.js"></script>
		</div>
		<br><br>
		
		<!--  -->
		<div class="lent_option-wrap">
		
			<div class="lent_option_box">
				<div><a href = "${root }index?formpath=rental&category=dryer"><img src = "${root }resources/image/1.png"></a></div>
				<div>건조기</div>
			</div>
			<div class="lent_option_box">
				<div><a href = "${root }index?formpath=rental&category=waterpurifier"><img src = "${root }resources/image/2.png"></a></div>
				<div>정수기</div>
			</div>
			<div class="lent_option_box">
				<div><a href = "${root }index?formpath=rental&category=aircleaner"><img src = "${root }resources/image/3.png"></a></div>
				<div>공기청정기</div>
			</div>
			<div class="lent_option_box">
				<div><a href = "${root }index?formpath=rental&category=washmachine"><img src = "${root }resources/image/4.png"></a></div>
				<div>식기세척기</div>
			</div>
			<div class="lent_option_box">
				<div><a href = "${root }index?formpath=rental&category=microwave"><img src = "${root }resources/image/5.png"></a></div>
				<div>전기레인지</div>
			</div>
			<div class="lent_option_box">
				<div><a href = "${root }index?formpath=rental&category=refrigerator"><img src = "${root }resources/image/6.png"></a></div>
				<div>얼음정수기<br>냉장고</div>
			</div>
		
		</div>
		
		<br><br>
		<div><strong>지금 가장 핫한 상품.</strong></div>
		<div>
			<ul>
				<li>
					<div style="width: 300px;">
						<div><img src = "${root }resources/image/test.png"></div>
						<div>카테고리 들어갈곳.</div>
						<div>제품명 들어갈곳.</div>
						<div>가격 들어갈곳.</div>
					</div>
				</li>
			</ul>
		</div>
		<br><br>
		<div><strong>렌탈 추천 상품.</strong></div>
		<div>
			<ul>
				<li>
					<div style="width: 300px;">
						<div><img src = "${root }resources/image/test.png"></div>
						<div>제품번호 들어갈곳.</div>
						<div>카테고리 들어갈곳.</div>
						<div>제품명 들어갈곳.</div>
						<div>가격 들어갈곳.</div>
					</div>
				</li>
			</ul>
		</div>
	</div>
</body>

<script>
	var mySwiper = new Swiper('.swiper-container', {
		navigation : {
			prevEl : '.swiper-button-prev',
			nextEl : '.swiper-button-next',
		},
		autoplay : {
			delay : 2000,
			disableOnInteraction: false,
		},
		pagination : {
			el : '.swiper-pagination',
			type : 'bullets',
			clickable : true,
		},
	});
</script>