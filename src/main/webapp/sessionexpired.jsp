<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Session Expired</title>
<style>
body {
	background-image: linear-gradient(#496587,#3A506B);
    background-repeat: no-repeat;
    background-attachment: fixed;
    padding: 0;
    margin: 0;
}

.container {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    min-height: 20vh;
    background-color: #ffffff;
    padding: 40px;
    border: 1px solid #dddddd;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
    max-width: 400px;
    margin-top:120px;
    margin-left:500px;
    
}

.container h1 {
    font-size: 24px;
    color: #ff6b6b;
    margin-bottom: 20px;
    font-weight: normal;
}

.container a {
    text-decoration: none;
    color: #ffffff;
    background-color: #335C81;
    padding: 10px 20px;
    border-radius: 4px;
    transition: background-color 0.3s ease;
}

.container a:hover {
    background-color: #27486b;
    transform: scale(1.05); 
}
</style>
</head>
<body>
	<div class="container">
        <h1>Your session has been expired !</h1>
        <a href="login">Login Again</a>
    </div>
</body>
</html>