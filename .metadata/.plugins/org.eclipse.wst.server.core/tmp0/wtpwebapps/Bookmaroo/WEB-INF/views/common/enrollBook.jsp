<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책마루도서관</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<style>
	#main{max-width: 1200px; min-height: 682px;}
	#mid{min-width: 1800px;}
	#searchButton{
		color: white; background-color: rgb(67, 115, 230);
		width: 90px;
	}
	.result{
		display: flex;
		align-items: center; 
		justify-content: between;
	}
	.enrollButton{
		color: white; background-color: rgb(67, 115, 230); 
		border: 1px solid rgb(67, 115, 230);
		width: 92px;
	}
</style>
</head>
<body>
	<!-- top.jsp -->
	<%@ include file="../../../WEB-INF/views/common/top.jsp"%>

		<div class="row" id="mid">
		
			<div class="col-2">
				<%@ include file="../../../WEB-INF/views/common/sideLib.jsp"%>
			</div>
			
			<div class="col-8" id="main">
			<br>
				<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
					<h1 class="h1">도서 등록</h1>
				</div>
				<br>
				    <input type="text" id="query" placeholder="도서 제목을 입력하세요">
				    <button id="searchButton">검색</button>
				    <form action="${ contextPath }/insertBook.lib" id="enrollForm" method="POST">
					    <div id="searchResult">
						</div>
						<input type="hidden" name="bookISBN">
						<input type="hidden" name="bookName">
						<input type="hidden" name="summary">
						<input type="hidden" name="author">
						<input type="hidden" name="publisher">
						<input type="hidden" name="pDate">
						<input type="hidden" name="bookImage">
					</form>
					
					<!-- https://www.youtube.com/watch?v=QPEUU89AOg8 참고 -->
				    <script>
				        const API_KEY = 'KakaoAK 3d8c5e4b296d616626c9e2e8ec37f82e';
				        
				        document.getElementById('searchButton').addEventListener('click', () => {
				        	const query = document.getElementById('query').value;
				            $.ajax({
				            	method: "GET",
				                url: "https://dapi.kakao.com/v3/search/book",
				                data: { query: query },
				                headers: { Authorization: API_KEY}
				                
				                })
				                
			                /* .done(function(변수명){})으로 응답 받은 객체를 '변수명'을 통해 기져오고 {}안에서 사용 가능
		                	response라는 객체의 documents에 책의 정보가 저장되어 있으므로 response.documents를 반복문 돌림
		                	documents안의 책 정보 변수명은 카카오 개발자 페이지 참조
			                */
			                .done(function (response){
			                	for(const res of response.documents){
			                		
			                		var newDiv = document.createElement("div");
			                		var imgDiv = document.createElement("div");
			                		var infoDiv = document.createElement("div");
			                		var sumDiv = document.createElement("div");
			                		var enrollDiv = document.createElement("div");
			                		var pTitle = document.createElement("p");
			                		var pAuthors = document.createElement("p");
			                		var pPublisher = document.createElement("p");
			                		var pISBN = document.createElement("p");
			                		var pDate = document.createElement("p");
			                		
			                		newDiv.classList.add("row", "border-bottom", "border-top", "result", "searchResult");
			                		imgDiv.classList.add("col-3");
									infoDiv.classList.add("col-7");
									enrollDiv.classList.add("col-2");
									sumDiv.classList.add("row");
			                		
			                		imgDiv.innerHTML = "<img src=" + res.thumbnail + "/>";
			                		
			                		pTitle.append(res.title);
			                		pAuthors.append(res.authors);
			                		pPublisher.append(res.publisher);
			                		pISBN.append(res.isbn);
			                		pDate.append(res.datetime.split("T")[0]);
			                		
			                		infoDiv.append(pTitle);
			                		infoDiv.append(pAuthors);
			                		infoDiv.append(pPublisher);
			                		infoDiv.append(pISBN);
			                		infoDiv.append(pDate);
			                		
			                		enrollDiv.innerHTML = "<button class='btn enrollButton' type='button'>등록하기</button>";
			                		
			                		//설명글이 너무 길면 카카오 api 특성상 잘려서 넘어오므로 '.'이 1개 이상 있을 경우 마지막 '.' 앞에서 잘라주고 마지막에 '.' 추가 
			                		let lastIndex = res.contents.lastIndexOf('.');
			                		let contents = lastIndex >= 0 ? res.contents.substring(0, lastIndex) : res.contents;
				                	sumDiv.append(contents);
				                	sumDiv.append(".");
									
				                	newDiv.append(imgDiv);
				                	newDiv.append(infoDiv);
				                	newDiv.append(enrollDiv);
				                	newDiv.append(sumDiv);
				                	
				                	$("#searchResult").append(newDiv);
			                	}
			                });
			       		});
				        
				        document.addEventListener('click', function(event) {
				            if (event.target.classList.contains('enrollButton')) {
				                let bImg = event.target.parentNode.parentNode.children[0].getAttribute('src');
				                let bName = event.target.parentNode.parentNode.children[1].children[0].innerText;
				                let bAuthor = event.target.parentNode.parentNode.children[1].children[1].innerText;
				                let bPublisher = event.target.parentNode.parentNode.children[1].children[2].innerText;
				                let bISBN = event.target.parentNode.parentNode.children[1].children[3].innerText;
				                let bDate = event.target.parentNode.parentNode.children[1].children[4].innerText;
				                let bContents = event.target.parentNode.parentNode.children[3].innerText;
				                console.log(bImg);
				                console.log(bName);
				                console.log(bAuthor);
				                console.log(bPublisher);
				                console.log(bISBN);
				                console.log(bDate);
				                console.log(bContents);
				                document.getElementById("enrollForm").submit();
				            }
				        });

				        
				    </script>
				
			<!-- 화면 중앙 오른쪽 여백 생성 -->
			<div class="col-2">
			</div>
			
			
			
		</div>
		
	<!-- bottom.jsp -->
	<%@ include file="../../../WEB-INF/views/common/bottom.jsp"%>

	
	
</body>
</html>