<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Students</title>
</head>
<body>
<%@include file="adminnavbar.jsp" %>
	<div class="task-space" style="width: 95%;height: 600px;">
		<div style="display:flex;flex-direction: row;justify-content: space-between;">
			<div class="list-view">
				<div class="headline" style="padding: 0px 10px">
	    		<h3 style="margin: 0">Student Details</h3>
	    		<span>Total Students : ${stcount}</span>
	    		</div>
				<c:forEach items="${studlist}" var="stud">
					<div class="student">
						<div class="sname">
							<c:choose>
								<c:when test="${stud.firstname==null}">
									<span style="color: red;font-size: 18px;font-weight: normal;">Details not set</span>
								</c:when>
								<c:otherwise>
									<c:out value="${stud.firstname} "/><c:out value="${stud.lastname}"/>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="bottom" >
							<div class="mail-company" style="width: 100%">
	    						<span>Email:<c:out value="${stud.email}"/></span>
	    						<span>Status:<c:out value="${stud.status}"/></span>
	    					</div>
	    					<div style="align-content: center;justify-content: center;">
	    						<c:if test="${stud.status=='active'||stud.status=='disabled'}">
	    						<a class="view" href='<c:url value="viewallstudents?id=${stud.id}"></c:url>'>View</a>
	    						</c:if>
	    					</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="detailed-view">
			<c:choose>
			<c:when test="${student!=null}">
				<div class="view-profile">
					<div class="text">
						<table>
						<tr>
							<td colspan="2"><h4>Personal Details</h4></td>
						</tr>
					    <tr>
					        <td><label>First Name</label></td>
					        <td>: ${student.firstname}</td>
					    </tr>
					    <tr>
					        <td><label>Last Name</label></td>
					        <td>: ${student.lastname}</td>
					    </tr>
					    <tr>
					        <td><label>Gender</label></td>
					        <td>: ${student.gender}</td>
					    </tr>
					    <tr>
					        <td><label>Date of Birth</label></td>
					        <td>: ${student.dateofbirth}</td>
					    </tr>
					    <tr>
					        <td><label>Email</label></td>
					        <td>: ${student.email}</td>
					    </tr>
					    <tr>
					        <td><label>Contact</label></td>
					        <td>: ${student.contact}</td>
					    </tr>
					    <tr>
					        <td><label>Address</label></td>
					        <td>: ${student.address}</td>
					    </tr>
						</table>
					</div>
					<div class="image">
						<img src="displayprofile?stid=${student.id}" alt="profile" />
					</div>
				</div>
				<div class="edu-profile">
					<table>
						<tr>
							<td colspan="2"><h4>Education Details</h4></td>
						</tr>
						<tr>
					        <td><label>University</label></td>
					        <td>: ${education.university}</td>
					        <td><label>Passout Date</label></td>
					        <td>: ${education.passout}</td>
					    </tr>
					    <tr>
					        <td><label>University ID</label></td>
					        <td>: ${education.id}</td>
					        <td><label>CGPA</label></td>
					        <td>: ${education.cgpa}</td>
					    </tr>
					    <tr>
					        <td><label>Degree</label></td>
					        <td>: ${education.degree}</td>
					        <td><label>Backlogs</label></td>
					        <td>: ${education.backlogs}</td>
					    </tr>
					    <tr>
					        <td><label>Stream</label></td>
					        <td>: ${education.stream}</td>
					    </tr>
					</table>
				</div>
			</c:when>
			<c:otherwise>
				<p style="align-self: center;">Select a Student to view details</p>
			</c:otherwise>
			</c:choose>
			</div>
		</div>
	</div>
</body>
</html>