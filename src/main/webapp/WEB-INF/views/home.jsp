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
	<style>
		* {
			margin: 0;
			padding: 0;
		}

		body {
			width: 100%;
		}

		ul li {
			list-style: none;
		}

		a, a:link {
			color: #000;
			text-decoration: none;
		}

		#navbar {
			width: 100%;
			height: 50px;
			background-color: rgb(156, 156, 156);
			line-height: 30px;
			margin: 10px auto;
			text-align: center;
		}

		.menu {
			padding-left: 0;
			display: none;
		}

		.menu li {
			margin-top: 10px;
			
		}

		.menu li:hover {
			background-color: black;
		}
		
		.menu li a {
			color: white;
		}
		
		#navbar>li {
			float: left;
			width: 200px;
			position: relative;
			top: 10px;
			color: white;
		}

		#navbar>li:hover > ul {
			display: block;
			background-color: rgb(156, 156, 156);
		}

		header {
			height: 500px;
		}
	</style>
</head>
<header>
	<!-- href: hypertext reference -->
	<ul id="navbar">
		<li>
			<a href="./home"><img src="../resources/images/logo.png" alt=""></a>
		</li>
		<li>
			<h1><a href="#">HTML</a></h1>
			<ul class="menu">
				<li><a href="html/metaTag">meta tag</a></li>
				<li><a href="html/formTag">form tag</a></li>
				<li><a href="html/selectBox">selectBox tag</a></li>
				<li><a href="html/input">input tag</a></li>
				<li><a href="html/tableTag">table tag</a></li>
				<li><a href="html/formattingTag">formatting tag</a></li>
			</ul>	
		</li>
		<li>
			<h1><a href="#">CSS</a></h1>
			<ul class="menu">
				<li><a href="css/block-inline">block_inline</a></li>
				<li><a href="css/position">position</a></li>
				<li><a href="css/ID&CLASS&NAME">id_class_name 차이점</a></li>
				<li><a href="css/before-after">before_after</a></li>
			</ul>	
		</li>
		<li>
			<h1><a href="#">JavaScipt</a></h1>
			<ul class="menu">
				<li><a href="javascript/hoisting">hoisting</a></li>
				<li><a href="javascript/practice">practice</a></li>
			</ul>	
		</li>
		<li>
			<h1><a href="#">mybatis</a></h1>
			<ul class="menu">
				<li><a href="mybatis/mybatisTest">mybatisTest</a></li>
			</ul>	
		</li>
		<li>
			<h1><a href="#">ETC</a></h1>
			<ul class="menu">
				<li><a href="etc/coding-notion">코딩 표기법</a></li>
				<li><a href="etc/path">절대경로와 상대경로</a></li>
			</ul>
		</li>
		<li>
			<h1><a href="#">PROJECTS</a></h1>
			<ul class="menu">
				<li><a href="projects/misostudy/home">misoStudy</a></li>
			</ul>
		</li>
	</ul>
</header>
<body>
	<button id="ex_input">나는 버튼</button>
	<p>
		&lt;p&gt;tag 사용<br/>
		안녕~ 오늘도 왔구나!
		이 파일은 HTML, CSS, JavaScipt 정리파일이야~<br/>
		오늘도 열심히 정리해보자!
	</p>
	<hr/>
	<pre>
		&lt;pre&gt;tag 사용
		안녕~ 오늘도 왔구나!
		이 파일은 HTML, CSS, JavaScipt 정리파일이야~
		오늘도 열심히 정리해보자!
	</pre>
	

	<!-- <iframe src="index.html"></iframe>  -->
<script>

	var inputValue = document.querySelector("button");
	inputValue.onclick =  function() {
		alert("안뇽~");
	};
	
</script>
</body>
</html>
