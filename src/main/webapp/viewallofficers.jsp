<%@page import="com.klef.jfsd.placeable.model.Admin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>    

<html>
<head>
    <meta charset="UTF-8">
    <title>All Officers</title>
    <link href='https://fonts.googleapis.com/css?family=Inter' rel='stylesheet'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css" integrity="sha512-5Hs3dF2AEPkpNAR7UiOHba+lRSJNeM2ECkwxUIxC1Q/FLycGTbNapWXB4tP889k5T5Ju8fs4b1P5z/iB4nMfSQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<link rel="stylesheet" type="text/css" href="style.css">    
</head>
<body>
     <%@include file="adminnavbar.jsp" %>
    <div class="task-space">
    	<div class="headline">
    		<h3>Placement Officer Details</h3>
    		<span>Total Officers : ${pocount}</span>
    	</div>
    	<div class="page-task">
    		<c:forEach items="${polist}" var="po">
    			<div class="employee">
    				<div class="top">
    					<div class="name"><c:out value="${po.name}"/></div>
    					<div class="gender-contact">
    						<span>Contact:<c:out value="${po.contact}"/></span>
    					</div>
    				</div>
    				<div class="bottom">
    					<div class="mail-company">
    						<span>Email:<c:out value="${po.email}"/></span>
    						<span>Company:<c:out value="${po.company}"/></span>
    					</div>
    					<div class="status">
    						<span>Status:<c:out value="${po.status}"/></span>
    						<c:choose>
			       				<c:when test="${po.status=='active'}">
			       					<a href='<c:url value="updateofficerstatus?id=${po.id}&status=inactive"></c:url>'>Disable</a>
			       				</c:when>
			       				<c:when test="${po.status=='pending'}">
			       					<a>Unverified</a>
			       				</c:when>
			       				<c:otherwise>
			       					<a href='<c:url value="updateofficerstatus?id=${po.id}&status=active"></c:url>'>Enable</a>
			       				</c:otherwise>
			       			</c:choose>
    					</div>
    				</div>
    			</div>
    		</c:forEach>
    	</div>
    </div>
</body>
</html>
