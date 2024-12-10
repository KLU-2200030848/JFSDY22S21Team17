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
    		<h3>Job Details</h3>
    		<span>Total Jobs : ${jcount}</span>
    	</div>
    	<div class="page-task">
    		<c:forEach items="${joblist}" var="job">
    			<div class="employee">
    				<div class="top">
    					<div class="name"><c:out value="${job.role}"/></div>
    					<div class="gender-contact">
    						<span>Company:<c:out value="${job.company}"/></span>
    						<span>Location:<c:out value="${job.location}"/></span>
    					</div>
    				</div>
    				<div class="bottom">
    					<div class="mail-company">
    						<span>Type:<c:out value="${job.type}"/></span>
    						<span>Deadline:<c:out value="${job.endDate}"/></span>
    					</div>
    					<div class="status">
    						<span>Industry:<c:out value="${job.industry}"/></span>
    					</div>
    				</div>
    			</div>
    		</c:forEach>
    	</div>
    </div>
</body>
</html>
