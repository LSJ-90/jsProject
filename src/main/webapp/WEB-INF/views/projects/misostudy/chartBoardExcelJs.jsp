<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<meta name="description" content="Web tutorials">
	<meta name="keywords" content="HTML">
	<meta name="author" content="AlpacaJoon">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Study Site 화로 정리 해보기</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<style>
		.echart {
			width: 900px; height:600px; margin-bottom: 10px; border: 1px solid black;	
		}
	</style>
</head>
<body>
	<header>
		<%@include file="navbar.jsp" %>
		<%@include file="signInForm.jsp" %>
		<%@include file="signUpForm.jsp" %>
	</header>
	<div class="container">
	<button id="wordDownBtn">워드다운</button>
	<button id="excelDownBtn">엑셀다운</button>
		<h2 id="testContentTitle" style="padding:0px 0; font-weight:bold; font-size:17px; color:#333;">1.연도별 특허 수</h2>
		<p style="margin:0; padding:0; text-align:center; font-weight:bold;">표 1. 연도별 특허 수</p>
		<table id="testTable1" class="testTable_1" width="100%" border="1" bordercolor="#666" cellspacing="0" cellpadding="0" style="border:1px solid #666; border-collapse:collapse;">
			<tr>
				<th width="25%" style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0; background:#F0F0F0;">연도</th>
				<th width="25%" style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0; background:#F0F0F0;">특허 수</th>
				<th width="25%" style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0; background:#F0F0F0;">누적 특허 수</th>
				<th width="25%" style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0; background:#F0F0F0;">Korea, Republic 특허 수</th>
			</tr>

			<tr>
				<td style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0;">2012</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">5,988</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">5,988</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">418</td>
			</tr>

			<tr>
				<td style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0;">2013</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">7,022</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">13,010</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">502</td>
			</tr>

			<tr>
				<td style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0;">2014</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">7,935</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">20,945</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">595</td>
			</tr>

			<tr>
				<td style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0;">2015</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">8,643</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">29,588</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">836</td>
			</tr>

			<tr>
				<td style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0;">2016</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">8,706</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">38,294</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">922</td>
			</tr>

			<tr>
				<td style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0;">2017</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">9,814</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">48,108</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">1,071</td>
			</tr>

			<tr>
				<td style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0;">2018</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">9,796</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">57,904</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">933</td>
			</tr>

			<tr>
				<td style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0;">2019</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">11,530</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">69,434</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">990</td>
			</tr>

			<tr>
				<td style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0;">2020</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">11,984</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">81,418</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">1,105</td>
			</tr>

			<tr>
				<td style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0;">2021</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">11,563</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">92,981</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">1,027</td>
			</tr>

			<tr>
				<td style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0;">2022</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">4,728</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">97,709</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">430</td>
			</tr>
		</table>
		<p>그림 1. 연도별 특허 출원 추이</p>
		<div class="echart" id="chartTest1"></div>
		
		<h2 style="padding:0px 0; font-weight:bold; font-size:17px; color:#333;">2. 출원인 국적별 분석 (특허권 보유 국가 분석)</h2>
		<h3 style="padding:0px 0; font-weight:bold; font-size:14px; color:#333;">2-1. 출원인 국적별 특허 수</h3>
		<p style="margin:0; padding:0; text-align:center; font-weight:bold;">표 2. 출원인 국적별 특허 수</p>
		<table id="testTable2" class="testTable_2" width="100%" border="1" bordercolor="#666" cellspacing="0" cellpadding="0" style="border:1px solid #666; border-collapse:collapse;">
			<tr>
				<th width="10%" style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0; background:#F0F0F0;">순위</th>
				<th width="10%" style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0; background:#F0F0F0;">출원인 국적</th>
				<th width="10%" style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0; background:#F0F0F0;">특허 수</th>
				<th width="10%" style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0; background:#F0F0F0;">비중 (%)</th>
			</tr>

			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">1</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">United States of America</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">51,582</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">52.79</td>
			</tr>

			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">2</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">Japan</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">9,166</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">9.38</td>
			</tr>

			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">3</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">Korea, Republic</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">8,829</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">9.04</td>
			</tr>

			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">4</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">China</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">3,451</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">3.53</td>
			</tr>

			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">5</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">Taiwan</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">3,243</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">3.32</td>
			</tr>

			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">6</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">Germany</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">2,968</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">3.04</td>
			</tr>

			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">7</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">United Kingdom</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">1,587</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">1.62</td>
			</tr>

			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">8</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">France</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">1,557</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">1.59</td>
			</tr>

			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">9</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">Netherlands</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">1,476</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">1.51</td>
			</tr>

			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">10</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">Switzerland</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">1,246</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">1.28</td>
			</tr>

		</table>
		
		<p>그림 2. 출원인 국적별 특허 수</p>
		<div class="echart" id="chartTest2"></div>
		
		<h3 style="padding:0px 0; font-weight:bold; font-size:14px; color:#333;">2-2. 출원인 국적별 연도별 특허 수</h3>
		<p style="margin:0; padding:0; text-align:center; font-weight:bold;">표 3. 출원인 국적별 연도별 특허 수</p>
		<table id="testTable3" class="testTable_2" width="100%" border="1" bordercolor="#666666" cellspacing="0" cellpadding="0" style="border:1px solid #666; border-collapse:collapse;">
			<tr>
				<th style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0; background:#F0F0F0;">연도</th>

				<th width="7%" style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0; background:#F0F0F0;">2012</th>

				<th width="7%" style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0; background:#F0F0F0;">2013</th>

				<th width="7%" style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0; background:#F0F0F0;">2014</th>

				<th width="7%" style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0; background:#F0F0F0;">2015</th>

				<th width="7%" style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0; background:#F0F0F0;">2016</th>

				<th width="7%" style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0; background:#F0F0F0;">2017</th>

				<th width="7%" style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0; background:#F0F0F0;">2018</th>

				<th width="7%" style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0; background:#F0F0F0;">2019</th>

				<th width="7%" style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0; background:#F0F0F0;">2020</th>

				<th width="7%" style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0; background:#F0F0F0;">2021</th>

				<th width="7%" style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0; background:#F0F0F0;">2022</th>

				<th width="7%" style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0; background:#F0F0F0;">총합</th>
			</tr>

			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0; font-weight:bold">United States of America</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">3,217</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">3,806</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">4,369</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">4,474</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">4,481</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">5,037</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">5,104</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">6,139</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">6,441</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">6,139</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">2,375</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">51,582</td>

			</tr>

			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0; font-weight:bold">Japan</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">822</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">865</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">852</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">964</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">874</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">952</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">830</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">923</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">935</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">823</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">326</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">9,166</td>

			</tr>

			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0; font-weight:bold">Korea, Republic</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">418</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">502</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">595</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">836</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">922</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">1,071</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">933</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">990</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">1,105</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">1,027</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">430</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">8,829</td>

			</tr>

			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0; font-weight:bold">China</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">101</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">125</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">179</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">224</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">254</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">341</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">329</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">505</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">479</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">579</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">335</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">3,451</td>

			</tr>

			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0; font-weight:bold">Taiwan</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">292</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">301</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">336</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">328</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">316</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">328</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">298</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">319</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">304</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">291</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">130</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">3,243</td>

			</tr>

			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0; font-weight:bold">Germany</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">170</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">190</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">232</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">252</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">214</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">295</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">320</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">426</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">420</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">328</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">121</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">2,968</td>

			</tr>

			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0; font-weight:bold">United Kingdom</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">56</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">77</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">103</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">121</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">138</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">160</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">180</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">232</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">228</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">207</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">85</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">1,587</td>

			</tr>

			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0; font-weight:bold">France</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">97</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">124</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">125</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">156</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">135</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">165</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">164</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">193</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">182</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">157</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">59</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">1,557</td>

			</tr>

			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0; font-weight:bold">Netherlands</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">110</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">133</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">151</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">174</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">158</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">147</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">149</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">134</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">144</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">118</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">58</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">1,476</td>

			</tr>

			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0; font-weight:bold">Switzerland</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">67</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">107</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">97</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">105</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">111</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">137</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">128</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">143</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">148</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">133</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">70</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">1,246</td>

			</tr>

		</table>
		
		<p>그림 3. 출원인 국적별 연도별 특허 수</p>
		<div class="echart" id="chartTest3"></div>
		
		<table id="testTable4" class="testTable_3" width="100%" border="1" bordercolor="#666" cellspacing="0" cellpadding="0" style="border:1px solid #666; border-collapse:collapse;">
			<tr>
				<th width="10%" style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0; background:#F0F0F0;">출원인 국적</th>
				<th width="10%" style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0; background:#F0F0F0;">특허 수</th>
				<th width="10%" style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0; background:#F0F0F0;">특정 기술 분야 총 특허 수</th>
				<th width="10%" style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0; background:#F0F0F0;">특정 국가 전체 특허 수</th>
				<th width="10%" style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0; background:#F0F0F0;">전체 특허 수</th>
				<th width="10%" style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0; background:#F0F0F0;">활동도 지수</th>
			</tr>
	
			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">Korea, Republic</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">8829</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">97709</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">215194</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">3561291</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">1.495</td>
			</tr>
	
			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">Netherlands</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">1476</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">97709</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">42733</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">3561291</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">1.259</td>
			</tr>
	
			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">United States of America</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">51582</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">97709</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">1614311</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">3561291</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">1.165</td>
			</tr>
	
			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">United Kingdom</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">1587</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">97709</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">50401</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">3561291</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">1.148</td>
			</tr>
	
			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">Switzerland</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">1246</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">97709</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">46192</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">3561291</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">0.983</td>
			</tr>
	
			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">Taiwan</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">3243</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">97709</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">120953</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">3561291</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">0.977</td>
			</tr>
	
			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">China</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">3451</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">97709</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">137079</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">3561291</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">0.918</td>
			</tr>
	
			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">France</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">1557</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">97709</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">66875</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">3561291</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">0.849</td>
			</tr>
	
			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">Germany</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">2968</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">97709</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">166867</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">3561291</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">0.648</td>
			</tr>
	
			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">Japan</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">9166</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">97709</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">558648</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">3561291</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">0.598</td>
			</tr>
	
		</table>
		
		<p>그림 4. 출원인 국적별 활동도 지수</p>
		<div class="echart" id="chartTest4"></div>
		
		<table id="testTable5" width="100%" border="1" bordercolor="#666" cellspacing="0" cellpadding="0" style="border:1px solid #666; border-collapse:collapse;">
			<tr>
				<th width="10%" style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0; background:#F0F0F0;">출원인 국적</th>
				<th width="10%" style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0; background:#F0F0F0;">특허 피인용 수</th>
				<th width="10%" style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0; background:#F0F0F0;">특정 기술 분야 특허의 총 피인용 수</th>
				<th width="10%" style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0; background:#F0F0F0;">특정 국가 특허 전체 피인용 수</th>
				<th width="10%" style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0; background:#F0F0F0;">전체 특허 피인용 수</th>
				<th width="10%" style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0; background:#F0F0F0;">이끌림 지수</th>
			</tr>

			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">United States of America</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">298767</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">382682</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">9502405</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">14450503</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">1.187</td>
			</tr>

			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">Netherlands</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">3086</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">382682</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">139032</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">14450503</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">0.838</td>
			</tr>

			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">Taiwan</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">6452</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">382682</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">293250</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">14450503</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">0.831</td>
			</tr>

			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">Korea, Republic</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">11733</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">382682</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">552420</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">14450503</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">0.802</td>
			</tr>

			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">Switzerland</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">2990</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">382682</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">156344</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">14450503</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">0.722</td>
			</tr>

			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">United Kingdom</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">3037</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">382682</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">171221</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">14450503</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">0.67</td>
			</tr>

			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">France</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">1958</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">382682</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">135464</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">14450503</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">0.546</td>
			</tr>

			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">Japan</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">14748</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">382682</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">1019637</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">14450503</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">0.546</td>
			</tr>

			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">Germany</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">5636</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">382682</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">398900</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">14450503</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">0.534</td>
			</tr>

			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">China</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">2741</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">382682</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">236236</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">14450503</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">0.438</td>
			</tr>

		</table>
		
		<p>그림 5. 출원인 국적별 이끌림 지수</p>
		<div class="echart" id="chartTest5"></div>
		
		<p>그림 6. 출원인 국적별 특허 수준 지수</p>
		<div class="echart" id="chartTest6"></div>
		
		<p>그림 7. 출원인 국적별 특허 수 대비 수준 지수</p>
		<div class="echart" id="chartTest7"></div>
		
		<p>그림 8. 특허 수 대비 평균 패밀리 크기</p>
		<div class="echart" id="chartTest8"></div>
		
		<p>그림 9. 출원인별 특허 수</p>
		<div class="echart" id="chartTest9"></div>
		
		<p>그림 10. 출원인별 연도별 특허 수</p>
		<div class="echart" id="chartTest10"></div>
		
		<p>그림 11. 출원인별 활동도 지수</p>
		<div class="echart" id="chartTest11"></div>
		
		<p>그림 12. 출원인별 이끌림 지수</p>
		<div class="echart" id="chartTest12"></div>
		
		<p>그림 13. 출원인별 특허 수준 지수</p>
		<div class="echart" id="chartTest13"></div>
		
		<p>그림 14. 출원인별 특허 수 대비 수준 지수</p>
		<div class="echart" id="chartTest14"></div>
		
		<p>그림 15. 특허 수 대비 평균 패밀리 크기(출원인별)</p>
		<div class="echart" id="chartTest15"></div>
		
		<p>그림 16. 피인용 수에 따른 특허 수의 분포</p>
		<div class="echart" id="chartTest16"></div>
	</div>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/exceljs/4.3.0/exceljs.min.js" integrity="sha512-UnrKxsCMN9hFk7M56t4I4ckB4N/2HHi0w/7+B/1JsXIX3DmyBcsGpT3/BsuZMZf+6mAr0vP81syWtfynHJ69JA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script type="text/javascript" src="/resources/js/shim.min.js"></script>
	<script type="text/javascript" src="/resources/js/xlsx.full.min.js"></script>
	<script type="text/javascript" src="/resources/js/xlsx.bundle.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/2.0.5/FileSaver.min.js" integrity="sha512-Qlv6VSKh1gDKGoJbnyA5RMXYcvnpIqhO++MhIM2fStMcGT9i2T//tSwYFlcyoRRDcDZ+TYHpH8azBBCyhpSeqw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<!-- 	<script type="text/javascript" src="/resources/js/FileSaver.js"></script> -->
	
	<script type="text/javascript" src="/resources/js/echarts.min.js"></script>
	<script type="text/javascript" src="/resources/js/makeEcharts.js"></script>
	<script type="text/javascript">
		var testWorkbook = new ExcelJS.Workbook();
		
		testWorkbook.creator = 'LSJ';
		testWorkbook.lastModifiedBy = 'Bot';
		testWorkbook.created = new Date(2021, 8, 30);
		testWorkbook.modified = new Date();
		testWorkbook.lastPrinted = new Date(2021, 7, 27);
		
		// 시트 생성
		var testWorksheet = testWorkbook.addWorksheet('Test New Sheet', {views:[{state: 'frozen', xSplit: 1, ySplit:1}]});
		var testWorksheet2 = testWorkbook.addWorksheet('Test New Sheet2', {properties:{tabColor:{argb:'FFC0000'}}});
		
		testWorksheet.columns = [
		  { header: '연도', key: 'year', width: 20 },
		  { header: '특허 수', key: 'patentCnt', width: 20 },
		  { header: '누적 특허 수.', key: 'cumulativSum', width: 20 },
		  { header: 'Korea, Republic 특허 수', key: 'patentCntKR', width: 30 }
		];
		
		testWorksheet2.columns = [
		  { header: '순위', key: 'rank', width: 20 },
		  { header: '출원인 국적', key: 'country', width: 20 },
		  { header: '특허 수 ', key: 'patentCnt', width: 20 },
		  { header: '비중', key: 'importance', width: 20 }
		];
		
		// 로우에 데이터 매칭
		testWorksheet.addRows(tsetValue1);
		testWorksheet2.addRows(tsetValue2);
		
		$('#excelDownBtn').click(function() {
			testWorkbook.xlsx.writeBuffer().then(function(data) {
				console.log(data);
			  var blob = new Blob([data], {type: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=utf-8' });
			  saveAs(blob, 'test.xlsx');
			});
		});
		
	
		$.post('/projects/misostudy/chartBarAndLine',
			function(jsonDataList) {
				// console.log(jsonDataList);
				echart_BarAndLine('chartTest1', jsonDataList[0], '연도', '특허 수(전체)', '특허 수(기준국가)');
			}		
		);
		
		$.post('/projects/misostudy/chartBarHorizontal',
			function(jsonDataList) {
				// console.log(jsonDataList);
				echart_BarHorizontal('chartTest2', jsonDataList[0], '특허 수', '국적');
				echart_BarHorizontal('chartTest4', jsonDataList[1], '활동도 지수', '국적');
				echart_BarHorizontal('chartTest5', jsonDataList[2], '이끌림 지수', '국적');
				echart_BarHorizontal('chartTest6', jsonDataList[3], '수준 지수', '국적');
				echart_BarHorizontal('chartTest9', jsonDataList[4], '특허 수', '출원인');
				echart_BarHorizontal('chartTest11', jsonDataList[5], '활동도 지수', '출원인');
				echart_BarHorizontal('chartTest12', jsonDataList[6], '이끌림 지수', '출원인');
				echart_BarHorizontal('chartTest13', jsonDataList[7], '수준 지수', '출원인');
			}		
		);
		
		$.post('/projects/misostudy/chartLineMultiple',
			function(jsonDataList) {
				// console.log(jsonDataList);
				echart_LineMultiple('chartTest3', jsonDataList[0], '연도', '특허 수');
				echart_LineMultiple('chartTest10', jsonDataList[1], '연도', '특허 수');
			}		
		);
		
		$.post('/projects/misostudy/chartScatterMultiple',
			function(jsonDataList) {
				// console.log(jsonDataList);
				echart_ScatterMultiple('chartTest7', jsonDataList[0], '특허 수', '수준 지수');
				echart_ScatterMultiple('chartTest8', jsonDataList[1], '특허 수', '평균 패밀리 크기');
				echart_ScatterMultiple('chartTest14', jsonDataList[2], '특허 수', '수준 지수');
				echart_ScatterMultiple('chartTest15', jsonDataList[3], '특허 수', '평균 패밀리 크기');
			}		
		);
		
		$.post('/projects/misostudy/chartScatterSingle',
			function(jsonDataList) {
				// console.log(jsonDataList);
				echart_ScatterSingle('chartTest16', jsonDataList[0], '피 인용 수', '특허 수');
			}		
		);
	</script>
	<script src="/resources/js/common.js"></script>
</body>
</html>
