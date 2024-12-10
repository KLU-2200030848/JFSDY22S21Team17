<%@page import="com.klef.jfsd.placeable.model.StudPersonal"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
    
<%
StudPersonal student = (StudPersonal)session.getAttribute("student");
if(student==null)
{
  response.sendRedirect("sessionexpiry");
  return;
}
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
	<form class="stud-form" method="post" action="setstudent" enctype="multipart/form-data">
		<h3>Build your Profile</h3>
		<table align="center">
		    <tr>
		        <td><input type="hidden" name="id" value="<%=student.getId()%>" required/></td>
		    </tr>
		    <tr>
		        <td><label>First Name</label></td>
		        <td><input type="text" name="fname" required/></td>
		    </tr>
		    <tr>
		        <td><label>Last Name</label></td>
		        <td><input type="text" name="lname" required/></td>
		    </tr>
		    <tr>
		        <td><label>Gender</label></td>
		        <td>
		            <input type="radio" name="gender" value="Male" required/>
		            <label for="Male">Male</label>
		            <input type="radio" name="gender" value="Female" required/>
		            <label for="Female">Female</label>
		            <input type="radio" name="gender" value="Others" required/>
		            <label for="Others">Others</label>
		        </td>
		    </tr>
		    <tr>
		        <td><label>Date of Birth</label></td>
		        <td><input type="date" name="dob" required/></td>
		    </tr>
		    <tr>
		        <td><label>Email</label></td>
		        <td><input type="email" name="email" value="<%=student.getEmail()%>" readonly required/></td>
		    </tr>
		    <tr>
		        <td><label>Contact</label></td>
		        <td><input type="number" name="contact" required/></td>
		    </tr>
		    <tr>
		        <td><label>Address</label></td>
		        <td><textarea name="address" required></textarea></td>
		    </tr>
		    <tr>
		        <td><label>Profile Image</label></td>
		        <td><input type="file" name="profile" required/></td>
		    </tr>
		    <tr>
		        <td colspan="2" style="text-align: center;"><input type="submit" class="button" value="Update"/></td>
		    </tr>
		</table>
	</form>
</body>
</html>