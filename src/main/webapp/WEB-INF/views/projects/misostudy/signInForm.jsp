<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<form id="signInForm" action="/projects/misostudy/signIn" method="post">
	<div class="modal fade" id="signInModal" tabindex="-1" aria-labelledby="signInModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="esignInModalLabel">Sign In</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="form-floating mb-3">
					  <input type="text" class="form-control" id="signInUserId" placeholder="User Id" name="id">
					  <label for="signInUserId">User Id</label>
					</div>
					<div class="form-floating">
					  <input type="password" class="form-control" id="signInPassword" placeholder="Password" name="pwd">
					  <label for="signInPassword">Password</label>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-outline-dark" data-bs-dismiss="modal">Close</button>
					<button type="submit" class="btn btn-outline-dark">Sign In</button>
				</div>
			</div>
		</div>
	</div>
</form>