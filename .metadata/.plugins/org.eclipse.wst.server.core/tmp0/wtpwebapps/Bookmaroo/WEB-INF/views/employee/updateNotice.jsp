<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	
	
	<!-- 게시글 상세보기 -->
	<!-- 페이지ㅡ 제목, 작성자, 내용 -->
	<!-- 일단 아이디와 글버 -->
	
	<div class="container-lg p-3 mt-3 position-absolute">
		<form action="${contextPath}/updateNotice.admin" method="post">
		<input type="hidden" value="${ noticePage }" name="noticePage">
		<input type="hidden" value="${ board.boardNo }" name="boardNo">
<%-- 		<input type="hidden" value="${ board.boardContent }" name="boardContent"> --%>
			<div class="row g-3">
				<div class="col-12">
						<span class="badge rounded-pill bg-warning text-bg-secondary bg-opacity-100 fs-3 mb-2 ms-3">공지사항 수정</span>
				</div>
					<div class="bg-white p-3">
						<div class="input-group py-2">
			  				<span class="input-group-text fs-4" id="inputGroup-sizing-default">제목</span>
			  				<input type="text" class="form-control" aria-label="Sizing example input" id="bTitle" name="boardTitle" value="${ board.boardTitle }">
						</div> 
						<div class="input-group py-2">
			  				<span class="input-group-text fs-4" id="inputGroup-sizing-default">이름</span>
			  				<input type="text" class="form-control bg-secondary bg-opacity-25" name="writer" value="${ board.writer }" readonly>
						</div>
						<div class="input-group py-2">
							<span class="input-group-text fs-4">내용</span>
							<textarea class="form-control" rows="10" id="bContent" style="resize: none;" name="boardContent">${ board.boardContent }</textarea>
						</div>
		  			</div>
				<button type="button" class="ms-3 w-25 btn btn-dark btn-sm mt-3" onclick="location.href='${contextPath}/noticeManage.admin?noticePage=${noticePage}'">목록 보기</button>
				<button class="ms-3 w-25 btn btn-warning btn-sm" id="updateBtn">수정 완료</button>
			</div>
		</form>
	</div>

	<script>
	
		const bTitle = document.getElementById('bTitle');
		const bContent = document.getElementById('bContent');
		
		document.getElementById('updateBtn').addEventListener('click', (e) => {
			if(bTitle.value.trim() == '') {
				alert("제목은 공백으로 둘 수 없습니다.");
				e.preventDefault();
			} else {
				form.submit();
			}
		})
		
	</script>
	
</body>
</html>