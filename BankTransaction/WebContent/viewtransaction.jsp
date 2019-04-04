<%@page import="bean.TransactionBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>view transaction</title>
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
    opacity:.8;
    text-align:center;  }

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
</head>
<body>
<a href="admin.jsp" style="color: white;">Back to Home</a>
<div class=point>
<table class=first>
	<tr>
		<th>From AC NO</th>
		<th>To AC NO</th>
		<th>Amount</th>
		<th>Transaction Time</th>
	</tr>
	<%
		ArrayList<TransactionBean> al = (ArrayList<TransactionBean>) request.getAttribute("transaction");
		for(TransactionBean bean : al){
			%>
			<tr>
				<td><%=bean.getSender() %></td>
				<td><%=bean.getReceiver() %></td>
				<td><%=bean.getAmount() %></td>
				<td><%=bean.getCurrentTime() %></td>
			</tr>
			<% 
		}
	%>
	</table>
</div>
</body>
</html>