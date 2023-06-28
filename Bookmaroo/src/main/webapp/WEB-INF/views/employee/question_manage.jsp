<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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
				<span class="badge rounded-pill text-bg-secondary ms-4 mb-2 bg-success bg-opacity-100 fs-3">문의사항 목록</span>
			</div>
			<div class="col-12 bg-white">
					<table class="table table-hover text-center">
					  <thead>
					    <tr>
					      <th scope="col">글번호</th>
					      <th scope="col">제목</th>
					      <th scope="col">작성자</th>
					      <th scope="col">작성일</th>
					      <th scope="col">답변</th>
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
					<span class="badge rounded-pill bg-success text-bg-secondary bg-opacity-100 fs-3">문의사항 상세정보</span>
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
						<input type="hidden" name="boardNo" id="boardNoCheck">
	  			</div>
	  			<div class="text-end mt-2">
					<button type="button" class="btn btn-danger btn-lg fs-5 rounded-pill shadow" id="delete">삭제</button>
				</div>
  			</div>
		</div>
	</section>
</body>
<script>
	window.onload = () => {
		
  		function searchQuestion(page) {
  			let type = document.getElementById("select").value;
  			let keyword = document.getElementById("keyword").value;
  			
  			$.ajax({
  				type: "POST",
  				url: "searchQuestion",
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
						let boardNo = data[i].boardNo;
						let memberNo = data[i].memberNo;
						let boardTitle = data[i].boardTitle;
						let boardContent = data[i].boardContent;
						let boardUpdateDate = data[i].boardUpdateDate;
						let boardViews = data[i].boardViews;
						let boardType = data[i].boardType;
						let memberName = data[i].memberName;
						let memberId = data[i].memberId;
						
						result += "<tr><th scope='row'>" + boardNo + "</th><td>" + boardTitle + "</td><td>" + memberId + "</td><td>" + boardUpdateDate + + "</td><td>" + replyContent" + </td></tr>";
					}
					document.getElementById("result").innerHTML = result;
					
					for(let i = 0; i < document.getElementById("result").querySelectorAll("tr").length; i++) {
						document.getElementById("result").querySelectorAll("tr")[i].onclick = () => {			
							document.getElementById("title").value = data[start + i].boardTitle;
							document.getElementById("contents").value = data[start + i].boardContent;
							document.getElementById("boardNoCheck").value = data[start + i].boardNo;
						}
					}
  				}
  			});
  		}
  		
  		document.getElementById("searching").onclick = () => {
  			searchQuestion(1);
  			
  			for(let i = 0; i < 5; i++) {
				document.getElementsByClassName("pageNum2")[i].onclick = () => {
					page = document.getElementsByClassName("pageNum2")[i].innerText;
					searchQuestion(page);
				}
			}
  		}
	}
</script>
</html>