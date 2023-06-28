<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<!-- Bootstrap -->
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous"> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script> -->
<!-- jQuery -->
<script type="text/javascript" src="//code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- summernotes -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

<style>
	#summernotes{
		margin: 0 auto;
	}
	.container-lg {
		background: #A9AABC;
		transform: translate(450px, 35px);
	}
</style>
</head>
<body>

	<jsp:include page="../common/top4.jsp"/>
	<jsp:include page="../common/sideList.jsp"/>

	<section class="container-lg p-3 mt-3 position-absolute">
		<div class="row">
			<div>
				<span class="badge rounded-pill text-bg-secondary ms-4 mb-2 bg-success bg-opacity-100 fs-3">리뷰 목록</span>
			</div>
			<div class="col-12 bg-white">
					<table class="table table-hover text-center">
					  <thead>
					    <tr>
					      <th scope="col">글번호</th>
					      <th scope="col">제목</th>
					      <th scope="col">작성자</th>
					      <th scope="col">작성일</th>
					    </tr>
					  </thead>
					  <tbody class="table-group-divider" id="result">
					  </tbody>
					  <div class="input-group mb-3 w-40">
							<button class="btn btn-success dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">검색조건</button>
							<select class="dropdown-menu" id="select">
								<option value="ReviewNo">글번호</option>
								<option value="ReviewTitle">제목</option>
								<option value="MemberId">작성자</option>
							</select>
							<input type="text" class="form-control" aria-label="Text input with dropdown button" id="keyword">
							<button type="button" class="btn btn-primary btn-md p-3 fs-5" id="searching">검색</button>
						</div>
				</table>
			
			
			<!--  pagination -->
			<div class="bg-white d-flex justify-content-center w-100mb-5">
					  	<ul class="pagination">
							<li class="page-item">
							   	<a class="page-link" href="" aria-label="Previous">
							   		<span aria-hidden="true">&laquo;</span>
							   	</a>
							</li>
							
							<li class="page-item"><a class="page-link pageNum2" id="first">1</a></li>
							<li class="page-item"><a class="page-link pageNum2" id="second">2</a></li>
							<li class="page-item"><a class="page-link pageNum2" id="third">3</a></li>
							<li class="page-item"><a class="page-link pageNum2" id="fourth">4</a></li>
							<li class="page-item"><a class="page-link pageNum2" id="fifth">5</a></li>
							
							<li class="page-item">
						    	<a class="page-link" href="" aria-label="Next">
						    		<span aria-hidden="true">&raquo;</span>
						    	</a>
						  	</li>
						</ul>
					</div>
			</div>
			
			<div class="col-12 mt-5">
				<div class="mb-2 ms-3">
					<span class="badge rounded-pill bg-success text-bg-secondary bg-opacity-100 fs-3">리뷰 확인</span>
				</div>
				<div class="bg-white p-3">
						<div class="input-group mb-2">
			  				<span class="input-group-text" id="inputGroup-sizing-default">제목</span>
			  				<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" id="title" readonly>
						</div>
						<div class="form-floating">
						  <textarea class="form-control" placeholder="Leave a comment here" id="contents" style="height: 500px" name="bookContent" readonly></textarea>
						  <label for="floatingTextarea2"></label>
						</div>
						<input type="hidden" name="reviewNo" id="reviewNoCheck">
	  			</div>
	  			<div class="text-end mt-2">
					<button type="button" class="btn btn-danger btn-lg fs-5 rounded-pill shadow" id="delete">삭제</button>
				</div>
  			</div>
		</div>	
	</section>
	<script>
	  	window.onload = () => {	  	
	  		searchReview(1);
  			
  			for(let i = 0; i < 5; i++) {
				document.getElementsByClassName("pageNum2")[i].onclick = () => {
					page = document.getElementsByClassName("pageNum2")[i].innerText;
					searchReview(page);
				}
			}
  			
	  		function searchReview(page) {
	  			let type = document.getElementById("select").value;
	  			let keyword = document.getElementById("keyword").value;
	  			
	  			$.ajax({
	  				type: "POST",
	  				url: "searchReview",
	  				async: false,
	  				data: {
	  					keyword: keyword,
	  					type: type
	  				},
	  				success: (data) => {
	  					
	  					let result = "";
	  					let start = 10 * (page - 1);
						let end = (10 * page) - 1;
						if(end > data.length) {
							end = data.length;
						}
						
						for(let i = start; i < end; i++) {
							let reviewTitle = data[i].reviewTitle;
							let reviewContent = data[i].reviewContent;
							let reviewNo = data[i].reviewNo;
							let memberId = data[i].memberId;
							let reviewUpdateDate = data[i].reviewUpdateDate;
							
							result += "<tr><th scope='row'>" + reviewNo + "</th><td>" + reviewTitle + "</td><td>" + memberId + "</td><td>" + reviewUpdateDate + "</td></tr>";
						}
						document.getElementById("result").innerHTML = result;
						
						for(let i = 0; i < document.getElementById("result").querySelectorAll("tr").length; i++) {
							document.getElementById("result").querySelectorAll("tr")[i].onclick = () => {			
								document.getElementById("title").value = data[start + i].reviewTitle;
								document.getElementById("contents").value = data[start + i].reviewContent;
								document.getElementById("reviewNoCheck").value = data[start + i].reviewNo;
							}
						}
	  				}
	  			});
	  		}
	  		
	  		document.getElementById("searching").onclick = () => {
	  			searchReview(1);
	  			
	  			for(let i = 0; i < 5; i++) {
					document.getElementsByClassName("pageNum2")[i].onclick = () => {
						page = document.getElementsByClassName("pageNum2")[i].innerText;
						searchReview(page);
					}
				}
	  		}
	  		
	  		document.getElementById("delete").onclick = () => {
	  			swal({
					title: "확인",
					text: "정말 삭제하시겠습니까?",
					icon: "warning",
					buttons: ["아니오", "예"]
				}).then((YES) => {
					if(YES) {
						$.ajax({
		  					url: "deleteReview",
		  					type: "POST",
		  					data: { "reviewNo": document.getElementById("reviewNoCheck").value },
		  					success: () => {
		  						document.getElementById("title").value = "";
								document.getElementById("contents").value = "";
								document.getElementById("reviewNoCheck").value = "";
								
								swal({
									   title: "성공",
									   text: "리뷰 삭제가 완료되었습니다.",
									   icon: "success"
								});
								
								searchReview(1);
					  			
					  			for(let i = 0; i < 5; i++) {
									document.getElementsByClassName("pageNum2")[i].onclick = () => {
										page = document.getElementsByClassName("pageNum2")[i].innerText;
										searchReview(page);
									}
								}
		  					}
		  				});
					}
				});
	  		}
	  	}
	</script>
</body>


</html>