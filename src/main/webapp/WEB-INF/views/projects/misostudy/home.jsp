<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page session="false" %>
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
		* {
			margin: 0;
			padding: 0;
		}

		ul li {
			list-style: none;
		}

		a, a:link {
			color: #000;
			text-decoration: none;
		}
		
		html {
			height: 100%;
		}
		
		body {
			text-align: center;
			position: relative;
			z-index: 1;
			height: 100%;
		}
		
		body::after {
			width: 100%;
			height: 100%;
			content: "";
			background: url("../../resources/images/test.jpg");
			background-size: cover;
			position: absolute;
			top: 0;
			left: 0;
			z-index: -1;
			opacity: 0.7;
		}
		
		#signInResultMessage {
			text-align: center;
		}
		
		.container {
			width: 90%;
			margin-top: 5vh;
			margin-bottom: 5vh;
		}
		
		/* footer */
		footer {
			color: white;
			background-color: #212529;
			position: fixed;
			bottom: 0;
			width: 100%;
		}
		.company {
		  	font-size: 12px;
		}
		.company__address {
		  	font-style: normal;
		  	line-height: 1.8;
		}
		.company__address span {
		  	margin-right: 15px;
		}
	</style>
</head>
<body>
	<header>
		<%@include file="navbar.jsp" %>
		<%@include file="signInForm.jsp" %>
		<%@include file="signUpForm.jsp" %>
	</header>
	<div class="container">
	</div>
	<footer>
		<%@include file="footer.jsp" %>
	</footer>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script type="text/javascript">
			
	</script>
</body>
</html>
