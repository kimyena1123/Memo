<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<link rel="stylesheet" href="/static/css/style.css" type="text/css">
    
    <header class="d-flex justify-content-between align-items-center">
		<h1 class="pt-2 pl-2">Memo</h1>
		
		<!-- 세션에 "usession_user_index" 라는 키에 값이 있다면 로그인된 상태 -->
		<c:if test="${not empty session_user_index }">
		<div class="mr-3">${session_user_name }님 <a href="/user/signout">로그아웃</a></div>
		</c:if>
		
	</header>