<%@page import="java.util.Map"%>
<%@page import="bean.AccountBean"%>
<%@page import="bean.UserBean"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
body {
	background-image:linear-gradient(rgba(0,0,0,0.5),rgba(0,0,0,0.5)), url('final.jpg' ); 
	background-size:cover;
background-repeat:no-repeat;
background-position:top; 
}
  table {
    
    border-collapse: collapse;
    width: 100%;color:white; 
}

td, th {
    
    text-align: left;
    padding: 8px;
}
th{
 background-color:menu; 
   color:black;  
   text-align:center; 
}
td{
 background-color:black;    
    opacity:.8; }

tr:nth-child(even) {
    background-color: #dddddd;
}
td:hover{
   border: 1px solid darkorange; 
    
}   
.point{
margin-top:70px; 
width:90%;
height:600px;
background-color:black;   
margin-left:5%; 
opacity:.7; 
border-radius:10px; 
}
.first{
margin-top:50px; 
}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>view user</title>


</head>
<body >
<a href="admin.jsp" style="color: white;">Back to Home</a>	
<div class="point"><br>
<table class="first"><thread>
<tr >

	<th >FirstName</th>
	<th>LastName</th>
	<th>DOB</th>
	<th>Gender</th>
	<th>Address</th>
	<th>Mobile</th>
	<th>Email</th>
	<th>Account Number</th>
	<th>Card Number</th>
	<th>Finger ID</th>
	<th>Account Balance</th>
</tr>
<%

	HashMap<String,UserBean> user =(HashMap<String,UserBean>) request.getAttribute("user");
	HashMap<String,AccountBean> account = (HashMap<String,AccountBean>)request.getAttribute("account");
	for(Map.Entry<String,UserBean> me : user.entrySet()){
		AccountBean accountBean = account.get(me.getKey());
		UserBean userBean = me.getValue();
		%>
		
		<tr >
		
		<td><%=userBean.getFirstName() %></td>
		<td><%=userBean.getLastName() %></td>
		<td><%=userBean.getDob() %></td>
		<td><%=userBean.getGender() %></td>
		<td><%=userBean.getAddress() %></td>
		<td><%=userBean.getMobile() %></td>
		<td><%=userBean.getEmail() %></td>
		<td><%=userBean.getAccNumber() %></td>
		<td><%=accountBean.getCardNumber() %></td>
		<td><%=accountBean.getFingerId() %></td>
		<td><%=accountBean.getAmount() %></td>
		</tr></thread>
		<% 
	}
%>
</table></div>
</body>
</html>