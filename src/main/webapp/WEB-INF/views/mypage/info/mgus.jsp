<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
table {
	width: 400; height: 300;
}
</style>
<div>
	<c:import url="mypage/mypageNav.jsp"></c:import>
		
	<div>
		<div>
			<h3>회원 관리</h3>
		</div>
		<section>
			<table>
				<thead>
					<tr>
						<td>항목</td><td>정보</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>회원번호</td><td>${allDto.no }</td>
					</tr>
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
							<input type="button" value="수정">
							<input type="button" value="삭제">
							<input type="button" value="목록" onclick="location.href='/homin/mypage/info/manage';">
						</td>
					</tr>
				</tbody>
			</table>
		</section>
	</div>
</div>
