<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="root" value="/" />
<meta
      name="viewport"
      content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no"
    />
<c:url var="root" value="/" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/board2.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/board.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css" />
<script>
	function loginForm() {
		alert('먼저 로그인해주세요');
		location.href='${root}index?formpath=login';
	}
</script>
<div id="wrap">
	<section class="info_section">
        <ul class="info_list">
          <c:choose>
			<c:when test="${empty sessionScope.id }">
				<li>
            		<img src="${pageContext.request.contextPath}/resources/image/cart2.png" onclick="loginForm()"/>
          		</li>
	       		<li>
	            	<a  href="${root}index?formpath=login "> 로그인 </a>
	          	</li>
          	</c:when>
			<c:otherwise>
				<li>
					<a href="${root }index?formpath=mypage">${sessionScope.nickname }님의 마이 | </a>
				</li>
				<li>
            		<a href="${root}index?formpath=basket"><img src="${pageContext.request.contextPath}/resources/image/cart2.png" />  </a>
          		</li>
				<li>
					<a  href="${root}logout ">로그아웃</a>
				</li>
			</c:otherwise>
		</c:choose>
		
          <li>
            <a href=""> | </a>
          </li>
          <li>
            <a href="${root}index?formpath=servicecenter&list=faq">고객센터</a>
          </li>
          <li>
            <a href="">
              <img src="${pageContext.request.contextPath}/resources/image/search2.png" />
            </a>
          </li>
        </ul>
      </section>
      
      
      
      <header class="header">
      
        <h1 class="logo">
          <a href="${root}index?formpath=home ">
			<img src="https://lghomin.com/_resources/ea91048d/client/img/icon_logo_main.6f114ba.svg" />
			 
		  </a>
        </h1>
       
       
        <nav class="nav">
          <ul class="gnb">
            <li>
              <a href="index.html">인테리어</a
              ><span class="sub_menu_toggle_btn">하위 메뉴 토글 버튼</span>
            </li>
            <li>
              <a href="introudce.html">렌탈/케어</a
              ><span class="sub_menu_toggle_btn">하위 메뉴 토글 버튼</span>
            </li>
            <li>
              <a href="gallery.html">생활용품</a
              ><span class="sub_menu_toggle_btn">하위 메뉴 토글 버튼</span>
            </li>
            <li>
              <a href="board.html">문의사항</a
              ><span class="sub_menu_toggle_btn">하위 메뉴 토글 버튼</span>
            </li>
          </ul>
        </nav>
        <span class="menu_toggle_btn">전체 메뉴 토글 버튼</span>
      </header>
</div>
<hr>
<!--  <table width=900>
	
	<tr align="right">
		<td width=600></td>
		<td><a href="${root}index?formpath=home ">홈</a></td>

		<c:choose>
			<c:when test="${empty sessionScope.id }">
				<td><a class= "out_thing" href="${root}index?formpath=login ">로그인</a></td>
			</c:when>
			<c:otherwise>
				<td><a class= "out_thing" href="${root}logout ">로그아웃</a></td>
			</c:otherwise>
		</c:choose>

		<td><a class= "out_thing" href="${root}index?formpath=member ">회원가입</a></td>
		<td><a class= "out_thing" href="${root}memberListProc">회원목록</a></td>
		<td><a class= "out_thing" href="${root}index?formpath=servicecenter&list=faq">고객센터</a></td>
		<td  ><a class= "out_thing" href="${root}boardProc">게시판</a></td>
	</tr>
	<tr>
		<td align="center" colspan=5><hr /></td>
	</tr>
</table>-->


