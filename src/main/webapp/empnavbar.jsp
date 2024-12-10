<%@page import="com.klef.jfsd.placeable.model.Employer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
Employer emp = (Employer) session.getAttribute("employer");
if(emp==null)
{
	response.sendRedirect("sessionexpired");
	return;
}
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link href='https://fonts.googleapis.com/css?family=Inter' rel='stylesheet'>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<nav class="navbar">
        <div class="logo-div">
            <h3 class="logo">PLACEABLE</h3>
        </div>
        <div class="links-div">
            <a href="emphome">Home</a>
            <a href="viewjobsbyemp?sort=desc">Posted Jobs</a>
            <a href="logout">Logout</a>
        </div>
        <div class="user-div">
            <span class="user"><%=emp.getName()%></span>
        </div>
    </nav>
</body>
</html>