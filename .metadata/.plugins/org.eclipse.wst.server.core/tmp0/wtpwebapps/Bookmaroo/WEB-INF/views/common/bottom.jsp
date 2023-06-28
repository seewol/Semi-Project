<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#ftnav{text-align: left; margin-left: 30px; font-size: 13px; }
	#ftnav a{text-decoration: none; color: white;}
	#ftp{text-align: left; margin-left: 10px; font-size: 13px; line-height:170%;}
	#anker{margin-left: 50px; vertical-align: middle; text-align: right; margin-right: 30px; position: fixed; right:15px;  bottom: 35px; }
	.bi-arrow-up-circle-fill{color:black; font-size: 40px;}
	footer {
		display:flex;  
		align-items:center; 
		position: relative;
		bottom: 0;
		height: 180px; width: 100%;
		min-width: 1000px;
		background: rgb(67, 115, 230); 
		color: white; 
		align-items: center; justify-content: space-between; 
		vertical-align: middle; text-align: center;
	}
</style>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
</head>
<body>
	<footer>
		<div id="a1">
			<nav id="ftnav">
		   		<b>
		   			<a target='_blank'>&nbsp;&nbsp;이용약관&nbsp;&nbsp;&nbsp;&nbsp;</a> |&nbsp;&nbsp;&nbsp;
		    		<a target='_blank'>&nbsp;개인정보취급방침&nbsp;&nbsp;&nbsp;&nbsp;</a> |&nbsp;&nbsp;&nbsp;
		    		<a target='_blank'>&nbsp;문의</a>
		    	</b>
		    	<br/>
		    	<br/>
			    <p id="ftp">
			    	<span id="sp2">책마루도서관 ｜ 사업자등록번호 : 123-45-67890 ｜ 서울 종로 제2023-01호 ｜ 대표자 : 박지은 ｜ 책임자 : 우진기</span><br/>
			    	<span>서울특별시 중구 남대문로 120 그레이츠 청계(구 대일빌딩) 2F, 3F</span><br/>
			    	<span id="sp1">Copyright © 2023 Book Maru Library All Right Reserved</span>
			    </p>
		    </nav>
		</div>
		<div id="anker"><a href="#" onclick="scrollToElement('anchorPoint')" ><i class="bi bi-arrow-up-circle-fill"></a></i></div>
	</footer>
	<script>
	function scrollToElement(id) {
		  const element = document.getElementById(id);
		  element.scrollIntoView({ behavior: 'auto' });
		}
	</script>		
</body>
</html>