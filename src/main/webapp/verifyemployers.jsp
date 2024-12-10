<%@page import="com.klef.jfsd.placeable.model.Admin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>    

<html>
<head>
    <meta charset="UTF-8">
    <title>Verify Employers</title>
    <link href='https://fonts.googleapis.com/css?family=Inter' rel='stylesheet'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css" integrity="sha512-5Hs3dF2AEPkpNAR7UiOHba+lRSJNeM2ECkwxUIxC1Q/FLycGTbNapWXB4tP889k5T5Ju8fs4b1P5z/iB4nMfSQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <%@include file="adminnavbar.jsp" %>
    <div class="task-space">
    	<div class="headline">
    		<h3>Employer Verification</h3>
    		<span>Pending Employers : ${empcount}</span>
    	</div>
    	<c:choose>
    		<c:when test="${empcount==0}">
    			<div class="page-task" style="display: flex;justify-content: center;">
    				<p>No more Employees to verify</p>
    			</div>
    		</c:when>
    		<c:otherwise>
    			<div class="page-task">
    				<c:forEach items="${emplist}" var="emp">
		    			<div class="employee">
		    				<div class="top">
		    					<div class="name"><c:out value="${emp.name}"/></div>
		    					<div class="gender-contact">
		    						<span>Gender:<c:out value="${emp.gender}"/></span>
		    						<span>Contact:<c:out value="${emp.contact}"/></span>
		    					</div>
		    				</div>
		    				<div class="bottom">
		    					<div class="mail-company">
		    						<span>Email:<c:out value="${emp.email}"/></span>
		    						<span>Company:<c:out value="${emp.company}"/></span>
		    					</div>
		    					<div class="status" style="justify-content: space-around;">
					       			<a href='<c:url value="verifyempstatus?id=${emp.id}&status=active"></c:url>'>Accept</a>
					       			<a href='<c:url value="verifyempstatus?id=${emp.id}&status=rejected"></c:url>'>Reject</a>
		    					</div>
		    				</div>
		    			</div>
		    		</c:forEach>
    			</div>
    		</c:otherwise>
    	</c:choose>
    </div>
</body>
</html>
