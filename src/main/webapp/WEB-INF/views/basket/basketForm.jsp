<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="root" value="/" />
<style>
	input{appearance:auto;}
</style>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/board.css" />   
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/mypage.css" /> 
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<c:if test="${not empty msg }">
	<script>
		alert('${msg}');
		location.href='${root}index?formpath=rental&category=dryer'
	</script>
</c:if>
<script>
function iamport(){
	//가맹점 식별코드
	IMP.init('imp15192515');
	IMP.request_pay({
	    pg : 'inicis',
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : '여러개' , 		// 결제창에서 보여질 이름
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
	        	$.ajax({
	            	url : "orderDB?prNo=${productInfo.product_no}",
	        		type : "POST",
	    			contentType : "application/json; charset=utf-8",
	            	data : JSON.stringify(d),
	            	success : function(){
	        			location.href = "${root}index?formpath=orderfinish&no="+data.response.impUid+"&prodNo=${productInfo.product_no}";
					},
					error : function(){
						alert("문제")
					}
	        	});
        	} else {
        		alert("결제 실패");
        	}
        });
	});
}
	

	var result = 0;
	function allCheck(){
		var len = document.getElementsByName("box");
		if(document.getElementById("all").checked==true){
			result = 0;
	    	for(var i=0; i < len.length;i++) {
	    		len[i].checked=true;  
	    		result += Number(document.getElementById("pr"+i).value);
	    		document.getElementById('price').innerText = result;
	    		document.getElementById('result').innerText = len.length;
	    	}
	    }
		if(document.getElementById("all").checked==false){
	    	for(var i=0;i<len.length;i++) {
	   			len[i].checked=false; 
	   			result = 0;
	    		document.getElementById('price').innerText = 0;
	    		document.getElementById('result').innerText = 0;
	    	}
	    }
	}
	
	function sumCheck(no){
		var len = document.getElementsByName("box").length;
		if(document.getElementsByName("box")[no].checked == false){
			$("input:checkbox[id='all']").prop("checked", false);
		}
		getCheckedCnt();
		getCheckedPrice(no);
	}
	
	function getCheckedPrice(no){
		var len = document.getElementsByName("box");
        if (document.getElementsByName("box")[no].checked == true) {
        	result += Number(document.getElementById("pr"+no).value);
	    	document.getElementById('price').innerText = result;
        }else{
        	result -= Number(document.getElementById("pr"+no).value);
           	document.getElementById('price').innerText = result;
        }
	}
	
	function getCheckedCnt()  {
		  // 선택된 목록 가져오기
		  const query = 'input[name="box"]:checked';
		  const selectedElements = 
		      document.querySelectorAll(query);
		  // 선택된 목록의 갯수 세기
		  const selectedElementsCnt =
		        selectedElements.length;
		  // 출력
		  document.getElementById('result').innerText
		    = selectedElementsCnt;
		}
</script>
<div class="bascket_test">
	<c:import url="mypage/mypageNav.jsp"></c:import>

	<section>
		<h3>장바구니</h3>
		<table>
			<thead>
				<tr>
					<td><input type = "checkbox" onclick = "allCheck()" id = "all">전체선택</td><td>제품분류</td><td>제품사진</td><td>제품번호</td><td>제품명</td><td>가격</td><td>삭제</td>
				</tr>
				
			</thead>
				<c:set var="total" value="0"></c:set>
				<c:set var="prNo" value="0"></c:set>
				<c:forEach var="bDto" items="${basket }">
				<tbody>
					<tr>
						<td><input type = "checkbox" id = "pr${prNo }" name = "box"  onclick='sumCheck(${prNo})' value = "${bDto.price }"></td>
						<c:choose>
							<c:when test="${bDto.classification eq 'dryer' }">	
								<td>건조기</td>
							</c:when>
							<c:when test="${bDto.classification eq 'waterpurifier' }">
								<td>정수기</td>
							</c:when>
							<c:when test="${bDto.classification eq 'aircleaner' }">
								<td>공기청정기</td>
							</c:when>
							<c:when test="${bDto.classification eq 'washmachine' }">
								<td>식기세척기</td>
							</c:when>
							<c:when test="${bDto.classification eq 'microwave' }">
								<td>전기레인지</td>
							</c:when>
						<c:otherwise>
								<td>얼음정수기/냉장고</td>
							</c:otherwise>
						</c:choose>
						<td><img src = "${root }resources/image/${bDto.classification}/${bDto.product_img}" style="width: 150px;height: 150px;"
								onclick = "location.href='${root}index?formpath=product&category=${bDto.classification }&prodNo=${bDto.product_no }'"></td>
						<td onclick = "location.href='${root}index?formpath=product&category=${bDto.classification }&prodNo=${bDto.product_no }'">${bDto.product_no }</td>
						<td onclick = "location.href='${root}index?formpath=product&category=${bDto.classification }&prodNo=${bDto.product_no }'"><strong>${bDto.product_name }</strong></td>
						<td>${bDto.price }</td>
						<td><input type="button" value="삭제" onclick="location.href='deleteBasket?no=${bDto.product_no}';">
						<c:set var="total" value="${total + bDto.price }"></c:set>
						<c:set var="prNo" value="${prNo + 1 }"></c:set>
				</c:forEach>
						<tr>
							<td colspan="5"><hr></td>
						</tr>
						<tr>
							<td colspan="3" align="right">총 개수 : </td><td><label id = "result"></label></td>
						</tr>
						<tr>
							<td colspan="3" align="right">총 금액 : </td><td><label id = "price"></label></td><td><input type="button" value="신청하기" onclick = "iamport()"></td>
						</tr>
				</tbody>
		</table>
	</section>
</div>