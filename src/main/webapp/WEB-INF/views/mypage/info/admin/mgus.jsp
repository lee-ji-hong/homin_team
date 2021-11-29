<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="root" value="/" />
<style>
table {
	width: 400; height: 300;
}
</style>
<script>
	function deleteUser() {
		var dt = confirm('${allDto.id } 아이디를 정말 삭제하겠습니까?');
		if (dt == true)
			location.href='member/deleteUser?id=${allDto.id }';
		else
			return;
	}
</script>
<div>
	<c:import url="mypage/mypageNav.jsp"></c:import>
		
	<div>
		<div>
			<h3 style="font-size:24px;">회원 관리</h3>
		</div>
		<section>
			<br>
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
							<input type="button" value="수정"
							style="height:30px; width:40px; vertical-align:middle; margin:2; border-radius:5px;">
							<input type="button" value="삭제" onclick="deleteUser();"
							style="height:30px; width:40px; vertical-align:middle; margin:2; background-color:lightpink; border-radius:5px;">
							<input type="button" value="목록" onclick="location.href='${root}index?formpath=info/manage';"
							style="height:30px; width:40px; vertical-align:middle; border-radius:5px;">
						</td>
					</tr>
				</tbody>
			</table>
		</section>
	</div>
</div>
