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
	<div id="testExportDoc" class="container">
<!-- 	<input id="patent_number"> -->
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
		<div class="testImg"></div>
		
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
		<div class="testImg"></div>
		
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
		<div class="testImg"></div>
		
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
		<div class="testImg"></div>
		
		<p style="margin:0; padding:0; text-align:center; font-weight:bold;">표 5. 출원인 국적별 이끌림 지수</p>
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
		<div class="testImg"></div>
		
		<p style="margin:0; padding:0; text-align:center; font-weight:bold;">표 6. 출원인 국적별 특허 수준 지수</p>
		<table id="testTable6" width="100%" border="1" bordercolor="#666" cellspacing="0" cellpadding="0" style="border:1px solid #666; border-collapse:collapse;">	
			<tr>
				<th width="40%" style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0; background:#F0F0F0;">국가</th>
				<th width="20%" style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0; background:#F0F0F0;">특허 수</th>
				<th width="20%" style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0; background:#F0F0F0;">특허 당 피인용 수</th>
				<th width="20%" style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0; background:#F0F0F0;">수준 지수</th>
			</tr>

			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">United States of America</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">49,207</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">6.188</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">1.474</td>
			</tr>

			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">Switzerland</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">1,176</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">2.593</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">0.618</td>
			</tr>

			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">Netherlands</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">1,418</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">2.209</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">0.526</td>
			</tr>

			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">Taiwan</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">3,113</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">2.118</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">0.505</td>
			</tr>

			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">United Kingdom</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">1,502</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">2.065</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">0.492</td>
			</tr>

			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">Germany</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">2,847</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">2.035</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">0.485</td>
			</tr>

			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">Japan</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">8,840</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">1.704</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">0.406</td>
			</tr>

			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">Korea, Republic</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">8,399</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">1.43</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">0.341</td>
			</tr>

			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">France</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">1,498</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">1.33</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">0.317</td>
			</tr>

			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">China</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">3,116</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">0.895</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">0.213</td>
			</tr>

		</table>
		
		<p>그림 6. 출원인 국적별 특허 수준 지수</p>
		<div class="echart" id="chartTest6"></div>
		<div class="testImg"></div>
		
		<p>그림 7. 출원인 국적별 특허 수 대비 수준 지수</p>
		<div class="echart" id="chartTest7"></div>
		<div class="testImg"></div>
		
		<p style="margin:0; padding:0; text-align:center; font-weight:bold;">표 7. 출원인 국적별 평균 패밀리 크기</p>
		<table id="testTable7" width="100%" border="1" bordercolor="#666666" cellspacing="0" cellpadding="0" style="border:1px solid #666; border-collapse:collapse;">	
			<tr>
				<th width="40%" style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0; background:#F0F0F0;">국가</th>
				<th width="20%" style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0; background:#F0F0F0;">특허 수</th>
				<th width="20%" style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0; background:#F0F0F0;">평균 패밀리 크기</th>
				<th width="20%" style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0; background:#F0F0F0;">분야 평균 대비<br/>평균 패밀리 크기</th>
			</tr>
		
			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">Switzerland</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">1,176</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">10.145</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">2.448</td>	
			</tr>
		
			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">Germany</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">2,847</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">7.627</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">1.84</td>	
			</tr>
		
			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">United Kingdom</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">1,502</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">7.563</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">1.825</td>	
			</tr>
		
			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">France</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">1,498</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">6.14</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">1.481</td>	
			</tr>
		
			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">Netherlands</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">1,418</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">5.559</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">1.341</td>	
			</tr>
		
			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">Japan</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">8,840</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">4.504</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">1.087</td>	
			</tr>
		
			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">United States of America</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">49,207</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">3.823</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">0.922</td>	
			</tr>
		
			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">China</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">3,116</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">3.282</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">0.792</td>	
			</tr>
		
			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">Korea, Republic</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">8,399</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">3.196</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">0.771</td>	
			</tr>
		
			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">Taiwan</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">3,113</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">2.619</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">0.632</td>	
			</tr>
		
		</table>
		
		<p>그림 8. 특허 수 대비 평균 패밀리 크기</p>
		<div class="echart" id="chartTest8"></div>
		<div class="testImg"></div>
		
		<p style="margin:0; padding:0; text-align:center; font-weight:bold;">표 8. 출원인별 특허 수</p>
		<table id="testTable8" width="100%" border="1" bordercolor="#666" cellspacing="0" cellpadding="0" style="border:1px solid #666; border-collapse:collapse;">	
			<tr>
				<th width="10%" style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0; background:#F0F0F0;">순위</th>
				<th width="50%" style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0; background:#F0F0F0;">출원인</th>
				<th width="20%" style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0; background:#F0F0F0;">특허 수</th>
				<th width="20%" style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0; background:#F0F0F0;">비중 (%)</th>
			</tr>

			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">1</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">SAMSUNG ELECTRONICS CO LTD</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">2,651</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">2.85</td>
			</tr>

			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">2</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">IBM</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">1,967</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">2.12</td>
			</tr>

			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">3</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">AT & T IP I LP</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">1,719</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">1.85</td>
			</tr>

			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">4</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">INTEL CORP</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">902</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">0.97</td>
			</tr>

			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">5</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">UNIV CALIFORNIA</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">834</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">0.9</td>
			</tr>

			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">6</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">SAMSUNG DISPLAY CO LTD</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">825</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">0.89</td>
			</tr>

			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">7</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">GENENTECH INC</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">623</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">0.67</td>
			</tr>

			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">8</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">AT & T MOBILITY II LLC</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">581</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">0.62</td>
			</tr>

			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">9</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">MASSACHUSETTS INST TECHNOLOGY</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">560</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">0.6</td>
			</tr>

			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">10</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">TAIWAN SEMICONDUCTOR MFG</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">499</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">0.54</td>
			</tr>

		</table>
		
		<p>그림 9. 출원인별 특허 수</p>
		<div class="echart" id="chartTest9"></div>
		<div class="testImg"></div>
		
		<p style="margin:0; padding:0; text-align:center; font-weight:bold">표 9. 출원인별 연도별 특허 수 </p>
		<table id="testTable9" width="100%" border="1" bordercolor="666" cellspacing="0" cellpadding="0" style="border:1px solid #666; border-collapse:collapse;">
			<tr>
				<th style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0; background:#F0F0F0;">연도</th>

				<th width="7.407407407407407%" style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0; background:#F0F0F0;">2012</th>

				<th width="7.407407407407407%" style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0; background:#F0F0F0;">2013</th>

				<th width="7.407407407407407%" style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0; background:#F0F0F0;">2014</th>

				<th width="7.407407407407407%" style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0; background:#F0F0F0;">2015</th>

				<th width="7.407407407407407%" style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0; background:#F0F0F0;">2016</th>

				<th width="7.407407407407407%" style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0; background:#F0F0F0;">2017</th>

				<th width="7.407407407407407%" style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0; background:#F0F0F0;">2018</th>

				<th width="7.407407407407407%" style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0; background:#F0F0F0;">2019</th>

				<th width="7.407407407407407%" style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0; background:#F0F0F0;">2020</th>

				<th width="7.407407407407407%" style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0; background:#F0F0F0;">2021</th>

				<th width="7.407407407407407%" style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0; background:#F0F0F0;">총합</th>
			</tr>

			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">SAMSUNG ELECTRONICS CO LTD</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">137</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">168</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">203</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">287</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">322</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">338</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">293</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">263</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">320</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">320</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">2,651</td>

			</tr>

			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">IBM</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">88</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">104</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">140</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">126</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">102</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">166</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">203</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">287</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">388</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">363</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">1,967</td>

			</tr>

			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">AT & T IP I LP</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">9</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">21</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">44</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">47</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">74</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">143</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">228</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">358</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">457</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">338</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">1,719</td>

			</tr>

			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">INTEL CORP</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">24</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">25</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">20</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">33</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">52</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">92</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">83</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">197</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">173</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">203</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">902</td>

			</tr>

			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">UNIV CALIFORNIA</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">63</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">81</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">98</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">89</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">68</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">89</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">70</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">75</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">104</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">97</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">834</td>

			</tr>

			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">SAMSUNG DISPLAY CO LTD</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">4</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">24</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">34</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">52</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">59</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">103</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">83</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">108</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">159</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">199</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">825</td>

			</tr>

			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">GENENTECH INC</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">65</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">77</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">65</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">46</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">58</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">62</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">80</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">50</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">59</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">61</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">623</td>

			</tr>

			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">AT & T MOBILITY II LLC</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">29</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">38</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">70</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">72</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">67</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">72</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">71</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">61</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">65</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">36</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">581</td>

			</tr>

			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">MASSACHUSETTS INST TECHNOLOGY</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">47</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">54</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">68</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">51</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">70</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">47</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">56</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">60</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">45</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">62</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">560</td>

			</tr>

			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">TAIWAN SEMICONDUCTOR MFG</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">9</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">17</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">16</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">23</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">41</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">75</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">70</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">74</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">79</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">95</td>

				<td style="border:1px solid #666; text-align:center; padding:2px 0;">499</td>

			</tr>

		</table>
		
		<p>그림 10. 출원인별 연도별 특허 수</p>
		<div class="echart" id="chartTest10"></div>
		<div class="testImg"></div>
		
		<p style="margin:0; padding:0; text-align:center; font-weight:bold;">표 10. 출원인별 활동도 지수</p>
		<table id="testTable10" width="100%" border="1" bordercolor="#666" cellspacing="0" cellpadding="0" style="border:1px solid #666; border-collapse:collapse;">
			<tr>
				<th width="10%" style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0; background:#F0F0F0;">출원인</th>
				<th width="10%" style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0; background:#F0F0F0;">특허 수</th>
				<th width="10%" style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0; background:#F0F0F0;">특정 기술 분야 총 특허 수</th>
				<th width="10%" style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0; background:#F0F0F0;">특정 출원인 전체 특허 수</th>
				<th width="10%" style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0; background:#F0F0F0;">전체 특허 수</th>
				<th width="10%" style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0; background:#F0F0F0;">활동도 지수</th>
			</tr>

			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">GENENTECH INC</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">623</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">92981</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">1051</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">3410307</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">21.741</td>
			</tr>

			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">AT & T MOBILITY II LLC</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">581</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">92981</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">2176</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">3410307</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">9.793</td>
			</tr>

			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">UNIV CALIFORNIA</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">834</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">92981</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">4245</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">3410307</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">7.206</td>
			</tr>

			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">MASSACHUSETTS INST TECHNOLOGY</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">560</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">92981</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">2981</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">3410307</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">6.89</td>
			</tr>

			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">AT & T IP I LP</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">1719</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">92981</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">10021</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">3410307</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">6.292</td>
			</tr>

			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">SAMSUNG DISPLAY CO LTD</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">825</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">92981</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">11932</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">3410307</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">2.536</td>
			</tr>

			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">SAMSUNG ELECTRONICS CO LTD</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">2651</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">92981</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">64260</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">3410307</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">1.513</td>
			</tr>

			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">INTEL CORP</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">902</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">92981</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">23631</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">3410307</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">1.4</td>
			</tr>

			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">TAIWAN SEMICONDUCTOR MFG</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">499</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">92981</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">18372</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">3410307</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">0.996</td>
			</tr>

			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">IBM</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">1967</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">92981</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">81163</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">3410307</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">0.889</td>
			</tr>

		</table>
		
		<p>그림 11. 출원인별 활동도 지수</p>
		<div class="echart" id="chartTest11"></div>
		<div class="testImg"></div>
		
		<p>그림 12. 출원인별 이끌림 지수</p>
		<div class="echart" id="chartTest12"></div>
		<div class="testImg"></div>
		
		<p>그림 13. 출원인별 특허 수준 지수</p>
		<div class="echart" id="chartTest13"></div>
		<div class="testImg"></div>
		
		<p>그림 14. 출원인별 특허 수 대비 수준 지수</p>
		<div class="echart" id="chartTest14"></div>
		<div class="testImg"></div>
		
		<p>그림 15. 특허 수 대비 평균 패밀리 크기(출원인별)</p>
		<div class="echart" id="chartTest15"></div>
		<div class="testImg"></div>
		
		<p>그림 16. 피인용 수에 따른 특허 수의 분포</p>
		<div class="echart" id="chartTest16"></div>
		<div class="testImg"></div>
	</div>
	
	<!-- bootstrap -->
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<!-- jquery.wordexport -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script type="text/javascript" src="/resources/js/FileSaver.js"></script>
	<script type="text/javascript" src="/resources/js/jquery.wordexport.js"></script>
	<!-- xlsx, sheetJS -->
