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
                	
                	<div class="notice_title_bottom">
	                	<div><span>${dto.title }</span></div>
	                	<div><span>${dto.writedate }</span></div>
                	</div>
                    
                </div>
                
                
                <div class="info">
                
                    <dl>
                        <dt>글쓴이</dt>
                        <dd>${view.id }</dd>
                    </dl>
                    
                    <dl>
                        <dt>작성일</dt>
                        <dd>${view.writeTime }</dd>
                    </dl>
                    <dl>
                        <dt>조회</dt>
                        <dd>${view.hit }</dd>
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
                
                
            <div class="board-comment-wrap">
            	<p>댓글</p>
			<div class= "board-comment-text">
			
				<div>
					<div class="board-comment-text-in">
					<textarea id="comment" name="comment" cols="50" rows="2" placeholder = "댓글을 입력하세요."></textarea>
					<input type="button" value="등록" id = "commentWrite" onclick = "commentProc()">
					</div>
					
				</div>
			</div>
			
			<div id="comment" class=".board-comment-review">
				<div>
					<div>
						<c:forEach var="com" items="${comment }">
						<div class="comment-log_review">
							<div class="comment-log_review_ch1">${com.id }</div>
							<div class="comment-log_review_ch2">
								<div>${com.comment_content }</div>
							</div>
						<div class="comment-log_review_bottom_wrap">
							<div>${com.writetime }</div>
							
						<c:if test = "${sessionScope.id eq com.id}">
							<div  onclick = "commentDelete(${com.comment_no})">삭제</div>

						</c:if>
						</div>		
					    </div>
						
						</c:forEach>
					</div>
					
						
				</div>
				
				</div>
		</div>    
                
                
            </div>
            
         
            
          
            
            <div class="bt_wrap">
             <div>
             <input type=button style="width: 60px; " value='후기작성' onclick="location.href='${root}index?formpath=write'"/> 
			<c:if test = "${sessionScope.id eq view.id }">
				<button formaction="${root }index?formpath=boardModifyCheck" style="width: 60px; ">수정</button>
				<button formaction="${root }index?formpath=boardDelete" style="width: 60px; ">삭제</button>
			</c:if>
			</div>
			<div>
			<input type=button style="width: 60px; " value='목록' onclick="location.href='${root}boardProc'"/>
            
            </div>
        </div>
    </div>
</div>    

	</form>
</section>