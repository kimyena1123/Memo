<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
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
				<form id="loginForm">
				<input type="text" class="form-control mt-2" placeholder="아이디" name="user_id" id = "login_id">
				<input type="password" placeholder="비밀번호" class="form-control mt-2" name="user_pw" id="login_pw">
				
				<button type="submit" class="btn btn-primary btn-block mt-2" id="loginBtn">로그인</button>
 			
 				<div class="text-center mt-4"><a href="/user/signup/view">회원가입</a></div>
 				</form>
 			</div>
 			
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
	
	<script>
		$(document).ready(function(){
			$("#loginForm").on("submit", function(e){
			//$("#loginBtn").on("click", function(){
				
				//해당 이벤트의 기능을 모두 취소한다
				//preventDefault : 브라우저에서 구현된 기본 동작을 취소해준다.
    			//폼 이벤트 : 폼이 제출되면 새로고침되는 기본동작을 취소
				e.preventDefault();
				
				let user_id = $("#login_id").val();
				let user_pw = $("#login_pw").val();
				
				//input 빈 값이라면
				if(user_id == ""){
					alert("아이디를 입력해주세요");
					return;
				}
				if(user_pw == ""){
					alert("비밀번호를 입력해주세요");
					return;
				}
				
				$.ajax({
					type: 'post',
					url: '/user/signin',
					data: {
						"user_id" : user_id,
						"user_pw" : user_pw,
					},
					success:function(res){
						if(res.result){ // 로그인 성공
							alert('로그인 성공');
							location.href="/post/list/view";
						}else{ // 로그인 실패
							alert("아이디 또는 비밀번호가 일치하지 않습니다.");
							location.reload();
						}
					},
					error:function(err){
						alert('login error');
					}
				})
			})
		})
	</script>
</body>
</html>