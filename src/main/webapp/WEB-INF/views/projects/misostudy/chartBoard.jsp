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
	
	<div style="position: fixed;">
		<button id="wordDownBtn" >워드다운</button>
		<button id="excelDownBtn">엑셀다운</button>
	</div>
	<div class="container testExportDoc googoose-wrapper">
	<div id="testHeader"></div>	
	<!-- 1.연도별 특허 수-->
		<h2 id="testContentTitle" style="padding:0px 0; font-weight:bold; font-size:17px; color:#333;">1.연도별 특허 수</h2>
		
		<table class="testExportExcel1" id="testTable1" class="testTable_1" width="100%" border="1" bordercolor="#666" cellspacing="0" cellpadding="0" style="border:1px solid #666; border-collapse:collapse;">
			<tr>
				<th width="25%" style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0; background:#F0F0F0;">연도</th>
				<th width="25%" style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0; background:#F0F0F0;">특허 수</th>
				<th width="25%" style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0; background:#F0F0F0;">누적 특허 수</th>
				<th width="25%" style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0; background:#F0F0F0;">Korea, Republic 특허 수</th>
			</tr>
			<tr>
				<td style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0;">!@#$%^&*()                 _-+={}[]|\~`"</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">◆♬</td>
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
		<p style="margin:0; padding:0; text-align:center; font-weight:bold;">표 1. 연도별 특허 수</p>
		
		<div class="echart" id="chartTest1"></div>
		<p>그림 1. 연도별 특허 출원 추이</p>
		<br clear="all" style="mso-special-character:line-break;page-break-before:always">
		
	<!-- 2. 출원인 국적별 분석 -->
		<h2 style="padding:0px 0; font-weight:bold; font-size:17px; color:#333;">2. 출원인 국적별 분석 (특허권 보유 국가 분석)</h2>
		
	<!-- 2-1. 출원인 국적별 특허 수 -->
		<h3 style="padding:0px 0; font-weight:bold; font-size:14px; color:#333;">2-1. 출원인 국적별 특허 수</h3>
		
		<table class="testExportExcel2" id="testTable2" class="testTable_2" width="100%" border="1" bordercolor="#666" cellspacing="0" cellpadding="0" style="border:1px solid #666; border-collapse:collapse;">
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
		<p style="margin:0; padding:0; text-align:center; font-weight:bold;">표 2. 출원인 국적별 특허 수</p>

		<div class="echart" id="chartTest2"></div>
		<p>그림 2. 출원인 국적별 특허 수</p>
		<br clear="all" style="mso-special-character:line-break;page-break-before:always">
		
	<!-- 2-2. 출원인 국적별 연도별 특허 수 -->
		<h3 style="padding:0px 0; font-weight:bold; font-size:14px; color:#333;">2-2. 출원인 국적별 연도별 특허 수</h3>
		
		<table class="testExportExcel2" id="testTable3" class="testTable_2" width="100%" border="1" bordercolor="#666666" cellspacing="0" cellpadding="0" style="border:1px solid #666; border-collapse:collapse;">
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
		<p style="margin:0; padding:0; text-align:center; font-weight:bold;">표 3. 출원인 국적별 연도별 특허 수</p>
		
		<div class="echart" id="chartTest3"></div>
		<p>그림 3. 출원인 국적별 연도별 특허 수</p>
		<br clear="all" style="mso-special-character:line-break;page-break-before:always">
	
	<!-- 2-3. 출원인 국적별 활동도 지수 -->	
		<h3 style="padding:0px 0; font-weight:bold; font-size:14px; color:#333;">2-3. 출원인 국적별 활동도 지수</h3>
		
		<table class="testExportExcel2" id="testTable4" class="testTable_3" width="100%" border="1" bordercolor="#666" cellspacing="0" cellpadding="0" style="border:1px solid #666; border-collapse:collapse;">
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
		<p style="margin:0; padding:0; text-align:center; font-weight:bold;">표 4. 출원인 국적별 활동도 지수</p>

		<div class="echart" id="chartTest4"></div>
		<p>그림 4. 출원인 국적별 활동도 지수</p>
	
	<!-- 2-4. 출원인 국적별 이끌림 지수 -->		
		<h3 style="padding:0px 0; font-weight:bold; font-size:14px; color:#333;">2-4. 출원인 국적별 이끌림 지수</h3>
		
		<table class="testExportExcel2" id="testTable5" width="100%" border="1" bordercolor="#666" cellspacing="0" cellpadding="0" style="border:1px solid #666; border-collapse:collapse;">
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
		<p style="margin:0; padding:0; text-align:center; font-weight:bold;">표 5. 출원인 국적별 이끌림 지수</p>
		
		<div class="echart" id="chartTest5"></div>
		<p>그림 5. 출원인 국적별 이끌림 지수</p>
		
	<!-- 2-5. 출원인 국적별 특허 수준 지수 -->		
		<h3 style="padding:0px 0; font-weight:bold; font-size:14px; color:#333;">2-5. 출원인 국적별 특허 수준 지수</h3>
	
		<table class="testExportExcel3" id="testTable6" width="100%" border="1" bordercolor="#666" cellspacing="0" cellpadding="0" style="border:1px solid #666; border-collapse:collapse;">	
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
		<p style="margin:0; padding:0; text-align:center; font-weight:bold;">표 6. 출원인 국적별 특허 수준 지수</p>
		
		<div class="echart" id="chartTest6"></div>
		<p>그림 6. 출원인 국적별 특허 수준 지수</p>
		
		<div class="echart" id="chartTest7"></div>
		<p>그림 7. 출원인 국적별 특허 수 대비 수준 지수</p>
		<br clear="all" style="mso-special-character:line-break;page-break-before:always">
	
	<!-- 2-6. 출원인 국적별 평균 패밀리 크기 -->	
		<h3 style="padding:0px 0; font-weight:bold; font-size:14px; color:#333;">2-6. 출원인 국적별 평균 패밀리 크기</h3>
	
		<table class="testExportExcel3" id="testTable7" width="100%" border="1" bordercolor="#666666" cellspacing="0" cellpadding="0" style="border:1px solid #666; border-collapse:collapse;">	
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
		<p style="margin:0; padding:0; text-align:center; font-weight:bold;">표 7. 출원인 국적별 평균 패밀리 크기</p>
		
		<div class="echart" id="chartTest8"></div>
		<p>그림 8. 특허 수 대비 평균 패밀리 크기</p>
		
		<div class="echart" id="chartTest9"></div>
		<p>그림 9. 출원인별 특허 수</p>
		
		<div class="echart" id="chartTest10"></div>
		<p>그림 10. 출원인별 연도별 특허 수</p>
		
		
		<div class="echart" id="chartTest11"></div>
		<p>그림 11. 출원인별 활동도 지수</p>
		
		
		<div class="echart" id="chartTest12"></div>
		<p>그림 12. 출원인별 이끌림 지수</p>
	</div> 
	
	<!-- test space start-->
	<div class="container">
		<h2 style="padding:0px 0; font-weight:bold; font-size:17px; color:#333;">1. Phân tích IPC theo đối thủ cạnh tranh</h2>
		<h3 style="padding:0px 0; font-weight:bold; font-size:14px; color:#333;">1-1. Trạng thái IPC theo đối thủ cạnh tranh (toàn diện)</h3>
		
		<table class="testExportExcel4" width="100%" border="1" bordercolor="#666" cellspacing="0" cellpadding="0" style="border:1px solid #666; border-collapse:collapse;">
			<colgroup>
				<col />
				<col />
				<col />
				<col />
				<col width="16%" />
				<col width="16%" />
				<col width="16%" />
			</colgroup>
			<tr>
				<th rowspan="2" width="10%" style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0; background:#F0F0F0;">IPC</th>
				<th rowspan="2" width="10%" style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0; background:#F0F0F0;">Số bằng sáng chế của tất cả những người được chuyển giao trong lĩnh vực công nghệ</th>
				<th rowspan="2" width="10%" style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0; background:#F0F0F0;">Tổng số bằng sáng chế của đối thủ cạnh tranh chính</th>
				<th rowspan="2" width="10%" style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0; background:#F0F0F0;">Thị phần bằng sáng chế của đối thủ cạnh tranh chính(%)</th>
				<th colspan="3" style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0; background:#F0F0F0;">Đối thủ chính</th>
			</tr>
			<tr>
				<th width="6%" style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0; background:#F0F0F0;">1</th>
				<th width="6%" style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0; background:#F0F0F0;">2</th>
				<th width="6%" style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0; background:#F0F0F0;">3</th>
			</tr>
			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0; font-weight:bold" title="">Total</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;" >20,412</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;" >6,791</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">33.27</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;" >4,436</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;" >1,159</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;" >1,196</td>
			</tr>
			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0; font-weight:bold" title="">G06F</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;" >3,675</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;" >1,425</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">38.78</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;" >1,125</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;" >102</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;" >198</td>
			</tr>
			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0; font-weight:bold" title="">G21K</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;" >4</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;" >1</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;" >25</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;" >0</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;" >1</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;" >0</td>
			</tr>
			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0; font-weight:bold" title="">G09C</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;" >1</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;" >1</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;" >100</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;" >1</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;" >0</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;" >0</td>
			</tr>
		</table>
		<p style="margin:0; padding:0; text-align:center; font-weight:bold;">Bảng 2. Trạng thái IPC theo đối thủ cạnh tranh</p>
		
		<div class="echart" id="chartTest13"></div>
		<p>그림 13. 출원인별 특허 수준 지수</p>
		
		<div class="echart" id="chartTest14"></div>
		<p>그림 14. 출원인별 특허 수 대비 수준 지수</p>
	</div>
	<!-- test space end -->
	
	<div class="container testExportDoc">
		<input type="hidden" value="1231313132">
		<%@ include file="./NewFile.jsp" %>
		
		<div class="echart" id="chartTest15"></div>
		<p>그림 15. 특허 수 대비 평균 패밀리 크기(출원인별)</p>
		
		<table class="testExportExcel5" width="100%" border="1" bordercolor="#666" cellspacing="0" cellpadding="0" style="border:1px solid #666; border-collapse:collapse;">
			<colgroup>
				<col />
				<col />
				<col />
				<col />
				<col width="16%" />
				<col width="16%" />
				<col width="16%" />
			</colgroup>
			<tr>
				<th width="6%" style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0; background:#F0F0F0;">1</th>
				<th width="6%" style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0; background:#F0F0F0;">2</th>
				<th width="6%" style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0; background:#F0F0F0;">3</th>
				<th rowspan="2" width="10%" style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0; background:#F0F0F0;">IPC</th>
				<th rowspan="2" width="10%" style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0; background:#F0F0F0;">Số bằng sáng chế của tất cả những người được chuyển giao trong lĩnh vực công nghệ</th>
				<th rowspan="2" width="10%" style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0; background:#F0F0F0;">Tổng số bằng sáng chế của đối thủ cạnh tranh chính</th>
				<th rowspan="2" width="10%" style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0; background:#F0F0F0;">Thị phần bằng sáng chế của đối thủ cạnh tranh chính(%)</th>
			</tr>
			<tr>
				<th colspan="3" style="border:1px solid #666; text-align:center; font-weight:bold; padding:2px 0; background:#F0F0F0;">Đối thủ chính</th>
			</tr>
			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0; font-weight:bold" title="">Total</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;" >20,412</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;" >6,791</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">33.27</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;" >4,436</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;" >1,159</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;" >1,196</td>
			</tr>
			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0; font-weight:bold" title="">G06F</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;" >3,675</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;" >1,425</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;">38.78</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;" >1,125</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;" >102</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;" >198</td>
			</tr>
			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0; font-weight:bold" title="">G21K</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;" >4</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;" >1</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;" >25</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;" >0</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;" >1</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;" >0</td>
			</tr>
			<tr>
				<td style="border:1px solid #666; text-align:center; padding:2px 0; font-weight:bold" title="">G09C</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;" >1</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;" >1</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;" >100</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;" >1</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;" >0</td>
				<td style="border:1px solid #666; text-align:center; padding:2px 0;" >0</td>
			</tr>
		</table>
		
		<div class="echart" id="chartTest16"></div>
		<p>그림 16. 피인용 수에 따른 특허 수의 분포</p>
		<br style="page-break-before:always">		
		
		<%@ include file="./NewFile2.jsp" %>
	</div>
	
	<!-- bootstrap -->
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	
	<!-- jquery -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

	<!-- wordexport -->
	<script type="text/javascript" src="/resources/js/FileSaver.js"></script>
	<script type="text/javascript" src="/resources/js/word.export.js"></script>
	
	<!-- xlsx(sheetJS) -->
	<script type="text/javascript" src="/resources/js/xlsx.export.js"></script>
	<script type="text/javascript" src="/resources/js/xlsx.export.util.js"></script>
	
	<!-- echarts -->
	<script type="text/javascript" src="/resources/js/echarts.min.js"></script>
	<script type="text/javascript" src="/resources/js/makeEcharts.js"></script>
	<script type="text/javascript">
		/*
		 * EXPORT DOC TEST CODE
		 */
		$("#wordDownBtn").click(function() {
    		// export할 부분 전부 가져오기
    		var exportDomArr = $(".testExportDoc");
    		
    		// doc export
    		$.get("/projects/misostudy/docHeaderFile", function(coverpage) {
	   			exportDoc(exportDomArr, coverpage, "모델3파일입니다");
        	});
        });
		
		/*
		 * EXPORT EXCEL TEST CODE
		 */
		$("#excelDownBtn").click(function() {
			// export할 table 전부 가져오기
			var tableDomArr1 = $(".testExportExcel1");
			var tableDomArr2 = $(".testExportExcel2");
			var tableDomArr3 = $(".testExportExcel3");
			var tableDomArr4 = $(".testExportExcel4");
			var tableDomArr5 = $(".testExportExcel5");
			
			// export할 json 데이터
			var dog = [
			    {"name": "식빵", "family": "웰시코기", "age": "1", "weight": "2.14"},
			    {"name": "콩콩", "family": "포메라니안", "age": "3", "weight": "2.5"},
			    {"name": "젤리", "family": "푸들", "age": "7", "weight": "3.1"},
			    {"name": "젤리", "family": "푸들", "age": "7", "weight": "3.1"},
			    {"name": "젤리", "family": "푸들", "age": "7", "weight": "3.1"},
			    {"name": "젤리", "family": "푸들", "age": "7", "weight": "3.1"},
			    {"name": "젤리", "family": "푸들", "age": "7", "weight": "3.1"},
			    {"name": "젤리", "family": "푸들", "age": "7", "weight": "3.1"},
			    {"name": "젤리", "family": "푸들", "age": "7", "weight": "3.1"},
			    {"name": "젤리", "family": "푸들", "age": "7", "weight": "3.1"}
			];
			
			// sheet 생성
			var sheetArr = [
 				{"name" : "시트 영 번 째", "value" : create_sheet_json([dog])},
 				{"name" : "시트 첫 번 째", "value" : create_sheet_table(tableDomArr1)},
 				{"name" : "시트 두 번 째", "value" : create_sheet_table(tableDomArr2)},
 				{"name" : "시트 세 번 째", "value" : create_sheet_table(tableDomArr3)},
 				{"name" : "시트 네 번 째", "value" : create_sheet_table(tableDomArr4)},
 				{"name" : "시트 다섯 번 째", "value" : create_sheet_table(tableDomArr5)}
			];
			
			// column width setting
			optionUtils.set_fit_columns(sheetArr, 50);
			
			// excel export
			exportExcel(sheetArr, "TEST");
		});
		
		/*
		 * DRAWING ECHARTS TEST CODE
		 */
		$.post("/projects/misostudy/chartBarAndLine", function(jsonDataList) {
			// console.log(jsonDataList);
			echart_BarAndLine("chartTest1", jsonDataList[0], "연도", "특허 수(전체)", "특허 수(기준국가)");
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
