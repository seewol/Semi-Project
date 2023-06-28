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
				      <th scope="col">대출 가능 여부</th> <!-- 일단 IS_RENTAL이 5가 넘으면 view에서 대출가능 여부를 '불가'로 했음 -->
				      <th scope="col">계정상태</th>
				    </tr>
				</thead>
				<tbody class="table-group-divider">
					<c:forEach items="${ list }" var="m">
					  	<tr>
					  		<td>${ m.memNo }</td>
					  		<td>${ m.memId }</td>
					  		<td>${ m.memName }</td>
					  		<td>${ m.phone }</td>
					  		<td>
					  			<c:if test="${ m.isRental >= 0 }">가능</c:if>
					  			<c:if test="${ m.isRental eq -1 }"><font color="red">불가능</font></c:if>
					  		</td>
					  		<td>
					  			<c:if test="${ m.memStatus eq 'Y'}">활성화</c:if>
					  			<c:if test="${ m.memStatus eq 'N' }"><font color="red">비활성화</font></c:if>
					  		</td>
					  	</tr>
					 </c:forEach>
				</tbody>
			</table>
			
			<!-- pagination -->
			<div class="col-12 d-flex bg-white justify-content-center">
			  <ul class="pagination">
			    <li class="page-item">
			    	<c:url value="${ loc }" var="goBack">
			    		<c:param name="page" value="${ pi.currentPage - 1 }"/>
			    		<c:param name="selectCategory" value="${category}"/>
			    		<c:param name="query" value="${query}"/>
			    	</c:url>
			    	<c:if test="${ pi.currentPage <= 1 }">
			    		<a class="page-link bg-secondary bg-opacity-50 disable">&lt;</a>
			    	</c:if>
			    	<c:if test="${ pi.currentPage > 1 }">
			    		<a class="page-link" href="${ goBack }">&lt;</a>
			    	</c:if>
			    </li>
			    
			    <!-- number -->
			    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
			    	<c:url var="goNum" value="${ loc }">
			    		<c:param name="page" value="${ p }"/>
			    		<c:param name="selectCategory" value="${category}"/>
			    		<c:param name="query" value="${query}"/>
			    	</c:url>
			    	<li class="page-item"><a class="page-link" href="${ goNum }">${ p }</a></li>
			    </c:forEach>
			    <!-- number -->
			    
			    <li class="page-item">
			    	<c:url value="${ loc }" var="goNext">
			    		<c:param name="page" value="${ pi.currentPage + 1 }"/>
			    		<c:param name="selectCategory" value="${category}"/>
			    		<c:param name="query" value="${query}"/>
			    	</c:url>
			    	<c:if test="${ pi.currentPage == pi.maxPage }">
			    		<a class="page-link bg-secondary bg-opacity-50 disable">&gt;</a>
			    	</c:if>
			    	<c:if test="${ pi.currentPage < pi.maxPage }">
			    		<a class="page-link" href="${ goNext }">&gt;</a>
			    	</c:if>
			    </li>
			  </ul>
			</div>
				<h4 class="text-end me-3">※ 클릭하여 관리하세요</h4>	
			</div>
			

			<!-- 검색조건 -->
			<div class="row g-2">
				<div class="col">
				  <form method="get" action="${contextPath}/userSearch.admin">
					<div class="input-group mb-3 w-50">
					  <button class="btn btn-success dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">검색조건</button>
					  <select class="dropdown-menu" name="selectCategory" id="selectCategory">
					    <option value="all" selected>전체</option>
					    <option value="m_no">회원번호</option>
					    <option value="m_id">아이디</option>
					    <option value="m_name">이름</option>
					    <option value="is_rental">대출가능 여부</option>
					  </select>
					  <input type="text" class="form-control" aria-label="Text input with dropdown button" id="searchBar" name="query">
					  <input type="hidden" name="page" value="${pi.currentPage}">
					  <button class="btn btn-primary btn-md p-3 fs-5" id="searchButton">검색</button> 
					</div>
				  </form>	
				</div>
			</div>
		</div>
		
	</section>		

	<script>
		const sBar = document.getElementById("searchBar");
		sBar.value = "${query}";
			
		const sCategory = document.getElementById("selectCategory");
		sCategory.value = "${category}";
	</script>	

</body>


	<script>
  	//게시글 상세조회.
  	// 게시글 눌렀을 때 글의 제목, 작성자, 내용 가져오기 콘솔에 일단 찍어보면서 확인
  	const tbody = document.querySelector('tbody');
  	const tds = tbody.querySelectorAll('td');
  	for(const td of tds) {
  		td.addEventListener('click', function() {
  			const trTds = td.parentElement.children;

  			//회원번호
  			const userNo = trTds[0].innerText;
			
  			//notice.admin로 데이터 담아서 url에 전송
 	  			location.href='${contextPath}/user.admin?userNo=' + userNo
 			  											+ '&page=' + ${ pi.currentPage };
  		})
  	}
	</script>
</html>




