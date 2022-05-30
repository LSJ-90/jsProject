<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<form id="signUpForm" action="/projects/misostudy/signUpForm" method="post" accept-charset="utf-8">
	<div class="modal fade" id="signUpModal" tabindex="-1" aria-labelledby="signUpModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="signUpModalLabel">Sign Up</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="alert alert-warning" id="signUpResultMessage"></div>
				<div class="modal-body">
					<div class="form-floating mb-3">
					  <input type="text" class="form-control" id="signUpUserId" placeholder="User Id" name="id">
					  <label for="signUpUserId">User Id</label>
					</div>
					<div class="form-floating mb-3">
					  <input type="password" class="form-control" id="signUpPassword" placeholder="Password" name="pwd">
					  <label for="signUpPassword">Password</label>
					</div>
					<div class="form-floating mb-3">
					  <input type="password" class="form-control" id="signUpPasswordConfirm" placeholder="Password Confirm" name="pwdConfirm">
					  <label for="floatingPasswordConfirm">Password Confirm</label>
					</div>	
					<div class="form-floating mb-3">
					  <input type="text" class="form-control" id="signUpName" placeholder="Name" name="name">
					  <label for="signUpName">Name</label>
					</div>	
					<div class="form-floating mb-3">
					  <input type="email" class="form-control" id="signUpEmail" placeholder="Email" name="email">
					  <label for="signUpEmail">Email</label>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-outline-dark" data-bs-dismiss="modal">Close</button>
					<button type="button" id="signUpBtn" class="btn btn-outline-dark">Sign Up</button>
				</div>
			</div>
		</div>
	</div>
</form>
		
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
