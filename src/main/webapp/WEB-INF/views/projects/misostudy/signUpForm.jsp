<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<div class="modal fade" id="signUpModal" tabindex="-1" aria-labelledby="signUpModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="signUpModalLabel">Sign Up</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form id="signUpForm" action="/projects/misostudy/signUpForm" method="post" accept-charset="utf-8">
					<div class="form-floating mb-3">
					  <input type="text" class="form-control" id="signUpUserId" placeholder="User Id" name="id" autocomplete="off">
					  <label for="signUpUserId">User Id</label>
					   <div class="warning" id="check_id"></div>
					</div>
					<div class="form-floating mb-3">
					  <input type="password" class="form-control" id="signUpPwd" placeholder="Password" name="pwd">
					  <label for="signUpPassword">Password</label>	
					  <div class="warning" id="check_pwd"></div>
					</div>
					<div class="form-floating mb-3">
					  <input type="password" class="form-control" id="signUpPwdConfirm" placeholder="Password Confirm" name="pwdConfirm">
					  <label for="floatingPasswordConfirm">Password Confirm</label>
					  <div class="warning" id="check_pwdConfirm"></div>
					</div>	
					<div class="form-floating mb-3">
					  <input type="text" class="form-control" id="signUpName" placeholder="Name" name="name">
					  <label for="signUpName">Name</label>
					  <div class="warning" id="check_name"></div>
					</div>	
					<div class="form-floating mb-3">
					  <input type="email" class="form-control" id="signUpEmail" placeholder="Email" name="email">
					  <label for="signUpEmail">Email</label>
					  <div class="warning" id="check_email"></div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-outline-dark" data-bs-dismiss="modal">Close</button>
				<button type="button" id="signUpBtn" class="btn btn-outline-dark">Sign Up</button>
			</div>
		</div>
	</div>
</div>