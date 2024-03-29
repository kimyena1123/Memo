<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메모 입력</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>

	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		
		<section class="d-flex justify-content-center">
			<div class="input-box my-5">
				<h1 class="text-center">메모 입력</h1>
				
				<div class="d-flex mt-4">
					<label class="col-2">제목 : </label>
					<input type="text" class="form-control col-10" name="post_title" id="post_title">
				</div>
				
				<div class="mt-3">
					<textarea rows="10" class="form-control" name="post_content" id="post_content"></textarea>
				</div>
				
				<div class="mt-2">
					<input type="file" id="post_file" name="post_file">
				</div>
				
				<div class="d-flex justify-content-between mt-3">
					<a href="/post/list/view" class="btn btn-info">목록으로</a>
					<button type="button" class="btn btn-primary" id="saveBtn">저장</button>
				</div>
			</div>
		</section>
		
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>


	<script>
		$(document).ready(function(){
			
			$("#saveBtn").on("click", function(){
				let post_title = $("#post_title").val();
				let post_content = $("#post_content").val();
				
				
				//input 빈 값 유효성 검사
				if(post_title == ""){
					alert("제목을 입력해주세요");
					return;
				}
				if(post_content == ""){
					alert("내용을 입력해주세요");
					return;
				}
				
				let formData = new FormData();
				formData.append('post_title',post_title);
				formData.append('post_content', post_content)
				//파일 한 개만해서 files[0]
				formData.append('file', $("#post_file")[0].files[0]);
				
				
				$.ajax({
					method: 'post',
					url: '/post/create',
					data: formData,
					enctype:"multipart/form-data", // 파일업로드 필수 항목
					processData:false, // 파일 업록드 필수 항목
					contentType:false, // 파일 업로드 필수 항목
					success:function(res){
						if(res.result){
							alert("post insert 성공");
							location.href='/post/list/view';
						}else{
							alert("post insert 실패");
						}
					},
					error:function(err){
						alert('post memo upload error');
					}
				})
			})
		})
	</script>
	
	
</body>
</html>