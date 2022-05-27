<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	<style>
		.container {
			width: 500px;
		}
		
		.form-floating {
			margin-bottom: 10px;
		}
	</style>
</head>
<body>
	<header>
		<%@include file="navbar.jsp" %>
		<%@include file="signInForm.jsp" %>
	</header>
	<div class="container">
		<div class="row">
			<div class="col">
				<form id="signUpForm" action="/projects/misostudy/signUpForm" method="post" accept-charset="utf-8">
					<div class="form-floating mt-3">
					  <input type="text" class="form-control" id="signUpUserId" placeholder="User Id" name="id">
					  <label for="signUpUserId">User Id</label>
					</div>
					<div class="form-floating ">
					  <input type="password" class="form-control" id="signUpPassword" placeholder="Password" name="pwd">
					  <label for="signUpPassword">Password</label>
					</div>
					<div class="form-floating">
					  <input type="password" class="form-control" id="signUpPasswordConfirm" placeholder="Password Confirm" name="pwdConfirm">
					  <label for="floatingPasswordConfirm">Password Confirm</label>
					</div>	
					<div class="form-floating">
					  <input type="text" class="form-control" id="signUpName" placeholder="Name" name="name">
					  <label for="signUpName">Name</label>
					</div>	
					<div class="form-floating">
					  <input type="email" class="form-control" id="signUpEmail" placeholder="Email" name="email">
					  <label for="signUpEmail">Email</label>
					</div>
					<button type="button" id="signUpBtn" class="btn btn-outline-dark">Sign Up</button>	
				</form>
			</div>
		</div>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$('#signUpBtn').click(function(){
		const newUserForm = $('#signUpForm').serialize();
		console.log(newUserForm);
		$('#signUpForm').submit();
		
	});
	
	$('#signUpUserId').keyup(function(){
		console.log(123);
	});
</script>
</body>
</html>
