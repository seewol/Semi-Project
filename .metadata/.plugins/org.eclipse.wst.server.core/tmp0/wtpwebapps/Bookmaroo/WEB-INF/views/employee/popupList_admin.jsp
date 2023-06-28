<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	.album .col{cursor: pointer;}
	.bd-placeholder-img {font-size: 1.125rem; text-anchor: middle;}
	.card *:hover{cursor: pointer;}
	
	.container-lg {
		background: #A9AABC;
		transform: translate(450px, 35px);
	}
	.disable {
		cursor: no-drop;
		user-select: none;
	}
</style>
<title>Insert title here</title>
</head>
<body>
	
	<jsp:include page="../common/top.jsp"/>
 	<jsp:include page="../common/sideList.jsp"/>
	
	<main class="container-lg p-3 mt-3 position-absolute" id="container-lg2">
		<div class="container text-center">
			<h2 class="fs-2 fw-bold badge text-bg-success w-50 p-4">현재 등록된 교육/문화프로그램 첨부파일</h2>
		</div>
		<div class="album py-2 bg-light">
			<div class="container">
				<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
					<c:forEach items="${ joinList }" var="j">
						<div class="col">
							<div class="card shadow-sm">
<%-- 								<c:forEach items="${ aList }" var="al"> --%>
									<c:if test="${ !(empty j.fileSequence) }"><!-- 참조 번호가 같은 것들만 -->
										<!-- 꼭 썸네일 번호를 지정해줘야만 하나? -->
										<c:if test="${ empty j.fileRename }">
											<svg class="bd-placeholder-img card-img-top" width="100%" height="225">
												<rect width="100%" height="100%" fill="#55595c"/>
												<text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text>
											</svg>
										</c:if>
										<c:if test="${ !(empty j.fileRename) }">
											<img src="${contextPath}/resources/uploadFiles/${j.fileRename}" width="100%" height="225">
										</c:if>
									</c:if>
									<c:if test="${ empty j.fileSequence }">
										<svg class="bd-placeholder-img card-img-top" width="100%" height="225">
											<rect width="100%" height="100%" fill="#55595c"/>
											<text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text>
										</svg>
										<img src="https://sesupport.edumall.jp/hc/article_attachments/900009570963/noImage.jpg" width="100%" height="225">
									</c:if>
<%-- 								</c:forEach> --%>

								<div class="card-body">
									<p class="card-text">
										<label class="pId">번호 ${ j.popUpNum }</label> | <label class="writer">${ j.memberNumAttm }</label>
									</p>
									<div class="d-flex justify-content-between align-items-center">
										${ j.popupTitleAttm }
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
				<br><br><br>
				<nav aria-label="Standard pagination example"">
					<div class="col-12 d-flex justify-content-center">
			  <ul class="pagination">
			    <li class="page-item">
			    	<c:url value="${ loc }" var="goBack">
			    		<c:param name="page" value="${ pi.currentPage - 1 }"/>
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
			    	</c:url>
			    	<li class="page-item"><a class="page-link" href="${ goNum }">${ p }</a></li>
			    </c:forEach>
			    <!-- number -->
			    
			    <li class="page-item">
			    	<c:url value="${ loc }" var="goNext">
			    		<c:param name="page" value="${ pi.currentPage + 1 }"/>
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
        			</nav>
<%-- 		        	<c:if test="${ !empty loginUser }"> --%>
<%-- 		        		<button class="btn btn-outline-success" type="button" onclick="location.href='${ contextPath }/writeAttm.at'">WRITE BOARD</button> --%>
<%-- 		        		<button class="btn btn-danger " type="button" onclick="location.href='${ contextPath }/popupList.adminAttm'">뒤로가기</button> --%>
		        		<button class="btn btn-danger" type="button" onclick="javascript:history.back()">뒤로가기</button>
<%-- 		        	</c:if> --%>
			</div>
		</div>
	</main>
	
	
	
	<script>
// 		window.onload = () => {
// 			const dives = document.getElementsByClassName('card');
// 			for(const div of dives) {
// 				div.addEventListener('click', function() {
// 					const fullId = this.querySelector('.pId').innerText;
// 					const popupNum = fullId.split(' ')[1];
// 					const writer = this.querySelector('.writer').innerText;

// 					console.log(popupNum)
					
//   					location.href="${contextPath}/selectAttm.adminAttm?pId=" + popupNum 
//   									+	"&writer=" + writer + "&page=" + ${pi.currentPage};

// 				})
// 			}
// 		}
	</script>
	
	
	
</body>
</html>
