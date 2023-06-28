<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책마루도서관</title>
<style>
	#main{max-width: 1200px; min-height: 682px;}
	#mid{min-width: 1800px;}
	.bi-quora{color: #4373e6;}
	#searchButton{
		color: white; background-color: rgb(67, 115, 230);
		width: 90px;
	}
</style>
</head>
<body>
	
	<!-- top.jsp -->
	<%@ include file="../../../WEB-INF/views/common/top3.jsp" %>
	
	  <div class="row" id="mid">
	  
	    <!-- 화면 중앙 왼쪽 -->
	    <div class="col-2">
	      <%@ include file="../../../WEB-INF/views/common/sideGui.jsp" %>
	    </div>
	    
	    <!-- 중앙 영역 -->
	    <div class="col-8" id="main">
	    <br>
	       <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
	        <h1 class="h1">자주 묻는 질문</h1>
	      </div>
	        <br>
	        <div>
				<form method="get" class="search-form d-flex justify-content-center" action="${ contextPath }/libraryFAQSearch.gui">
					<div class="input-group">
						<select class="bg-light" name="category" id="categorySelect">
							<option selected value="all">전체</option>
							<option value="q_question">질문</option>
							<option value="q_answer">답변</option>
						</select> 
						&nbsp; &nbsp; &nbsp; 
						<input class="form-control mr-sm-2 w-50" type="search" placeholder="검색어 입력" aria-label="Search" id="searchBar" name="query">
						 &nbsp; &nbsp; &nbsp;
						<button class="btn my-2 my-sm-0 rounded-start" id="searchButton"><i class="bi bi-search"></i> 검색</button>
					</div>
				</form>
			</div>
			<br>
			
			<div class="accordion" id="FAQ">
				<c:if test="${ !empty list }">
					<c:forEach	items="${ list }" var="i" varStatus="status">
						<div class="accordion-item">
							<h2 class="accordion-header" id="heading${status.index}">
								<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse${status.index}" aria-controls="collapse${status.index}"><i class="bi bi-quora"></i>
									. ${i.faqQuestion }
								</button>
							</h2>
							<div id="collapse${status.index}" class="accordion-collapse collapse" aria-labelledby="heading${status.index}" data-bs-parent="#FAQ">
								<div class="accordion-body">
									${i.faqAnswer }
								</div>
							</div>
						</div>
					</c:forEach>
				</c:if>
				<c:if test="${ empty list }">
					<h3>검색 결과가 존재하지 않습니다.</h3>
				</c:if>
			</div>
			
			<br>
			
			<!-- 페이징 처리 -->
			<nav aria-label="Page navigation example">
	        	<ul class="pagination justify-content-center">
	        		<c:if test="${pi.currentPage > 1 }">
	        			<li class="page-item">
	        			<c:if test="${ !empty category && !empty query }">
	        				<c:url value="${ loc }" var="goBack">
		            			<c:param name="category" value="${category }"/>
		            			<c:param name="query" value="${query}"/>
		            			<c:param name="page" value="${ pi.currentPage - 1 }"/>
		            		</c:url>
	        			</c:if>
	        			<c:if test="${ !(!empty category && !empty query) }">
	        				<c:url value="${ loc }" var="goBack">
		            			<c:param name="page" value="${ pi.currentPage - 1 }"/>
		            		</c:url>
	        			</c:if>
		            	<a class="page-link" href="${ goBack }" aria-label="Previous">
		            		<span aria-hidden="true">&laquo;</span>
		              	</a>
		            </li>
	        		</c:if>
		            
		            <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
		            	<c:if test="${ !empty category && !empty query }">
		            		<c:url value="${ loc }" var="goNum">
		            			<c:param name="category" value="${ category }"/>
		            			<c:param name="query" value="${ query }"/>
		            			<c:param name="page" value="${ p }"/>
		            		</c:url>
		            	</c:if>
		            	<c:if test="${ !(!empty category && !empty query) }">
		            		<c:url value="${ loc }" var="goNum">
		            			<c:param name="page" value="${ p }"/>
		            		</c:url>
		            	</c:if>
		            	
		            	<li class="page-item"><a class="page-link" href="${ goNum }">${ p }</a></li>
		            </c:forEach>
		            
		            <c:if test="${pi.currentPage < pi.maxPage }">
		            	<li class="page-item">
		            		<c:if test="${ !empty category && !empty query }">
		            			<c:url value="${ loc }" var="goNext">
				            		<c:param name="category" value="${ category }"/>
				            		<c:param name="query" value="${ query }"/>
				            		<c:param name="page" value="${ pi.currentPage + 1 }"/>
				            	</c:url>
		            		</c:if>
		            		<c:if test="${ !(!empty category && !empty query) }">
		            			<c:url value="${ loc }" var="goNext">
				            		<c:param name="page" value="${ pi.currentPage + 1 }"/>
				            	</c:url>
		            		</c:if>
			            	<a class="page-link" href="${ goNext }" aria-label="Next">
			            		<span aria-hidden="true">&raquo;</span>
			            	</a>
		           		</li>
		            </c:if>
		            
		    	</ul>
        	</nav>
        	
			<br>
			
	    </div>
	    
	    <!-- 화면 중앙 오른쪽 여백 생성 -->
	    <div class="col-2">
	    </div>
	    
	  </div>
	  
	<!-- bottom.jsp -->
	<%@ include file="../../../WEB-INF/views/common/bottom.jsp" %>
	
	<script>
		const sBar = document.getElementById("searchBar");
		sBar.value = "${query}";
		if("${category}" != ""){
			const cSel = document.getElementById("categorySelect");
			cSel.value = "${category}";
		}
	</script>
</body>
</html>