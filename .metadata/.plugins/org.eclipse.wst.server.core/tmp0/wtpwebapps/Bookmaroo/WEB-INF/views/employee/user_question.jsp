<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	
	.disable {
		cursor: no-drop;
		user-select: none;
	}
	
</style>
</head>
<body>

		<jsp:include page="../common/top4.jsp"/>
	 	<jsp:include page="../common/sideList.jsp"/>

		
	<!-- FAQ화면 -->
	<section class="container-lg text-center position-absolute mt-3 pt-4 pb-3">	
		<div class="row g-2">
				<div class="col-12">
					<span class="badge text-bg-info p-2 mb-3 fs-4 shadow">자주 묻는 질문 FAQ</span>
			      	<div class="bg-white">
				  		<table class="bg-white table table-hover text-center fs-6 p-5">
							<thead>
							    <tr>
							      <th scope="col">번호</th>
							      <th scope="col">질문</th>
							      <th scope="col">내용</th>
							      <th scope="col">등록날짜</th>
							      <th scope="col">작업</th>
							    </tr>
							</thead>
							<tbody class="faqTbody table-group-divider">
								<c:if test="${ !empty list }">
									<c:forEach items="${ list }" var="li" >
								  		<tr>
									  		<td scope="row">${ li.faqNumber }</td>
									  		
									  		<td>
									  			<c:choose>
									  				<c:when test="${ fn:length(li.faqQuestion) >= 10 }">
									  					<c:out value="${ fn:substring(li.faqQuestion, 0, 10)}..."/>
									  				</c:when>
									  				<c:otherwise>
									  					<c:out value="${ li.faqQuestion }"/>
									  				</c:otherwise>
									  			</c:choose>
									  		</td>
									  		<td>
									  			<c:choose>
										           <c:when test="${fn:length(li.faqAnswer) >= 10}">
										            	<c:out value="${fn:substring(li.faqAnswer, 0, 10)}..."/>
										           </c:when>
										           <c:otherwise>
										            	<c:out value="${li.faqAnswer}"/>
										           </c:otherwise> 
										        </c:choose>
									  		</td>
									  		<td>${ li.faqDate }</td>
									  		<td>
									  			<button type="button" class="btn btn-primary btn-lg p-1 fs-6 rounded-pill shadow faqUpdate">수정</button>
												<button type="button" class="btn btn-danger btn-lg p-1 fs-6 rounded-pill shadow faqDelete">삭제</button>
									  		</td>
									  	</tr>
									</c:forEach>
								</c:if>
							</tbody>
						</table>
						
						
						
					<!-- 페이지 처리 ^^ , pi들어옴-->
					<div class="bg-white d-flex justify-content-center w-100 mb-5">
					  <ul class="pagination">
						  <li class="page-item">	
							<c:if test="${ !empty selectCategory && !empty query }">
								<c:url value="${ loc }?selectCategory=${selectCategory}&query=${query}" var="goBack">
									<c:param name="page" value="${ pi.currentPage - 1 }"/>
								</c:url>
							</c:if>
							<c:if test="${ !(!empty selectCategory && !empty query) }"> <!-- -->
								<c:url value="${ loc }?selectCategory=${selectCategory}&query=${query}" var="goBack">
									<c:param name="page" value="${ pi.currentPage - 1 }"/>
								</c:url>
							</c:if>	
							 <c:if test="${ pi.currentPage > 1 }">
						    	<a class="page-link" href="${ goBack }">&lt;</a>
						    </c:if>    	

						  	<!-- 클릭 불가능한 상태 -->
						  	<c:if test="${ pi.currentPage <= 1 }">
				    			<a class="page-link bg-secondary bg-opacity-50 disable">&lt;</a>
							</c:if>	
						  </li>
						   	

					    <!-- number -->
					    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
					    	<c:if test="${ !empty selectCategory && !empty query }">
						    	<c:url value="${ loc }?selectCategory=${selectCategory}&query=${query}" var="goNum">
						    		<c:param name="page" value="${ p }"/>
						    	</c:url>
						    </c:if>
						    <c:if test="${ !(!empty selectCategory && !empty query) }">
								<c:url value="${ loc }?selectCategory=${selectCategory}&query=${query}" var="goNum">
									<c:param name="page" value="${ p }" />
								</c:url>						    
						    </c:if>
						    
						    	<li class="page-item"><a class="page-link" href="${ goNum }">${ p }</a></li>
												    	
					    </c:forEach>
					     <!-- number -->
					    			
						
					    <li class="page-item">
					    	<c:if test="${ !empty selectCategory && !empty query }">
						    	<c:url value="${ loc }?selectCategory=${selectCategory}&query=${query}" var="goNext">
						    		<c:param name="page" value="${ pi.currentPage + 1 }"/>
						    	</c:url>
						    </c:if>
							<c:if test="${ !(!empty selectCategory && !empty query) }">
					    		<c:url value="${ loc }?selectCategory=${selectCategory}&query=${query}" var="goNext">
					    			<c:param name="page" value="${ pi.currentPage + 1 }"/>
					    		</c:url>
				    		</c:if>
							 <!-- 클릭 불가능한 상태 -->
						    <c:if test="${ pi.currentPage == pi.maxPage }">
						    	<a class="page-link bg-secondary bg-opacity-50 disable">&gt;</a>
					    	</c:if>
							<c:if test="${ pi.currentPage < pi.endPage }">
								<a class="page-link" href="${ goNext }">&gt;</a>
							</c:if>
				    	</li>	    
					  </ul>
					</div>
				</div>
					
					
					
				<!-- 검색조건~ -->
				<div class="row g-2">
					<div class="col-10">
						<form method="get" class="search-form d-flex justify-content-center" action="${ contextPath }/FAQSearch.admin">
							<div class="input-group mb-3 w-75">
							  <button class="btn btn-success dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">검색조건</button>
							  <select class="dropdown-menu" name="selectCategory">
							    <option value="all" selected>전체</option>
							    <option value="q_question">질문</option>
								<option value="q_answer">답변</option>
							  </select>
							  <input type="search" placeholder="검색어 입력" aria-label="Text input with dropdown button" id="searchBar" name="query">
							  <button class="btn btn-primary btn-md p-3 fs-5" id="searchButton">검색</button> 
							</div>
						</form>
					</div>
					<div class="col-2">
						<button type="button" class="btn btn-xl btn-warning mt-2 p-2 fs-5 btn-rounded-line text-black shadow-lg" onclick="location.href='${contextPath}/FAQinsert.admin'">FAQ등록</button>
					</div>
				</div>
			</div>
		</div>
	</section>
	
		
		<script>

			//수정 버튼들
			const faqUpdates = document.querySelectorAll('.faqUpdate');
			//삭제 버튼들
	 		const faqDeletes = document.querySelectorAll('.faqDelete');
	 		
			//각 행 글 번호에 맞는 각각의 수정 버튼 뽑아내고 글번호 주소요청~
			for(const faqUpdate of faqUpdates ) {
				faqUpdate.addEventListener('click', function() {
					const faqNo1 = faqUpdate.parentElement.parentElement.children[0].innerText;
					console.log(faqNo1);
 					location.href = '${contextPath}/FAQupdate.admin?faqNo=' + faqNo1 + '&page=' + ${ pi.currentPage };
				});
			}	

			
			for(const faqDelete of faqDeletes) {
					faqDelete.addEventListener('click', function() {
			 		    const faqNo2 = faqDelete.parentElement.parentElement.children[0].innerText;
			 		   if(confirm("삭제하시겠습니까?")) {
			 		     	location.href='${contextPath}/FAQdelete.admin?faqNo=' + faqNo2 + '&page=' + ${ pi.currentPage };
						} else {
							
						}
					});
			}
			
		</script>

</body>
</html>