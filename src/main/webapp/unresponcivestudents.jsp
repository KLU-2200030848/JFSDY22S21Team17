<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Unresponsive Students</title>
<link href='https://fonts.googleapis.com/css?family=Inter' rel='stylesheet'>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<%@include file="ponavbar.jsp" %>
	<div class="body-space">
		<div class="side-nav">
			<a href="pohome"><div class="views">Statistics</div></a>
			<a href="viewstudbyuniversity?university=<%=po.getCompany()%>&sid=0"><div class="views">Students Details</div></a>
			<a href="unresponcivestudents?univ=<%=po.getCompany()%>"><div class="views">Inactive Students</div></a>
			<a href="#"><div class="views">Applied Students</div></a>
		</div>
		<div style="margin-left: 50px;width: 65%">
		<div class="task-space" style="width: 100%;box-sizing: border-box;">
    	<div class="headline">
    		<h3>Inactive Students</h3>
    		<span>Student Count : ${students.size()}</span>
    	</div>
    	<c:choose>
    		<c:when test="${students.size()==0}">
    			<div class="page-task" style="display: flex;justify-content: center;">
    				<p>No inactive students</p>
    			</div>
    		</c:when>
    		<c:otherwise>
    			<div class="page-task">
    				<c:forEach items="${students}" var="student">
		    			<div class="employee">
		    				<div class="top">
		    					<div class="name"><c:out value="${student[3]}"/></div>
		    					<div class="gender-contact">
		    						<span>Generated Id:<c:out value="${student[0]}"/></span>
		    						<span>University:<c:out value="${student[4]}"/></span>
		    					</div>
		    				</div>
		    				<div class="bottom">
		    					<div class="mail-company">
		    						<span>Email:<c:out value="${student[1]}"/></span>
		    					</div>
		    					<div class="status" style="justify-content: space-around;">
					       			<span>Status:${student[2]}</span>
		    					</div>
		    				</div>
		    			</div>
		    		</c:forEach>
    			</div>
    		</c:otherwise>
    	</c:choose>
    </div>
		</div>
	</div>
</body>
</html>