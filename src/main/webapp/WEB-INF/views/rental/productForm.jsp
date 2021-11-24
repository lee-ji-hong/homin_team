<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="root" value="/" />
<link rel="stylesheet" href="${root }resources/swiper/swiper.min.css">  

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
	<div style="display: flex;flex-direction: row;s">
		<div>
			<span>${product.product_no }</span>
			<h2>
				<span>${product.product_name }</span>
			</h2>
			<p>대충 여기에 제품 설명.</p>
			<div>
				<span>#연관 태그</span>
			</div>
			<div class="swiper-container" style="width: 300px;">
				<div class="swiper-wrapper">
					<div class="swiper-slide">
						<img src="${root }resources/image/${product.classification }/${product.product_filename}" style="width: 100%;">
					</div>
				</div>
			</div>
			<div class="swiper-button-prev"></div>
			<div class="swiper-button-next"></div>
			<div class="swiper-pagination" style="width: 300px;"></div>
			<script src="${root }resources/swiper/swiper.min.js"></script>
		</div>
		<div>
			<div>
				<span>계약 기간</span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<span>2년</span>
			</div>
			<div>
				<span>방문 주기</span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<span>6개월마다 1회</span>
			</div>
			<div>
				<span>월 이용 요금</span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<span>${product.price }</span>
			</div>
			<div>
				<button id="check_module" type="button" onclick = "location.href='${root}index?formpath=productOrder&prodNo=${product.product_no }'">이용 신청</button>
				<button type="button">장바구니 담기</button>
			</div>
		</div>
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