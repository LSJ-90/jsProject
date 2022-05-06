<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	<meta charset="UTF-8"> 
	<style>
		table {
			margin: 20px;
		}
	
		table, tr, td {
			border: 1px solid black;
		}
		
		td {
			
		}
	</style>
</head>
<body>
	<h1>Hello world!!</h1>
	
	<table>
		<thead>
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>이메일</th>
				<th>전화번호</th>
				<th>고용일</th>
				<th>상사아이디</th>
				<th>부서</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>${empInfo.empId }</td>
				<td>${empInfo.name }</td>
				<td>${empInfo.email }</td>
				<td>${empInfo.phone }</td>
				<td>${empInfo.hireDate }</td>
				<td>${empInfo.magId }</td>
				<td>${empInfo.jobTitle }</td>
			</tr>
		</tbody>		
	</table>
	
	
	<table>
		<thead>
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>이메일</th>
				<th>전화번호</th>
				<th>고용일</th>
				<th>상사아이디</th>
				<th>부서</th>
			</tr>
		</thead>
		<tbody>
				<c:forEach var="empInfo" items="${empInfos }">
			<tr>
					<td>${empInfo.empId }</td>
					<td>${empInfo.name }</td>
					<td>${empInfo.email }</td>
					<td>${empInfo.phone }</td>
					<td>${empInfo.hireDate }</td>
					<td>${empInfo.magId }</td>
					<td>${empInfo.jobTitle }</td>
			</tr>
				</c:forEach>
		</tbody>		
	</table>
	<script>
	
	</script>
</body>
</html>