<!-- 	<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script> -->
<!-- 	<script type="text/javascript" src="/resources/js/shim.min.js"></script> -->
<!-- 	<script type="text/javascript" src="/resources/js/xlsx.full.min.js"></script> -->
	<script type="text/javascript" src="/resources/js/xlsx.bundle.js"></script>
	<!-- echarts -->
<!-- 	<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script> -->
	<script type="text/javascript" src="/resources/js/echarts.min.js"></script>
	<script type="text/javascript" src="/resources/js/makeEcharts.js"></script>
	<script type="text/javascript">
       
		// EXPORT DOC TEST CODE
		$("#wordDownBtn").click(function() {
        	var myPromise = new Promise(function(resolve, reject) {
        		// echarts tooltip div 내용 비우기
        		$(".echart").each(function() {
       				console.log($(this).children());
					$(this).children().last().empty();
				});
        		
        		// canvas로  라이브러리에 보낼 temp Image 만들기
        		var canvas = document.getElementsByTagName("canvas");
	        	var classCharts = document.getElementsByClassName("testImg");
	        	for (var i=0; i<canvas.length; i++) {
	        	    var tempImg = new Image();
	        		tempImg.src = canvas[i].toDataURL();
	        		tempImg.width = 800;
	        		tempImg.height = 500;
	        		classCharts[i].append(tempImg);
	        	}
	        	//TODO: 
	        	resolve();
	        	reject();
       		});
        		 
       		myPromise.then(function() {
       			// export 실행
       			$("#testExportDoc").wordExport();
       			
       			// temp Image 삭제
       			var tempImgs = $("#testExportDoc").find("img");
   		        if (tempImgs.length > 0) {
   		            for (var i=0; i<tempImgs.length; i++) {
   		            	tempImgs[i].remove();
   		        	}
   				}
       		});
        });
		
		
		// EXPORT EXCEL TEST CODE
		$("#excelDownBtn").click(function() {
			var tableDomArray = document.getElementsByTagName("table");
			console.log(document.getElementsByTagName("table"));
			
			var sheetArr = [
				{"name" : "시트 첫 번 째", "value" : excelHandler.getWorksheetBySingleTable(tableDomArray[0])},
				{"name" : "시트 두 번 째", "value" : excelHandler.getWorksheetByMultipleTable([tableDomArray[1], tableDomArray[2], tableDomArray[3], tableDomArray[4]])},
				{"name" : "시트 세 번 째", "value" : excelHandler.getWorksheetByMultipleTable([tableDomArray[5], tableDomArray[6], tableDomArray[7]])},
				{"name" : "시트 네 번 째", "value" : excelHandler.getWorksheetBySingleTable(tableDomArray[8])},
				{"name" : "시트 다섯 번 째", "value" : excelHandler.getWorksheetBySingleTable(tableDomArray[9])},
				{"name" : "시트 여섯 번 째", "value" : excelHandler.getWorksheetBySingleTable(tableDomArray[3])}
			];
			
// 		    var newWorksheet1 = excelHandler.getWorksheetBySingleTable(tableDomArray[0]);
// 		    var newWorksheet2 = excelHandler.getWorksheetByMultipleTable([tableDomArray[1], tableDomArray[2], tableDomArray[3], tableDomArray[4]]);
// 		    var newWorksheet3 = excelHandler.getWorksheetByMultipleTable([tableDomArray[5], tableDomArray[6], tableDomArray[7]]);
// 		    var newWorksheet4 = excelHandler.getWorksheetBySingleTable(tableDomArray[8]);
// 		    var newWorksheet5 = excelHandler.getWorksheetBySingleTable(tableDomArray[9]);
// 		    var newWorksheet6 = excelHandler.getWorksheetBySingleTable(tableDomArray[3]);
		    
// 			excelFileExport(tableDomArray);
			excelFileExport(sheetArr);
		});
		
		function excelFileExport(sheetArr) {
			// 새로운 workbook 생성
		    var newWorkbook = XLSX.utils.book_new();
			
		    // 새로운 sheet 만들기
// 		    var newWorksheet1 = excelHandler.getWorksheetBySingleTable(tableDomArray[0]);
// 		    var newWorksheet2 = excelHandler.getWorksheetByMultipleTable([tableDomArray[1], tableDomArray[2], tableDomArray[3], tableDomArray[4]]);
// 		    var newWorksheet3 = excelHandler.getWorksheetByMultipleTable([tableDomArray[5], tableDomArray[6], tableDomArray[7]]);
// 		    var newWorksheet4 = excelHandler.getWorksheetBySingleTable(tableDomArray[8]);
// 		    var newWorksheet5 = excelHandler.getWorksheetBySingleTable(tableDomArray[9]);
// 		    var newWorksheet6 = excelHandler.getWorksheetBySingleTable(tableDomArray[3]);
			
		    // workbook에 새로만든 워크시트를 삽입
		    for (var sheet of sheetArr) {
		    	 XLSX.utils.book_append_sheet(newWorkbook, sheet.value, sheet.name);	
		    }
		    
// 		    XLSX.utils.book_append_sheet(newWorkbook, newWorksheet1, "test_Single_1");
// 		    XLSX.utils.book_append_sheet(newWorkbook, newWorksheet2, "test_Multiple_1");
// 		    XLSX.utils.book_append_sheet(newWorkbook, newWorksheet3, "test_Multiple_2");
// 		    XLSX.utils.book_append_sheet(newWorkbook, newWorksheet4, "test_Single_2");
// 		    XLSX.utils.book_append_sheet(newWorkbook, newWorksheet5, "test_Single_3");
// 		    XLSX.utils.book_append_sheet(newWorkbook, newWorksheet6, "test_Single_4");
		   
		    // 엑셀파일 만들기
		    var wordbookOut = XLSX.write(newWorkbook, {bookType:"xlsx",  type: "binary"});

		    // 엑셀 파일 내보내기
		    saveAs(new Blob([s2ab(wordbookOut)],{type:"application/octet-stream"}), "testWorkbook.xlsx");
		}

		var excelHandler = {
		    // 시트에 담길 테이블이 여러 개 일 때
			getWorksheetByMultipleTable : function(tableDomArray) {
		    	var sheet = XLSX.utils.table_to_sheet(tableDomArray[0]);
		    	
		    	optionUtils.create_gap_rows(sheet, 3);
		    	
		    	for (var i=1; i<tableDomArray.length; i++) {
		    		var testDom = XLSX.utils.sheet_add_dom(sheet, tableDomArray[i], {origin: -1});
		    		optionUtils.create_gap_rows(sheet, 3);
		    	}

		    	optionUtils.create_border_cell(sheet);
				
		    	for (var i=0; i<tableDomArray.length; i++) {
			    	optionUtils.fill_color_headers(sheet, tableDomArray[i]);
		    	}
		    	
		    	optionUtils.replace_fit_columns(sheet);
		    	
		    	return sheet;
		    },
		    
		 	// 시트에 담길 테이블이 하나 일 때
		    getWorksheetBySingleTable : function(tableDom){
		    	var sheet = XLSX.utils.table_to_sheet(tableDom);
		    	
		    	optionUtils.create_border_cell(sheet);
		    	optionUtils.fill_color_headers(sheet, tableDom);
		    	optionUtils.replace_fit_columns(sheet);
		    	
// 		    	var testKeies = Object.keys(sheet);
// 		    	var regexStr = /[^0-9]/g;
// 		    	var regexNum = /[0-9]/g;
// 		    	var strArray = new Array();
// 		    	var numberArray = new Array(); 
// 		    	var minNum;
// 		    	var maxNum;
// 		    	var minStr;
// 		    	var maxStr;
		    	
// 		    	for (var i=0; i<testKeies.length; i++) {
// 		    		var numberStr = testKeies[i].replace(regexStr, "");
// 		    		var resultNum = parseInt(numberStr);
// 		    		if (!isNaN(resultNum)) {
// 		    			numberArray.push(resultNum);
// 		    		}
		    		
// 		    		var resultStr = testKeies[i].replace(regexNum, "");
// 		    		if (resultStr.indexOf("!") == -1) {
// 			    		strArray.push(resultStr);
// 		    		}
// 		    	}
		    	
// 	    		minNum = Math.min.apply(null, numberArray);
// 	    		maxNum = Math.max.apply(null, numberArray);
// 	    		minStr = arrayMin(strArray);
// 	    		maxStr = arrayMax(strArray);
	    		
// 		    	for (var i=0; i<testKeies.length; i++) {
// 		    		var resultStr = testKeies[i].replace(regexNum, "");
// 		    		var numberSTr = testKeies[i].replace(regexStr, "");
// 		    		var resultNum = parseInt(numberSTr);
		    		
// 			    	if (resultStr == minStr && resultNum == minNum) {
// 			    		sheet[testKeies[i]].s = {
// 				    		fill: {
// 				    			fgColor: { rgb: "DCDCDC" } 
// 				    		},
// 				    		font: {
// 				    			sz: 12
// 				    		},
// 				    		border: {
// 				    			top: {style: "thick"},
// 				    			left: { style: "thick" },
// 				    		}
// 				    	};	
// 			    	} else if (resultStr == minStr && resultNum != maxNum && resultNum != minNum) {
// 			    		sheet[testKeies[i]].s = {
// 				    		border: {
// 				    			left: { style: "thick" },
// 			    				top: { style: "thin" }
// 				    		}
// 				    	};	
// 				    } else if (resultStr == minStr && resultNum === maxNum) {
// 			    		sheet[testKeies[i]].s = {
// 				    		border: {
// 				    			left: { style: "thick" },
// 				    			bottom: { style: "thick" },
// 				    			top: { style: "thin" },
// 				    		}
// 				    	};	
// 				    } else if (resultNum == minNum && resultStr != minStr && resultStr != maxStr) {
// 			    		sheet[testKeies[i]].s = {
// 		    				fill: {
// 				    			fgColor: { rgb: "DCDCDC" } 
// 				    		},
// 				    		border: {
// 				    			top: { style: "thick" },
// 				    			left: { style: "thin" },
// 				    			right: { style: "thin" }
// 				    		}
// 				    	};	
// 			    	} else if (resultNum == maxNum && resultStr != minStr && resultStr != maxStr) {
// 			    		sheet[testKeies[i]].s = {
// 				    		border: {
// 				    			bottom: { style: "thick" },
// 				    			left: { style: "thin" },
// 				    			right: { style: "thin" }
// 				    		}
// 				    	};	
// 			    	} else if (resultStr == maxStr && resultNum == minNum) {
// 			    		sheet[testKeies[i]].s = {
// 				    		fill: {
// 				    			fgColor: { rgb: "DCDCDC" } 
// 				    		},
// 				    		font: {
// 				    			sz: 12
// 				    		},
// 				    		border: {
// 				    			top: {style: "thick"},
// 				    			right: { style: "thick" }				  
// 				    		}
// 				    	};	
// 			    	} else if (resultStr === maxStr && resultNum != minNum && resultNum != maxNum) {
// 			    		sheet[testKeies[i]].s = {
// 				    		border: {
// 				    			right: { style: "thick" },
// 			    				top: { style: "thin" }
// 				    		}
// 				    	};	
// 			    	} else if (resultStr === maxStr && resultNum === maxNum) {
// 			    		sheet[testKeies[i]].s = {
// 				    		border: {
// 				    			right: { style: "thick" },
// 				    			bottom: { style: "thick" }
// 				    		}
// 				    	};	
// 			    	} else {
// 			    		sheet[testKeies[i]].s = {
// 				    		border: {
// 				    			top: { style: "thin" },
// 				    			right: { style: "thin" },
// 				    			left: { style: "thin" },
// 				    			bottom: { style: "thin" }
// 				    		}
// 				    	};
// 			    	}
// 		    	}
		    	return sheet;
		    }
		}
		
		var optionUtils = {
			create_border_cell : function(sheet) {
				for (var property in sheet) { 
	    		// console.log(sheet[property]);
	    		    if (typeof (sheet[property]) !== 'object') {
	    		    	continue; 
	    		    }
	    		    
	    		    sheet[property].s = { 
		 		    	alignment: {
		 		        	horizontal: 'center',
		 		        },
		 		        border: {
		 		        	right: {
		 		            	style: 'thin',
		 		            	color: '000000',
		 		          	},
		 		          	left: {
		 		            	style: 'thin',
		 		            	color: '000000',
		 		         	},
		 		          	top: {
		 		            	style: 'thin',
		 		            	color: '000000',
		 		          	},
		 		          	bottom: {
		 		            	style: 'thin',
		 		            	color: '000000',
		 		          	}
		 		        }
		 		    }
		    	}
			},
			
			fill_color_headers : function(sheet, tableDom) {
				for (var property in sheet) { 
					var thArr = tableDom.getElementsByTagName("th");
					var headerArr = new Array();
					
					for (var th of thArr) {
						headerArr.push(th.innerText);
					}
					
	    		    if (typeof (sheet[property]) !== 'object') {
	    		    	continue; 
	    		    }
	    		    
	    		    for (var header of headerArr) {
		    		    if (sheet[property].v == header) {
		    		    	sheet[property].s = {
	    		    			fill: {
	 				    			fgColor: { rgb: "DCDCDC" } 
	     				    	},
	     				    	alignment: {
	    		 		        	horizontal: 'center',
	    		 		        },
	    		 		        border: {
	    		 		        	right: {
	    		 		            	style: 'thin',
	    		 		            	color: '000000',
	    		 		          	},
	    		 		          	left: {
	    		 		            	style: 'thin',
	    		 		            	color: '000000',
	    		 		         	},
	    		 		          	top: {
	    		 		            	style: 'thin',
	    		 		            	color: '000000',
	    		 		          	},
	    		 		          	bottom: {
	    		 		            	style: 'thick',
	    		 		            	color: '000000',
	    		 		          	}
	    		 		        }
		    		    	}
		    		    }
	    		    }
		    	}
			},	
			
			replace_fit_columns : function(sheet) {
				var cellWidth = 15;
				var columLength = (XLSX.utils.decode_range(sheet["!ref"]).e.c) + 1;
		    	var	cellWidthArr = []; 
		    	
		    	for (var i=0; i<columLength; i++) {
		    		// cellWidthArr.push(cellWidth);
		    		cellWidthArr[i] = {width:cellWidth};
		    	}
		    	
		    	// var wscols = cellWidthArr.map(function(cellWidth) { return {width:cellWidth} });
				// console.log(cellWidthArr);
		    	sheet["!cols"] = cellWidthArr;
			},
			
			create_gap_rows : function(sheet, nrows) {
				var ref = XLSX.utils.decode_range(sheet["!ref"]);
				ref.e.r += nrows;
				sheet["!ref"] = XLSX.utils.encode_range(ref);	
			}	
		}
		
		function s2ab(s) {
		    let buf = new ArrayBuffer(s.length); //convert s to arrayBuffer
		    let view = new Uint8Array(buf);  //create uint8array as viewer
		    for (let i=0; i<s.length; i++) view[i] = s.charCodeAt(i) & 0xFF; //convert to octet
		    return buf;
		}
		
