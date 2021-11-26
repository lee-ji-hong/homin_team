<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="root" value="/"></c:set>
<div>
	<c:import url="mypage/mypageNav.jsp"></c:import>
	
	<div style="width: 1200">
		<div>
			<h3>안녕하세요. ${sessionScope.nickname }님</h3>
			<h3>좌측 배너에서 원하시는 서비스를 골라주세요.</h3>
		</div>
	</div>
</div>