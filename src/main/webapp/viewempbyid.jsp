<%@page import="com.klef.jfsd.placeable.model.Admin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>    

<html>
<head>
<meta charset="UTF-8">
<title>View Employer By Id</title>
</head>
<body>
<%@include file="adminnavbar.jsp" %>

  <h3 style="text-align: center;"><u><c:out value="${emp.name}"/>'s Profile</u></h3>

<div style="text-align: center;">
           <b>ID:</b><c:out value="${emp.id}"/><br><br>
           <b>NAME:</b><c:out value="${emp.name}"/><br><br>
           <b>GENDER:</b><c:out value="${emp.gender}"/><br><br>
           <b>COMPANY:</b><c:out value="${emp.company}"/><br><br>
           <b>EMAIL:</b><c:out value="${emp.email}"/><br><br>
           <b>CONTACT:</b><c:out value="${emp.contact}"/><br><br>
           <b>STATUS:</b><c:out value="${emp.status}"/><br><br>
</div>
</body>
</html>