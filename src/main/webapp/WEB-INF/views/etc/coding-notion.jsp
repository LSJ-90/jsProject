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
		ul li {
			padding: 10px;
		}
	</style>
</head>
<body>
	<a href="../home"><img src="../resources/images/logo.png" alt=""></a>
	<h1>표기법</h1>
	<ul>
		<li>
			Camel Case:<br/>
			- 첫 단어를 제외하고 이후 단어의 첫 번째 문자를 대문자로 표기<br/>
			- 변수명, 함수명을 정할 때 주로 사용됨<br/>
			EX) camelCaseStudy
		</li>
		<li> 
			Pascal Case:<br/> 
			- 모든 단어의 첫 번째 문자를 대문자로 표기<br/>
			- 클래스명을 정할 때 주로 사용됨<br/>
			EX) PascalCaseStudy
		</li>
		<li>
			Kebab Case:<br/>
			- 모든 단어를 소문자로 작성하고 단어 사이를 하이픈(-)으로 이어 표기<br/>
			- url을 정할 때 주로 사용됨<br/>
			EX) kebab-case-study
		</li>
		<li>
			Snake Case:<br/>
			- 모든 단어를 소문자 혹은 대문자로 작성하고 단어 사이를 언더바(_)로 이어 표기<br/>
			- 주로 상수명을 결정할 때 사용됨<br/>
			EX) snake_case_study, SNAKE_CASE_STUDY
		</li>
		<li>
			Hungarian Notation:<br/>
			- 각 데이터 타입에 따라 문자를 지정해둠<br/>
			- 지정된 문자를 변수명 앞에 작성함으로서 변수명만 보더라도 타입을 알 수 있게 표기<br/>
			EX) nPrice, chGender .. 
		</li>
	</ul>
</body>
</html>