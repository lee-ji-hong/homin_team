<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="root" value="/" />
<c:if test="${msg ne null }">
	<script>alert('${msg}');</script>
</c:if>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	$(function(){
		$("#submitCheck").click(function() {
			var pw = $('#pw').val();
			var pwOk = $('#pwOk').val();
			
			if(pw == ''){
				$('#pw').focus();
				return;
			}
			if(pwOk == ''){
				$('#pwOk').focus();
				return;
			}
			if(pw != pwOk){
				alert('입력하신 정보가 일치하지 않습니다.');
				$('#pw').val('');
				$('#pwOk').val('');
				return;
			}
			$('#f').submit();
		});
	});
</script>
<center>
<form action="boardModify" method="post" id = "f">
<input type="hidden" name="no" value="${no }" />
<table>
	<tr>
		<td>패스워드 </td>
		<td><input type=password style="width: 175; height:30; vertical-align:middle; margin:5;"
		name='pw' id = "pw" placeholder='PW 입력'/></td>
	</tr>
	<tr>
		<td>패스워드 확인</td>
		<td><input type=password style="width: 175; height:30; vertical-align:middle; margin:5;"
		name='pwOk' id = "pwOk" placeholder='PW 입력'/></td>
	</tr>
	<tr>
		<td colspan=2 align='center'>
			<input type=button value='확인' style="width: 75; height: 30; font-size: 15; border-radius:10px; color:#FFFFFF; background-color:#B71256;"
					 id = "submitCheck"/>
			<input type=reset value='취소' style="width: 75; height: 30; font-size: 15; border-radius:10px;"
			onclick = "javascript:history.back()"/> 
		</td>
	</tr>
</table>
</form>
</center>