<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login to continue</title>
<link href='https://fonts.googleapis.com/css?family=Inter' rel='stylesheet'>
<link href="https://fonts.googleapis.com/css2?family=Fugaz+One&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Itim&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body class="login">
	
	<div class="login-head"></div>
	<div class="login-empty"></div>
	<div class="word-span">
		<span class="fugaz-one-regular">Sign In</span>
		<span class="itim-regular">To brighten your future</span>
	</div>
	<h3 class="login-logo" onclick="back()" style="cursor:pointer;">PLACEABLE</h3>
	<div class="login-form">
		<form method="post" action="checklogin">
			<c:out value="${message}"></c:out> <br/><br/>
			<input type="text" name="email" placeholder="Username/Email" required/><br/>
			<input type="password" name="password" placeholder="Password" required/><br/>
			<input type="submit" value="Sign in"/> <br/>
			<p>Are you an Employer? <a href="empregistration" style="color:#FFCC00">Register</a></p>
		</form>
	</div>
	<script>
	    const back = () => {
	    	window.location.href = "/";
	    }
	</script>
	
</body>
</html>