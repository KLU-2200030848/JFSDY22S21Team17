<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employer Home</title>
<link rel="stylesheet" type="text/css" href="style.css">
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>
	<%@include file="empnavbar.jsp" %>
	<div class="empspace">
		<div class="leftspace">
			<div class="jobsview">
				<span class="heading">Jobs / Internships</span> <br/>
				<c:forEach items="${recentjobs}" var="job">
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
			<div class="viewall">
				<a href="viewjobsbyemp?sort=desc">View all</a>
			</div>
			<div class="postjob">
				<span><a href="addjob">Post a new Job</a></span>
				<span style="font-size: 18px;"><i class='bx bx-plus'></i></span>
			</div>
		</div>
		<div class="rightspace">
			<div class="acc-details">
				<div class="details">
					<span><%=emp.getName()%></span><br/>
					<span><%=emp.getEmail()%></span> 
				</div>
				<div class="edit">
					<span style="font-weight: bold;font-size:20px;"><%=emp.getCompany()%></span>
					<button style="margin-right: 15px;" onclick="showUpdateDialog()" >Edit <i class='bx bxs-edit'></i></button>
				</div>
			</div>
		</div>
	</div>
	
	<dialog id="update-profile">
		<p onclick="closeUpdateDialog()" align="right"><i class='bx bx-x'></i></p>
		<h3 align="center">Update Details</h3>
		<form method="post" action="updateempdetails">
		    <input type="hidden" name="eid" value="<%=emp.getId()%>" readonly required />
		    <table align="center">
		        <tr>
		            <td><label>Full Name</label></td>
		            <td><input type="text" name="ename" value="<%=emp.getName()%>" required /></td>
		        </tr>
		        <tr>
		            <td><label>Company</label></td>
		            <td><input type="text" name="ecompany" value="<%=emp.getCompany()%>" required /></td>
		        </tr>
		        <tr>
		            <td><label>Contact</label></td>
		            <td><input type="number" name="econtact" value="<%=emp.getContact()%>" required /></td>
		        </tr>
		        <tr>
		            <td colspan="2" style="text-align: center;">
		                <input class="button" type="submit" value="Update" />
		            </td>
		        </tr>
		    </table>
		</form>
	</dialog>
	
	<script>
		const updateDialog = document.getElementById("update-profile")
		
		const showUpdateDialog = () =>{ updateDialog.showModal() }
		const closeUpdateDialog = () =>{ updateDialog.close() }
	</script>
</body>
</html>