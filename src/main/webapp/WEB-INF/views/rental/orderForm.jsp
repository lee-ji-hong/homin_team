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
		<input type = "button" id = "orderBtn" onclick = "iamport()" value = "신청하기">
	</div>
</div>

<script>
function iamport(){
	//가맹점 식별코드
	IMP.init('imp15192515');
	IMP.request_pay({
	    pg : 'inicis',
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : '${productInfo.product_name }' , 		// 결제창에서 보여질 이름
	    amount : 100, 									// 실제 결제되는 가격
	    buyer_email : '${memberInfo.email}',			// 구매자 이메일
	    buyer_name : '${memberInfo.nickname}',			// 구매자 이름
	    buyer_tel : '${memberInfo.phone}',				// 구매자 번호
	    buyer_addr : '${memberPostcode.addr1}',			// 구매자 주소
	    buyer_postcode : '${memberPostcode.zipcode}'	// 구매자 우편번호
	}, function(rsp) {		// 콜백
		console.log(rsp);
		// 결제검증
		$.ajax({
        	type : "POST",
        	url : "${root}check/" + rsp.imp_uid 
        }).done(function(data) {
        	console.log(data);
        	// 위의 rsp.paid_amount 와 data.response.amount를 비교한후 로직 실행 (import 서버검증)
        	if(rsp.paid_amount == data.response.amount){
        		var d = {
        	    		uid : data.response.impUid,
        	    		buyerpostcode : data.response.buyerPostcode,
        	    		buyername : data.response.buyerName,
        	    		email : data.response.buyerEmail,
        	    		addr : data.response.buyerAddr,
        	    		tell : data.response.buyerTel,
        	    		amount : data.response.amount,
        	    		name : data.response.name
        	   		}
	        	alert("결제 및 결제검증완료");
	        	$.ajax({
	            	url : "${root}orderDB",
	        		type : "POST",
	    			contentType : "application/json; charset=utf-8",
	            	data : JSON.stringify(d),
	        	}); 
        	} else {
        		alert("결제 실패");
        	}
        });
	});
}
</script>