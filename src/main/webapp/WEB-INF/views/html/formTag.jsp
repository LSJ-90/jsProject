﻿<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <title>HTML</title>
</head>
<body>
    <a href="../home"><img src="../resources/images/logo.png" alt=""></a>

    <!-- form action 속성 -->
    <h1>form action 속성</h1>
    <p>입력된 URL 경로로 데이터를 제출</p>
    <form action="제출할 경로">
        <input type="submit"/>
    </form>
    
    <!-- form method 속성 -->
    <h1>form method 속성</h1>
    <ul>
        <li>get을 이용하여 사용자 정보같은 중요한 데이터를 보내면 안됨.</li>
        <li>URL 길이는 2048자로 제한됨.</li>
        <li>key=value 형태의 쿼리스트링으로 데이터가 보내짐.</li>
    </ul>
    <form action="../index.html" method="get">get
        <input type="text" name="name" value="alpacajoon"/>
        <input type="submit"/>
    </form>

    <ul>
        <li>post는 제출된 데이터가 url에 표시 안되않음.</li>
        <li>post는 크기 제한이 없으며 많은 양의 데이터를 보내는 데 사용할 수 있음.</li>
    </ul>
    <form action="formTag.html" method="post">post
        <input type="text" name="name" value="alpacajoon"/>
        <input type="submit"/>
    </form>

    <!-- form target 속성 -->
    <h1>form target 속성</h1>
    <form action="index.html" target="_blank">_blank
        <input type="text" name="name" value="alpacajoon"/>
        <input type="submit"/>
    </form>

    <form action="index.html" target="_self">_self
        <input type="text" name="name" value="alpacajoon"/>
        <input type="submit"/>
    </form>

    <!-- _parent, _top, _framename는 iframe 요소와 주로 사용됨 -->
    <form action="index.html" target="_parent">_parent
        <input type="text" name="name" value="alpacajoon"/>
        <input type="submit"/>
    </form>

    <form action="index.html" target="_top">_top
        <input type="text" name="name" value="alpacajoon"/>
        <input type="submit"/>
    </form>

    <form action="index.html" target="_framename">_framename
        <input type="text" name="name" value="alpacajoon"/>
        <input type="submit"/>
    </form>

    <!-- form autocomplete 속성 -->
    <h1>form autocomplete 속성</h1>
    <form action="index.html" autocomplete="on">on
        <input type="text" name="name"/>
        <input type="submit"/>
    </form>

    <form action="index.html" autocomplete="off">off
        <input type="text" name="name"/>
        <input type="submit"/>
    </form>
    
    <!-- form novalidate 속성 -->
    <h1>form novalidate 속성</h1>
    <form action="index.html">novalidate 미적용
        <input type="email" name="email" value="alpacajoon.com"/>
        <input type="submit"/>
    </form>

    <form action="index.html" novalidate>novalidate 적용
        <input type="email" name="email" value="alpacajoon.com"/>
        <input type="submit"/>
    </form>

    <!-- form enctype 속성 -->
    <h1>form enctype 속성</h1>
    enctype: 제출되는 파일양식의 인코딩 방식 작성
    <form action="index.html" method="post" enctype="multipart/form-data">
        <input type="file" />
        <input type="submit"/>
    </form>

    <!-- form name 속성 -->
    <h1>form name 속성</h1>
    name: 자바스크립트에서 name명으로 form태그를 핸들링 할 수 있음
    <form action="index.html" method="get" name="name_form">
        <input type="name" name="name" value="alpacajoon"/>
    </form>
    <form action="index.html" method="get" name="email_form">
        <input type="email" name="email" value="alpacajoon.com"/>
    </form>
</body>
</html>