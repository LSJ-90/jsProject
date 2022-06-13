<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<meta name="description" content="Web tutorials">
	<meta name="keywords" content="HTML">
	<meta name="author" content="AlpacaJoon">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Study Site 화로 정리 해보기</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link href="/resources/css/style.css" rel="stylesheet">
</head>
<body>
	<header>
		<%@include file="navbar.jsp" %>
		<%@include file="signInForm.jsp" %>
		<%@include file="signUpForm.jsp" %>
	</header>
	<div class="container" id="findUserInfoDiv">
		<form class="findUserInfoForm">
			<div class="form-floating mb-3">
			  <input type="email" class="form-control mb-3" id="findUserIdByEmail" placeholder="Email" name="email" autocomplete="off">
			  <label for="findUserIdByEmail">Email</label>
			</div>
			<div class="findBox" id="findMyIdBox">
			  
			</div>
			<button type="button" class="btn btn-dark mb-3" id="findMyIdBtn">FIND ID</button>
		</form>
		<form class="findUserInfoForm">
			<div class="form-floating mb-3">
			  <input type="email" class="form-control" id="findUserPwdByEmail" placeholder="Email" name="email" autocomplete="off">
			  <label for="findUserIdByEmail">Email</label>
			</div>
			<div class="form-floating mb-3">
				<input type="text" class="form-control" id="findUserPwdById" placeholder="User Id" name="id" autocomplete="off"> 
				<label for="findUserPwdById">User Id</label>
			</div>
			<div class="findBox" id="findMyPwdBox">
			  
			 </div>
			<button type="button" class="btn btn-dark" id="findMyPwdBtn">FIND PWD</button>
		</form>
	</div>
	<footer>
		<%@include file="footer.jsp" %>
	</footer>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script type="text/javascript">
		$('#findMyIdBtn').click(function() {
			const email = $('#findUserIdByEmail').val();
			console.log(email);
			if (email === '') {
				alert("이메일을 입력해주세요....");
				return;
			}
			$.ajax({
				type: 'post',
				url: '/projects/misostudy/findMyId?email=' + email,
				dataType: 'text',
				success: function(result) {
					// alert('성공');
					// console.log(result);
					$('#findMyIdBox').empty();
					if (result === 'fail') {
						$('#findMyIdBox').append('<input type="text" class="form-control mb-3" value="존재하는 정보가 없습니다. 입력 정보를 다시 확인해 주세요.." readonly>');
					} else {
						$('#findMyIdBox').append('<input type="text" class="form-control mb-3" value="당신의 아이디는 ' + result + ' 입니다." readonly>');
					}
				},
				error : function(request, status, error) {
					alert('실패');
					console.log(request);
					console.log(status);
					console.log(error);
				}
			});	
		});
		
		$('#findMyPwdBtn').click(function() {
			const email = $('#findUserPwdByEmail').val();
			const id = $('#findUserPwdById').val();
			if (email === '' || id === '') {
				alert("정보를 모두 입력해주세요....");
				return;
			}
			$.ajax({
				type: 'post',
				url: '/projects/misostudy/findMyPwd?email=' + email + '&id=' + id,
				dataType: 'text',
				success: function(result) {
					// alert('성공');
					// console.log(result);
					$('#findMyPwdBox').empty();
					if (result === 'fail') {
						$('#findMyPwdBox').append('<input type="text" class="form-control mb-3" value="존재하는 정보가 없습니다. 입력 정보를 다시 확인해 주세요.." readonly>');
					} else {
						$('#findMyPwdBox').append('<input type="text" class="form-control mb-3" value="당신의 임시 패스워드는 ' + result + ' 입니다." readonly>');
					}
				},
				error : function(request, status, error) {
					alert('실패');
					console.log(request);
					console.log(status);
					console.log(error);
				}
			});	
		});
	</script>
	<script src="/resources/js/common.js"></script>
</body>
</html>
