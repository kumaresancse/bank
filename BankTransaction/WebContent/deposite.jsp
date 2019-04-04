<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>deposit</title>
</head>
<style>
body{
background-image:url('dep.jpg' ); 
background-size:cover;
background-repeat:no-repeat;
background-position:top; 

}
.body{
width:60%;
height:400px;  

margin-left:20%; 	 
margin-top:170px; 
border:2px solid ;
border-color:darkorange; 
}
.right{
width:50%; 
height:400px;
margin-left:50%;
margin-top:-421px; 
background-color:black;  
opacity:.6; 
color:white; 
}
.left{
width:50%; 
height:400px;
background-color:green; 

}
input[type=text]{
height:30px;
width:250px;
border-radius:10px;  
text-align:center;
  margin-left:70px;  
  background-color:black;
  opacity:.7;  
  font-family:cursive; 
  color:white; 
}
input[type=submit]{

height:40px;
width:255px;
background-color:darkorange; 
border-radius:10px;  
 margin-left:70px;  
 	
}

</style>

<body>

<div class="body">
<div class=left>
<img src="final.jpg" width="100%" height="100%">
</div>
<div class=right>
<h1 style="text-align:center; line-height:150px;font-family:cursive;  ">Credit Account</h1>
<form action="DepositServlet" method="post" autocomplete="off">
		<table><center>
			<tr>
		
				<td><input type="text" name="accno" placeholder="Account Num" required >  </td>
			</tr>
			<tr>
				
				<td><input type="text" name="amount" placeholder="Amount" required> </td>
			</tr>
			<tr>
				<td><input type="submit" value="Submit"> </td>
			</tr></center>
		</table>
		
	</form>
	<a href="admin.jsp" style="color: white;">Back to Home</a>
	<%
	String res = (String)request.getAttribute("res");
	if(res!=null){
		%>
		<p style="color: red;"><%=res %></p>
		<% 
	}
	%>
</div>

</div>

</body>
</html>