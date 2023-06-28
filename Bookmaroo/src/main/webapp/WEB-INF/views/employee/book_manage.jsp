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
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<body>

	<jsp:include page="../common/top4.jsp"/>
 	<jsp:include page="../common/sideList.jsp"/>
 	
	<section class="container-lg text-center position-absolute mt-3 pt-4">
	  <div class="row g-2">
	    <div class="col-6">
	      <span class="badge text-bg-success p-2 mb-3 fs-4 shadow">등록된 도서 목록</span>
	      <div class="bg-white">
		  	<table class="bg-white table table-hover text-center fs-6 p-5">
					<thead>
					    <tr>
					      <th scope="col">도서번호</th>
					      <th scope="col">도서 명</th>
					      <th scope="col">저자</th>
					      <th scope="col">출판사</th>
					      <th scope="col">대여 상태</th>
					    </tr>
					</thead>
					<tbody class="table-group-divider" id="result">
					</tbody>
						<div class="input-group mb-3 w-40">
							<button class="btn btn-success dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">검색조건</button>
							<select class="dropdown-menu" id="select2">
								<option value="title">도서 명</option>
								<option value="isbn">ISBN</option>
								<option value="authors">저자</option>
								<option value="status">대여 상태(Y/N)</option>
							</select>
							<input type="text" class="form-control" aria-label="Text input with dropdown button" id="keyword">
							<button type="button" class="btn btn-primary btn-md p-3 fs-5" id="searching">검색</button>
						</div>
				</table>
					<div class="bg-white d-flex justify-content-center w-100mb-5">
					  	<ul class="pagination">
							<li class="page-item">
							   	<a class="page-link" href="" aria-label="Previous">
							   		<span aria-hidden="true">&laquo;</span>
							   	</a>
							</li>
							
							<li class="page-item"><a class="page-link pageNum2" id="first">1</a></li>
							<li class="page-item"><a class="page-link pageNum2" id="second">2</a></li>
							<li class="page-item"><a class="page-link pageNum2" id="third">3</a></li>
							<li class="page-item"><a class="page-link pageNum2" id="fourth">4</a></li>
							<li class="page-item"><a class="page-link pageNum2" id="fifth">5</a></li>
							
							<li class="page-item">
						    	<a class="page-link" href="" aria-label="Next">
						    		<span aria-hidden="true">&raquo;</span>
						    	</a>
						  	</li>
						</ul>
					</div>		
				</div>
		  	</div>
			<!-- col-8, col-4 -->
		  	<div class="col-6">
		  		<span class="badge text-bg-success p-2 fs-4 shadow">도서 정보</span>
	      		<div class="p-3">
	      			<div class="form-1-container">
	     				<form action="" method="post">
		                    <!-- Book's Credentials  -->
		                    <fieldset class="form-group border border-4 p-3 fw-bold text-start">
		                        <div class="row">
		                        	<div class="col-5">
		                        		<!-- 책 사진이 뜨는 곳 -->
		                        		<div class="text-center">
	  										<img src="" class="rounded" id="thumbnail2">
										</div>	
		                        	</div>
		                        	<div class="col-7 mb-2">
		                        		<div class="form-group mt-1">
				                            <label>도서번호</label>
				                            <input type="text" class="form-control bg-secondary bg-opacity-50" id="isbn2" name="isbn" readonly>
				                        </div>
			                        	<div class="form-group mt-1">
				                            <label>도서명</label>
				                            <input type="text" class="form-control" id="title2" name="title" required>
				                        </div>
				                        <div class="form-group mt-1">
				                            <label>저자명</label>
				                            <input type="text" class="form-control" id="authors2" name="authors" required>
				                        </div>
				                        <div class="form-group mt-1">
				                            <label>출판사</label>
				                            <input type="text" class="form-control" id="publisher2" name="publisher" required>
				                        </div>
				                        <div class="form-group mt-1">
				                            <label>발행일</label>
				                            <input type="text" class="form-control" id="datetime2" name="datetime" required>
				                        </div>
				                        <div class="form-group mt-1">
				                            <label>장르</label>
				                            <select id="gmCode2">
												<option value="1">건강/취미</option>
												<option value="2">경제/경영</option>
												<option value="4">공무원 수험서</option>
												<option value="5">과학</option>
												<option value="6">달력/기타</option>
												<option value="7">만화</option>
												<option value="8">사회과학</option>
												<option value="9">소설/시/희곡</option>
												<option value="10">수험서/자격증</option>
												<option value="11">어린이</option>
												<option value="12">에세이</option>
												<option value="13">여행</option>
												<option value="14">역사</option>
												<option value="15">예술/대중문화</option>
												<option value="16">외국어</option>
												<option value="17">요리/살림</option>
												<option value="18">유아</option>
												<option value="19">인문학</option>
												<option value="20">자기계발</option>
												<option value="21">잡지</option>
												<option value="22">장르소설</option>
												<option value="23">전집/중고전집</option>
												<option value="24">종교/역학</option>
												<option value="25">좋은부모</option>
												<option value="26">청소년</option>
												<option value="27">컴퓨터/모바일</option>
												<option value="28">참고서</option>
											</select>
				                        </div>
				                        <div class="form-group mt-1">
				                            <label>대여 상태</label>
				                            <input type="text" class="form-control bg-secondary bg-opacity-50" id="status2" name="book_status" readonly>
				                        </div>		                        
		                        	</div>
		                        </div>
		                         <div class="row">
			                        	<div class="col-12">
			                        		<div class="form-floating">
											  <textarea class="form-control" placeholder="Leave a comment here" id="contents2" style="height: 150px" name="bookContent"></textarea>
											  <label for="floatingTextarea2">내용 입력</label>
											</div>
					                        <div class="text-end mt-2">
					                            <button type="button" class="btn btn-primary mt-2 p-2 fs-5 rounded-pill" name="submit">도서 수정</button>
					                            <button type="button" class="btn btn-danger mt-2 p-2 fs-5 rounded-pill" id="delete">도서 삭제</button>
					                        </div>
			                        	</div>
			                        </div>
		                    </fieldset>      
		                </form>
	      			</div>
	      		</div>
		  	</div>
		  	
		  	
		  	<div>
				<span class="badge text-bg-success p-2 mb-3 fs-4 shadow">비치 희망 도서</span>
			</div>
			<div class="col-12 bg-white">
					<table class="table table-hover text-center">
					  <thead>
					    <tr>
					      <th scope="col">도서명</th>
					      <th scope="col">저자명</th>
					      <th scope="col">출판사</th>
					      <th scope="col">신청인</th>
					      <th scope="col">요청사항</th>
					    </tr>
					  </thead>
					  <tbody class="table-group-divider" id="result2">
					  </tbody>
					  <div class="input-group mb-3 w-40">
							<button class="btn btn-success dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">검색조건</button>
							<select class="dropdown-menu" id="select3">
								<option value="Title">도서명</option>
								<option value="Authors">저자명</option>
								<option value="MemberId">신청인</option>
							</select>
							<input type="text" class="form-control" aria-label="Text input with dropdown button" id="keyword2">
							<button type="button" class="btn btn-primary btn-md p-3 fs-5" id="searching2">검색</button>
						</div>
				</table>
			
			
			<!--  pagination -->
				<div class="bg-white d-flex justify-content-center w-100mb-5">
				  	<ul class="pagination">
						<li class="page-item">
						   	<a class="page-link" href="" aria-label="Previous">
						   		<span aria-hidden="true">&laquo;</span>
						   	</a>
						</li>
						
						<li class="page-item"><a class="page-link pageNum3" id="first">1</a></li>
						<li class="page-item"><a class="page-link pageNum3" id="second">2</a></li>
						<li class="page-item"><a class="page-link pageNum3" id="third">3</a></li>
						<li class="page-item"><a class="page-link pageNum3" id="fourth">4</a></li>
						<li class="page-item"><a class="page-link pageNum3" id="fifth">5</a></li>
						
						<li class="page-item">
					    	<a class="page-link" href="" aria-label="Next">
					    		<span aria-hidden="true">&raquo;</span>
					    	</a>
					  	</li>
					</ul>
				</div>
			</div>
		  	
		  	
		  	
		  	<!-- col-6, col-6 -->
		  	<div class="row g-2">
			    <div class="col-6">
			      <span class="badge text-bg-success p-2 mb-3 fs-4 shadow">도서 검색</span>
			      	<div class="bg-white">
					  	<table class="bg-white table table-hover text-center fs-6 p-5">
							<thead>
							    <tr>
							      <th scope="col">ISBN</th>
							      <th scope="col">도서 명</th>
							      <th scope="col">저자</th>
							      <th scope="col">출판사</th>
							      <th scope="col">발행일</th>
							    </tr>
							</thead>
							<tbody class="table-group-divider" id="books">
							</tbody>
							<div class="input-group mb-3 w-40">
								<button class="btn btn-success dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">검색조건</button>
								<select class="dropdown-menu" id="select">
									<option value="title">도서 명</option>
									<option value="isbn">ISBN</option>
									<option value="authors">저자</option>
								</select>
								<input type="text" class="form-control" aria-label="Text input with dropdown button" id="searchType">
								<button type="button" class="btn btn-primary btn-md p-3 fs-5" id="search">검색</button>
							</div>
						</table>
							<div class="bg-white d-flex justify-content-center w-100mb-5">
								<ul class="pagination">
									<li class="page-item">
									   	<a class="page-link" href="" aria-label="Previous">
									   		<span aria-hidden="true">&laquo;</span>
									   	</a>
									</li>
									
									<li class="page-item"><a class="page-link pageNum" id="first">1</a></li>
									<li class="page-item"><a class="page-link pageNum" id="second">2</a></li>
									<li class="page-item"><a class="page-link pageNum" id="third">3</a></li>
									<li class="page-item"><a class="page-link pageNum" id="fourth">4</a></li>
									<li class="page-item"><a class="page-link pageNum" id="fifth">5</a></li>
									
									<li class="page-item">
								    	<a class="page-link" href="" aria-label="Next">
								    		<span aria-hidden="true">&raquo;</span>
								    	</a>
								  	</li>
								</ul>
							</div>	
						</div>
			  		</div>
	
			  	<div class="col-6">
			  		 <span class="badge text-bg-success p-2 fs-4 shadow">도서 등록</span>
		      		<div class="p-3">
		      			<div class="form-1-container">
		     				<form action="${ contextPath }/insertBook.admin" method="post">
			                    <!-- Book's Credentials  -->
			                    <fieldset class="form-group border border-4 p-3 fw-bold text-start">
			                        <div class="row mb-2">
			                        	<div class="col-5">
			                        	
			                        		<!-- 책 사진 등록하는 곳 -->                  		
											<div style="width: 14rem;">
											  <img src="" class="card-img-top" id="thumbnail">
											  <div class="card-body">
											  </div>
											</div>		                        			          
											
			                        	</div>
			                        	<div class="col-7 mb-2">
				                        	<div class="form-group mt-1">
					                            <label>도서번호</label>
					                            <input type="text" class="form-control" id="isbn" name="isbn" required>
					                        </div>
				                        	<div class="form-group mt-1">
					                            <label>도서명</label>
					                            <input type="text" class="form-control" id="title" name="title" required>
					                        </div>
					                        <div class="form-group mt-1">
					                            <label>저자명</label>
					                            <input type="text" class="form-control" id="authors" name="authors" required>
					                        </div>
					                        <div class="form-group mt-1">
					                            <label>출판사</label>
					                            <input type="text" class="form-control" id="publisher" name="publisher" required>
					                        </div>
					                        <div class="form-group mt-1">
					                            <label>발행년도</label>
					                            <input type="text" class="form-control" id="datetime" name="datetime" required>
					                        </div>
					                        <div class="form-group mt-1">
					                            <label>장르</label>
					                            <select id="gmCode">
													<option value="1">건강/취미</option>
													<option value="2">경제/경영</option>
													<option value="4">공무원 수험서</option>
													<option value="5">과학</option>
													<option value="6">달력/기타</option>
													<option value="7">만화</option>
													<option value="8">사회과학</option>
													<option value="9">소설/시/희곡</option>
													<option value="10">수험서/자격증</option>
													<option value="11">어린이</option>
													<option value="12">에세이</option>
													<option value="13">여행</option>
													<option value="14">역사</option>
													<option value="15">예술/대중문화</option>
													<option value="16">외국어</option>
													<option value="17">요리/살림</option>
													<option value="18">유아</option>
													<option value="19">인문학</option>
													<option value="20">자기계발</option>
													<option value="21">잡지</option>
													<option value="22">장르소설</option>
													<option value="23">전집/중고전집</option>
													<option value="24">종교/역학</option>
													<option value="25">좋은부모</option>
													<option value="26">청소년</option>
													<option value="27">컴퓨터/모바일</option>
													<option value="28">참고서</option>
												</select>
					                        </div>
			                        	</div>
			                        </div>
			                        
			                        <div class="row">
			                        	<div class="col-12">
			                        		<div class="form-floating">
											  <textarea class="form-control" placeholder="Leave a comment here" id="contents" style="height: 150px" name="bookContent"></textarea>
											  <label for="floatingTextarea2">내용 입력</label>
											</div>
					                        <div class="text-end mt-2">
					                            <button type="button" class="btn btn-primary mt-2 p-2 fs-5 rounded-pill" name="submit">도서 등록</button>
					                            <button type="reset" class="btn btn-dark mt-2 p-2 fs-5 rounded-pill" id="reset">초기화</button>
					                        </div>
			                        	</div>
			                        </div>
			                    </fieldset>      
			                </form>
		      			</div>
		      		</div>
			  	</div>
			  </div>
		  </div>
	</section>
	<script>
		window.onload = () => {
			searchBook(1);
			
			for(let i = 0; i < 5; i++) {
				document.getElementsByClassName("pageNum2")[i].onclick = () => {
					page = document.getElementsByClassName("pageNum2")[i].innerText;
					searchBook(page);
				}
			}
			
			searchWish(1);
			
			for(let i = 0; i < 5; i++) {
				document.getElementsByClassName("pageNum3")[i].onclick = () => {
					page = document.getElementsByClassName("pageNum3")[i].innerText;
					searchWishes(page);
				}
			}
			
			function searchAPI(page) {
				let type = document.getElementById("select").value;
				$.ajax({
					method: "GET",
					url: "https://dapi.kakao.com/v3/search/book?target=" + type,
					data: { 
						query: document.getElementById("searchType").value,
						page: page
					},
					headers: { Authorization: "KakaoAK 4c71af0643f2d004b84a70dd3c7b8477"}
				})
				
				.done(msg => {
					let books = "";
					for(book of msg.documents) {
						let title = book.title;
						let authors = book.authors;
						let publisher = book.publisher;
						let datetime = book.datetime.substring(0, 4);
						let isbn = book.isbn.split(" ")[0];
						
						books += "<tr><td scope='row'>" + isbn + "</td>" + "<td>" + title + "</td>" + "<td>" + authors + "</td>" + "<td>" + publisher + "</td>"	+ "<td>" + datetime + "</td></tr>";
					}
					document.getElementById("books").innerHTML = books;
					
					for(let i = 0; i < document.getElementById("books").querySelectorAll("tr").length; i++) {
						document.getElementById("books").querySelectorAll("tr")[i].onclick = () => {
							document.getElementById("isbn").value = msg.documents[i].isbn.split(" ")[0];
							document.getElementById("title").value = msg.documents[i].title;
							document.getElementById("authors").value = msg.documents[i].authors;
							document.getElementById("publisher").value = msg.documents[i].publisher;
							document.getElementById("datetime").value = msg.documents[i].datetime.substring(0, 10);
							document.getElementById("contents").value = msg.documents[i].contents.replace(msg.documents[i].contents.split("").reverse().join("").split(".")[0].split("").reverse().join("").trim(), "");
							document.getElementById("thumbnail").src = msg.documents[i].thumbnail;
						}
					}
				});
			}
			
			document.getElementById("search").onclick = () => {				
				searchAPI(1);
				
				for(let i = 0; i < 5; i++) {
					document.getElementsByClassName("pageNum")[i].onclick = () => {
						page = document.getElementsByClassName("pageNum")[i].innerText;
						
						searchAPI(page);
					};
				}
			}
			
			function searchBook(page) {
				let type = document.getElementById("select2").value;
				let keyword = document.getElementById("keyword").value;
				
				$.ajax({
					type: "POST",
					url: "searchBook",
					async: false,
					data: {
						keyword: keyword,
						type: type
					},
					success: (data) => {
						let books = "";
						let start = 10 * (page - 1);
						let end = (10 * page) - 1;
						if(end > data.length) {
							end = data.length;
						}
						
						for(let i = start; i < end; i++) {
							let isbn = data[i].isbn;
							let title = data[i].title;
							let authors = data[i].authors;
							let publisher = data[i].publisher;
							let datetime = data[i].datetime;
							let gmCode = data[i].gmCode;
							let status = data[i].isRental;
							
							books += "<tr><td scope='row'>" + isbn + "</td>" + "<td>" + title + "</td>" + "<td>" + authors + "</td>" + "<td>" + publisher + "</td>"	+ "<td>" + status + "</td></tr>";
						}
						document.getElementById("result").innerHTML = books;
						
						for(let i = 0; i < document.getElementById("result").querySelectorAll("tr").length; i++) {
							document.getElementById("result").querySelectorAll("tr")[i].onclick = () => {			
								document.getElementById("isbn2").value = data[start + i].isbn;
								document.getElementById("title2").value = data[start + i].title;
								document.getElementById("authors2").value = data[start + i].authors;
								document.getElementById("publisher2").value = data[start + i].publisher;
								document.getElementById("datetime2").value = data[start + i].datetime;
								document.getElementById("gmCode2").value = data[start + i].gmCode;
								document.getElementById("status2").value = data[start + i].isRental;
								document.getElementById("contents2").value = data[start + i].contents;
								document.getElementById("thumbnail2").src = data[start + i].thumbnail;
							}
						}
					}
				});
			}
			
			document.getElementById("searching").onclick = () => {				
				searchBook(1);
				
				for(let i = 0; i < 5; i++) {
					document.getElementsByClassName("pageNum2")[i].onclick = () => {
						page = document.getElementsByClassName("pageNum2")[i].innerText;
						searchBook(page);
					}
				}
			}
			
			function reset() {
				document.getElementById("reset").onclick = true;
				document.getElementById("thumbnail").src = "";
			}
			
			document.getElementById("reset").onclick = () => {
				reset();
			}
			
			document.getElementsByName("submit")[0].onclick = () => {
				let arr = [document.getElementById("isbn2").value,
					document.getElementById("title2").value,
					document.getElementById("authors2").value,
					document.getElementById("publisher2").value,
					document.getElementById("datetime2").value,
					document.getElementById("gmCode2").value,
					document.getElementById("status2").value,
					document.getElementById("contents2").value,
					document.getElementById("thumbnail2").src]
				
				$.ajax({
					url: "updateBook",
					type: "POST",
					traditional: true,
					data: {
						"book" : arr
					},
					dataType: 'json',
					success: (isbn) => {
						document.getElementById("isbn2").value = "";
						document.getElementById("title2").value = "";
						document.getElementById("authors2").value = "";
						document.getElementById("publisher2").value = "";
						document.getElementById("datetime2").value = "";
						document.getElementById("gmCode2").value = "";
						document.getElementById("status2").value = "";
						document.getElementById("contents2").value = "";
						document.getElementById("thumbnail2").src = "";
						
						swal({
							   title: "성공",
							   text: "도서 수정이 완료되었습니다.",
							   icon: "success"
						});
						
						searchBook(1);
						
						for(let i = 0; i < 5; i++) {
							document.getElementsByClassName("pageNum2")[i].onclick = () => {
								page = document.getElementsByClassName("pageNum2")[i].innerText;
								searchBook(page);
							}
						}
					},
					error : (isbn) => {
						switch("") {
						case document.getElementById("isbn2").value : check(document.getElementById("isbn2").value, document.getElementById("isbn").parentElement.children[0].innerText); break;
						case document.getElementById("authors2").value : check(document.getElementById("authors2").value, document.getElementById("authors").parentElement.children[0].innerText); break;
						case document.getElementById("title2").value : check(document.getElementById("title2").value, document.getElementById("title").parentElement.children[0].innerText); break;
						case document.getElementById("publisher2").value : check(document.getElementById("publisher2").value, document.getElementById("publisher").parentElement.children[0].innerText); break;
						case document.getElementById("datatime2").value : check(document.getElementById("datatime2").value, document.getElementById("datatime").parentElement.children[0].innerText); break;
						default : swal({
									   title: "실패",
									   text: "도서 수정이 실패했습니다. 다시 시도해주세요.",
									   icon: "error"
								  });
						}
					}
				});
			}
			
				     
			document.getElementById("delete").onclick = () => {
				swal({
					title: "확인",
					text: "정말 삭제하시겠습니까?",
					icon: "warning",
					buttons: ["아니오", "예"]
				}).then((YES) => {
					if(YES) {
						$.ajax({
							url: "deleteBook",
							type: "POST",
							data: { "isbn": document.getElementById("isbn2").value },
							success: () => {
								document.getElementById("isbn2").value = "";
								document.getElementById("title2").value = "";
								document.getElementById("authors2").value = "";
								document.getElementById("publisher2").value = "";
								document.getElementById("datetime2").value = "";
								document.getElementById("gmCode2").value = "";
								document.getElementById("status2").value = "";
								document.getElementById("contents2").value = "";
								document.getElementById("thumbnail2").src = "";
								
								swal({
									   title: "성공",
									   text: "도서 삭제가 완료되었습니다.",
									   icon: "success"
								});
								
								searchBook(1);
								
								for(let i = 0; i < 5; i++) {
									document.getElementsByClassName("pageNum2")[i].onclick = () => {
										page = document.getElementsByClassName("pageNum2")[i].innerText;
										searchBook(page);
									}
								}
							},
							error: () => {
								swal({
									   title: "실패",
									   text: "대여 기록이 존재하는 도서는 삭제가 불가능합니다.",
									   icon: "error"
								});
							}
						});
					}
				})
			}
			
			document.getElementsByName("submit")[1].onclick = () => {
				let arr = [document.getElementById("isbn").value,
					document.getElementById("title").value,
					document.getElementById("authors").value,
					document.getElementById("publisher").value,
					document.getElementById("datetime").value,
					document.getElementById("gmCode").value,
					document.getElementById("contents").value,
					document.getElementById("thumbnail").src]
					
				$.ajax({
					url: "insertBook",
					type: "POST",
					traditional: true,
					data: {
						"book" : arr
					},
					dataType: 'json',
					success: (isbn) => {
						document.getElementById("isbn").value = "";
						document.getElementById("title").value = "";
						document.getElementById("authors").value = "";
						document.getElementById("publisher").value = "";
						document.getElementById("datetime").value = "";
						document.getElementById("contents").value = "";
						document.getElementById("thumbnail").src = "";
						
						swal({
							   title: "성공",
							   text: "도서 등록이 완료되었습니다.",
							   icon: "success"
						});
					},
					error: (isbn) => {
	
						swal({title: "실패", text: "이미 등록된 도서입니다.", icon: "warning"});
					}
				});
			}
			
			function check(data, data2) {
				swal({
					   title: "실패",
					   text: data2 + "을(를) 입력해주세요.",
					   icon: "error"
				});
			}
			
			function searchWish(page) {
				let type = document.getElementById("select3").value;
				let keyword = document.getElementById("keyword2").value;
				
				$.ajax({
					type: "POST",
					url: "searchWish",
					async: false,
					data: {
						keyword: keyword,
						type: type
					},
					success: (data) => {
						let wishes = "";
						let start = 10 * (page - 1);
						let end = (10 * page) - 1;
						if(end > data.length) {
							end = data.length;
						}
						
						for(let i = start; i < end; i++) {
							let wishNo = data[i].wishNo;
							let memberNo = data[i].memberNo;
							let wishTitle = data[i].wishTitle;
							let wishAuthor = data[i].wishAuthor;
							let wishPublisher = data[i].wishPublisher;
							let wishPrice = data[i].wishPrice;
							let wishEtc = data[i].wishEtc;
							let wishPublication = data[i].wishPublication;
							let memberId = data[i].memberId;
							
							wishes += "<tr><td scope='row'>" + wishTitle + "</td><td>" + wishAuthor + "</td><td>" + wishPublisher + "</td><td>" + memberId + "</td><td>" + wishEtc + "</td></tr>";
						}
						document.getElementById("result2").innerHTML = wishes;
						
						for(let i = 0; i < document.getElementById("result2").querySelectorAll("tr").length; i++) {
							document.getElementById("result2").querySelectorAll("tr")[i].onclick = () => {
								swal({
									title: "확인",
									text: "정말 삭제하시겠습니까?",
									icon: "warning",
									buttons: ["아니오", "예"]
								}).then((YES) => {
									if(YES) {
										$.ajax({
											type: "POST",
											url: "deleteWish",
											async: false,
											data: {
												keyword: data[start + i].wishNo
											},
											success: (msg) => {													
												swal({
													   title: "성공",
													   text: "삭제가 완료되었습니다.",
													   icon: "success"
												});
												searchWish(1);												
												for(let i = 0; i < 5; i++) {
													document.getElementsByClassName("pageNum3")[i].onclick = () => {
														page = document.getElementsByClassName("pageNum3")[i].innerText;
														searchWish(page);
													}
												}
											}
										})
									}
								})
							}
						}
					}
				});
			}
			
			document.getElementById("searching2").onclick = () => {				
				searchWish(1);
				
				for(let i = 0; i < 5; i++) {
					document.getElementsByClassName("pageNum3")[i].onclick = () => {
						page = document.getElementsByClassName("pageNum3")[i].innerText;
						searchWishes(page);
					}
				}
			}
		}
	</script>
</body>
</html>