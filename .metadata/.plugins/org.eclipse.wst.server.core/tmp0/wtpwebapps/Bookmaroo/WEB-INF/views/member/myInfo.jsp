<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>내 정보 수정</title>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300&display=swap" rel="stylesheet">
<script src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<style>
	#deleteMember {
 		 cursor: pointer;
	}
	#main {
 	    position: relative;
	    top: 0;
	    left: 50%;
 	    transform: translateX(-50%); 
	    font-family: 'Inter', sans-serif;
	    width: 100%;
 	    height: auto; /* footer의 높이를 고려하여 설정 */
	    overflow: auto;
 	    margin-top: 102px;
	    margin-bottom: 110px;
	}
	table{
		margin-bottom: 5px;
	}
    hr {
    	width: 500px;
    }
    td {
    	padding: 5px;
    }
   	::placeholder {
  		color: black;
 		font-size: .8em;
 		font-weight: 400;
	}
	.td_width {
		width: 250px;
	}
	#deleteMember {
		font-size: 10px;
		font-style: italic;
		text-decoration: underline;
		color: lightgray;
		margin-left: 200px;
	}
	#info {
		font-size: 13px;
	}
	a {
		  text-decoration: none;
	}
	#update {
		text-decoration: none;
		font-size: 13px;
		color: black;
	}
	#update:link{color: black;}
	#update:visited{color: black;}
	#update:hover{color: #4373E6;}
</style>
</head>
<body>
	<%@ include file="../common/top3.jsp" %>
	<section class="row">
		<div class="col-2">
			<jsp:include page="../common/myPageSide.jsp"/>
		</div>
		<div class="col-8">
			<div align="center" id="main">
				<h5><b>👤${ loginUser.memName }님의 프로필</b></h5><br>
				<form id="updateForm">
					<table>
						<tr>
							<td class="td_width">
								<span id="info">ID</span>
								<c:if test="${ empty loginUser.memId }">
									<input class="form-control" type="text" id="memId" name="memId" value="-" style="background-color: #EAEAEA;"readonly aria-label="default input example"/>
								</c:if>
								<c:if test="${ !empty loginUser.memId }">
									<input class="form-control" type="text" id="memId" name="memId" value="${ loginUser.memId }" style="background-color: #EAEAEA;"readonly aria-label="default input example"/>
								</c:if>
							</td>
						</tr>
						<tr>
							<td class="td_width">
								<span id="info">NAME</span>
								<input class="form-control" type="text" name="memName" value="${ loginUser.memName }" style="background-color: #EAEAEA;" readonly aria-label="default input example"/>
							</td>
						</tr>
						<tr>
							<td class="td_width">
								<span id="info">PHONE</span>
								<input class="form-control" type="tel" id="phoneNumber" name="phone" value="${ loginUser.phone }" style="background-color: #EAEAEA;" aria-label="default input example" readonly/>
							</td>
						</tr>
						<tr>
							<td>
							</td>
						</tr>
					</table>
					<div id="aTags">
					<c:if test="${ !empty loginUser.memId }">
						<a href="${ contextPath }/updatePwdForm.me" onclick="window.open(this.href, '_blank', 'width=400, height=420'); return false;"><span id="update">비밀번호 변경&nbsp;</span></a> |
					</c:if>	
						<a href="${ contextPath }/updatePhoneForm.me" onclick="window.open(this.href, '_blank', 'width=400, height=350'); return false;"><span id="update">&nbsp;휴대폰 번호 변경</span></a>
						<br/>
					<c:if test="${ !empty loginUser.memNo }">
						<a id="deleteMember"><b>회원 탈퇴</b></a>
					</c:if>
					</div>	
					<hr/>
					<br/>
					<button type="button" class="btn btn-primary" style="--bs-btn-padding-y: .40rem; --bs-btn-padding-x: 4.0rem; --bs-btn-font-size: 0.8rem; background-color: #4373E6;" onclick = "location.href='${contextPath}/semiHome.do'">메인으로 돌아가기</button>
				</form>
			</div>
		</div>
		<div class="col-2"></div>	
	</section>
	
	<div class="modal fade" tabindex="-1" role="dialog" id="loginModal">
      <div class="modal-dialog" role="document">
            <div class="modal-content rounded-3 shadow">
              <div class="modal-body p-4 text-center">
                 <h1>🐼</h1>
                   <h5 class="mb-0">로그인 후 이용 가능합니다.</h5>
              </div>
              <div class="modal-footer flex-nowrap p-0">
                   <button type="button" class="btn btn-lg btn-link fs-6 text-decoration-none col-12 m-0 rounded-0" data-bs-dismiss="modal">확인</button>
              </div>
            </div>
       </div>
 	</div>
 	<div class="modal fade" tabindex="-1" role="dialog" id="deleteModal">
		<div class="modal-dialog" role="document">
	    	<div class="modal-content rounded-3 shadow">
	    		<div class="modal-body p-4 text-center">
	     			<h1>😵‍💫</h1>
	       			<h3 class="mb-0">회원을 탈퇴하시겠습니까?</h3>
	       			<p class="mb-0">삭제 후 되돌릴 수 없습니다.</p>
	      		</div>
	      		<div class="modal-footer flex-nowrap p-0">																			
	        		<button type="button" class="btn btn-lg btn-link fs-6 text-decoration-none col-6 m-0 rounded-0 border-end" onclick="location.href='${contextPath}/deleteMember.me'">
	        			<strong>네</strong>
	        		</button>
	        		<button type="button" class="btn btn-lg btn-link fs-6 text-decoration-none col-6 m-0 rounded-0" data-bs-dismiss="modal">아니오</button>
	      		</div>
	    	</div>
	  	</div>
	</div>
	<%@ include file="../common/bottom.jsp" %>
	
	<script>
		window.onload = () =>{
			
			// ● ● ● 회원 탈퇴
			document.getElementById('deleteMember').addEventListener('click', ()=>{
				$('#deleteModal').modal('show');
			});
			
		}
	</script>
</body>
</html>