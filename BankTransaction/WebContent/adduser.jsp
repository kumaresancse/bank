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
	background-image:linear-gradient(rgba(0,0,0,0.5),rgba(0,0,0,0.5)), url("computer.jpg" ); 
	background-size: cover;
background-repeat:no-repeat;
background-position:top;  
	
}

.form {
	height: auto;
	width: 35%;
	background-color: black;
	color:white;
	margin-left: 32.5%;
	margin-top: 120px;
	opacity:.65; 
	border-radius:10px; 

}
.head{
width:100%;
height:100px;  
}
.head ul{
list-style:none; 
margin-left:80%; 
}
.head ul li{
width:35%;
height:50px;  
text-align:center; 
line-height:50px;
border-radius:5px;
float:left;
margin:20px; 

color:black; 
background-color:black; 
opacity:.6;

}
a{
text-decoration:none; 
color:white; 
}
.head ul li:hover{
color:black;
background-color:darkorange;
  
}

input[type=text]{	   
height:35px;
width:80%;
margin-left:3%	;
border-radius:6px; 
font-size:large; 
}
input[type=date]{
height:35px;
width:80%;
margin-left:3%	;
border-radius:6px; 
font-size:large; 
}
input[type=radio]{
border-radius:6px; 
width:10%;
line-height:35px;  
font-size:large;  
 }
input[type=number]{
border-radius:6px; 
height:35px;
width:80%;
margin-left:3%	;
font-size:large; }
input[type=email]{height:35px;
width:80%;
margin-left:3%	;
border-radius:6px; 
font-size:large; }
input[type=submit]{height:45px;
width:80%;
border-radius:6px; 
margin-left:3%	;
font-family:serif;
font-size:large;  } 
::placeholder{
text-align:center; 
font-family:cursive;
color:black;   
} 
</style>
<script src="js/script.js" type="text/javascript"></script>
</head>
<body>
	<!-- <a href="adduser.jsp">Add User</a>
	<a href="ViewAccountServlet">View User</a> -->
<div class="head">	
<ul>
<li><a href="admin.jsp">HOME</a></li>
<li><a href="logout.jsp">LOGOUT</a></li>
</ul>
	</div>
	<div class="form">
	<center>
	<img src="icon.png" style="border-radius:500px;margin-top:-40px " width="90" height="90" >
	<br><br><br>
		<form action="CreateAccountServlet" method="post">
			
<input type="text" onchange="validateUsername('fname')" id="fname" name="fname" placeholder="First Name"
						required><br><br>
<input type="text" name="lname" placeholder="Last Name"
						required><br><br>
<input type="date" name="dob" required ><br><br>
<input type="radio" name="g" value="male" required>Male
<input type="radio" name="g" value="female" required>Female<br><br>
<input type="text" name="address" required placeholder="Address">  <br><br>
<input type="number" name="mobile" onchange="validatePhone('mob')" id="mob" placeholder="Mobile Number" required /><br><br>
<input type="email" name="mail" onchange="ValidateEmail('mail')" id="mail" placeholder="Email ID" required />	<br><br>	
<input type="text" name="acno" onchange="validatePhone('acc')" id="acc" placeholder="Account Number" required /><br><br>
<input type="text" name="card" onchange="validatePhone('card')" id="card" placeholder="Card Number" required /><br><br>
<input type="text" name="fid" placeholder="Finger ID" required /><br><br>
<input type="submit" style="background-color:darkorange " value="REGISTER">
			
			
		</form>
		<%
			if(request.getAttribute("res")!=null){
				out.println(request.getAttribute("res")); 
			}
		%>
		<div style="color: red;" id="error"></div>
		</center>
	</div>

</body>
</html>