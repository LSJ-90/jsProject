<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<div class="container-fluid">
		<a class="navbar-brand" href="../../home"><img src="../../resources/images/logo.png" alt="misotech_logo"></a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link active" href="/projects/misostudy/home">Home</a></li>
				<li class="nav-item"><a class="nav-link" href="#">게시판</a></li>
			</ul>
			<c:choose>
				<c:when test="${!empty LOGIN_USER}">
					<ul id="loginUl" class="navbar-nav justify-content-end">
						<li class="nav-item"><a class="nav-link" href="/projects/misostudy/signOut" role="button">Sign out</a></li>
					</ul>
				</c:when>
				<c:otherwise>
					<ul id="loginUl" class="navbar-nav justify-content-end">
						<li class="nav-item"><a class="nav-link" href="#" role="button" data-bs-toggle="modal" data-bs-target="#signInModal">Sign in</a></li>
						<li class="nav-item"><a class="nav-link" href="#" role="button" data-bs-toggle="modal" data-bs-target="#signUpModal">Sign up</a></li>
					</ul>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</nav>