<%@page import="com.klef.jfsd.placeable.model.StudPersonal"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<%
StudPersonal student = (StudPersonal)session.getAttribute("student");
if(student==null)
{
  response.sendRedirect("sessionexpiry");
  return;
}

java.time.LocalDate today = java.time.LocalDate.now();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Build Profile</title>
<link href='https://fonts.googleapis.com/css?family=Inter' rel='stylesheet'>
<link rel="stylesheet" type="text/css" href="style.css">
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>
<body class="chngpwd-body">
	<form class="stud-form" method="post" action="savedetails" style="padding:3%">
		<h3>Continue Buliding Profile</h3>
		<table>
		    <tr>
		        <td><input name="stpid" type="hidden" value="<%=student.getId()%>" required/></td>
		    </tr>
		    <tr>
		        <td><label>University ID</label></td>
		        <td><input name="id" type="number" value="${education.id}" readonly required/></td>
		    </tr>
		    <tr>
		        <td><label>University</label></td>
		        <td><input name="university" type="text" value="${education.university}" readonly required/></td>
		    </tr>
		    <tr>
		        <td><label>Degree</label></td>
		        <td><input name="degree" type="text" required/></td>
		    </tr>
		    <tr>
		        <td><label>Stream</label></td>
		        <td><input name="stream" type="text" required/></td>
		    </tr>
		    <tr>
		        <td><label>CGPA</label></td>
		        <td><input name="cgpa" type="number" step="0.01" required/></td>
		    </tr>
		    <tr>
		        <td><label>Passout Date</label></td>
		        <td><input name="passout" type="date" min="${today}" required/></td>
		    </tr>
		    <tr>
		        <td><label>Backlogs</label></td>
		        <td><input name="backlogs" type="number" required/></td>
		    </tr>
		    <tr>
		        <td colspan="2" style="text-align: center;"><input type="submit" class="button" value="Save"/></td>
		    </tr>
		</table>
	</form>
</body>
</html>