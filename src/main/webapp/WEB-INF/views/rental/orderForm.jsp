<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="root" value="/" />
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<div>
	<div><h1>가입 예정 상품</h1></div>
	<hr/>
	<div>
		<img src = "${root }resources/image/${productInfo.classification }/${productInfo.product_filename}">
	</div>
	<div>${productInfo.product_no }</div>
	<div>${productInfo.product_name }</div>
	<div></div>
	<div>${productInfo.price }원</div>
	<div>계약기간</div>
	<div>방문주기</div>
	<div>
		<input type = "button" id = "orderBtn" value = "신청하기">
	</div>
</div>

<script>
	$("#orderBtn").click(function() {
		var IMP = window.IMP; // 생략가능
		IMP.init('imp15192515');		// 가맹점 식별코드
		IMP.request_pay({
			pg : 'inicis',				// PG사 선택
			pay_method : 'card',		// 결제 유형
			merchant_uid : 'merchant_' + new Date().getTime(),	// 가맹점에서 구별할 수 있는 고유한id
			name : '${productInfo.product_name}',			// 결제창에서 보여질 이름
			amount : /* ${productInfo.price} */100,					// 가격 
			buyer_email : '${memberInfo.email}',// 구매자 이메일
			buyer_name : '${memberInfo.nickname}',			// 구매자 이릅
			buyer_tel : '${memberInfo.phone}',	// 구매자 번호
			buyer_addr : '${memberPostcode.addr1}'+'${memberPostcode.addr2}',				// 구매자 주소
			buyer_postcode : '${memberPostcode.zipcode}',		
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