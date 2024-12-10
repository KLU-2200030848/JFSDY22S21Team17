<%@page import="com.klef.jfsd.placeable.model.PlacementOfficer"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
PlacementOfficer po = (PlacementOfficer)session.getAttribute("placementofficer");
if(po==null)
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
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<nav class="navbar">
        <div class="logo-div">
            <h3 class="logo">PLACEABLE</h3>
        </div>
        <div class="links-div">
            <a href="pohome">Home</a>
            <a onclick="showRegDialog()" style="cursor: pointer;">Add Student</a>
            <a href="logout">Logout</a>
        </div>
        <div class="user-div">
            <span class="user"><%=po.getName()%></span>
        </div>
    </nav>
    
    <dialog id="reg-stud">
    	<p onclick="closeRegDialog()" align="right"><i class='bx bx-x'></i></p>
    	<h3 align="center">Add Student</h3>
    	<form action="insertstudent" method="post">		
		<table align="center">
			<tr>
			<td><label>University ID</label></td>
			<td><input type="number" name="uid" required="required"/></td>
			</tr>
			<tr>
			<td><label>Email</label></td>
			<td><input type="email" name="email" required="required"/></td>
			</tr>
			<tr>
			<td colspan="2" style="text-align: center;">
			<input type="submit" value="Add" class="button">
			</td>
			</tr>
		</table>
		</form>
    </dialog>
    
    <script>
		const regDialog = document.getElementById("reg-stud")
		
		const showRegDialog = () =>{ regDialog.showModal() }
		const closeRegDialog = () =>{ regDialog.close() }
	</script>
</body>
</html>
