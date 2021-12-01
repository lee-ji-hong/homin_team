<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/view.css" />   
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css" />   
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/board.css" />

<section class="content_section">
 	<form action="" method="post">
 	
 


 <div class="board_wrap">
        <div class="board_title">
        <strong>NOTICE</strong> 
        <hr style="width : 50px;">
        <p>공지사항을 전달드립니다.</p>
     	 </div>
      
      
        <div class="board_view_wrap">
        
            <div class="board_view">
            
            <div class="board_view_sub">
            
                <div class="notice_title">
                	<div class="notice_title_header">
                		<div>${dto.division }</div>
                	</div>
                </div>
                
                
                <div class="info">
                
                    <dl>
                        
                        <dd>${dto.title }</dd>
                    </dl>
                    
                    <dl>
                        <dt>작성일</dt>
                        <dd>${dto.writedate }</dd>
                    </dl>
                   
                </div>
            </div>
            
            <!-- 이미지 사진  -->
            
            <c:forEach var="file" items="${fileName }"> 
				<div> 
				<img src = "/img/${file }" style="width: 500px; height: 500px;"> 
				</div>
 			</c:forEach>
            
            <!-- 글자  -->    
                <div class="cont">
                    ${dto.content }
                </div>
                
  
            </div>
            
         
            
          
            
            <div class="bt_wrap">
             <div>
<%--              <input type=button style="width: 60px; " value='후기작성' onclick="location.href='${root}index?formpath=write'"/>  --%>
			<c:if test = "${sessionScope.id eq view.id }">
				<button formaction="${root }index?formpath=boardModifyCheck" style="width: 60px; ">수정</button>
				<button formaction="${root }index?formpath=boardDelete" style="width: 60px; ">삭제</button>
			</c:if>
			</div>
			<div>
			<input type=button style="width: 60px; " value='목록' onclick="location.href='${root}index?formpath=servicecenter&list=notice'"/>
             
            </div>
        </div>
    </div>
</div>    

	</form>
</section>