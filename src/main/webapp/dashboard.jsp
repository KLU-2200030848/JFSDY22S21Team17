<%@page import="com.klef.jfsd.placeable.model.Admin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>    

<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <link href='https://fonts.googleapis.com/css?family=Inter' rel='stylesheet'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css" integrity="sha512-5Hs3dF2AEPkpNAR7UiOHba+lRSJNeM2ECkwxUIxC1Q/FLycGTbNapWXB4tP889k5T5Ju8fs4b1P5z/iB4nMfSQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<link rel="stylesheet" type="text/css" href="style.css">
	<style>
		a {
			color: white;
		}
	</style>
</head>
<body>
<%@include file="adminnavbar.jsp" %>
	<div class="admin-space">
		<div class="boxes">
			<div class="view-box">
				<div class="view-detail"><i class="fa-solid fa-user-tie"></i><span>Employers</span></div>
				<div class="view-bottom">
					<div class="view-count">
						<span>${empcount}</span>
					</div>
					<div class="view-btn">
						<a href="viewallemployers" class="button">View all</a>
					</div>
				</div>	
			</div>
			<div class="view-box">
				<div class="view-detail"><i class="fa-solid fa-user-tag"></i><span>Place Officers</span></div>
				<div class="view-bottom">
					<div class="view-count">
						<span>${pocount}</span>
					</div>
					<div class="view-btn">
						<a href="viewallofficers" class="button">View all</a>
					</div>
				</div>	
			</div>
			<div class="view-box">
				<div class="view-detail"><i class="fa-solid fa-user-graduate"></i><span>Students</span></div>
				<div class="view-bottom">
					<div class="view-count">
						<span>${stcount}</span>
					</div>
					<div class="view-btn">
						<a href="viewallstudents?id=0" class="button">View all</a>
					</div>
				</div>	
			</div>
			<div class="view-box">
				<div class="view-detail"><i class="fa-solid fa-briefcase"></i><span>Jobs</span></div>
				<div class="view-bottom">
					<div class="view-count">
						<span>${jcount}</span>
					</div>
					<div class="view-btn">
						<a href="viewalljobs" class="button">View all</a>
					</div>
				</div>	
			</div>
			<div class="view-box">
				<div class="view-detail"><i class="fa-solid fa-list-check"></i><span>Applicants</span></div>
				<div class="view-bottom">
					<div class="view-count">
						<span>${jacount}</span>
					</div>
					<div class="view-btn">
						<a href="viewallapplicants" class="button">View all</a>
					</div>
				</div>	
			</div>
			<div class="view-box">
				<div class="view-detail"><i class="fa-solid fa-comments"></i><span>Contact Forms</span></div>
				<div class="view-bottom">
					<div class="view-count">
						<span>${count}</span>
					</div>
					<div class="view-btn">
						<a href="viewallresponses" class="button">View all</a>
					</div>
				</div>	
			</div>
		</div>
		<div class="stats">
			<div class="container">
				<div class="heading">STATISTICS</div>
				<div class="stat-values">
					<div class="each">
						<span>Total Users</span>
						<span>${tucount}</span>
					</div>
					<div class="each">
						<span>Companies</span>
						<span>${ccount}</span>
					</div>
					<div class="each">
						<span>Universities</span>
						<span>${ucount}</span>
					</div>
					<div class="each">
						<span>Applicants/Job Ratio</span>
						<span>${ajratio}</span>
					</div>
					<div class="each">
						<span>Jobs/Company Ratio</span>
						<span>${jcratio}</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>