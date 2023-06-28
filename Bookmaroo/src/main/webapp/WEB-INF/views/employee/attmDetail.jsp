<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<style>
	.container-lg {
		padding: 30px;
		transform: translate(450px, 35px);
		background: #A9AABC;
	}
	.plus-transform {
		transform: translate(450px, 480px);
	}
	.userList {
/* 		height:1000px; */
		background: white;
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
</head>
<body>
	
	<jsp:include page="../common/top.jsp"/>
	<jsp:include page="../common/sideList.jsp"/>
	
	<section class="container-lg mt-4 position-absolute">
		<div class="row g-4">
			<!-- 이용자 대출 도서 상황 -->
			<div class="col-lg-6 d-flex flex-column">
				
				<div class="border border-1 p-3 bg-white shadow fw-bold">
						<!-- 무조건 이미지 파일임 -->
						<c:forEach items="list" var="a">
							<div class="mb-4">
								<div class="card">
									<img src="${ contextPath }/resources/uploadFiles/${ a.fileRename }" width="100%" height="200">
									<div class="card-body">
										<h5 class="card-title">
											<a href="${ contextPath }/resources/uploadFiles/${ a.fileRename }" download="${ a.fileRename }">${ a.fileName }</a>
										</h5>
									</div>
								</div>
							</div>
							<img src="" class="rounded mt-3 mx-auto d-block" alt="도서 사진">
							<label for="formGroupExampleInput" class="form-label mt-2">번호</label>
							<input type="text" class="form-control bg-secondary bg-opacity-50" value="" id="rentNo" readonly>
							<label for="formGroupExampleInput" class="form-label mt-2">제목</label>
							<input type="text" class="form-control bg-secondary bg-opacity-50" value="" id="bookISBN" readonly>
							<label for="formGroupExampleInput" class="form-label mt-2">작성자</label>
							<input type="text" class="form-control bg-secondary bg-opacity-50" value="" id="bookName" readonly>
						</c:forEach>
<%-- 						<c:forEach items="${ empty bList }" > --%>
<!-- 							<h2>대출한 도서가 없습니다.</h2> -->
<%-- 						</c:forEach> --%>
				</div>
			</div>
		</div>
	</section>