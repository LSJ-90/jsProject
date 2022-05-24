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
				<c:forEach items="${jobs }" var="job">
					<option value="${job }" ${empInfo.job == job ? 'selected' : '' }>
						<c:out value="${empInfo.job == job ? '--' += empInfo.job += '--' : job  }"/>
					</option>
				</c:forEach>
			</select>
		</td>
		<td>
			<select name="mgrNo" class="mgrNoSelectBox">
				<c:forEach items="${mgrNos }" var="mgrNo">
					<option value="${mgrNo }" ${empInfo.mgrNo == mgrNo ? 'selected' : '' }>
						<!-- 삼항연산자 -->
						<c:out 
							value="${empInfo.mgrNo == mgrNo 
										? (empInfo.mgrNo == 0 ? '--없음--' : '--' += empInfo.mgrNo += '--') 
										: (mgrNo == 0 ? '없음' : mgrNo)}"/>
						<!-- choose when otherwise 사용
						<c:choose>
							<c:when test="${empInfo.mgrNo == mgrNo}">
								<c:choose>
									<c:when test="${empInfo.mgrNo == 0}">
										<c:out value="${'--없음--' }"/>
									</c:when>
									<c:otherwise>
										<c:out value="${'--' += empInfo.mgrNo += '--' }"/>
									</c:otherwise>
								</c:choose>
							</c:when>
							<c:otherwise>
								<c:out value="${mgrNo == 0 ? '없음' : mgrNo}"/>
							</c:otherwise>
						</c:choose>
						-->
					</option>
				</c:forEach>
			</select>
		</td>
		<td><fmt:formatDate pattern="yyyy-MM-dd" value="${empInfo.hireDate }"/></td>
<%-- 	<td><input type="text" name="salary" value="<fmt:formatNumber value='${empInfo.salary }' pattern='##,###'/>"/></td> --%>
		<td><input type="number" name="salary" min="0" value="<c:out value="${empInfo.salary }"/>"/></td>
		<td><input type="number" name="commission" min="0" value="<c:out value="${empInfo.commission }"/>"/></td>
		<td>
			<select name="deptNo" class="deptNoSelectBox">
				<c:forEach items="${deptNos }" var="deptNo">
					<option value="${deptNo }" ${empInfo.deptNo == deptNo ? 'selected' : '' }>
						<c:out value="${empInfo.deptNo == deptNo ? '--' += empInfo.deptNo += '--' : deptNo }"/>
					</option>
				</c:forEach>
			</select>
		</td>
	</tr>
</c:forEach>