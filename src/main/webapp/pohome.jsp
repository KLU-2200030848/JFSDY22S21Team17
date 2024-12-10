<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PO Home</title>
<link href='https://fonts.googleapis.com/css?family=Inter' rel='stylesheet'>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<%@include file="ponavbar.jsp" %>
	<div class="body-space empspace">
		<div class="side-nav">
			<a href="pohome"><div class="views">Statistics</div></a>
			<a href="viewstudbyuniversity?university=<%=po.getCompany()%>&sid=0"><div class="views">Students Details</div></a>
			<a href="unresponcivestudents?univ=<%=po.getCompany()%>"><div class="views">Inactive Students</div></a>
			<a href="#"><div class="views">Applied Students</div></a>
		</div>
		<div style="width: 40%;margin-left: 50px;margin-top: 7%;display: flex;font-size: 20px;">
			<div>
				<h3>Statistics</h3>
				<p>Total Students : ${tscount}</p>
				<p>Active Students : ${acount}</p>
				<p>Inactive Students : ${incount}</p>
			</div>
		</div>
		<div class="rightspace" style="margin: 3%">
			<div class="acc-details" style="width: 300px">
				<div class="details">
					<span><%=po.getName()%></span><br/>
					<span><%=po.getEmail()%></span> 
				</div>
				<div class="edit">
					<span style="font-weight: bold;font-size:20px;"><%=po.getCompany()%></span>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
