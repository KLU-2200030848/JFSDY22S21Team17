<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Profile</title>
<link href='https://fonts.googleapis.com/css?family=Inter' rel='stylesheet'>
<link rel="stylesheet" type="text/css" href="style.css">
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css" integrity="sha512-5Hs3dF2AEPkpNAR7UiOHba+lRSJNeM2ECkwxUIxC1Q/FLycGTbNapWXB4tP889k5T5Ju8fs4b1P5z/iB4nMfSQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>
img {
	width: auto;
	height: 100px;
}
.student-body {
	display: flex;
	flex-direction: row;
	justify-content: space-evenly;
	align-items: center;
}
table {
	width: 500px;
}
</style>
</head>
<body>
	<%@include file="studnavbar.jsp" %>
	<div class="student-body">
		<div >
		<form method="post" action="setstudent" enctype="multipart/form-data">
			<h3>Personal Details</h3>
			<table align="center">
			    <tr>
			        <td><input type="hidden" name="id" value="<%=student.getId()%>" required/></td>
			    </tr>
			    <tr>
			        <td><label>First Name</label></td>
			        <td><input type="text" name="fname" value="${student.firstname}" required/></td>
			    </tr>
			    <tr>
			        <td><label>Last Name</label></td>
			        <td><input type="text" name="lname" value="${student.lastname}" required/></td>
			    </tr>
			    <tr>
			        <td><label>Gender</label></td>
			        <td>
			            <input type="text" name="gender" value="${student.gender}" readonly="readonly" required/>

			        </td>
			    </tr>
			    <tr>
			        <td><label>Date of Birth</label></td>
			        <td><input type="date" name="dob" value="${student.dateofbirth}" readonly="readonly" required/></td>
			    </tr>
			    <tr>
			        <td><label>Email</label></td>
			        <td><input type="email" name="email" value="<%=student.getEmail()%>" readonly required/></td>
			    </tr>
			    <tr>
			        <td><label>Contact</label></td>
			        <td><input type="number" name="contact" value="${student.contact}" required/></td>
			    </tr>
			    <tr>
			        <td><label>Address</label></td>
			        <td><textarea name="address"  required>${student.address}</textarea></td>
			    </tr>
			    <tr>
			        <td><label>Profile Image</label></td>
			        <td><input type="file" name="profile" value="${student.image}" /></td>
			        <td><img src="displayprofile?stid=<%=student.getId()%>" alt="profile" /></td>
			    </tr>
			    <tr>
			        <td colspan="2" style="text-align: center;"><input type="submit" class="button" value="Update"/></td>
			    </tr>
			</table>
		</form>
		</div>
		<div>
		<form method="post" action="savedetails" style="padding:3%">
			<h3>Education Details</h3>
			<table>
			    <tr>
			        <td><input name="stpid" type="hidden" value="<%=student.getId()%>" required/></td>
			    </tr>
			    <tr>
			        <td><label>University ID</label></td>
			        <td><input name="id" type="number" value="${education.id}" readonly required/></td>
			    </tr>
			    <tr>
			        <td><label>University</label></td>
			        <td><input name="university" type="text" value="${education.university}" readonly required/></td>
			    </tr>
			    <tr>
			        <td><label>Degree</label></td>
			        <td><input name="degree" type="text" value="${education.degree}" required/></td>
			    </tr>
			    <tr>
			        <td><label>Stream</label></td>
			        <td><input name="stream" type="text" value="${education.stream}" required/></td>
			    </tr>
			    <tr>
			        <td><label>CGPA</label></td>
			        <td><input name="cgpa" type="number" step="0.01" value="${education.cgpa}" required/></td>
			    </tr>
			    <tr>
			        <td><label>Passout Date</label></td>
			        <td><input name="passout" type="date" min="${today}" value="${education.passout}" required/></td>
			    </tr>
			    <tr>
			        <td><label>Backlogs</label></td>
			        <td><input name="backlogs" type="number" value="${education.backlogs}" required/></td>
			    </tr>
			    <tr>
			        <td colspan="2" style="text-align: center;"><input type="submit" class="button" value="Update"/></td>
			    </tr>
			</table>
		</form>
		</div>
	</div>
</body>
</html>