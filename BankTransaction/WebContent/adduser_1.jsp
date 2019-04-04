<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>add user</title>
<style type="text/css">
* {
	padding: 0px;
	margin: 0px;
}

body {
	background-image: url("images/1.jpg");
	background-size: cover;
	ackground-color: red;
	background-blend-mode: screen;
}

.form {
	height: 500px;
	width: 40%;
	background-color: #474242;
	opacity: 0.9;
	margin-left: 30%;
	margin-top: 100px;
}
</style>
<script src="js/script.js" type="text/javascript"></script>
</head>
<body>
	<a href="adduser.jsp">Add User</a>
	<a href="">View User</a>
	<div class="form">
		<form action="CreateAccountServlet" method="post">
			<table>
				<tr>
					<td>First Name</td>
					<td><input type="text" name="fname" placeholder="First Name"
						required></td>
				</tr>
				<tr>
					<td>Last Name</td>
					<td><input type="text" name="lname" placeholder="Last Name"
						required></td>
				</tr>
				<tr>
					<td>DOB</td>
					<td><input type="date" name="dob" required ></td>
				</tr>
				<tr>
					<td>Gender</td>
					<td>
						<input type="radio" name="g" value="male" required>Male
						<input type="radio" name="g" value="female" required>Female
					</td>
				</tr>
				<tr>
					<td>Address</td>
					<td><input type="text" name="address" required placeholder="addresss">  </td>
				</tr>
				<tr>
					<td>Mobile No</td>
					<td><input type="number" name="mobile" placeholder="Mobile Number" required /></td>
				</tr>
				<tr>
					<td>Mail ID</td>
					<td><input type="email" name="mail" placeholder="Email ID" required /> </td>
				</tr>
				<tr>
				<td>Account Detail</td>
				</tr>
				<tr>
					<td>Account Number</td>
					<td><input type="text" name="acno" placeholder="000 000 0000" required /></td>
				</tr>
				<tr>
					<td>Card No</td>
					<td><input type="text" name="card" placeholder="000 000 0000" required /></td>
				</tr>
				<tr>
					<td>Finger ID</td>
					<td><input type="text" name="fid" placeholder="Finger ID" required /></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="submit" value="Register"></td>
				</tr>
			</table>
		</form>
		<%
			if(request.getAttribute("res")!=null){
				out.println(request.getAttribute("res")); 
			}
		%>
		<div style="color: red;" id="err"></div>
	</div>

</body>
</html>