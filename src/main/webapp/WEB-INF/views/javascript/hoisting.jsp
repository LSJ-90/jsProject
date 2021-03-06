<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<meta name="description" content="Web tutorials">
	<meta name="keywords" content="HTML">
	<meta name="author" content="AlpacaJoon">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>JavaScipt</title>
</head>
<body>
	<a href="../home"><img src="../resources/images/logo.png" alt=""></a>
	<h1>HOISTING</h1>
	<ul>
		<li>선언이 초기화보다 늦게 작성되었더라도, 선언이 먼저되어 있어 결과가 도출되는 현상을 뜻함</li>
	</ul>

	<textarea style="width: 800px; height: 500px;">
// 전역 변수 선언
x = 1;
y = 2;

// 함수 정의
function foo(a) {
	// 지역 변수 선언
	var z = 10;

	// 메서드 호출
	console.log(a + z); // 110
}

// 함수 호출
foo(100);

// 메서드 호출
var x;
var y;
console.log(x + y); // 3

1. 전역 코드 평가 >> 타입 선언이 변수 초기화보다 늦었지만 전역 코드 평가가 실행보다 먼저 되기 때문에 호이스팅 발생!
	: 전역 코드의 변수 선언문과 함수 선언문이 실행 컨텍스트에서 관리되는 전역 스코프에 등록
	: var x, var y, funtion foo(a)

2. 전역 코드 실행
	: 평가 과정이 끝난 후 런타임이 시작되어 전역 코드가 순차적으로 실행됨
	: 전역 변수에 값이 할당되고 함수가 있다면 호출됨
	: 함수를 만나면 코드 실행을 중단하고 함수 내부에서 코드 평가를 이어가게 됨
	: x=1, y=2, foo(100)

3. 함수 코드 평가
	: 매개변수와 지역 변수 선언문이 실행 컨텍스트에서 관리되는 지역 스코프에 등록됨
	: var z, 매개변수 a

4. 함수 코드 실행
	: 매개변수와 지역변수의 값이 할당되고 함수 내부 코드부터 다시 런타임이 시작됨
	: z=10, a=100

5. 함수 내부코드 실행 완료 후 전역 코드 재 실행
	</textarea>

	<div id="output"></div>
	
	<script>
		document.getElementById("output").innerHTML = "F12를 눌러 console.log 값을 비교해보자!";
		
		console.log("##변수 선언 전/후에 따른 a값 차이##");
		console.log("변수 선언 전: " + a);
		console.log("var a = \"Hello World!\";");
		var a = "Hello World!";
		console.log("변수 선언 후: " + a);
		
		console.log(" ");
		console.log("-------------------------------");
		console.log(" ");

		// 변수 초기화 후 타입 선언
		console.log("변수 초기화 전: " + b);
		console.log("b = \"Hello World!\";");
		b = "Hello World!";
		console.log("변수 초기화 후 / 타입 선언 전: " + b);
		console.log("var b;")
		var b;
		console.log("타입 선언 후: " + b);
		console.log(">> 타입 선언 전이라도 값을 가져올 수 있음, 하지만 타입을 선언하지 않을 시 ReferenceError가 발생함");
		
		console.log(" ");
		console.log("-------------------------------");
		console.log(" ");

		// 타입선언 후 변수 초기화
		console.log("타입 선언 전: " + c);
		console.log("var c;");
		var c;
		console.log("타입 선언 후 / 변수 초기화 전: " + c);
		console.log("c = \"Hello World!\";");
		c = "Hello World!";
		console.log("변수 초기화 후: " + c);
		console.log(">> 변수 초기화 전에는 undefined라는 값으로 초기화 되어있음");
		
		console.log(" ");
		console.log("-------------------------------");
		console.log(" ");

		// 함수 지역변수를 제외한 변수는 모두 전역변수화 됨
		for(var i = 1; i<5; i++) {
			console.log(i);
		}
		console.log(i);

		console.log(" ");
		console.log("-------------------------------");
		console.log(" ");

		// 함수 호이스팅
		console.dir(add);
		console.dir(sub);

		console.log(add(2, 5));
		console.log(sub(2, 5));

		function add(x, y) {
			return x + y;
		}
		// 함수 호이스팅이 아닌 변수 호이스팅이 일어남
		var sub = function (x, y) {
			return x - y;
		}
	</script>
</body>
</html>