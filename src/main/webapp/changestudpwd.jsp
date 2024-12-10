<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Change Password</title>
<link href='https://fonts.googleapis.com/css?family=Inter' rel='stylesheet'>
<link rel="stylesheet" type="text/css" href="style.css">
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>
<body class="chngpwd-body">
	<form class="chngpwd" method="post" action="updatestudpwd">
		<h3 align="center" style="margin:5px;">Change Password</h3>
		<c:out value="${message}"></c:out>
		<input type="password" placeholder="New Password" name="password" required/>
		<input type="password" placeholder="Confirm Password" name="confirm" required/>
		<input type="submit" class="button" value="Change"/>
	</form>
</body>
</html>