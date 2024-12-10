<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jobs Posted</title>
<link rel="stylesheet" type="text/css" href="style.css">
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>
	<%@include file="empnavbar.jsp" %>
	<div class="empspace">
	<div class="jobsposted">
	<div class="head-field">
		<span class="heading">Jobs / Internships</span>
		<div class="dropdown">
  		<button>Sort By <i class='bx bx-sort-alt-2'></i></button>
  		<div class="dropdown-content">
    		<a href="viewjobsbyemp?sort=asc">Ascending</a>
    		<a href="viewjobsbyemp?sort=desc">Descending</a>
  		</div>
		</div>
	</div>
	<div class="jobs">
	<c:forEach items="${joblist}" var="job">
		<div class="job">
			<div class="jobleft">
				<span class="jobrole"><c:out value="${job.role}"></c:out></span>
				<p class="desc"><c:out value="${job.description}"></c:out></p>
				<a href="jobapplicants?jid=${job.id}" class="button">Detailed View</a>
			</div>
			<div class="jobright">
				<div class="status">
					<div class="value">
						<span class="value-head" style="color:#00F000;">Approved</span>
						<span class="value-head">${statusCounts[job.id]['Accepted']!=null?statusCounts[job.id]['Accepted']:0}</span>
					</div>
					<div class="value">
						<span class="value-head" style="color:#009DFF;">Pending</span>
						<span class="value-head">${statusCounts[job.id]['Pending']!=null?statusCounts[job.id]['Pending']:0}</span>
					</div>
					<div class="value">
						<span class="value-head" style="color:#FF2626;">Rejected</span>
						<span class="value-head">${statusCounts[job.id]['Rejected']!=null?statusCounts[job.id]['Rejected']:0}</span>
					</div>
				</div>
				<div class="deadline">
					<span>Deadline : <c:out value="${job.endDate}"></c:out></span>
				</div>
			</div>
		</div>
	</c:forEach>
	</div>
	</div>
	</div>
</body>
</html>