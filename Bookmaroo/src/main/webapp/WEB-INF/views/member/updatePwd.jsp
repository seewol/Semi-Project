<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>비밀번호 변경</title>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300&display=swap" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<script src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<style>
	#main {
		padding: 35px;
 	    font-family: 'Inter', sans-serif;
 	}
	hr {
		width: 300px;
	}
	.td_width {
		width: 250px;
	}
	::placeholder {
  		color: black;
 		font-size: .8em;
 		font-weight: 400;
	}
	#checkPwdResult {
		font-size: 11px;
		color: gray;
		margin-left: 11px;
	}
	#newPwdResult {
		font-size: 11px;
		color: gray;
		margin-left: 11px;
	}
</style>
</head>
<body>
	<c:set value="${ pageContext.servletContext.contextPath }" var="contextPath" scope="application"/>
	<section>
		<form id="updatePwdForm" action="${ contextPath }/updatePwd.me" method="post">
			<div id="main" align="center">
				<h3>🔑</h3>
				<h4><b>비밀번호 변경</b></h4>
				<br/>
				<table>
					<tr>
						<td class="td_width">
							<input class="form-control" type="password" id="password" name="password" placeholder="현재 비밀번호" aria-label="default input example"/>
						</td>
						<td>
						</td>
					</tr>
					<tr>
						<td>
							<span id="checkPwdResult">현재 비밀번호를 입력하세요.</span>
						</td>
						<td></td>
					</tr>
					<tr>
						<td class="td_width">
							<input class="form-control" type="password" id="newPassword" name="newPassword" placeholder="새 비밀번호" aria-label="default input example"/>
						</td>
						<td></td>
					</tr>
					<tr>
						<td class="td_width">
							<input class="form-control" type="password" id="checkNewPassword" name="checkNewPassword" placeholder="새 비밀번호 확인" aria-label="default input example"/>
						</td>
						<td></td>
					</tr>
					<tr>
						<td>
							<span id="newPwdResult">8~16자 영문 대소문자, 숫자, 특수문자 포함</span>
						</td>
						<td></td>
					</tr>
					<tr>
						<td>
						</td>
					</tr>
				</table>
				<hr>
				<button type="button" id="update" class="btn btn-primary" style="--bs-btn-padding-y: .40rem; --bs-btn-padding-x: 4.0rem; --bs-btn-font-size: 1.0rem; background-color: #4373E6;" disabled>비밀번호 변경</button>
			</div>
		</form>
	</section>
</body>
<script>
	window.onload = () =>{
		
		let currentPwd = false;
		let newPwd1 = false;
		let newPwd2 = false;
		
		
		//● ● ● 현재 비밀번호 일치 여부 확인 ①
		const password = document.getElementById('password');  // 현재 비밀번호 input
		const checkPwdResult = document.getElementById('checkPwdResult'); // 현재 비밀번호 일치 여부 노출
		
		password.addEventListener('change', function(){
			// 서버로 입력한 비밀번호 보내서 현재 비밀번호와 일치하는지 여부 확인
			$.ajax({
				url: '${contextPath}/checkPwd.me',
				type: 'POST',
				dataType: 'json',
				data: {password: password.value.trim()},
				success: (data) =>{
					if(data.result == 'Y'){
						password.style.color = '#4373E6';
						checkPwdResult.style.color = '#4373E6';
						checkPwdResult.innerText = '🍀비밀번호 확인이 일치합니다.';
						currentPwd = true;
						if(currentPwd && newPwd1 && newPwd2){
							$('#update').attr('disabled', false);
						}
					} else if(data.result == 'N'){
						password.style.color = '#DC6089';
						checkPwdResult.style.color = '#DC6089';
						checkPwdResult.innerText = '비밀번호 확인이 일치하지 않습니다.';
						currentPwd = false;
						$('#update').attr('disabled', true);
					}
				},
				error : (data) =>{
					console.log(data);
				}
			});
		});
		
		
		// ● ● ● 새 비밀번호 정규 표현식
		const newPassword = document.getElementById('newPassword');	// 새 비밀번호 
		const checkNewPassword = document.getElementById('checkNewPassword'); // 새 비밀번호 확인
		const newPwdResult = document.getElementById('newPwdResult'); // 새 비밀번호 결과
		
		const reg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[~!@#$%^&*()+|=])[A-Za-z\d~!@#$%^&*()+|=]{8,16}$/;
		
		newPassword.addEventListener('change', function(){
			if(this.value.trim() == ''){
				newPwdResult.style.color = '#DC6089';
				newPwdResult.innerText ='변경할 비밀번호를 입력해주세요.';
				newPwd1 = false;
				$('#update').attr('disabled', true);
			} else if(!reg.test(this.value.trim())){
				newPwdResult.innerText = '비밀번호 형식에 맞게 입력해주세요.';
				newPwdResult.style.color = '#DC6089';
				newPwd1 = false;
				$('#update').attr('disabled', true);
			} else {
				newPwdResult.innerText = '🍀사용 가능한 비밀번호입니다.';
				newPwdResult.style.color = '#4373E6';
				newPwd1 = true;
				if(currentPwd && newPwd1 && newPwd2){
					$('#update').attr('disabled', false);
				}
			}
		});
		
		
		// ● ● ● 새 비밀번호 확인과의 값 일치 여부
		checkNewPassword.addEventListener('blur', function(){
			const chkNewPwd = this.value;
			if (newPwd1) {
				if(newPassword.value.trim() == chkNewPwd) {
					this.style.color = '#4373E6';
					newPassword.style.color = '#4373E6';
					newPwdResult.style.color = '#4373E6';
					newPwdResult.innerText = '🍀비밀번호 확인이 일치합니다.';
					newPwd2 = true;
					if(currentPwd && newPwd1 && newPwd2){
						$('#update').attr('disabled', false);
					}
				} else if(newPassword.value.trim() != chkNewPwd){
					this.style.color = '#DC6089';
					newPassword.style.color = '#DC6089';
					newPwdResult.style.color = '#DC6089';
					newPwdResult.innerText = '비밀번호 확인이 일치하지 않습니다.';
					newPwd2 = false;
					$('#update').attr('disabled', true);
				}
			}
		});
		
		document.getElementById('update').addEventListener('click', function(){
			$.ajax({
				url: '${contextPath}/updatePwd.me',
				type: 'POST',
				dataType: 'json',
				data: {newPassword: newPassword.value.trim()},
				success: (data) =>{
					if(data.result == 1){
						window.close();
					} else if(data.result == 0){
						alert("비밀번호 변경에 실패하였습니다.");
					}
				},
				error : (data) =>{
					console.log(data);
				}
			});
		});
		
	}
</script>
</html>