<%@page import="com.klef.jfsd.placeable.model.Admin"%>
<%
	Admin admin = (Admin) session.getAttribute("admin");

	if(admin == null)
	{
		response.sendRedirect("sessionexpired");
		return;
	}
%>

<!DOCTYPE html>
<html>
<head>
<title>Spring Boot</title>
<link href='https://fonts.googleapis.com/css?family=Inter' rel='stylesheet'>
<link rel="stylesheet" type="text/css" href="style.css">
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>
    <nav class="navbar">
        <div class="logo-div">
            <h3 class="logo">PLACEABLE</h3>
        </div>
        <div class="links-div">
            <a href="dashboard">Dashboard</a>
            <a onclick="showPoDialog()" style="cursor: pointer;">Add P&T Officer</a>
            <a href="verifyemployers">Verify Employers</a>
            <a href="logout">Logout</a>
        </div>
        <div class="user-div">
            <span class="user"><%=admin.getUsername()%></span>
        </div>
    </nav>
    
    <dialog id="reg-po">
    	<p onclick="closePoDialog()" align="right"><i class='bx bx-x'></i></p>
    	<h3 align="center">Add Placement Officer</h3>
    	<form method="post" action="insertofficer">
			<table align="center">
				<tr>
					<td><label>FullName</label></td>
					<td><input type="text" name="pname" required /></td>
				</tr>
				<tr>
					<td><label>Email</label></td>
					<td><input type="email" name="pemail" required /></td>
				</tr>
				<tr>
					<td><label>Company</label></td>
					<td><input type="text" name="pcompany" required /></td>
				</tr>
				<tr>
					<td><label>Contact</label></td>
					<td><input type="number" name="pcontact" required /></td>
				</tr>
				<tr>
					<td><label>Password</label></td>
					<td><input type="password" name="ppwd" required /></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;">
						<input type="submit" value="Add" class="button"/>
					</td>
				</tr>
			</table>
		</form>
	</dialog>
	
	<script>
		const poDialog = document.getElementById("reg-po")
		
		const showPoDialog = () =>{ poDialog.showModal() }
		const closePoDialog = () =>{ poDialog.close() }
	</script>
</body>
</html>