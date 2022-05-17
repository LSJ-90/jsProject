<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
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
	Name: <input type="text" id="inputName" name="inputName"></input>
	<button id="searchPhone">검색</button>
	<h2><span id="name"></span>의 전화번호는 <span id="phone"></span>입니다.</h2>
	
	<h2>Promise TEST</h2>
	Name: <input type="text" id="inputName2" name="inputName"></input>
	<button id="searchPhone2">검색</button>
	<h2><span id="name2"></span>의 전화번호는 <span id="phone2"></span>입니다.</h2>
	
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
	
	<form method="get" action="/javascript/practice" 
		  id="searchEmpInfosForm" name="searchEmpInfosForm">
		<select name="searchKey">
			<option value="name">이름</option>
			<option value="email">이메일</option>
			<option value="dept">부서</option>
		</select>
		<input type="text" id="searchValue" name="searchValue"/>
		<button type="button" id=searchEmpInfosBtn>검색</button>
		<button type="submit" id=searchEmpInfosFormBtn>GET검색</button>
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
	// 배열 순환(반복가능한 객체만 사용가능) for~of: value를 리턴, internet ex 사용불가
		const dataList = new Array();
		<c:forEach var='empInfo' items='${empInfos }'>
			dataList.push('${empInfo}');
		</c:forEach>
		
		for (const data of dataList) {
			//  console.log(data);
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
			// console.log(Object.keys(searchData));	    // 모든 key 리턴
			// console.log(Object.values(searchData));		// 모든 value 리턴, Internet Ex사용불가
			// console.log(Object.entries(searchData));		// 모든 enrty 리턴, Internet Ex사용불가
		
		// shift(), pop()
		/* const myArray = [1, 2, 'Dave', 100]; 
			console.log(myArray);
			console.log("length: " + myArray.length);
		myArray.shift(); // 첫 데이터를 제거 후 두번째 데이터를 첫번째로 옮기면서 length가 줄어듬
			console.log(myArray);
			console.log("shift.length: " + myArray.length);
		myArray.pop(); // 마지막 데이터를 제거함
			console.log(myArray);
			console.log("pop.length: " + myArray.length); */
		
		/* 
		readyState
		: XMLHttpRequest객체의 현재 상태를 반환
		0 : 요청이 초기화되지 않음 // unsent
		1 : 서버와 연결됨 // opened
		2 : 서버가 요청을 받음 // headers_received
		3 : 서버가 요청을 처리 중임 // loading
		4 : 서버가 요청처리를 끝내고 응답데이터를 보낼 준비가 됨 //done
		
		status(좀 더 디테일하게)
		: 요청에 대한 HTTP 응답코드를 반환
		200 : OK
		201 : 
		404 : Not Found
		406 : Not Acceptable > 응답헤더에 적혀 있는 컨텐츠 형식을 생성해낼 수 없을 때 발생하는 에러 
		500 : Server Error
		*/
		
		// 바닐라 자바스크립트 ajax
		/* searchPhone button 이벤트 */
		document.getElementById('searchPhone').addEventListener('click', function() {
			
			/* phone 정보를 검색할 name 데이터를 빼옴 */
			const inputName = document.getElementById('inputName').value;
			
			/* 통신에 사용 할 XMLHttpRequest 객체 생성 */
			const xhr = new XMLHttpRequest();
			
		    /* Get 방식, name 파라미터와 함께 데이터 요청 */
		    xhr.open('GET', '/javascript/practice/searchPhoneByName?inputName=' + inputName);
		    
		    /* Response Type을 Json으로 정의 */
		    xhr.responseType = 'json';
		    
		    /* 서버에 요청을 전송 */
		    xhr.send();
		    
		    /* readyState가 변화했을때 함수 실행 */
		    xhr.onreadystatechange = function() {
		    	/* 
		    	readyState가 Done이고 응답 값이 200일 때, 받아온 response로 name과 age를 그려줌 
		    	응답헤더에 json파일이 넘어오지 않으면서 406에러가 뜨면서 통신이 되지 않아, pom.xml에 json관련 dependency를 추가함
		    	*/
			    if (xhr.readyState === xhr.DONE) {
				    if (xhr.status === 200) {
				    	const result = xhr.response;
				    	// console.log('json : ' + JSON.stringify(result));
				        document.getElementById('name').innerHTML = result.name;
				        document.getElementById('phone').innerHTML = result.phone;
				    } else {
				    	// console.log("json : " + JSON.stringify(result));
				    	alert('Request Error!');
					}
			    }
		    };
		});
		
		// 비동기 함수의 문제점
		// 응답을 받기도 전에 return이 실행되어버림
		/* function getHtml() {
			let htmlData;
			$.get('/javascript/practice', function(response) {
				htmlData = response;
			});
			return htmlData;
		}
		console.log(getHtml()); */ // undefined 
		
		/* 컨트롤단에서 시간 차이를 주어 확인해보기
		function getHtml(callbackFn) {
		 	$.get('/javascript/practice', function (response) {
		  		callbackFn(response);
		 	});
		}
		function callbackFn(htmlData) {
			console.log(htmlData);
		}
		getHtml(callbackFn); // callback 
		*/
		
		// promise internet Ex사용불가 es6문법 >> webhack?을 사용해 es5문법으로 컴파일가능 
		// promise겍체, resolve(), reject()
		// 대기(pending): 이행하지도, 거부하지도 않은 초기 상태.
		// 이행(fulfilled): 연산이 성공적으로 완료됨.
		// 거부(rejected): 연산이 실패함.
		document.getElementById('searchPhone2').addEventListener('click', function(){
			
			/* 대기(pending): 이행하지도, 거부하지도 않은 초기 상태 */
			const myFirstPromise = new Promise(function(resolve, reject) {
				
				const inputName = document.getElementById('inputName2').value;
				// console.log(inputName2);
				
				const xhr = new XMLHttpRequest(); // axios, ajax
				
				xhr.open('GET', '/javascript/practice/searchPhoneByName?inputName=' + inputName);
				xhr.responseType = 'json';
				xhr.send();
				
				 xhr.onreadystatechange = function() {
				    if (xhr.readyState === xhr.DONE) {
					      if (xhr.status === 200) {
					    	const result = xhr.response;
					    	// 성공시 resolve 이행(fulfilled)
					    	resolve(result);
					    	// console.log("resolve json : " + JSON.stringify(result));
					    	
					      } else {
					    	// console.log("json : " + JSON.stringify(result));
					    	// 실패 시 reject 거부(rejected)
					       	reject(new Error(xhr.status));
					      }
				    }
			    };
				
				
			});
			
			myFirstPromise
				.then(function(result) {
					// console.log('then result : ' + JSON.stringify(result));
			        document.getElementById('name2').innerHTML = result.name;
			        document.getElementById('phone2').innerHTML = result.phone;
				})
				.catch(function(error) {
					console.log(error);
				})
				.finally(function() {
					console.log('성공하든 실패하든 반드시 실행됨');
				});
		});
		
		// promise chaining
		/* 함수표현식 알아보기
		function ex(A, B) {
		    return new Promise(function(resolve, reject) {
		    	 ~로직~
		    });
		}
		*/
		
		/*
		new Promise(function(resolve, reject){
			  setTimeout(function() {
			    resolve(1);
			  }, 2000);
			})
			.then(function(result) {
			  console.log(result); // 1
			  return result + 10;
			})
			.then(function(result) {
			  console.log(result); // 11
			  return result + 20;
			})
			.then(function(result) {
			  console.log(result); // 31
			});
		 */
		 
		// 테이블 검색(제이쿼리사용)
		$('#searchEmpInfosBtn').click(function() {
			const searchKey = $('select[name=searchKey]').val(),
				  searchValue = $('#searchValue').val();
			
			const formData = $("#searchEmpInfosForm").serialize();
			console.log(formData);
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
					const tbody = $('#empInfosTbody').empty();
					
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
						tbody.append(row);
					}); 
							
					if (result.length == 0) {
						tbody.text("데이터가 없어요...T^T");
					}
				},
				error:function() {
			        console.log("실패");
			    }
			});	
		});
		 
		 
		// 테이블 검색(제이쿼리사용) GET
		/* 미완
		$('#searchEmpInfosFormBtn').click(function() {
			var formValues = $('#searchEmpInfosForm').serialize() ;
			console.log(formValues);
			
			const jsonText = JSON.stringify(formValues);
			// console.log("jsonText: " + jsonText);	
			
			// 제이쿼리 ajax
			$.ajax({
				type: 'get',
				url: '/javascript/practice',
				data: formValues,
				contentType: 'application/json',
				dataType: 'json',
				success: function(result) {
					 console.log(result);
				},
				error:function() {
			        console.log("실패");
			    }
			});	
		});
		*/
		
		// es버전 확인하는 방법: 엔진자체는 보통 최신화 되어있음 >> webhack 최신버전으로 맞추기도 가능..!?
		// scope알아보기, 함수표기법 알아보기, 호이스팅, (async, await 짝꿍), filiter, splice, subString
		// setTimeOut(),setTimeClear() 둘이 짝궁 비동기처리 메소드이기때문에 콜백함수 대신하여 사용하는게 아님.
		// getElementsByClassName 은 배열로 생성되기 떄문에 classModi[0]으로 선택해야함
		// 자동완성 html태그 중에 있음 찾아보자!
		// 여러가지 방법을 많이 알아야 한다.
	</script>
</body>
</html>
