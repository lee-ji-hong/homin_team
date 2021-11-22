<%@ page contentType="text/html; charset=UTF-8"%>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function ajaxIsExist() {
		var i = document.getElementById('id').value;
		var d = {
			id : i
		}
		$.ajax({
			url : "isExistId",
			type : "POST",
			data : JSON.stringify(d), //문자열을 json타입으로 변환
			contentType : "application/json; charset=utf-8", //보낼 데이터 유형
			dataType : 'json', //return 타입 json으로 지정
			success : function(result) {
				$('#msg').text(result.msg)
			},
			error : function() {
				alert("문제 발생")
			}
		})
	}

	function sendAuth() {
		var e = document.getElementById('email').value;
		if (e == "") {
			$('#msg').text('이메일을 입력하세요.');
			return;
		}
		var s = {
			email : e
		}
		$.ajax({
			url : "sendAuth",
			type : "POST",
			data : JSON.stringify(s),
			contentType : "application/json;charset=utf-8",
			dataType : "json",
			success : function(result) {
				$('#msg').text(result.msg)
			},
			error : function() {
				$('#msg').text('인증번호 전송 Error')
			}
		})
	}

	function sendAuthConfirm() {
		var i = document.getElementById('inputAuthNum').value;
		if (i == "") {
			$('#msg').text('인증번호를 입력하세요.');
			return;
		}
		var s = {
			inputAuthNum : i
		}
		$.ajax({
			url : "authConfirm",
			type : "POST",
			data : JSON.stringify(s),
			contentType : "application/json;charset=utf-8",
			dataType : "json",
			success : function(result) {
				$('#msg').text(result.msg)
			},
			error : function() {
				$('#msg').text('인증번호 확인 Error')
			}
		})
	}
	function daumPost() {
		new daum.Postcode({
			onComplete : function(data) {
				var addr = "";
				if (data.userSelectedType === "R") {//도로명 주소일 경우( R )
					addr = data.roadAddress;
				} else {//지번일 경우( J )
					addr = data.jibunAddress;
				}
				document.getElementById("zipcode").value = data.zonecode;
				document.getElementById("addr1").value = addr;
				document.getElementById("addr2").focus();
			}
		}).open();
	}
</script>
<script>
	src="https//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js">
</script>
<center>
<div>
	<a href="/homin"><img style="width: 100;" alt="" src="https://static.mylgid.com/userweb/1.0.28/images/logo_bi_SVC0000026.png"></a>
</div>
<hr>
	<h3>회원정보 입력</h3>
	<p>MY LG ID 가입을 위해 정보를 입력해주세요.</p>
	<h3>
		<font color="red" id="msg">${msg }</font>
	</h3>
	<form action="memberProc" method="post">
		<table>
			<tr>
				<td align='right' height=40 >아이디</td>
				<td><input type=text name='id' id="id" style="width: 225px;"placeholder='이메일주소를 입력해주세요' /></td>
				<td colspan="2"><input type="button" value="중복 확인"
					onclick="ajaxIsExist()"></td>
			</tr>
			<tr>
				<td align='right' width=120>이름</td>
				<td colspan="3"><input type=text name='nickname' style="width: 175px;" />
			</tr>
			<tr>
				<td align='right' height=40>패스워드</td>
				<td><input type="password" name='pw' placeholder='pw 입력' /></td>
				<td align='right'>패스워드 확인</td>
				<td><input type="password" name='pwOk' placeholder='pw 입력' /></td>
			</tr>
			<tr>
				<td align='right' height=40>E-Mail</td>
				<td><input type=text name='email' id="email" placeholder='E-Mail 입력' /></td>
				<td colspan="2"><input type="button" value="인증번호 전송"	onclick="sendAuth()"></td>
			</tr>
			<tr>
				<td align='right'>인증번호</td>
				<td><input type=text name='authNum' id="inputAuthNum"	placeholder='인증번호 입력' /></td>
				<td colspan="2"><input type="button" value="인증번호 확인"	onclick="sendAuthConfirm()"></td>
			</tr>
			<tr>
				<td align='right'>우편번호</td>
				<td><input type=text name='zipcode' id="zipcode"	readonly="readonly" /></td>
				<td colspan="2"><input type="button" value="우편번호 검색"		onclick="daumPost()"></td>
			</tr>
			<tr>
				<td align='right'>주소</td>
				<td colspan="3"><input type=text name='addr1' id="addr1" readonly="readonly" style="width: 475px;" /></td>
			</tr>
			<tr>
				<td align='right'>상세주소</td>
				<td colspan="3"><input type=text name='addr2' id="addr2" style="width: 475px;" /></td>
			</tr>
			<tr>
				<td align='right'>휴대폰번호</td>
				<td colspan='3'><input type=text name='phone' style="width: 175px;" />
			</tr>
			<tr>
				<td align='center' height=40 colspan=4>
				<input type=submit		value='가입' style="width: 120px;" /> 
				<input type=reset value='취소'	style="width: 120px;" /></td>
			</tr>
		</table>
	</form>
</center>
