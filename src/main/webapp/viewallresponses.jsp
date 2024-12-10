<%@page import="com.klef.jfsd.placeable.model.Admin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>    

<html>
<head>
    <meta charset="UTF-8">
    <title>Contact Us</title>
    <link href='https://fonts.googleapis.com/css?family=Inter' rel='stylesheet'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css" integrity="sha512-5Hs3dF2AEPkpNAR7UiOHba+lRSJNeM2ECkwxUIxC1Q/FLycGTbNapWXB4tP889k5T5Ju8fs4b1P5z/iB4nMfSQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<%@include file="adminnavbar.jsp" %>
    <div class="task-space">
    	<div class="headline">
    		<h3>Contact Us Responses</h3>
    		<span>Total Applicants : ${acount}</span>
    	</div>
    	<div class="page-task" style="display: flex;">
    		<table class="app-table">
    			<thead>
    				<tr>
    					<td>Id</td>
    					<td>Name</td>
    					<td>Email</td>
    					<td>Response</td>
    				</tr>
    			</thead>
    			<tbody>
    				<c:forEach items="${list}" var="c">
    					<tr>
    						<td><c:out value="${c.id}"></c:out></td>
    						<td><c:out value="${c.name}"></c:out></td>
    						<td><c:out value="${c.email}"></c:out></td>
    						<td><c:out value="${c.message}"></c:out></td>
    					</tr>
    				</c:forEach>
    			</tbody>
    		</table>
    	</div>
    </div>
</body>
</html>
