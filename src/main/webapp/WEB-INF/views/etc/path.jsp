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
	<title>개념정리</title>
	<style>
		th, td {
			padding: 10px;
			border: 1px solid black;
			text-align: center;
		}

		table {
			margin: 15px;
		}
	</style>
</head>
<body>
	<a href="../home"><img src="../resources/images/logo.png" alt=""></a>
	<h1>절대경로와 상대경로</h1>
	<table>
		<tr>
			<th></th>
			<th>절대경로</th>
			<th>상대경로</th>
		</tr>
		<tr>
			<th>형태</th>
			<td>루트 디렉토리를 포함하는 경로</td>
			<td>루트 디렉토리를 포함하지 않는 경로</td>
		</tr>
		<tr>
			<th>사용처</th>
			<td>외부파일을 불러올 때</td>
			<td>내부파일을 불러올 때</td>
		</tr>
		<tr>
			<th>장점</th>
			<td>어디에서나 해당 파일을 찾을 수 있음</td>
			<td>디렉토리 구조만 같다면 서버가 바뀌어도 경로수정이 필요없음</td>
		</tr>
		<tr>
			<th>단점</th>
			<td>서버가 변경되면 경로를 맞게 수정해야 될 수 있음</td>
			<td>디렉토리 구조를 따라가지 못하면 찾기 어려워질 가능성이 있음</td>
		</tr>
	</table>

	<table>
		<caption>상대경로 명령어(EX: C:\index\a) 현재위치가 a일 경우</caption>
		<tr>
			<th>상위 디렉토리</th>
			<td>../파일명</td>
			<td>index폴더 접근: ../index</td>
		</tr>
		<tr>
			<th>현재 디렉토리</th>
			<td>./파일명</td>
			<td>a폴더 접근: ./a</td>
		</tr>
		<tr>
			<th>최상위 디렉토리</th>
			<td>/</td>
			<td>C: 접근: /</td>
		</tr>
	</table>
</body>
</html>