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
	<link href="/resources/css/style.css" rel="stylesheet">
</head>
<body>
	<header>
		<%@include file="navbar.jsp" %>
		<%@include file="signInForm.jsp" %>
		<%@include file="signUpForm.jsp" %>
	</header>
	<div class="container">
		<c:choose>
			<c:when test="${LOGIN_USER.id eq 'admin01'}">
				<div class="echart" id="boardCntByDayEchart" style="width: 100%; height:300px; margin-bottom: 10px;"></div>
				<div class="echart" id="boardCntByMonthEchart" style="width: 100%; height:300px;"></div>
			</c:when>
			<c:when test="${!empty LOGIN_USER }">
				<div class="helloBoard">어서오세요.<br> 게시판 업그레이드 중 입니다!!</div>
			</c:when>
			<c:otherwise>
				<div class="helloBoard">어서오세요.<br> 회원가입 후 게시판을 이용해보세요!!</div>
			</c:otherwise>
		</c:choose>
	</div>
	<footer>
		<%@include file="footer.jsp" %>
	</footer>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="/resources/js/echarts.min.js"></script>
	<script type="text/javascript">
		const createdDates = ${createdDates };
	 	const createdDateCntInfos = ${createdDateCntInfos };
	 	const boardCntByDayEchart = echarts.init(document.getElementById('boardCntByDayEchart'),'dark');
	 	const optionDayEchart = {
	      title: {
	        text: '등록된 게시글 차트(일별)'
	      },
	      tooltip: {
	    	  
	      },
	      legend: {
	        data: ['sales']
	      },
	      xAxis: {
	        data:  createdDates // 날짜데이터 createdDates
	      },
	      yAxis: {
	    	  boundaryGap: [0, '100%']
	      },
	      dataZoom: [
    	    {
    	      type: 'inside',
    	      start: 100,
    	      end: 0
    	    },
    	    {
    	      start: 0,
    	      end: 10
    	    }
    	  ],
	      series: [
	        {
	          type: 'line',
	          data: createdDateCntInfos // 날짜별 등록된 게시물 수
	        }
	      ]
	    };
	 	boardCntByDayEchart.setOption(optionDayEchart);
	 	
	 	const createdDates2 = ${createdDates2 };
	 	const createdDateCntInfos2 = ${createdDateCntInfos2 };
	 	console.log(createdDates2);
	 	console.log(createdDateCntInfos2);
	 	const boardCntByMonthEchart = echarts.init(document.getElementById('boardCntByMonthEchart'),'dark');
	 	const optionMonthEchart = {
	      title: {
	        text: '등록된 게시글 차트(월별)'
	      },
	      tooltip: {
	    	  
	      },
	      legend: {
	        data: ['sales']
	      },
	      xAxis: {
	        data:  createdDates2 // 날짜데이터 createdDates
	      },
	      yAxis: {
	    	  boundaryGap: [0, '100%']
	      },
	      dataZoom: [
    	    {
    	      type: 'slider',
    	      start: 100,
    	      end: 0
    	    },
    	    {
    	      start: 0,
    	      end: 10
    	    }
    	  ],
	      series: [
	        {
	          type: 'line',
	          data: createdDateCntInfos2 // 날짜별 등록된 게시물 수
	        }
	      ]
	    };
	 	boardCntByMonthEchart.setOption(optionMonthEchart);
	</script>
	<script src="/resources/js/common.js"></script>
</body>
</html>
