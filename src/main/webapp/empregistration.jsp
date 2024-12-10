<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register as Employer</title>
<link href='https://fonts.googleapis.com/css?family=Inter' rel='stylesheet'>
<link href="https://fonts.googleapis.com/css2?family=Fugaz+One&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Itim&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body class="login">
	<div class="login-head"></div>
	<div class="login-empty"></div>
	<div class="word-span">
		<span class="fugaz-one-regular">Register</span>
		<span class="itim-regular">Always better to be United</span>
	</div>
	<h3 class="login-logo" onclick="back()" style="cursor:pointer;">PLACEABLE</h3>
	<div class="regist-form">
	<form:form modelAttribute="employer" method="post" action="insertemp">
		<c:out value="${message}"></c:out> <br/>
		<form:input path="name" placeholder="Full Name" required="required"/> <br/>
		
		<form:select path="gender" required="required">
		    <form:option value="" label="Select Gender" />
		    <form:option value="Male" label="Male" />
		    <form:option value="Female" label="Female" />
		    <form:option value="Others" label="Others" />
		</form:select> <br/>
		
		<form:input path="email" placeholder="Email" required="required"/> <br/>
		
		<form:input path="company" placeholder="Company" required="required"/> <br/>
		
		<form:input type="text" path="contact" placeholder="Contact"
		pattern="[6-9][0-9]{9}"  maxlength="10" minlength="10" 
 		 title="Contact number must start with 6, 7, 8, or 9 and be exactly 10 digits long." 
		 required="required"/> <br/>
		
		<form:input type="password" placeholder="Password" path="password" pattern="(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}"
			  title="Password must contain at least one uppercase letter, one lowercase letter, one digit, one special character, and be at least 8 characters long." 
		 required="required"/> <br/>
		
		<form:input type="hidden" path="status" value="pending" required="required"/>
		
		<input type="submit" value="Register"/>
	</form:form>
	</div>
	<script>
	    const back = () => {
	    	window.location.href = "/";
	    }
	</script>
</body>
</html>