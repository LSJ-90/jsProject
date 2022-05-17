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
        table, th, tr, td {
            border: 1px solid black;
        } 

        table {
            margin: 10px;
        }

        .strong_font {
            color:red;
        }
    </style>
</head>
<body>
    <a href="../home"><img src="../resources/images/logo.png" alt=""></a>
    <table>
        <thead>
            <tr>
                <th></th>
                <th>Element</th>
                <th>CSS</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <th>id</th>
                <td>페이지에서 <strong class="strong_font">하나의 요소만</strong> 지정 가능</td>
                <td>Selector 역할 수행 가능</td>
            </tr>
            <tr>
                <th>class</th>
                <td>여러 개의 요소에 지정 가능</td>
                <td>Selector 역할 수행 가능</td>
            </tr>
            <tr>
                <th>name</th>
                <td>여러 개의 요소에 지정 가능</td>
                <td>Selector 역할 수행 <strong class="strong_font">불가능</strong></td>
            </tr>
        </tbody>
        
    </table>
</body>
</html>