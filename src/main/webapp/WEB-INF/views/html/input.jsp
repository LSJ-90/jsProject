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
    <!-- input -->
    <ol>
        <li>readonly: 읽기만 가능</li>
        <li>placeholder: input박스 내에 샘플값 혹은 간단한 설명표현 가능</li>
        <li>required: 필수로 입력해야 제출이 가능 </li>
    </ol>
    <h1>input</h1>
    <ul>
        <li>label태그의 for속성과 input태그의 id명이 같아야 바인딩됨</li>
        <li>서버에 데이터를 제출할 때 name명이 쿼리스트링의 KEY가 됨</li>
    </ul>
    <form>
        <ol>
            <li>
                <input type="text" placeholder="아이디를 입력하시옹~" name="userId" required/>
            </li>
            <li>
                <label for="male">남자</label>
                <input type="radio" id="male" name="gender" value="male"/>
                <label for="female">여자</label>
                <input type="radio" id="female" name="gender" value="female"/>
            </li>
            <li>
                <input type="checkbox" checked/>커피
                <input type="checkbox"/>콜라
                <input type="checkbox"/>사이다
                <input type="checkbox"/>박카스
            </li>
            <li><input type="color">색고르기</li>
            <li><input type="date">날짜(년,월,일)</li>
            <li><input type="datetime-local">날짜시간</li>
            <li><input type="month">날짜(년,월)</li>
            <li><input type="time">시간</li>
            <li><input type="email" value="lsj@gmail.com"></li>
            <li><input type="file"></li>
            <li><input type="hidden">히든 input</li>
            <li><input type="number">숫자</li>
            <li><input type="password">비밀번호</li>
            <li><input type="range">범위</li>
            <li><input type="search">검색</li>
            <li><input type="tel">전화번호</li>
            <li><input type="url">URL</li>
            <li><input type="week">1주 가져오기</li>
            <li><input type="image">이미지 submit</li>
            <li><input type="submit"/></li>
            <li><input type="reset"></li>
            <li><input type="button"/></li>
        </ol>
    </form>
</body>
</html>