<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		
		<section class="contents d-flex justify-content-center">
			<div class="join-box my-5">
				<h2 class="text-center">회원가입</h2>
				<input type="text" class="form-control mt-2" placeholder="아이디" name="user_id" id = "join_id">
				<input type="password" placeholder="비밀번호" class="form-control mt-2" name="user_pw" id="join_pw">
				<input type="password" placeholder="비밀번호 확인" class="form-control mt-2" id="join_pw_check">
				<input type="password" placeholder="이름" class="form-control mt-2" name="user_name" id="join_name">
				<input type="text" placeholder="이메일" class="form-control mt-2" name="user_email" id="join_email">
				<button type="button" class="btn btn-primary btn-block mt-2" id="joinBtn">회원가입</button>
 			</div>
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
	
	
	<script>
		$(document).ready(function(){
			$("#joinBtn").on("click", function(){
				let user_id = $("#join_id").val();
				let user_pw = $("#join_pw").val();
				let user_pw_check = $("#join_pw_check").val();
				let user_name = $("#join_name").val();
				let user_email = $("#join_email").val();
				
				//input이 빈 값이라면
				if(user_id == ""){
					alert("아이디를 입력해주세요");
					return;
				}
				if(user_pw == ""){
					alert('비밀번호란을 채워주세요');
					return;
				}
				if(user_name == ""){
					alert('이름을 적어주세요');
					return;
				}
				if(user_email == ""){
					alert("이메일을 입력해주세요");
					return;
				}
				if(user_pw != user_pw_check){
					alert("비밀번호가 일치하지 않습니다.");
					return;
				}
				
				$.ajax({
					type: 'post',
					url: '/user/signup',
					data: {
						"user_id" : user_id,
						"user_pw" : user_pw,
						"user_name": user_name,
						"user_email": user_email,
					},
					success:function(res){
						if(res.result){ // true라면 insert 성공
							location.href="/user/signin/view";
						}else{
							alert("insert 실패");
						}
					},
					error:function(err){
						alert("insert error");
					}
				})
			})//회원가입 버튼
		}) // jquery
	</script>
</body>
</html>