<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="root" value="/" />
<c:if test="${not empty msg }">
	<script>alert('${msg}')</script>
</c:if>
<style>
table {
	width: 400; height: 200;
}
</style>
<div>
	<c:import url="mypage/mypageNav.jsp"></c:import>
		
	<div>
		<div>
			<h3>회원 관리 정보</h3>
		</div>
		<section>
			<div>
				<h4>MY LG ID 회원 정보</h4>
			</div>
			<div>
				<p>MY LG ID 홈페이지에서 회원 정보를 변경할 수 있습니다.</p>
			</div>
			<table>
				<tr>
					<td>아이디</td><td>${allDto.id }</td>
				</tr>
				<tr>
					<td>비밀번호</td><td>******</td>
				</tr>
				<tr>
					<td>이름</td><td>${allDto.nickname }</td>
				</tr>
				<tr>
					<td>휴대폰번호</td><td>${allDto.phone }</td>
				</tr>
				<tr>
					<td>이메일</td><td>${allDto.email }</td>
				</tr>
				<tr>
					<td colspan="2" align="right">
						<input type="button" value="수정" onclick="location.href='${root}index?formpath=mgmt/confirmPwForUdMb'">
						<input type="button" value="회원탈퇴" onclick="location.href='${root}index?formpath=mgmt/confirmPw'">
					</td>
				</tr>
				
			</table>
		</section>
	</div>
</div>
