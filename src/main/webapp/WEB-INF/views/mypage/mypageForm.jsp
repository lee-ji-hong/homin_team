<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="root" value="/"></c:set>
<div>
	<c:import url="mypage/mypageNav.jsp"></c:import>
	
	<div>
		<div>
			<h3>안녕하세요. ${sessionScope.nickname }님</h3>
		</div>
	</div>
</div>