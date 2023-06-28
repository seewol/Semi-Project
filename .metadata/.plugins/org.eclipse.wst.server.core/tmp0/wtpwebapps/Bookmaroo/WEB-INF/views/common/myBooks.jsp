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
	.returnButton{
		color: white; 
		background-color: #DD3B57; 
		border: 1px solid #DD3B57;
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
	      	<%@ include file="../../../WEB-INF/views/common/myPageSide.jsp" %>
	    </div>
				    
	    <!-- 중앙 영역 -->
	    <div class="col-8" id="main">
	    
	    <br>
    	<div class="d-flex flex-wrap flex-md-nowrap pb-2 mb-3 border-bottom justify-content-between align-items-center">
        	<h1 class="h1">내 서재</h1>
     	</div>
	    <br>
	      
	    <div>
	    	<c:if test="${!empty list }">
	    		<div class="row border-bottom border-top text-center bg-light">
		    		<div class="col-2"><b>도서 표지</b></div>
		    		<div class="col-6"><b>도서 정보</b></div>
		    		<div class="col-2"><b>대여일</b></div>
		    		<div class="col-2"><b>반납(예정)일</b></div>
		    	</div>	
    			<c:forEach items="${list}" var="b" varStatus="status">
				  	<div class="row border-bottom border-top text-center align-items-center">
					  	<div class="col-2"><img src="${b.bookImage}" alt="책 이미지" class="bookImage"></div>
						<div class="col-6">
							<div><b>${b.bookName}</b></div>
							<br>
							<div>${b.author}</div>
							<br>
							<div>${b.publisher}</div>
						</div>
						<div class="col-2">${b.rentDate}</div>
						<c:if test="${b.isReturn == 'Y' }">
							<div class="col-2">${b.returnDate}</div>
						</c:if>
						<c:if test="${b.isReturn != 'Y' }">
							<div class="col-2">
								<div>${b.dueDate}</div>
								<form action="${ contextPath }/returnBook.lib" method="POST">
									<input name="bookNumber" value="${b.bookNumber}" type="hidden">
						  			<input name="bookImage" value="${b.bookImage}" type="hidden">
						  			<input name="bookName" value="${b.bookName}" type="hidden">
						  			<input name="publisher" value="${b.publisher}" type="hidden">
						  			<input name="author" value="${b.author}" type="hidden">
						  			<input name="place" value="myBooks" type="hidden">
									<div><button class="returnButton">반납하기</button></div>
								</form>
							</div>
						</c:if>
					</div>
				</c:forEach>
			</c:if>
			<c:if test="${ empty list }">
				<h3>대여목록이 비어있습니다.</h3>
			</c:if>
		</div>
		<br>
	    
	    <!-- 페이징 처리 -->
		<nav aria-label="Page navigation example">
	       	<ul class="pagination justify-content-center">
	       		<c:if test="${pi.currentPage > 1 }">
	       			<li class="page-item">
       				<c:url value="/myBooks.lib" var="goBack">
            			<c:param name="page" value="${ pi.currentPage - 1 }"/>
            		</c:url>
	            	<a class="page-link" href="${ goBack }" aria-label="Previous">
	            		<span aria-hidden="true">&laquo;</span>
	              	</a>
	            </li>
	       		</c:if>
	            
	            <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
            		<c:url value="/myBooks.lib" var="goNum">
            			<c:param name="page" value="${ p }"/>
            		</c:url>
	            	
	            	<li class="page-item"><a class="page-link" href="${ goNum }">${ p }</a></li>
	            </c:forEach>
	            
	            <c:if test="${pi.currentPage < pi.maxPage }">
	            	<li class="page-item">
            			<c:url value="/myBooks.lib" var="goNext">
		            		<c:param name="page" value="${ pi.currentPage + 1 }"/>
		            	</c:url>
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
	
	<div class="modal fade" tabindex="-1" role="dialog" id="modalId">
      	<div class="modal-dialog" role="document">
            <div class="modal-content rounded-3 shadow">
              	<div class="modal-body p-4 text-center">
                 	<h1 id="modalIcon"><i class="bi bi-check-circle" style="color: green;"></i></h1>
                   	<h3 class="mb-0" id="modalText"></h3>
              	</div>
              	<div class="modal-footer flex-nowrap p-0">
                   	<button type="button" class="btn btn-lg btn-link fs-6 text-decoration-none col-12 m-0 rounded-0" data-bs-dismiss="modal" id="modalButton">확인</button>
              	</div>
            </div>
    	</div>
    </div>
    
    <script>
	
		window.onload = () =>{
		   	const contextPath = "${contextPath}";
			const successMessage = "${successMessage}";
			const modalIcon = document.getElementById("modalIcon");
		   	const modalText = document.getElementById("modalText");
		   	if (successMessage != "") {
		   		modalIcon.innerHTML = "<i class='bi bi-check-circle' style='color: green;'></i>";
		      	modalText.innerText = successMessage;
		   		$('#modalId').modal('show');
		   	}
		   	
		   	const message = "${message}";
		   	if (message != "") {
		   		modalIcon.innerHTML = "<i class='bi bi-exclamation-triangle-fill' style='color: red;'></i>";
		      	modalText.innerText = message;
		   		$('#modalId').modal('show');
		   	}
		}		
	  		
	</script>
    
</body>
</html>