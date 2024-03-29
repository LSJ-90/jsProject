﻿<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <meta name="description" content="Web tutorials">
    <meta name="keywords" content="HTML, CSS">
    <meta name="author" content="AlpacaJoon">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HTML</title>
    <style>
        th, td {
            border: 1px solid black;
        }
        
        table, th, td {
            padding: 10px;
        }
    </style>
</head>
<body>
    <a href="../home"><img src="../resources/images/logo.png" alt=""></a>
    <h1>table</h1>
    <ul>
        <li>tr: row</li>
        <li>th: head</li>
        <li>td: data</li>
    </ul>
    <table>
        <caption>달력</caption>
        <tr>
            <th>일</th>
            <th>월</th>
            <th>화</th>
            <th>수</th>
            <th>목</th>
            <th>금</th>
            <th>토</th>
        </tr>
        <tr>
            <td>1</td>
            <td>2</td>
            <td>3</td>
            <td>4</td>
            <td>5</td>
            <td>6</td>
            <td>7</td>
        </tr>
        <tr>
            <td>8</td>
            <td>9</td>
            <td>10</td>
            <td>11</td>
            <td>12</td>
            <td>13</td>
            <td>14</td>
        </tr>
        <tr>
            <td>15</td>
            <td>16</td>
            <td>17</td>
            <td>18</td>
            <td>19</td>
            <td>20</td>
            <td>21</td>
        </tr>
        <tr>
            <td>22</td>
            <td>23</td>
            <td>24</td>
            <td>25</td>
            <td>26</td>
            <td>27</td>
            <td>28</td>
        </tr>
        <tr>
            <td>29</td>
            <td>30</td>
        </tr>
        
    </table>
    
    <table>
        <caption>rowspan</caption>
        <tr>
            <th>NAME</th>
            <td>AlpacaJoon</td>
        </tr>
        <tr>
            <th rowspan="2">TEL</th>
            <td>010-5124-1190</td>
        </tr>
        <tr>
            <td>010-5124-1191</td>
        </tr>
        <tr>
            <th>EMAIL</th>
            <td>lsj@naver.com</td>
        </tr>
    </table>

    <table>
        <caption>colspan</caption>
        <thead>
            <tr>
                <th>NAME</th>
                <th colspan="2">TEL</th>
                <th>EMAIL</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>AlpacaJoon</td>
                <td>010-5124-1190</td>
                <td>010-5124-1191</td>
                <td>lsj@naver.com</td>
            </tr>
        </tbody>
        
    </table>

    
    <table>
        <caption>2022학년도 대학수학능력시험 성적통지표</caption>
        <thead>
            <tr>
                <th scope="identification numer">수험번호</th>
                <th>성명</th>
                <th>생년월일</th>
                <th>성별</th>
                <th colspan="4">출신고교(반 또는 졸업년도)</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>12345678</td>
                <td>이승준</td>
                <td>90년 2월 23일</td>
                <td>남성</td>
                <td colspan="4">경신고등학교</td>
            </tr>
            <tr>
                <th rowspan="2">구분</th>
                <td rowspan="2">한국사 영역</td>
                <td rowspan="2">국어 영역</td> 
                <td>수학영역</td>
                <td rowspan="2">영어 영역</td>
                <td colspan="2">사회탐구 영역</td>
                <td>제2외국어/한문 영역</td>
            </tr>
            <tr>
                <td>나형</td>
                <td>생활과 윤리</td>
                <td>사회 문화</td>
                <td>아랍어</td>
            </tr>
            <tr>
                <th>표준점수</th>
                <td rowspan="2"></td>
                <td>131</td>
                <td>137</td>
                <td rowspan="2"></td>
                <td>53</td>
                <td>64</td>
                <td>69</td>
            </tr>
            <tr>
                <th>백분위</th>
                <td>93</td>
                <td>95</td>
                <td>75</td>
                <td>93</td>
                <td>95</td>
            </tr>
        </tbody>   
        <tfoot>
            <tr>
                <th>등급</th>
                <td>2</td>
                <td>2</td>
                <td>2</td>
                <td>1</td>
                <td>4</td>
                <td>2</td>
                <td>2</td>
            </tr>
        </tfoot>
    </table>
</body>
</html>