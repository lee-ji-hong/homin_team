<%@ page contentType="text/html; charset=UTF-8"    %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

   
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/faq.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/review.css" />   
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css" />   
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/board.css" />   


<c:url var="root" value="/" />
<center>
<section class="content_section">



 	 <div class="board_wraps">  
 	 <div class="board_title">
        <strong>review</strong> 
        <hr style="width : 50px;">
        <p>상품 사용 후기입니다.</p>
      </div>
      <div class="board_list_wrap" style="width: 1200px;">
        <div class="board_list">
          <div class="top">
            <div class="num">구분</div>
            <div class="photo" >사진</div>
            <div class="title">제목</div>
            <div class="star">별점</div>
            <div class="writer">제품명</div>
            <div class="date">작성일</div>
            <div class="count">조회</div>
          </div>
          
          
      	<c:forEach var="list" items="${boardList }">
          <div>
            <div class="num">${list.no }</div>
            <div class="photo"><img src = "${root }resources/image/test.png" style="width: 150px; height: 150px;"></div>
            <c:choose>
			<c:when test="${list.fileName eq null || list.fileName eq ''}">
				<div id="${list.no }" class="title"><a href = 'viewProc?num=${list.no }'>${list.title }</a></div>
			</c:when>
			<c:otherwise>
				<div id="${list.no }" class="title"><a href = 'viewProc?num=${list.no }'>${list.title }  <img src = "${root }resources/image/img.png" style="width: 15px; height: 15px;"></a></div>
			</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${list.review_star eq 1 }">
					<div class="star"><img src = "${root }resources/image/ico_point1.png"></div>
				</c:when>
				<c:when test="${list.review_star eq 2 }">
					<div class="star"><img src = "${root }resources/image/ico_point2.png"></div>
				</c:when>
				<c:when test="${list.review_star eq 3 }">
					<div class="star"><img src = "${root }resources/image/ico_point3.png"></div>
				</c:when>
				<c:when test="${list.review_star eq 4 }">
					<div class="star"><img src = "${root }resources/image/ico_point4.png"></div>
				</c:when>
				<c:otherwise>
					<div class="star"><img src = "${root }resources/image/ico_point5.png"></div>
				</c:otherwise>
			</c:choose>
            <div class="writer">캣타워</div>
            <div class="date">${list.writeTime }</div>
            <div class="count">${list.hit }</div>
          </div>
          </c:forEach>
     </div>
 </div>
     <!-- 페이징 부분  -->
	<div class="board_row">
		${page}
	</div>
	
	<div class="board_row_bottom">
			    
	    <!-- 검색 부분  -->
	    <form action="#" method="get">
		<table>
			<tr>
				<td>
					<select  name="select">
						<option value="title">제목</option>
						<option value="content">내용</option>
						<option value="id">작성자</option>
					</select>
					<input type=text name='search'/>
					<input type=submit name='searchBtn' value='검색' style="width: 80px; "/>
				</td>
			</tr>
		</table>
		</form>
		
		<!-- 글쓰기버튼 -->
	    <div class="write_box">
	    	<c:if test="${sessionScope.id ne null }">
	       		<input type="button" value='후기작성'  onclick="location.href='${root }index?formpath=write'" />
	        </c:if>
	    </div>
	    
	</div>

</section>

</center>