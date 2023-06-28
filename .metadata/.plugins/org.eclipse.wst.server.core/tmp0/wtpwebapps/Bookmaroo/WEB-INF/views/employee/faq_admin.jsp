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
 		<form action="${contextPath}/FAQupdateSubmit.admin" method="post">
			<div class="row g-3">
				<div class="col-12">
						<span class="badge rounded-pill bg-warning text-bg-secondary bg-opacity-100 fs-3 mb-2 ms-3">FAQ 수정</span>
<%-- 						<input type="hidden" value="${ page }" name="page"> --%>
<%--  						<input type="hidden" value="${ b.bNo }" name="bNo"> --%>
				</div>
					<div class="bg-white p-3">
						<div class="input-group py-2">
			  				<span class="input-group-text fs-4" id="inputGroup-sizing-default">글 번호</span>
			  				<input type="text" value="${ faq.faqNumber }" class="form-control bg-secondary bg-opacity-25" aria-label="Sizing example input" id="faqNum" name="faqNumber" readonly>
						</div> 
						<div class="input-group py-2">
			  				<span class="input-group-text fs-4" id="inputGroup-sizing-default">질문</span>
			  				<input type="text" value="${ faq.faqQuestion }" class="form-control" id="faqQuestionElement" name="faqQuestion">
						</div>
						<div class="input-group py-2">
							<span class="input-group-text fs-4">내용</span>
							<textarea class="form-control" id="faqAnswerElement" name="faqAnswer" rows="10">${ faq.faqAnswer }</textarea>
						</div>
		  			</div>
				<button type="button" class="ms-3 w-25 btn btn-dark btn-sm mt-3" onclick="javascript:history.back()">목록 보기</button>
				<button class="ms-3 w-25 btn btn-warning btn-sm">수정 완료</button>
			</div>
 		</form> 
	</div>

</body>
	<script>
	
		//자바스크립트 처리
		
	</script>

</html>