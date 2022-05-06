<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<a href="../home"><img src="../resources/images/logo.png" alt=""></a>
	<h1>자바스크립트 연습</h1>
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
	
	<form>
		<select name="">
			<option value="">이름</option>
		</select>
		<input type="text" id="searchName" name="name"/>
		<button type="submit">검색</button>
	</form> 
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
		// 배열 순환(반복가능한 객체만 사용가능) for~of: value를 리턴
		const dataList = new Array();
		<c:forEach var="empInfo" items="${empInfos }">
			dataList.push("${empInfo}");
		</c:forEach>
		
		for (const data of dataList) {
			// console.log(data);
		}
		
		// 객체 순환 for~in: 배열은 index, 객체는 key을 리턴 
		for (const data in dataList) {
			// console.log(data, dataList[data]);
		}
		
		// Object.entries(), Object.keys(searchData), Object.values(searchData)
		const searchData = {
			empId: "${empInfo.empId }",
			name: "${empInfo.name }",
			phone: "${empInfo.phone }",
			hireDate: "${empInfo.hireDate }",
			magId: "${empInfo.magId }"
		}
			// console.log(Object.entries(searchData));		// 모든 enrty 리턴, Internet Ex사용불가
			// console.log(Object.keys(searchData));	    // 모든 key 리턴
			// console.log(Object.values(searchData));		// 모든 value 리턴, Internet Ex사용불가
		
		// shift(), pop()
		const myArray = [1, 2, 'Dave', 100]; 
			// console.log(myArray);
		myArray.shift(); // 첫 데이터를 제거 후 두번째 데이터를 첫번째로 옮김
			// console.log(myArray);
		myArray.pop(); // 마지막 데이터를 제거함
			// console.log(myArray);
		
		// promise internet Ex사용불가
		const myFirstPromise = function(url) {
			return new Promise(function(resolve, reject) {
				const xhr = new XMLHttpRequest();
				xhr.open("Get", url);
				xhr.send();
				
				xhr.onload = function() {
					if (xhr.status === 200) {
						resolve("안녕~"); // 성공시
					} else {
						reject(new Error(xhr.status)); // 실패시
					}
				};
			});
		};
		
		myFirstPromise("/javascript/practice")
			.then(function(res) {
				console.log(res);
			})
			.catch(function(err) {
				console.log(err);
			})
			.finally(function() {
				console.log("이건아니야~");
			});
			
	</script>
</body>
</html>
