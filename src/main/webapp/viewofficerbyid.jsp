<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>    

<html>
<head>
<meta charset="UTF-8">
<title>View Officer By Id</title>
</head>
<body>
<%@include file="adminnavbar.jsp" %>

  <h3 style="text-align: center;"><u><c:out value="${po.name}"/>'s Profile</u></h3>

<div style="text-align: center;">
           <b>ID:</b><c:out value="${po.id}"/><br><br>
           <b>NAME:</b><c:out value="${po.name}"/><br><br>
           <b>COMPANY:</b><c:out value="${po.company}"/><br><br>
           <b>EMAIL:</b><c:out value="${po.email}"/><br><br>
           <b>CONTACT:</b><c:out value="${po.contact}"/><br><br>
           <b>STATUS:</b><c:out value="${po.status}"/><br><br>
</div>
</body>
</html>