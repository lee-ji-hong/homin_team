<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/faq.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/view.css" />   
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css" />   
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/board.css" />


<c:url var="root" value="/" />

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>




<script type="text/javascript">
	$(document).ready(function (e){
    	$("input[type='file']").change(function(e){
			$('#preview').empty();
			var files = e.target.files;
      		var arr = Array.prototype.slice.call(files);
     		for(var i=0;i<files.length;i++){
       			if(!checkExtension(files[i].name,files[i].size)){
          			return false;
        		}
			}
      preview(arr);
    });
    function checkExtension(fileName,fileSize){
    	var regex = new RegExp("(.*?)\.(jpg|png|img)$");
    	var maxSize = 52428800;
    	if(fileSize >= maxSize){
    		alert('파일 사이즈 초과');
    		$("input[type='file']").val("");
    		return false;
    	}
      
      if(!(regex.test(fileName))){
    	  alert('사진만 등록 가능합니다.');
    	  $("input[type='file']").val("");
    	  return false;
    }
      return true;
    }
    
    function preview(arr){
    	arr.forEach(function(f){
    		var fileName = f.name;
    		if(fileName.length > 10){
    			fileName = fileName.substring(0,7)+"...";
    		}
        var str = '<div style="display: inline-flex; padding: 10px;"><li>';
        str += '<span>'+fileName+'</span><br>';
        if(f.type.match('image.*')){
        	var reader = new FileReader();
        	reader.onload = function (e) {
            str += '<img src="'+e.target.result+'" title="'+f.name+'" width=100 height=100 />';
            str += '</li></div>';
            $(str).appendTo('#preview');
        }
        	reader.readAsDataURL(f);
        }else{
			str += '<img src="/resources/img/fileImg.png" title="'+f.name+'" width=100 height=100 />';
         	$(str).appendTo('#preview');
        }
      });
    	}
	});
	
	function rmv(i) {
		document.getElementById('img'+i).remove();
	 }
	
	$( document ).ready(function() {
		$(".star_rating a").click(function() {
			$(this).parent().children("a").removeClass("on");
			$(this).addClass("on").prevAll("a").addClass("on");
			var starRate = $(this).attr('id');
			$("#review_star").val(starRate);
			     return false;
			});
		});

</script>

<center>
<form action="${root }boardModifyProc" method="post" enctype="multipart/form-data">
<input type="hidden" name="no" value="${view.no }"/>
<table style="width: 650px; ">
	<tr>
		<td style="width: 570px; height:40px;">
			<input type=text name='title' style="width: 500px; " value="${view.title }"/> 
		</td>
	</tr>
	<tr>
		<td colspan=2 align="right">
			<textarea name="content" style="width: 650px; height: 300px">${view.content }</textarea>
		</td>
	</tr>
	<tr>
		<td align='right' height=40 colspan=2>
			<input type="file" name="uploadFile" id="uploadFile" multiple> 
		</td>
	</tr>
	<c:forEach var="file" items="${fileName }" varStatus="status">
		<tr id = "img${status.index}">
			<td colspan = 2 style = "width: 150px; height: 150px;" valign="top" id = >
				<input type = "hidden" name = "img" value = "${file }">
				<div ><img src = "/img/${file }"style="width: 100px; height: 100px;"></div><input type = "button" onclick = "rmv(${status.index})" value = "x">
			</td>
		</tr>
	</c:forEach>
	<tr>
		<td><div id="preview"></div></td>
	</tr>
	<tr>
		<td align='center' height=40 colspan=2>
			<input type=submit value='수정' style="width: 120px; "/>
			<input type=button value='취소' onclick = "location.href='${root}boardProc'" style="width: 120px; "/>	 
		</td>
	</tr>
	<tr>
		<td>별점</td>
	</tr>
	<tr>
	  	<td class="star_rating">
	     	<a href="#" class="on" id="1">★</a>
			<a href="#" class="on" id="2">★</a>
			<a href="#" class="on" id="3">★</a>
			<a href="#" id="4">★</a>
			<a href="#" id="5">★</a>
	   		<input type="hidden" id="review_star" name="review_star" value="3">
		</td>
	</tr>
</table>
</form> 
</center>