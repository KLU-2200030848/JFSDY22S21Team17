<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contact Us</title>
<link href='https://fonts.googleapis.com/css?family=Inter' rel='stylesheet'>
<link rel="stylesheet" type="text/css" href="style.css">
<style>
input {
	margin-bottom: 10px;
	min-width: 300px;
}
input::placeholder {
 color: white;
}
textarea {
	margin-bottom: 10px;
	min-width: 300px;
}
textarea::placeholder {
	color: white;
}
.contact {
	margin: auto;	
	width: fit-content;
	height: auto;
	padding: 25px;
	box-sizing: border-box;
	border: 1px solid white;
	border-radius: 10px;
	margin-top: 7%;
}
form {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
}
</style>
</head>
<body>
<%@include file="mainnavbar.jsp" %>
	<div class="contact">
		<h3 align="center">Contact Us</h3>
		<c:out value="${msg}"></c:out>
		<form method="post" action="postresponse">
			<input type="text" name="name" placeholder="Enter your name"/>
			<input type="email" name="email" placeholder="Enter your mail id"/>
			<textarea rows="5" name="message" placeholder="Enter your response"></textarea>
			<input type="submit" class="button" value="Submit"/>
		</form>
	</div>
</body>
</html>