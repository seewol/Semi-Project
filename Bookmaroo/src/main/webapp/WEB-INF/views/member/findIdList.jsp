<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>아이디 찾기 목록</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300&display=swap" rel="stylesheet">
<script src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<meta charset="UTF-8">
<style>
	#main{
/* 		position: absolute; */
		top: 50%;
        left: 50%;
/*         transform: translate(-50%, -50%); */
        font-family: 'Inter', sans-serif;
        margin-top: 157px;
        margin-bottom: 216px;
    }
    hr{width: 600px;}
    #list {
		background-color: #D5D6E2;
		width: 260px;
		height: 220px;
		border-radius: 20px;
		display: flex;
		justify-content: center;
		align-items: center;
	}

	#list table {
		margin: auto;
	}
</style>
</head>
<body>
	<%@ include file="../common/top3.jsp" %>
	<div align="center" id="main">
		<h4><b>아이디 찾기</b></h4>
		<div style="margin: 10px;"><span style="font-size: 13px; font-weight: 500;">고객님의 정보와 일치하는 아이디 목록입니다</span></div>
		<div id="list">
			<table>
				<c:forEach items="${ list }" var="list">
					<tr>
						<td>
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-check2-circle" viewBox="0 0 16 16">
				  				<path d="M2.5 8a5.5 5.5 0 0 1 8.25-4.764.5.5 0 0 0 .5-.866A6.5 6.5 0 1 0 14.5 8a.5.5 0 0 0-1 0 5.5 5.5 0 1 1-11 0z"/>
								<path d="M15.354 3.354a.5.5 0 0 0-.708-.708L8 9.293 5.354 6.646a.5.5 0 1 0-.708.708l3 3a.5.5 0 0 0 .708 0l7-7z"/>
							</svg>&nbsp;${ list.memId }
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<hr/>
		<br/>
		<button type="button" class="btn btn-primary" style="--bs-btn-padding-y: .55rem; --bs-btn-padding-x: 3.9rem; --bs-btn-font-size: 1.0rem; background-color: #4373E6;" onclick="location.href='${contextPath}/semiHome.do'">메인으로 돌아가기</button>
	</div>
	<%@ include file="../common/bottom.jsp" %>
</body>
</html>