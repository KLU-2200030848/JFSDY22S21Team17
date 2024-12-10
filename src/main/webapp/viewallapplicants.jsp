<%@page import="com.klef.jfsd.placeable.model.Admin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>    

<html>
<head>
    <meta charset="UTF-8">
    <title>All Jobs</title>
    <link href='https://fonts.googleapis.com/css?family=Inter' rel='stylesheet'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css" integrity="sha512-5Hs3dF2AEPkpNAR7UiOHba+lRSJNeM2ECkwxUIxC1Q/FLycGTbNapWXB4tP889k5T5Ju8fs4b1P5z/iB4nMfSQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<%@include file="adminnavbar.jsp" %>
    <div class="task-space">
    	<div class="headline">
    		<h3>Applicants Details</h3>
    		<span>Total Applicants : ${acount}</span>
    	</div>
    	<div class="page-task" style="display: flex;">
    		<table class="app-table">
    			<thead>
    				<tr>
    					<td>Student</td>
    					<td>Job</td>
    					<td>Applied Time</td>
    					<td>Status</td>
    					<td>Resume</td>
    				</tr>
    			</thead>
    			<tbody>
    				<c:forEach items="${applist}" var="app">
    					<tr>
    						<td><c:out value="${app.sname}"></c:out></td>
    						<td><c:out value="${app.role}"></c:out></td>
    						<td><c:out value="${app.appliedtime}"></c:out></td>
    						<td><c:out value="${app.status}"></c:out></td>
    						<td><a href="viewresume?appid=${app.id}" class="button" target="_blank">View</a></td>
    					</tr>
    				</c:forEach>
    			</tbody>
    		</table>
    	</div>
    </div>
</body>
</html>
