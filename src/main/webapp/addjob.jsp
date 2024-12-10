<%@page import="com.klef.jfsd.placeable.model.Employer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Post a Job</title>
<link href='https://fonts.googleapis.com/css?family=Inter' rel='stylesheet'>
<link rel="stylesheet" type="text/css" href="style.css">
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>
	<%@include file="empnavbar.jsp" %>
	<div style="display: flex;justify-content: center;align-items: center;">
	<form:form class="post-job" modelAttribute="job" method="post" action="postjob">
		<div align="center">
			<h3 align="center">Add a new Job</h3>
			<c:out value="${message}"></c:out> <br/>
		</div>
		<form:input type="hidden" path="empid" required="required"/>
		<div style="display: flex;flex-direction: row;justify-content: space-between;">
		<div>
			<table>
			    <tr>
			        <td><label>Job Role :</label></td>
			        <td><form:input path="role" required="required"/></td>
			    </tr>
			    <tr>
			        <td><label>Job Type :</label></td>
			        <td>
			            <form:select path="type" required="required">
			                <form:option value="">Select Job Type</form:option>
			                <form:option value="Full Time">Full Time</form:option>
			                <form:option value="Part Time">Part Time</form:option>
			                <form:option value="Internship">Internship</form:option>
			            </form:select>
			        </td>
			    </tr>
			    <tr>
			        <td><label>Company :</label></td>
			        <td><form:input path="company" readonly="true" required="required"/></td>
			    </tr>
			    <tr>
			        <td><label>Job Industry :</label></td>
			        <td><form:input path="industry" required="required"/></td>
			    </tr>
			    <tr>
			        <td><label>Job Location :</label></td>
			        <td><form:input path="location" required="required"/></td>
			    </tr>
			    <tr>
			        <td><label>Job Description :</label></td>
			        <td><form:textarea path="description" required="required"/></td>
			    </tr>
			    <tr>
			        <td><label>Deadline :</label></td>
			        <td><form:input type="date" path="endDate" required="required"/></td>
			    </tr>
			</table>
		</div>
		<div>
			<table>
			    <tr>
			        <td><label>Streams :</label></td>
			        <td><form:input path="stream" required="required"/></td>
			    </tr>
			    <tr>
			        <td><label>Branches :</label></td>
			        <td><form:input path="branch" required="required"/></td>
			    </tr>
			    <tr>
			        <td><label>Batches :</label></td>
			        <td><form:input path="batch" required="required"/></td>
			    </tr>
			    <tr>
			        <td><label>CGPA :</label></td>
			        <td><form:input path="cgpa" required="required"/></td>
			    </tr>
			    <tr>
			        <td><label>Backlog Status :</label></td>
			        <td><form:input path="backlogStatus" required="required"/></td>
			    </tr>
			    <tr>
			    	<td><br/></td>
			    </tr>
			    <tr>
			        <td colspan="2" style="text-align: center;">
			            <input type="submit" class="button" value="Post"/>
			        </td>
			    </tr>
			</table>
		</div>
		</div>
	</form:form>
	</div>
</body>
</html>