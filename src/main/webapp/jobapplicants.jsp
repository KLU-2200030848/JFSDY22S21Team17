<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${job.role} details</title>
<link href='https://fonts.googleapis.com/css?family=Inter' rel='stylesheet'>
<link rel="stylesheet" type="text/css" href="style.css">
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>
	<%@include file="empnavbar.jsp" %>
	<div class="task-space" style="width: 95%;height: 600px;">
		<div style="display:flex;flex-direction: row;">
			<div class="job-details">
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
						<tr><td colspan="2" style="font-weight: bold;font-size: 18px;">Criteria</td></tr>
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
					</table>
				</div>
			</div>
			<div class="app-list">
				<div class="counts">
					<h3>Applicants</h3>
					<div class="accept">
						<span style="color:#00F000;">Approved:</span>
						<span>${statusCounts[job.id]['Accepted']!=null?statusCounts[job.id]['Accepted']:0}</span>
					</div>
					<div class="pending">
						<span style="color:#009DFF;">Pending:</span>
						<span>${statusCounts[job.id]['Pending']!=null?statusCounts[job.id]['Pending']:0}</span>
					</div>
					<div class="reject">
						<span style="color:#FF2626;">Rejected:</span>
						<span>${statusCounts[job.id]['Rejected']!=null?statusCounts[job.id]['Rejected']:0}</span>
					</div>
				</div>
				<div class="list">
					<c:if test="${applist.isEmpty()}">
						<p style="text-align: center">No one applied for this Job</p>
					</c:if>
					<c:forEach items="${applist}" var="app">
						<div class="application">
							<div class="app-details">
								<div class="sname"><c:out value="${app.sname}"></c:out></div>
								<div>Applied time:<c:out value="${app.appliedtime}"></c:out></div>
								<div><a href="viewresume?appid=${app.id}" class="button" style="width: fit-content;" target="_blank">View Resume</a></div>
							</div>
							<div class="actions">
								<c:choose>
									<c:when test="${app.status=='pending'}">
										<div style="width:100%;display: flex;flex-direction:row;align-items:center;justify-content:space-around;">
											<div><a href='<c:url value="verifyappstatus?aid=${app.id}&astatus=accepted&jid=${app.jobid}"></c:url>' class="button" style="width: fit-content;">Approve</a></div>
											<div><a href='<c:url value="verifyappstatus?aid=${app.id}&astatus=rejected&jid=${app.jobid}"></c:url>' class="button" style="width: fit-content;">Decline</a></div>
										</div>
									</c:when>
									<c:when test="${app.status=='accepted'}">
										<div style="width:100%;display: flex;flex-direction:row;align-items:center;justify-content:space-around;">
											<span style="color:#00F000;">Approved</span>
										</div>
									</c:when>
									<c:when test="${app.status=='rejected'}">
										<div style="width:100%;display: flex;flex-direction:row;align-items:center;justify-content:space-around;">
											<span style="color:#FF2626;">Rejected</span>
										</div>
									</c:when>
								</c:choose>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="filters">
			
			</div>
		</div>
	</div>
</body>
</html>