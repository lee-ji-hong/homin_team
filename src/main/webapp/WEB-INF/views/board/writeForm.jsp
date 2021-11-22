<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="root" value="/" />

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<style type="text/css">
  .star_rating {font-size:0; letter-spacing:-4px;}
  .star_rating a {
      font-size:22px;
      letter-spacing:0;
      display:inline-block;
      margin-left:5px;
      color:#ccc;
      text-decoration:none;
  }
  .star_rating a:first-child {margin-left:0;}
  .star_rating a.on {color:#777;}
</style>


<script type="text/javascript">
	// 문서가 준비되면 매개변수로 넣은 콜백 함수를 실행하라는 의미.
	$(function(){
    	$("input[type='file']").change(function(e){
     	 	//div 내용 비워주기
			$('#preview').empty();
			var files = e.target.files;
      		var arr = Array.prototype.slice.call(files);
      		//업로드 가능 파일인지 체크
     		for(var i=0;i<files.length;i++){
       		if(!checkExtension(files[i].name,files[i].size)){
          	return false;
        	}
		}
      preview(arr);
    });//file change
    function checkExtension(fileName,fileSize){
      var regex = new RegExp("(.*?)\.(jpg|png|img)$");
      var maxSize = 52428800;  //50MB
      if(fileSize >= maxSize){
        alert('파일 사이즈 초과');
        $("input[type='file']").val("");  //파일 초기화
        return false;
      }
      if(!(regex.test(fileName))){
        alert('사진만 등록 가능합니다.');
        $("input[type='file']").val("");  //파일 초기화
        return false;
      }
      return true;
    }
    function preview(arr){
      arr.forEach(function(f){
        //파일명이 길면 파일명...으로 처리
        var fileName = f.name;
        if(fileName.length > 10){
          fileName = fileName.substring(0,7)+"...";
        }
        //div에 이미지 추가
        var str = '<div style="display: inline-flex; padding: 10px;"><li>';
        str += '<span>'+fileName+'</span><br>';
        //이미지 파일 미리보기
        if(f.type.match('image.*')){
          var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
          reader.onload = function (e) { //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
            //str += '<button type="button" class="delBtn" value="'+f.name+'" style="background: red">x</button><br>';
            str += '<img src="'+e.target.result+'" title="'+f.name+'" width=100 height=100 />';
            str += '</li></div>';
            $(str).appendTo('#preview');
          } 
          reader.readAsDataURL(f);
        }else{
			str += '<img src="/resources/img/fileImg.png" title="'+f.name+'" width=100 height=100 />';
         	$(str).appendTo('#preview');
        }
      });//arr.forEach
    	}
	});
	
	$(function(){
		$(".star_rating a").click(function() {
			$(this).parent().children("a").removeClass("on");
			$(this).addClass("on").prevAll("a").addClass("on");
			 var starRate = $(this).attr('id');
			$("#review_star").val(starRate);
			     return false;
			});
			$('#writeBtn').click(function(){
				var title = $('#title').val();
				if(title == ''){
					 $('#msg1').css('display', 'block');
					 $('#title').focus();
					 return;
				}
				var content = $('#content').val();
				if(content == ''){
					 $('#msg2').css('display', 'block');
					 $('#content').focus();
					 return
				}
				$('#f').submit();
			})
		$("#title").blur(function() {
			var title = $('#title').val();
			if (title != '') {
				$('#msg1').css('display', 'none');
			}
		});
		$("#content").blur(function() {
			var content = $('#content').val();
			if (content != '') {
				$('#msg2').css('display', 'none');
			}
		});
	});
</script>

<center>
<form action="${root }writeProc" method="post" enctype="multipart/form-data" id = "f">
<table style="width: 650px; ">
	<tr>
		<td style="width: 570px; height:40px;">
			<input type=text name='title' id = "title" style="width: 500px; " placeholder = "제목을 입력하세요."/> 
			<span style="display: none;" id = "msg1">필수 사항입니다.</span>
		</td>
	</tr>
	<tr>
		<td colspan=2 align="right"><textarea name="content" id = "content" style="width: 650px; height: 300px" placeholder = "내용을 입력하세요."></textarea>
		<span style="display: none;" id = "msg2">필수 사항입니다.</span>
		</td>
	</tr>
	<tr>
		<td align='right' height=40 colspan=2>
			<input type="file" name="uploadFile" id="uploadFile" multiple> 
		</td>
	</tr>
	<tr>
		<td><div id="preview"></div></td>
	</tr>
	<tr>
		<td align='center' height=40 colspan=2>
			<input type="button" value='글쓰기' style="width: 120px;" id = "writeBtn" />
			<input type=reset value='취소' style="width: 120px; "/>	 
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

