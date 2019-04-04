<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>admin</title>
<style>
body{
background-image:linear-gradient(rgba(0,0,0,0.5),rgba(0,0,0,0.5)), url("image2.jpg" ); 
background-repeat:no-repeat;
background-size:cover;
background-position:center;
 }
.menu{
margin-top:100px;
width:100%;
height:100vh;  
}
.menu ul{
margin-left:12.5%;
list-style:none;  
}
.menu ul li{
width:75%;
height:60px;  
text-align:center; 
line-height:60px;
border-radius:20px;

margin:20px; 
border-color:white;
color:black; 
background-color:white; 
opacity:.6; 
}
a{
text-decoration:none; 
color:inherit; 
}
.menu ul li:hover{
background-color:darkorange;
  color:white; 
  
}

</style>

</head>
<body>
<div class="menu">
<ul>
<li><a href="admin.jsp">Home</a></li>
<li><a href="adduser.jsp">Create Account</a></li>
<li><a href="ViewAccountServlet">View Accounts</a></li>
<li><a href="deposite.jsp">Deposit</a></li>
<li><a href="ViewTransactionServlet">View Transaction</a></li>
<li><a href="close.jsp">Close Account</a></li>
<li><a href="logout.jsp">Logout</a> </li>
</ul></div>
</body>
</html>