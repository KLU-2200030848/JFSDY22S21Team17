<%@page import="com.klef.jfsd.placeable.model.StudPersonal"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
StudPersonal student = (StudPersonal)session.getAttribute("student");
if(student==null)
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
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>
	<nav class="navbar">
        <div class="logo-div">
            <h3 class="logo">PLACEABLE</h3>
        </div>
        <div class="links-div">
            <a href="studenthome?sort=default">Home</a>
            <a href="jobsapplied?sid=${student.id}">Applied Jobs</a>
            <a href="logout">Logout</a>
        </div>
        <div class="user-div">
            <span class="user" onclick="showProfileDialog()" style="cursor:pointer;">Hello, <%=student.getLastname()%></span>
        </div>
    </nav>
</body>
</html>