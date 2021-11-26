<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="root" value="/" />
    <script>
    	
    </script>
<div>
	<div>
		<h1>고객정보</h1>
	</div>
	<div>
		<span>고객정보</span>&nbsp<span>${memberInfo.id }</span>
	</div>
	<div>
		<span>생년월일</span>&nbsp<span>${productInfo.product_no }</span>
	</div>
	<div>
		<span>휴대폰번호</span>&nbsp<span>${memberInfo.phone }</span>
	</div>
	
	<div>
		<h1>약관동의</h1>
	</div>
	<div>
		전체 동의
	</div>
	<div>
		<span><input type = "checkbox">[LG전자] 개인정보 수집 및 이용 동의 (필수)</span>
	</div>
	<div>
		<span>[LG전자] 개인정보 제 3자 제공 동의 (필수)</span>
	</div>
	<div>
		<span>[홈인] 개인정보 제 3자 제공 동의 (필수)</span>
	</div>
	<div>
		<input type = button value = "동의" onclick = "location.href='${root}index?formpath=order&prodNo=${productInfo.product_no }'">
	</div>
</div>