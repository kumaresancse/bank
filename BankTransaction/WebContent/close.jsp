<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>close</title>
<style>
body{
background-image:url('dep.jpg' ); 
background-size:cover;
background-repeat:no-repeat;
background-position:top; 

}
.head{
width:30%;
height:350px;
color:white;
background-color:black; 
margin-left:35%;
margin-top:200px;  
border-radius:20px; 
opacity:.6; }

input[type=text]{
height:30px;
width:250px;
border-radius:10px;  
text-align:center;
  margin-left:75px;  
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
 margin-left:75px;  
 	
}

</style>
</head>
<body>
<div class="head">
<h1 style="text-align:center; line-height:100px;font-family:cursive;  ">Delete Account</h1>
<form action="CloseAccount" method="post" autocomplete="off">
<table>
	<tr>
	
		<td><input type="text" name="accno" placeholder="Account Num" /> </td>
	</tr>
	<tr>
		
		<td><input type="submit" value="Delete Account" > </td>
	</tr>

</table>
</form>
<a href="admin.jsp" style="color: white;">Back to Home</a>
<%
	String res = (String)request.getAttribute("res");
	if(res!=null){
		%>
		<p><%=res %></p>
		<%
	}

%>
</div>
</body>
</html>