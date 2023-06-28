<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	a {
		color: black;
		text-decoration: none;
		cursor: pointer;
	}
 	
	
</style>
</head>
<body>

	<section class="container-fluid position-absolute">
		<div class="p-3 bg-primary bg-opacity-25 text-center" style="width:380px;" id="sideBarList">
			<div class="bg-white d-inline-block">
				<a href="#"><img src="${contextPath}/resources/image/bookMarooLogo.png" class="p-4 mb-2" alt="Bookmaroo logo"></a>
			</div>
			<ul class="list-unstyled text-decoration-none p-2">
			   <li class="bg-white mx-auto d-inline-block mt-2">
		    	<div>
		    		<button class="btn btn-white fs-3 btns" data-bs-toggle="collapse" role="button" aria-expanded="false" aria-controls="multiCollapseExample1" onclick="location.href='${ contextPath }/noticeManage.admin'">
		    			<i class="bi bi-folder-fill text-primary pe-4"></i>공지사항 관리
		    			<span class="material-symbols-outlined" id="arrowIcon">keyboard_arrow_right</span>
		    		</button>
				</div>
				    <div class="collapse multi-collapse" id="multiCollapseExample1">
				      <div class="card card-body border border-0">
					    <a class="btnList text-start ms-5" onclick="location.href='${ contextPath }/noticeManage.admin'">
					    	 <p>공지사항 등록</p>
					    	 <p>공지사항 삭제</p>
					    	 <p>공지사항 수정</p>
 			    	  	</a>
				      </div>
				    </div>
			    </li>



<!-- 			    <li class="bg-white mx-auto d-inline-block mt-2"> -->
<!-- 		    	<div> -->
<!-- 		    		<button class="btn btn-white fs-3 btns" data-bs-toggle="collapse" href="#multiCollapseExample2" role="button" aria-expanded="false" aria-controls="multiCollapseExample"> -->
<!-- 		    			<i class="bi bi-folder-fill text-primary pe-4"></i>교육/문화&nbsp;&nbsp;&nbsp; -->
<!-- 		    			<span class="material-symbols-outlined ms-4" id="arrowIcon">keyboard_arrow_right</span> -->
<!-- 		    		</button> -->
<!-- 				</div> -->
<!-- 				    <div class="collapse multi-collapse" id="multiCollapseExample2"> -->
<!-- 				      <div class="card card-body border border-0"> -->
<%-- 					    <a class="btnList text-start ms-5" id="toUserManage" onclick="location.href='${ contextPath }/popupManage.admin'"> --%>
<!-- 							<p>이미지 등록</p> -->
<!-- 							<p>이미지 삭제</p> -->
<!--  			    	  	</a> -->
<!-- 				      </div> -->
<!-- 				    </div> -->
<!-- 			    </li> -->
			    

			   <li class="bg-white mx-auto d-inline-block mt-2">
		    	<div>
		    		<button class="btn btn-white fs-3 btns" data-bs-toggle="collapse" role="button" aria-expanded="false" aria-controls="multiCollapseExample" onclick="location.href='${ contextPath }/userManage.admin'">
		    			<i class="bi bi-folder-fill text-primary pe-4"></i>이용자 관리
		    			<span class="material-symbols-outlined ms-4" id="arrowIcon">keyboard_arrow_right</span>
		    		</button>
				</div>
				    <div class="collapse multi-collapse" id="multiCollapseExample3">
				      <div class="card card-body border border-0">
					    <a class="btnList text-start ms-5" id="toUserManage" onclick="location.href='${ contextPath }/userManage.admin'">
					    	 <p>이용자 등록</p>
					    	 <p>이용자 목록</p>
					    	 <p>이용자 삭제</p>
 			    	  	</a>
				      </div>
				    </div>
			    </li>
			    
			   <li class="bg-white mx-auto d-inline-block mt-2">
		    	<div>
		    		<button class="btn btn-white fs-3 btns" data-bs-toggle="collapse" role="button" aria-expanded="false" aria-controls="multiCollapseExample" onclick="location.href='${ pageContext.servletContext.contextPath }/bookManage'">
		    			<i class="bi bi-folder-fill text-primary pe-4"></i>도서 관리
		    			<span class="material-symbols-outlined ms-5 me-1" id="arrowIcon">keyboard_arrow_right</span>
		    		</button>
				</div>
				    <div class="collapse multi-collapse" id="multiCollapseExample4">
				      <div class="card card-body border border-0">
					    <a class="btnList text-start ms-5" onclick="location.href='${ pageContext.servletContext.contextPath }/bookManage'">
					    	 <p>도서 목록</p>
					    	 <p>도서 등록</p>
					    	 <p>도서 삭제</p>
					    	 <p>도서 수정</p>
					    	 <p>도서 상태</p>
 			    	  	</a>
				      </div>
				    </div>
			    </li>
			    
			   <li class="bg-white mx-auto d-inline-block mt-2">
		    	<div>
		    		<button class="btn btn-white fs-3 btns" data-bs-toggle="collapse" role="button" aria-expanded="false" aria-controls="multiCollapseExample" onclick="location.href='${ contextPath }/question.admin'">
		    			<i class="bi bi-folder-fill text-primary pe-4"></i>이용안내 관리
		    			<span class="material-symbols-outlined" id="arrowIcon">keyboard_arrow_right</span>
		    		</button>
				</div>
				    <div class="collapse multi-collapse" id="multiCollapseExample5">
				      <div class="card card-body border border-0">
					    <a class="btnList text-start ms-5" onclick="location.href='${ contextPath }/question.admin'">
					    	 <p>문의사항 답변</p>
 			    	  	</a>
				      </div>
				    </div>
			    </li>
			    
			   <li class="bg-white mx-auto d-inline-block mt-2">
		    	<div>
		    		<button class="btn btn-white fs-3 btns" data-bs-toggle="collapse" role="button" aria-expanded="false" aria-controls="multiCollapseExample" onclick="location.href='${ contextPath }/adminManage'">
		    			<i class="bi bi-folder-fill text-primary pe-4"></i>관리자 관리
		    			<span class="material-symbols-outlined ms-4" id="arrowIcon">keyboard_arrow_right</span>
		    		</button>
				</div>
				    <div class="collapse multi-collapse" id="multiCollapseExample6">
				      <div class="card card-body border border-0">
					    <a class="btnList text-start ms-5" onclick="location.href='${ contextPath }/adminManage'">
					    	 <p>계정목록 조회</p>
					    	 <p>계정 생성</p>
					    	 <p>계정 삭제</p>
					    	 <p>관리자 권한 부여</p>
 			    	  	</a>
				      </div>
				    </div>
			    </li>
			    
			   <li class="bg-white mx-auto d-inline-block mt-2">
		    	<div>
		    		<button class="btn btn-white fs-3 btns" data-bs-toggle="collapse" role="button" aria-expanded="false" aria-controls="multiCollapseExample" onclick="location.href='userReview'">
		    			<i class="bi bi-folder-fill text-primary pe-4"></i>리뷰 관리
		    			<span class="material-symbols-outlined ms-5 me-2" id="arrowIcon">keyboard_arrow_right</span>
		    		</button>
				</div>
				    <div class="collapse multi-collapse" id="multiCollapseExample7">
				      <div class="card card-body border border-0">
					    <a class="btnList text-start ms-5" onclick="location.href='userReview'">
					    	 <p>리뷰 목록</p>
					    	 <p>리뷰 수정</p>
					    	 <p>리뷰 삭제</p>
 			    	  	</a>
				      </div>
				    </div>
			    </li>
			    
			</ul>
	  	</div>
	</section>
	
</body>
</html>



