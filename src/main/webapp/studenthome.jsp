<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Home</title>
<link href='https://fonts.googleapis.com/css?family=Inter' rel='stylesheet'>
<link rel="stylesheet" type="text/css" href="style.css">
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css" integrity="sha512-5Hs3dF2AEPkpNAR7UiOHba+lRSJNeM2ECkwxUIxC1Q/FLycGTbNapWXB4tP889k5T5Ju8fs4b1P5z/iB4nMfSQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
	<%@include file="studnavbar.jsp" %>
	<div class="student-body">
		<div class="sort-box"></div>
		<div class="main-box">
			<div class="head-box">
				<h3>Jobs / Internships</h3>
				<div class="dropdown">
		  		<button>Sort By <i class='bx bx-sort-alt-2'></i></button>
		  		<div class="dropdown-content">
		  			<a href="studenthome?sort=random">Default</a>
		    		<a href="studenthome?sort=deadline">Deadline</a>
		    		<a href="studenthome?sort=posted">Posted Time</a>
		  		</div>
				</div>
			</div>
			<div class="job-box">
				<c:forEach items="${joblist}" var="job">
				<div class="job-view">
					<h3><c:out value="${job.role}"></c:out></h3>
					<span><c:out value="${job.company}"></c:out></span>
					<span><c:out value="${job.type}"></c:out></span>
					<span>Deadline : <c:out value="${job.endDate}"></c:out></span>
					<a href="jobdetails?jobid=${job.id}" class="button" style="width:100px;align-self: center">More details</a>
				</div>
				</c:forEach>
			</div>
		</div>
		<div class="profile-box">
			<div class="mini-profile">
				<div class="details">
					<span><%=student.getFirstname()%> <%=student.getLastname()%></span> <br/>
					<span><%=student.getEmail()%></span> <br/>
					<a href="editprofile">Edit Profile <i class="fa-solid fa-pen"></i></a>
				</div>
				<div class="profile">
					<img src="displayprofile?stid=<%=student.getId()%>" alt="profile" />
				</div>
			</div>
		</div>
	</div>
	
	<dialog id="stud-profile">
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
				<img src="displayprofile?stid=<%=student.getId()%>" alt="profile" />
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
	</dialog>
	
	<script>
		const profileDialog = document.getElementById("stud-profile")
		const profile = document.querySelector(".view-profile")
		
		const showProfileDialog = () =>{ profileDialog.showModal() }
		const closeProfileDialog = () =>{ profileDialog.close() }
		
		profileDialog.addEventListener("click", (e) => !profile.contains(e.target) && profileDialog.close())
	</script>
</body>
</html>