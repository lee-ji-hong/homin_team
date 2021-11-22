<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/faq.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css" />   
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/board.css" />   

 <section class="content_section">
        <div class="content_row_1">
          <table class="board_table">
            <caption>
              문의사항 게시판
            </caption>
            <thead>
              <tr>
                <th>구분</th>
                <th>제목</th>
                <th>작성일</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="all" items="${all }">
			<tr>
				<td>${all.division }</td>
				<td><a href = "index?formpath=servicecenter&list=noticeView&num=${all.no }">${all.title }</a></td>
				<td>${all.writedate }</td>
			</tr>
		</c:forEach>
            </tbody>
          </table>
        </div>
        
        <div class="content_row_3">
          <span class="list_prev_btn">문의사항 이전 버튼</span>
          <a href="#">1</a>
          <a href="#">2</a>
          <a href="#">3</a>
          <span class="list_next_btn">문의사항 다음 버튼</span>
        </div>
      </section>
      
      
