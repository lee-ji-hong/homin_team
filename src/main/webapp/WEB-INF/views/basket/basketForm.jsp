<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="root" value="/" />
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<script>
function iamport(){
	//가맹점 식별코드
	IMP.init('imp15192515');
	IMP.request_pay({
	    pg : 'inicis',
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : '정수기' , 		// 결제창에서 보여질 이름
	    amount : 100, 									// 실제 결제되는 가격
	    buyer_email : '',			// 구매자 이메일
	    buyer_name : '',			// 구매자 이름
	    buyer_tel : '',				// 구매자 번호
	    buyer_addr : '',			// 구매자 주소
	    buyer_postcode : ''	// 구매자 우편번호
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
	        	alert("결제 및 결제검증완료");
	        	//location.href='${root}index?formpath=home';
        	} else {
        		alert("결제 실패");
        	}
        });
	});
}
</script>
<c:url var="root" value="/" />
<c:if test="${not empty msg }">
	<script>
		alert('${msg}');
		location.href='${root}index?formpath=rental&category=dryer'
	</script>
</c:if>
<div>
	<c:import url="mypage/mypageNav.jsp"></c:import>

	<section>
		<h3>장바구니</h3>
		<table>
			<thead>
				<tr>
					<td>제품분류</td><td>제품번호</td><td>제품명</td><td>대여료(월)</td><td>삭제</td>
				</tr>
				
			</thead>
			<tbody>
				<c:set var="total" value="0"></c:set>
				<c:set var="count" value="0"></c:set>
				<c:forEach var="bDto" items="${basket }">
					<tr>
						<td>${bDto.classification }</td>
						<td>${bDto.product_no }</td>
						<td>${bDto.product_name }</td>
						<td>${bDto.price }</td>
						<td><input type="button" value="삭제" onclick="location.href='deleteBasket?no=${bDto.product_no}';">
						<c:set var="total" value="${total + bDto.price }"></c:set>
						<c:set var="count" value="${count + 1 }"></c:set>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="5"><hr></td>
				</tr>
				<tr>
					<td colspan="3" align="right">총 개수 : </td><td> <c:out value="${count }"></c:out></td>
				</tr>
				<tr>
					<td colspan="3" align="right">총 금액 : </td><td> <c:out value="${total }"></c:out></td><td><input type="button" value="신청하기" onclick = "iamport()"></td>
				</tr>
			</tbody>
		</table>
	</section>
</div>