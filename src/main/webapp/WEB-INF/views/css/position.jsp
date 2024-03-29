<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<meta name="description" content="Web tutorials">
	<meta name="keywords" content="HTML">
	<meta name="author" content="AlpacaJoon">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>CSS</title>
	<style>

		#boxes {
			position: relative;
		}

		.position {
			width: 200px;
			height: 200px;
			color: white;
			margin-bottom: 20px;
			box-sizing: border-box;
		}

		#testBox {
			position: relative;
			background-color: red;
			top: 0px;
			left: 0px;
		}
		
		.testDiv {
			width: 200px;
			height: 200px;
			margin-bottom: 20px;
			background-color: hotpink;
		}
		
		#ex_image {
			opacity: 0.3;
		}
		
		
		#top_left {
			position: absolute;
			top: 10px;
			left: 5px;
		}

		#bottom_left {
			position: absolute;
			bottom: 10px;
			left: 5px;
		}
		
		#top_right {
			position: absolute;
			top: 10px;
			right: 5px;
		}
		
		#bottom_right {
			position: absolute;
			bottom: 10px;
			right: 5px;
		}

		#center {
			position: absolute;
			top: 50%;
			width: 100%;
			text-align: center;
			border: 1px solid red;
		}
	</style>
</head>
<body>
	<a href="../home"><img src="../resources/images/logo.png" alt=""></a>
	<ul>
		<li>static</li>
		<li>relative</li>
		<li>fixed</li>
		<li>absolute</li>
		<li>sticky</li>
	</ul>
	<div id="boxes">
		<div id="box1" class="testDiv">1</div>
		<div id="box2" class="testDiv">2</div>
		<div id="testBox" class="position">test box</div>
		<div id="box3" class="testDiv">3</div>
		<div id="box4" class="testDiv">4</div>
		<div id="box5" class="testDiv">5</div>
		<div id="box6" class="testDiv">6</div>
		<div id="box7" class="testDiv">7</div>
		<div id="box8" class="testDiv">8</div>
		<div id="box9" class="testDiv">9</div>
		<div id="box10" class="testDiv">10</div>
	</div>
	
	<div style="position: relative;">
		<img id="ex_image" src="../images/img_5terre_wide.png" alt="이미지">
		<div id="top_left" class="ex_image_text">Top Left</div>
		<div id="bottom_left" class="ex_image_text">Bottom Left</div>
		<div id="top_right" class="ex_image_text">Top Right</div>
		<div id="bottom_right" class="ex_image_text">Bottom Right</div>
		<div id="center" class="ex_image_text">Center</div>
	</div>
</body>
</html>