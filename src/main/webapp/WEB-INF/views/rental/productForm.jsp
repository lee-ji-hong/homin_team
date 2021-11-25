<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="root" value="/" />
<link rel="stylesheet" href="${root }resources/swiper/swiper.min.css">  

<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>


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
<div>
	<span>${product.product_no }</span>
	<h2>
		<span>${product.product_name }</span>
	</h2>
	<p>대충 여기에 제품 설명.</p>
	<div>
		<span>#연관 태그</span>
	</div>
</div>
<div style="width: 300px;">
			<div class="swiper-container" style="width: 100%;">
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

	<p>결제 테스트</p>
	<button id="check_module" type="button">결제</button>

<script>
	$("#check_module").click(function() {
		var IMP = window.IMP; // 생략가능
		IMP.init('imp15192515');		// 가맹점 식별코드
		IMP.request_pay({
			pg : 'inicis',				// PG사 선택
			pay_method : 'card',		// 결제 유형
			merchant_uid : 'merchant_' + new Date().getTime(),	// 가맹점에서 구별할 수 있는 고유한id
			name : '주문명:결제테스트',			// 결제창에서 보여질 이름
			amount : 1000,					// 가격 
			buyer_email : 'iamport@siot.do',// 구매자 이메일
			buyer_name : '테스트',			// 구매자 이릅
			buyer_tel : '010-1234-5678',	// 구매자 번호
			buyer_addr : '서울',				// 구매자 주소
			buyer_postcode : '123-456',		
			m_redirect_url : 'https://www.yourdomain.com/payments/complete'	// 결제후 돌아갈 url
		
		}, function(rsp) {
			console.log(rsp);
			if (rsp.success) {
				var msg = '결제가 완료되었습니다.';
				msg += '고유ID : ' + rsp.imp_uid;
				msg += '상점 거래ID : ' + rsp.merchant_uid;
				msg += '결제 금액 : ' + rsp.paid_amount;
				msg += '카드 승인번호 : ' + rsp.apply_num;
			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
			}
			alert(msg);
		});
	});
</script>



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