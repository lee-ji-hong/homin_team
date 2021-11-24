<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="root" value="/" />
<meta
      name="viewport"
      content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no"
    />
<c:url var="root" value="/" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/board2.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/board.css" />
<div id="wrap">
<div id="header-wrap">
	<section class="info_section">
		<div>
	        <ul class="info_list">
	          
	          <li>
	            <a href="${root}index?formpath=servicecenter&list=faq">고객센터</a>
	          </li>
	          <li>
	            <a href=""> | </a>
	          </li>
	          <c:choose>
				<c:when test="${empty sessionScope.id }">
		          <li>
		            <a  href="${root}index?formpath=login "> 로그인 </a>
		          </li>
	          	</c:when>
				<c:otherwise>
					<li>
						<a  href="${root}logout ">로그아웃</a>
					</li>		
				</c:otherwise>
			  </c:choose>
	
	          
	        </ul>
	   </div>  
	   <div>
	        <ul class="info_list" >
	        	<li>
		            <a href="">
		              <img src="${pageContext.request.contextPath}/resources/image/search2.png" />
		            </a>
	            </li>
	            <li>
		           	<a href="">
		           		<img src="${pageContext.request.contextPath}/resources/image/cart2.png" />  
		           	</a>
	            </li>
	        </ul>
        </div>
      </section>
      
      
      
      <header class="header">
      
        <h1 class="logo">
          <a href="${root}index?formpath=home ">
			<img src="https://lghomin.com/_resources/ea91048d/client/img/icon_logo_main.6f114ba.svg" />
			 
		  </a>
        </h1>

      </header>
</div>      
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