// 		function arrayMin(arr) {
// 			var len = arr.length, min = arr[0];
// 		  	while (len--) {
// 		    	if (arr[len] < min) {
// 		      		min = arr[len];
// 		    	}
// 		  	}
// 		  	return min;
// 		}

// 		function arrayMax(arr) {
// 		  	var len = arr.length, max = arr[0];
// 		  	while (len--) {
// 		    	if (arr[len] > max) {
// 		      	max = arr[len];
// 		    	}
// 			}
// 		  	return max;
// 		}
		
		/*
		 * 차트 그리기 시작	
		 */
		$.post("/projects/misostudy/chartBarAndLine", function(jsonDataList) {
			// console.log(jsonDataList);
			echart_BarAndLine("chartTest1", jsonDataList[0], "연도", "특허 수(전체)", "특허 수(기준국가)");
			
			// console.log(XLSX.utils.json_to_sheet(jsonDataList[0]));
		});

		$.post("/projects/misostudy/chartBarHorizontal", function(jsonDataList) {
			// console.log(jsonDataList);
			echart_BarHorizontal("chartTest2", jsonDataList[0], "특허 수", "국적");
			echart_BarHorizontal("chartTest4", jsonDataList[1], "활동도 지수", "국적");
			echart_BarHorizontal("chartTest5", jsonDataList[2], "이끌림 지수", "국적");
			echart_BarHorizontal("chartTest6", jsonDataList[3], "수준 지수", "국적");
			echart_BarHorizontal("chartTest9", jsonDataList[4], "특허 수", "출원인");
			echart_BarHorizontal("chartTest11", jsonDataList[5], "활동도 지수", "출원인");
			echart_BarHorizontal("chartTest12", jsonDataList[6], "이끌림 지수", "출원인");
			echart_BarHorizontal("chartTest13", jsonDataList[7], "수준 지수", "출원인");
		});

		$.post("/projects/misostudy/chartLineMultiple", function(jsonDataList) {
			// console.log(jsonDataList);
			echart_LineMultiple("chartTest3", jsonDataList[0], "연도", "특허 수");
			echart_LineMultiple("chartTest10", jsonDataList[1], "연도", "특허 수");
		});

		$.post("/projects/misostudy/chartScatterMultiple", function(jsonDataList) {
			// console.log(jsonDataList);
			echart_ScatterMultiple("chartTest7", jsonDataList[0], "특허 수", "수준 지수");
			echart_ScatterMultiple("chartTest8", jsonDataList[1], "특허 수", "평균 패밀리 크기");
			echart_ScatterMultiple("chartTest14", jsonDataList[2], "특허 수", "수준 지수");
			echart_ScatterMultiple("chartTest15", jsonDataList[3], "특허 수", "평균 패밀리 크기");
		});

		$.post("/projects/misostudy/chartScatterSingle", function(jsonDataList) {
			// console.log(jsonDataList);
			echart_ScatterSingle("chartTest16", jsonDataList[0], "피 인용 수", "특허 수");
		});
	</script>
	<script type="" src="/resources/js/common.js"></script>
</body>
</html>
