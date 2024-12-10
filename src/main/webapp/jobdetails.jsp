<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Job Details</title>
</head>
<body>
	<%@include file="studnavbar.jsp" %>
	<br/><br/>
	<center><c:out value="${message}"></c:out></center>
	<div class="container">
		<div class="details">
			<table>
				<tr class="role" >
					<td colspan="2">${job.role}</td>
				</tr>
				<tr>
					<td>Type</td>
					<td>:${job.type}</td>
				</tr>
				<tr>
					<td>Company</td>
					<td>:${job.company}</td>
				</tr>
				<tr>
					<td>Industry</td>
					<td>:${job.industry}</td>
				</tr>
				<tr>
					<td>Location</td>
					<td>:${job.location}</td>
				</tr>
				<tr>
					<td>Deadline</td>
					<td>:${job.endDate}</td>
				</tr>
				<tr>
					<td>Description</td>
					<td>:${job.description}</td>
				</tr>
			</table>
		</div>
		<div class="criteria">
		<form method="post" action="applyjob" enctype="multipart/form-data">
			<table>
				<tr>
					<td>Stream</td>
					<td>:${job.stream}</td>
				</tr>
				<tr>
					<td>Branch</td>
					<td>:${job.branch}</td>
				</tr>
				<tr>
					<td>Batch</td>
					<td>:${job.batch}</td>
				</tr>
				<tr>
					<td>CGPA</td>
					<td>:${job.cgpa}</td>
				</tr>
				<tr>
					<td>Backlog Status</td>
					<td>:${job.backlogStatus}</td>
				</tr>
				<tr>
					<td>Upload Resume</td>
					<td>
							<input type="hidden" name="sname" value="${student.firstname} ${student.lastname}"/>
							<input type="hidden" name="jobrole" value="${job.role}"/>
							<input type="hidden" name="jobid" value="${job.id}"/>
							<input type="hidden" name="stpid" value="${student.id}"/>
							<input type="file" name="resume" required/>
					</td>
				</tr>
				<tr  class="apply">
					<td colspan="2"><input type="submit" class="button" value="Apply"/></td>
				</tr>
			</table>
		</form>
		</div>
	</div>
</body>
</html>