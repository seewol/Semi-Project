<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<br><br>
	<c:if test="${ empty loginUser }">
		<a href="${ contextPath }/loginView.me"><h2>로그인</h2></a>
		<a href="${ contextPath }/signUp.me"><h2>회원가입</h2></a>
	</c:if>
	<c:if test="${ !empty loginUser }">
		<a href="${ contextPath }/logout.me"><h2>로그아웃</h2></a>
	</c:if>
</body>
</html>