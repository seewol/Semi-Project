<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>로그인</title>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300&display=swap" rel="stylesheet">
<style>
	#main{
/* 		position: absolute; */
/* 		top: 50%; */
/*      left: 50%; */
/*      transform: translate(-50%, -50%); */
        font-family: 'Inter', sans-serif;
        margin-top: 120px;
        margin-bottom: 95px;
        width:100%;
        height: auto;
        min-height: 414px;
    }
    hr{width: 500px;}
    td{padding: 5px; width: 260px;}
   	
   	::placeholder {
  		color: black;
 		font-size: .8em;
 		font-weight: 400;
	}
	a>span{text-decoration-line: none;}
	a:link{color: black;}
	a:visited{color: black;}
	a:hover{color: #4373E6;}
</style>
</head>
<body>
	<%@ include file="../common/top3.jsp" %>
	<section>
		<div align="center" id="main">
			<h4><b>로그인</b></h4><br>
			<form action="${ contextPath }/login.me" method="post">
				<table>
					<tr>
						<td>
							<input class="form-control" type="text" name="memId" placeholder="아이디" aria-label="default input example" required/>
						</td>
					</tr>
					<tr>
						<td>
							<input class="form-control" type="password" name="password" placeholder="비밀번호" aria-label="default input example" required/>
						</td>
					</tr>
				</table>
				<br/>
				<button class="btn btn-primary" style="--bs-btn-padding-y: .55rem; --bs-btn-padding-x: 6.3rem; --bs-btn-font-size: 1.0rem; background-color: #4373E6;">로그인</button>
			</form>
			<br>
			<a href="${ contextPath }/findIdForm.me"><span style="font-size: 13px"><b>아이디 찾기&nbsp;</b></span></a> |
			<a href="${ contextPath }/findPwdForm.me"><span style="font-size: 13px"><b>&nbsp;비밀번호 찾기&nbsp;</b></span></a> |
			<a href="${ contextPath }/signUp.me"><span style="font-size: 13px"><b>&nbsp;회원가입</b></span></a>
			<hr/>
			<div><span style="font-size: 11px; color: gray;">카카오톡 계정으로 로그인 할 수 있어요</span></div> <!-- =http://localhost:8080/bookmaroo -->
			<a href="https://kauth.kakao.com/oauth/authorize?client_id=3820ee86989bf11805e157a18f4e15b1&redirect_uri=http://localhost:8099${ contextPath }/kakao&response_type=code">
			<img src="resources/image/kakao_login_medium_wide.png" width="250px" style="margin-top: 10px"/>
			</a>
		</div>
	</section>
	<%@ include file="../common/bottom.jsp" %>
</body>
</html>