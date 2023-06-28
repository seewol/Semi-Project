<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<!-- Bootstrap -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<!-- jQuery -->
<script type="text/javascript" src="//code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- summernotes -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

<style>
	#summernotes{
		margin: 0 auto;
	}
	#summernotes2{
		margin: 0 auto;
	}
	.container-lg {
		background: #A9AABC;
		transform: translate(450px, 35px);
	}
	#container-lg2{
		transform: translate(450px, 1180px);
	}
	tr:hover {
		cursor: pointer;
	}
	.disable {
		cursor: no-drop;
		user-select: none;
	}
</style>
</head>
<body>
	
	

	<jsp:include page="../common/top4.jsp"/>
 	<jsp:include page="../common/sideList.jsp"/>


	
	

	<section class="container-lg p-3 mt-3 position-absolute">
		<div class="row">
			<div class="col-3">
				<span class="badge rounded-pill ms-4 mb-2 bg-success bg-opacity-100 fs-3">공지사항 목록</span>
			</div>
			<div class="col-9">
				<form method="get" action="${ contextPath }/noticeManage.admin">
					<div class="input-group mb-3 w-50">
<!-- 					  <button class="btn btn-success dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">검색조건</button> -->
<!-- 					  <select name="noticeCategory" class="dropdown-menu"> -->
					
					<!-- category의 value명은 DB의 변수명과 일치시킴 -->
					<select class="bg-light arr" style="width: fit-content;" name="noticeCategory" id="noticeCategory">
					    <option value="all" selected>전체</option>
					    <option value="B_NO">번호</option>
					    <option value="B_TITLE">제목</option>
					    <option value="M_NAME">작성자</option>
