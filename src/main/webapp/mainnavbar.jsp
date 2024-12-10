<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link href='https://fonts.googleapis.com/css?family=Inter' rel='stylesheet'>
<link rel="stylesheet" type="text/css" href="style.css">
<style>
	.user-div a {
		width: 80px;
		height: 20px;
		color: var(--dark-slate-blue);
		font-size: 16px;
		font-weight: bold;
		background: -webkit-radial-gradient(var(--gold), var(--orange)); 
		transition: font-size .5s;
	}
	.user-div a:hover {
		font-size: 17px;
	}
</style>
</head>
<body>
	<nav class="navbar">
        <div class="logo-div">
            <h3 class="logo">PLACEABLE</h3>
        </div>
        <div class="links-div">
            <a href="/">Home</a>
            <a href="#">About Us</a>
            <a href="contactus">Contact</a>
        </div>
        <div class="user-div">
            <a href="login" class="button">Login</a>
        </div>
    </nav>
</body>
</html>