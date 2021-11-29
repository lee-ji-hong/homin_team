<%@ page language="java" contentType="text/html; charset=UTF-8"
    		pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

          <center>  
            <div class="notice_view_wrap">
        
            <div class="notice_view">
            
            <div class="notice_view_sub">
                <div class="title">
                    <h2>${view.title }</h2>
                </div>
                
                
                <div class="info">
                
                    <dl>
                        <dt>공지사항 구분</dt>
                      <dd>${dto.division }</dd>
                    </dl>
                    
                    <dl>
                        <dt>작성일</dt>
                        <dd>${dto.writedate }</dd>
                    </dl> 
                </div>
            </div>
       
            
            <!-- 글자  -->    
                <div class="cont">
                    ${dto.content }
                </div>    
            </div>        
            </div>
          </center>