<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>비밀번호 찾기</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300&display=swap" rel="stylesheet">
<script src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<meta charset="UTF-8">
<style>
	#main{
/* 		position: absolute; */
		top: 50%;
        left: 50%;
/*         transform: translate(-50%, -50%); */
        font-family: 'Inter', sans-serif;
        width:100%;
        height: auto;
        min-height: 384px;
        margin-top: 165px;
        margin-bottom: 80px;
    }
    hr{width: 500px;}
    #memId {
    	padding: 5px;
    	width: 250px;
    	margin-left: 90px;
    	magin-right: 10px;
    }
   	::placeholder {
  		color: black;
 		font-size: .8em;
 		font-weight: 400;
	}
	a{text-decoration-line: none;}
	a:link{color: black;}
	a:visited{color: black;}
	a:hover{color: #4373E6;}
</style>
</head>
<body>
	<%@ include file="../common/top3.jsp" %>
	<div align="center" id="main">
		<h4><b>비밀번호 찾기</b></h4>
		<div style="margin: 10px;"><span style="font-size: 11px; color: gray;">책마루 회원 전용</span></div>
		<div style="margin: 10px;"><span id="checkIdResult" style="font-size: 13px; font-weight: 500;">비밀번호를 찾고자 하는 아이디를 입력하세요</span></div>
		<form action="${ contextPath }/findPwd.me" method="post">
			<table>
					<tr>
						<td>
							<input class="form-control" type="text" id="memId" name="memId" placeholder="아이디" aria-label="default input example"/>
						</td>
						<td>
							&nbsp;<button type="button" id="checkId" class="btn btn-primary btn-default" style="background-color: #4373E6;">확인하기</button>
						</td>
					</tr>
			</table>
			<button type="submit" id="next" class="btn btn-primary" style="--bs-btn-padding-y: .55rem; --bs-btn-padding-x: 7.0rem; --bs-btn-font-size: 1.0rem; background-color: #4373E6; margin: 10px;" disabled>다음</button>
		</form>
		<hr>
	</div>
	<div class="modal fade" tabindex="-1" role="dialog" id="idModal">
      <div class="modal-dialog" role="document">
            <div class="modal-content rounded-3 shadow">
              <div class="modal-body p-4 text-center">
                 <h1>😶‍🌫️</h1>
                   <h5 class="mb-0">아이디를 입력해주세요.</h5>
              </div>
              <div class="modal-footer flex-nowrap p-0">
                   <button type="button" class="btn btn-lg btn-link fs-6 text-decoration-none col-12 m-0 rounded-0" data-bs-dismiss="modal" onclick="focusDropBox();">확인</button>
              </div>
            </div>
       </div>
 	</div>
	<%@ include file="../common/bottom.jsp" %>
	<script>
		window.onload = () =>{
			
			const checkIdBtn = document.getElementById('checkId');
			const checkIdResult = document.getElementById('checkIdResult');
			
			checkIdBtn.addEventListener('click', () => {
				const memId = document.getElementById('memId').value;
				if(memId.trim() == ''){ 
					$('#idModal').modal('show');
				} else {
					$.ajax({
						url: '${contextPath}/pwdCheckId.me',
						type: 'POST',
						data: {memId: memId.trim()},
						success: (data) =>{
// 							console.log(data);
							if(data == 'N'){	// DB에 회원 정보가 없는 경우
								checkIdResult.innerText = '아이디가 존재하지 않습니다.😭';
								checkIdResult.style.color = '#DC6089';
							} else if(data == 'Y'){
								checkIdResult.innerText = '다음을 눌러 진행해주세요.';
								checkIdResult.style.color = '#4373E6';
								$('#next').attr('disabled', false);
							} 
						},
						error : (data) =>{
							console.log(data);
						}
					});
				}
			});
		}
	</script>
</body>
</html>