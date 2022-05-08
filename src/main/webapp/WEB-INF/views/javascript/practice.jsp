<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	
	<h2>Vanilla JS AJAX TEST</h2>
	Name: <input type="text" id="inputName"></input>
	<button id="searchPhone">검색</button>
	<!-- 응답 받은 name 및 age 데이터를 추가해서 작성할 간단한 결과 텍스트 -->
	<h2><span id="name"></span>의 전화번호는 <span id="phone"></span>입니다.</h2>
	
	<!-- 연습
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
	-->
	
	<form id="form-search" method="get">
		<select name="search-key">
			<option value="name">이름</option>
			<option value="email">이메일</option>
			<option value="dept">부서</option>
		</select>
		<input type="text" id="searchValue" name="searchValue"/>
		<button type="button" id=searchEmpInfosBtn>검색</button>
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
		<tbody id="empInfosTbody">
			<c:forEach var="empInfo" items="${empInfos }">
				<tr>
					<td>${empInfo.empId }</td>
					<td>${empInfo.name }</td>
					<td>${empInfo.email }</td>
					<td>${empInfo.phone }</td>
					<td><fmt:formatDate value="${empInfo.hireDate }" pattern="yyyy-MM-dd"/></td>
					<td>${empInfo.magId }</td>
					<td>${empInfo.jobTitle }</td>
				</tr>
			</c:forEach>
		</tbody>		
	</table>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script>
		// 배열 순환(반복가능한 객체만 사용가능) for~of: value를 리턴
		const dataList = new Array();
		<c:forEach var='empInfo' items='${empInfos }'>
			dataList.push('${empInfo}');
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
			empId: '${empInfo.empId }',
			name: '${empInfo.name }',
			phone: '${empInfo.phone }',
			hireDate: '${empInfo.hireDate }',
			magId: '${empInfo.magId }'
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
				xhr.open('Get', url);
				xhr.send();
				
				xhr.onload = function() {
					if (xhr.status === 200) {
						resolve('안녕~'); // 성공시
					} else {
						reject(new Error(xhr.status)); // 실패시
					}
				};
			});
		};
		
		myFirstPromise('/javascript/practice')
			.then(function(res) {
				console.log(res);
			})
			.catch(function(err) {
				console.log(err);
			})
			.finally(function() {
				console.log('이건아니야~');
			});
			
		
			
		
		
		// 바닐라 자바스크립트 ajax 
		window.onload = function() {
			// 바닐라 자바스크립트 ajax2 
			let httpRequest;
			/* searchPhone button 이벤트 */
			document.getElementById('searchPhone').addEventListener('click', function(){
				/* phone 정보를 검색할 name 데이터를 빼옴 */
				var inputName = document.getElementById('inputName').value;
				/* 통신에 사용 할 XMLHttpRequest 객체 생성 */
				const xhr = new XMLHttpRequest();
				/* readyState가 변화했을때 함수 실행 */
			    xhr.onreadystatechange = function() {
			    	/* 
			    	readyState가 Done이고 응답 값이 200일 때, 받아온 response로 name과 age를 그려줌 
			    	406에러가 뜨면서 통신이 되지 않아, pom.xml에 json관련 dependency를 추가함
			    	*/
				    if (xhr.readyState === xhr.DONE) {
					      if (xhr.status === 200) {
					    	var result = xhr.response;
					    	console.log('json : ' + JSON.stringify(result));
					        document.getElementById('name').innerHTML = result.name;
					        document.getElementById('phone').innerHTML = result.phone;
					      } else {
					    	// console.log("json : " + JSON.stringify(result));
					        alert('Request Error!');
					      }
				    }
			    };
			    /* Get 방식, name 파라미터와 함께 데이터 요청 */
			    xhr.open('GET', '/javascript/practice/searchPhoneByName?inputName=' + inputName);
			    /* Response Type을 Json으로 정의 */
			    xhr.responseType = 'json';
			    /* 서버에 요청을 전송 */
			    xhr.send();
			});
			
			// 테이블 검색(제이쿼리사용)
			$('#searchEmpInfosBtn').click(function() {
				const searchKey = $('select[name=search-key]').val();
				const searchValue = $('#searchValue').val();
				// console.log(searchKey);	
				// console.log(searchValue);
				
				const data = {
							  'searchKey': searchKey,
							  'searchValue' : searchValue
							 };
				// console.log(data);	
				
				const jsonText = JSON.stringify(data);
				// console.log("jsonText: " + jsonText);	
				
				// 제이쿼리 ajax
				$.ajax({
					type: 'post',
					url: '/javascript/practice/searchEmpInfos',
					data: jsonText,
					contentType: 'application/json',
					dataType: 'json',
					success: function(result) {
						// console.log(result);
						const $tbody = $('#empInfosTbody').empty();
						$.each(result, function(index, result) {
							let row = "<tr>";
							row += "<td>"+result.empId+"</td>";
							row += "<td>"+result.name+"</td>";
							row += "<td>"+result.email+"</td>";
							row += "<td>"+result.phone+"</td>";
							row += "<td>"+result.hireDate+"</td>";
							row += "<td>"+result.magId+"</td>";
							row += "<td>"+result.jobTitle+"</td>";
							row += "</tr>";
							$tbody.append(row);
						}); 
								
						if (result.length == 0) {
							$(this).text("데이터가 없어요...T^T");
						}
					}
				});
			});
		}
	</script>
</body>
</html>
