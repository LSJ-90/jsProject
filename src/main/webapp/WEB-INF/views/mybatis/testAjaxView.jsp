<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:forEach items="${empInfos3 }" var="empInfo">
	<tr>
		<td><input type="hidden" name="empNo" value="${empInfo.empNo }"/><c:out value="${empInfo.empNo }"/></td>
		<td><input type="text" name="name" value="<c:out value="${empInfo.name }"/>"/></td>
		<td>
			<select name="job" class="jobSelectBox">
				<option value="${empInfo.job }">--<c:out value="${empInfo.job }"/>--</option>
				<c:forEach items="${jobs }" var="job">
					<option value="${job }"><c:out value="${job }"/></option>
				</c:forEach>
			</select>
		</td>
		<td><c:out value="${empInfo.mgrNo }"/></td>
		<td><fmt:formatDate pattern="yyyy-MM-dd" value="${empInfo.hireDate }"/></td>
		<td><input type="number" name="salary" value="<c:out value="${empInfo.salary }"/>"/></td>
		<td><input type="number" name="commission" value="<c:out value="${empInfo.commission }"/>"/></td>
		<td>
			<select name="deptNo" class="deptNoSelectBox">
				<option value="${empInfo.deptNo }">--<c:out value="${empInfo.deptNo }"/>--</option>
				<c:forEach items="${deptNos }" var="deptNo">
					<option value="${deptNo }"><c:out value="${deptNo }"/></option>
				</c:forEach>
			</select>
		</td>
	</tr>
</c:forEach>
