<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <meta name="description" content="Web tutorials">
    <meta name="keywords" content="HTML, CSS">
    <meta name="author" content="AlpacaJoon">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CSS</title>
    <style>
        * {
            margin: 0;
            padding: 0;
        }

        .testBox {
            width: 100%;
            height: 100px;
            margin: 30px 0;
        }

        #box1 {
            background-color: blue;
            display: block;
        }
        #box2 {
            background-color: blue;
            display: block;
        }
        #box3 {
            background-color: blue;
            display: block;
        }
        #box4 {
            background-color: yellow;
            display: inline;
        }
        #box5 {
            background-color: yellow;
            display: inline;
        }
        #box6 {
            background-color: yellow;
            display: inline;
        }

        #box6 {
            background-color: yellow;
            display: inline;
        }

        #box10 {
            background-color: red;
            display: inline;
        }

        #box11 {
            background-color: red;
            display: inline-block;
        }

        li {
            margin: 20px 25px;
        }
    </style>
</head>
<body>
    <a href="../home"><img src="../resources/images/logo.png" alt=""></a>
    <h1>BLOCK, INLINE</h1>
    <ul>
        <li>
            block: 스스로가 한 줄 모두를 차지(div, p, h1 ...)
        </li>
        <li>
            inline: 줄바꿈없이 콘텐츠만 크기로 자리를 차지(sapn a, em ...)<br/>
            주의사항: width, height가 지정되어도 값을 적용시키지 못함<br/>> 
            콘텐츠의 크기만큼만 공간을 차지하기 때문임
        </li>
        <li>
            inline-block: inline특징을 가지면서 width, height같은 속성과 간격을 지정할 수 있음(button, input, select ...)
        </li>
    </ul>
    <div class="boxes">
        <div id="box1" class="testBox">div Tag</div>
        <h1 id="box2" class="testBox">h1 Tag</h1>
        <p id="box3" class="testBox">p Tag</p>
        <span id="box4" class="testBox">span Tag</span>
        <a id="box5" class="testBox">a Tag</a>
        <em id="box6" class="testBox">em Tag</em>
        <button id="box7" class="testBox">button Tag</button>
        <input id="box8" class="testBox">
        <select id="box9" class="testBox">
            <option value="">1</option>
            <option value="">2</option>
            <option value="">3</option>
        </select>
        <div id="box10" class="testBox">div Tag(inline)</div>
        <span id="box11" class="testBox">span Tag(inline-block)</span>
    </div>
</body>
</html>