<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Applied Jobs</title>
<link href='https://fonts.googleapis.com/css?family=Inter' rel='stylesheet'>
<link rel="stylesheet" type="text/css" href="style.css">
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>
<%@include file="studnavbar.jsp" %>
	<div style="padding: 1.5cm">
		<div class="job-box" style="width: 80%;max-height: 525px;">
			<c:if test="${applist.isEmpty()}">
				<p>No Jobs Applied</p>
			</c:if>
			<c:forEach items="${applist}" var="app">
			<div class="job-view" style="min-width: 350px;">
				<h3><c:out value="${app.role}"></c:out></h3>
				<span><c:out value="${app.sname}"></c:out></span>
				<span>Applied time :<c:out value="${app.appliedtime}"></c:out></span>
				<span style="align-self: center;">
					<c:choose>
						<c:when test="${app.status=='pending'}">
							<span style="color: skyblue;">Application is in Verification Process</span>
						</c:when>
						<c:when test="${app.status=='accepted'}">
							<span style="color: limegreen;">Congrats! Your application got selected</span>
						</c:when>
						<c:otherwise>
							<span style="color: red;">Your application is declined</span>
						</c:otherwise>
					</c:choose>
				</span>
				<div style="display: flex;flex-direction: row;gap: 15px;justify-content: space-between;">
				<span><a href="viewresume?appid=${app.id}" class="button" style="width: fit-content;" target="_blank">View Resume</a></span>
				<a href="jobdetails?jobid=${app.jobid}" class="button" style="width: fit-content;">Job details</a>
				</div>
			</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>