<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Student by ID</title>
<link href='https://fonts.googleapis.com/css?family=Inter' rel='stylesheet'>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<%@include file="ponavbar.jsp" %>
<div style="text-align: center;">
           <b>ID:</b><c:out value="${studp.id}"/><br><br>
           <b>FNAME:</b><c:out value="${studp.firstname}"/><br><br>
           <b>LNAME:</b><c:out value="${studp.lastname}"/><br><br>
           <b>GENDER:</b><c:out value="${studp.gender}"/><br><br>
           <b>DATEOFBIRTH:</b><c:out value="${studp.dateofbirth}"/><br><br>
           <b>EMAIL:</b><c:out value="${studp.email}"/><br><br>
           <b>CONTACT:</b><c:out value="${studp.contact}"/><br><br>
           <b>ADDRESS:</b><c:out value="${studp.address}"/><br><br>
           <b>STATUS:</b><c:out value="${studp.status}"/><br><br>
</div>
</body>
</html>