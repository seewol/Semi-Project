<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" /> -->
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous"> -->
</head>
<style>

	.container-lg {
		padding: 30px;
		background: #A9AABC;
		transform: translate(450px, 35px);
	}
	.userList {
/* 		height:1000px; */
		background: white;
	}
	.userInfo {
		height: 420px;
	}
	.userList,
	.userInfo {
		border: 1px solid lightgray;
	}
	.disable {
		cursor: no-drop;
		user-select: none;
	}
	tr:hover {
		cursor: pointer;
	}
	
</style>
<body>   <!-- class="vh-100" -->

	<jsp:include page="../common/top4.jsp"/>
 	<jsp:include page="../common/sideList.jsp"/>
 	
	<section class="container-lg mt-4 position-absolute">
		<div class="row g-2">
			<div class="col-12 userList border-3 shadow">
			<h5 class="fs-6 fw-bold mt-1">이용자 목록</h5>
			<table class="table table-hover text-center fs-6 ">
				<thead>
				    <tr>
				      <th scope="col">회원번호</th>
				      <th scope="col">아이디</th>
				      <th scope="col">이름</th>
				      <th scope="col">전화번호</th>
				      <th scope="col">가입일</th> <!-- 일단 IS_RENTAL이 5가 넘으면 view에서 대출가능 여부를 '불가'로 했음 -->
				      <th scope="col">관리자 여부</th>
				    </tr>
				</thead>
				<tbody class="table-group-divider" id="result">
				</tbody>
			</table>
			
			<div class="bg-white d-flex justify-content-center w-100mb-5">
				<ul class="pagination">
					<li class="page-item">
					   	<a class="page-link" href="" aria-label="Previous">
					   		<span aria-hidden="true">&laquo;</span>
					   	</a>
					</li>
					
					<li class="page-item"><a class="page-link pageNum" id="first">1</a></li>
					<li class="page-item"><a class="page-link pageNum" id="second">2</a></li>
					<li class="page-item"><a class="page-link pageNum" id="third">3</a></li>
					<li class="page-item"><a class="page-link pageNum" id="fourth">4</a></li>
					<li class="page-item"><a class="page-link pageNum" id="fifth">5</a></li>
					
					<li class="page-item">
				    	<a class="page-link" href="" aria-label="Next">
				    		<span aria-hidden="true">&raquo;</span>
				    	</a>
				  	</li>
				</ul>
			</div>	
			<div class="input-group mb-3 w-40">
				<button class="btn btn-success dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">검색조건</button>
				<select class="dropdown-menu" id="select">
					<option value="MemberId">아이디</option>
					<option value="MemberName">이름</option>
					<option value="IsAdmin">관리자 여부(관리자 : 0/이용자 : 1)</option>
				</select>
				<input type="text" class="form-control" aria-label="Text input with dropdown button" id="keyword">
				<button type="button" class="btn btn-primary btn-md p-3 fs-5" id="search">검색</button>
			</div>
		</div>
	</section>		
</body>
	<script>
		window.onload = () => {
			searchUser(1);
			
			for(let i = 0; i < 5; i++) {
				document.getElementsByClassName("pageNum")[i].onclick = () => {
					page = document.getElementsByClassName("pageNum")[i].innerText;
					searchUser(page);
				}
			}
			
			function searchUser(page) {
				let type = document.getElementById("select").value;
				let keyword = document.getElementById("keyword").value;
				
				$.ajax({
					type: "POST",
					url: "searchUser",
					async: false,
					data: {
						keyword: keyword,
						type: type
					},
					success: (data) => {
						let user = "";
						let start = 10 * (page - 1);
						let end = (10 * page) - 1;
						if(end > data.length) {
							end = data.length;
						}
						
						for(let i = start; i < end; i++) {
							let memberNo = data[i].memberNo;
							let memberId = data[i].memberId;
							let password = data[i].password;
							let memberName = data[i].memberName;
							let phone = data[i].phone;
							let enrollDate = data[i].enrollDate;
							let isRental = data[i].isRental;
							let isAdmin = data[i].isAdmin;
							let loginType = data[i].loginType;
							let kakaoId = data[i].kakaoId;
							let memberStatus = data[i].memberStatus;
							
							if(isAdmin == 0) {
								isAdmin = 'Y'
							} else {
								isAdmin = 'N'
							}
							
							user += "<tr><td scope='row'>" + memberNo + "</td><td>" + memberId + "</td><td>" + memberName + "</td><td>" + phone + "</td><td>" + enrollDate + "</td><td>" + isAdmin + "</td></tr>";
						}
						document.getElementById("result").innerHTML = user;
						
						for(let i = 0; i < document.getElementById("result").querySelectorAll("tr").length; i++) {
							document.getElementById("result").querySelectorAll("tr")[i].onclick = () => {			
								if(document.getElementById("result").querySelectorAll("tr")[i].querySelectorAll("td")[5].innerHTML == 'Y') {
									$.ajax({
										type: "POST",
										url: "updateUser1",
										async: false,
										data: {
											keyword: document.getElementById("result").querySelectorAll("tr")[i].querySelectorAll("td")[0].innerHTML,
											type: "2"
										},
										success: () => {
											document.getElementById("result").querySelectorAll("tr")[i].querySelectorAll("td")[5].innerHTML = 'N'
										}
										
									});
								} else {
									$.ajax({
										type: "POST",
										url: "updateUser1",
										async: false,
										data: {
											keyword: document.getElementById("result").querySelectorAll("tr")[i].querySelectorAll("td")[0].innerHTML,
											type: "1"
										},
										success: () => {
											document.getElementById("result").querySelectorAll("tr")[i].querySelectorAll("td")[5].innerHTML = 'Y'
										}
									});
								}
							}
						}
					}
				});
			}
			
			document.getElementById("search").onclick = () => {				
				searchUser(1);
				
				for(let i = 0; i < 5; i++) {
					document.getElementsByClassName("pageNum")[i].onclick = () => {
						page = document.getElementsByClassName("pageNum")[i].innerText;
						searchUser(page);
					}
				}
			}
		}
	</script>
</html>