<!-- 					    <option value="B_UPDATE_DATE">작성일</option> -->
					  </select>
					  <input type="text" class="form-control" aria-label="Text input with dropdown button" name="noticeQuery" id="noticeQuery">
					  <button class="btn btn-primary btn-md p-3 fs-5">검색</button> 
					</div>
				</form>
			</div>
 		</div>
			
			
			
			<div class="col-12 bg-white">
					<table class="table table-hover text-center">
					  <thead>
					    <tr>
					      <th scope="col">번호</th>
					      <th scope="col">제목</th>
					      <th scope="col">작성자</th>
					      <th scope="col">작성일</th>
					    </tr>
					  </thead>
					  <tbody class="table-group-divider">
					  	<c:forEach items="${ list }" var="li">
					  		<tr>
					  			<td>${ li.boardNo }</td>
					  			<td>${ li.boardTitle }</td>
					  			<td>${ li.writer }</td>
					  			<td>${ li.boardUpdateDate }</td>
					  		</tr>
					  	</c:forEach>
					  </tbody>
				</table>
			
			<!-- 기존 변수명 앞에 notice를 붙여서 교육 문화프로그램과 분리 -->
			<!--  공지사항 pagination -->
			<div class="col-12 d-flex justify-content-center">
			  <ul class="pagination">
			    <li class="page-item">
			    	<c:url value="${ loc }" var="noticeGoBack">
			    		<c:param name="noticePage" value="${ noticePi.currentPage - 1 }"/>
			    		<c:param name="noticeCategory" value="${ noticeCategory }"/>
	            		<c:param name="noticeQuery" value="${ noticeQuery }"/>
			    	</c:url>
			    	<c:if test="${ noticePi.currentPage <= 1 }">
			    		<a class="page-link bg-secondary bg-opacity-50 disable">&lt;</a>
			    	</c:if>
			    	<c:if test="${ noticePi.currentPage > 1 }">
			    		<a class="page-link" href="${ noticeGoBack }">&lt;</a>
			    	</c:if>
			    </li>
			    
			    <!-- Number -->
			    <c:forEach begin="${ noticePi.startPage }" end="${ noticePi.endPage }" var="noticeP">
			    	<c:url var="noticeGoNum" value="${ loc }">
			    		<c:param name="noticePage" value="${ noticeP }"/>
			    		<c:param name="noticeCategory" value="${ noticeCategory }"/>
	            		<c:param name="noticeQuery" value="${ noticeQuery }"/>
			    	</c:url>
			    	<li class="page-item"><a class="page-link" href="${ noticeGoNum }">${ noticeP }</a></li>
			    </c:forEach>
				<!-- Number -->
				
			    <li class="page-item">
			    	<c:url value="${ loc }" var="noticeGoNext">
			    		<c:param name="noticePage" value="${ noticePi.currentPage + 1 }"/>
			    		<c:param name="noticeCategory" value="${ noticeCategory }"/>
	            		<c:param name="noticeQuery" value="${ noticeQuery }"/>
			    	</c:url>
			    	<c:if test="${ noticePi.currentPage == noticePi.maxPage }">
			    		<a class="page-link bg-secondary bg-opacity-50 disable">&gt;</a>
			    	</c:if>
			    	<c:if test="${ noticePi.currentPage < noticePi.maxPage }">
			    		<a class="page-link" href="${ noticeGoNext }">&gt;</a>
			    	</c:if>
			    </li>
			  </ul>
			</div>
				
				
				
				<h4 class="text-end me-3">※ 클릭하여 관리하세요</h4>
			</div>
			
			
			
				<div class="row">
		  			<div class="col-8 mt-5" id="summernotes"> <!-- 요소 가운데 정렬 하려고 summrnotes 태그 넣었음 -->
		  				<form action="insertNotice.admin" method="post">
							<div class="mb-2 ms-3">
								<span class="badge rounded-pill bg-success text-bg-secondary bg-opacity-100 fs-3">공지사항 등록</span>
							</div>
							<div class="bg-white p-3">
								<div class="input-group mb-2">
					  				<span class="input-group-text" id="inputGroup-sizing-default">제목</span>
					  				<input type="text" name="boardTitle" id="title" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
								</div>
							  	<div class="form-floating">
								  <textarea class="form-control" name="boardContent" id="content" placeholder="Leave a comment here" style="height: 400px; resize: none"></textarea>
								  <label for="floatingTextarea2">내용</label>
								</div>
				  			</div>
				  			<div class="text-end mt-2">
				  				<button class="btn btn-primary btn-lg fs-5 rounded-pill shadow" id="noticeSubmit">공지등록</button>
							</div>
						</form>
		  			</div>
	  			</div>

	</section>
  			
 
		
		<script>
		const nQuery = document.getElementById("noticeQuery");
		nQuery.value = "${noticeQuery}";
			
		const nCategory = document.getElementById("noticeCategory");
		nCategory.value = "${noticeCategory}";
		</script>
		
		
		
		
		<script>
		//게시글 상세조회.
	  	// 게시글 눌렀을 때 이용자의 정보 가져오기
	  	const tbody = document.querySelector('tbody');
	  	const tds = tbody.querySelectorAll('td');
	  		
	  	console.log(tbody);
	  	
	  	
	  	for(const td of tds) {
	  		td.addEventListener('click', function() {
	  			const trTds = td.parentElement.children
	  			
	  			//공지사항 번호
	  			const boardNum = trTds[0].innerText;
	  			//게시글 제목
	  			const boardTitle = trTds[1].innerText;
	  			//작성자 이름
	  			const boardWriter = trTds[3].innerText;
	  			//게시글 내용
	  			const boardContent = trTds[2].innerText;
	  			
	  			console.log(this);
	  			
	  			//notice.admin로 데이터 담아서 url에 전송
	 	  			location.href='${contextPath}/notice.admin?noticePage=' + '${noticePi.currentPage}' +
	 	  															'&noticeCategory=' + '${noticeCategory}' + 
	 	  															'&noticeQuery=' + '${noticeQuery}' +
	 	  															'&boardNo=' + boardNum
	 	  																	
	 			  											
	  		});
	  	}
	

		  	//공지사항 제목과 내용에 아무것도 안적었다면 제줄 못하게 막음.
		  	const title = document.getElementById('title');
		  	const content = document.getElementById('content');
		  	const submitBtn = document.getElementById('noticeSubmit');

			 submitBtn.addEventListener('click', e => {
			 if(title.value.trim() == '') {
			  		alert("제목을 입력해 주세요.")
			  		title.focus();
			  		e.preventDefault();
			  	} else if(content.value.trim() == '') {
			  		alert("내용을 입력해 주세요.")
			  		content.focus();
			  		e.preventDefault();
			  	}
			});
	  	
		</script> 
		
		


</body>

</html>