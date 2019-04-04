<%@page import="bean.CurrentBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>home</title>
<script type="text/javascript">
	function accountValidate() {
		var facc = document.getElementById('accno').value;
		var sacc = document.getElementById('raccno').value;
		if(facc===sacc){
			document.getElementById('raccno').value="";
			document.getElementById('err').innerHTML="Enter valid Account No!!!";
			return false;
		}else{
			return true;
		}
		
	}
	
</script>
<style>
body{
background-image:url("123.jpg" );  
background-size:cover;
background-repeat:no-repeat;
background-position:top; 
}

.tot{
width:35%;
height:350px;
color:white;
background-color:black; 
margin-left:32.5%;
margin-top:200px;  
border-radius:20px; 
opacity:.6;
border:2px solid ;
border-color:darkorange; 

z-index: -1;

   }

input[type=text]{
height:30px;
width:250px;
border-radius:10px;  
text-align:center;
   opacity:.9;
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
   opacity: 1.5;
 	
}

#err{
color: red;
font-size: 20px;
}

.f{
z-index: 1;
background:inherit;
}

</style>
</head>
<body>
<div class="tot">
	<%
		CurrentBean bean = (CurrentBean) session.getAttribute("user");
		if (bean == null) {
			response.sendRedirect("index.jsp");
		}
	%>
	<p style="color:darkorange; font-size:x-large;  ">
		Hello
		<%=bean.getName()%></p>
		
	<div class="f">	
	<form action="TransactionServlet" method="post" autocomplete="off">
		<table style="margin-top:-18px ">
			<tr>
				<td>Your Current Balance</td>
				<td><input type="text" value="<%=bean.getAmount()%>" readonly="readonly"></td>
			</tr>
			<tr>
				<td>Your Account Number</td>
				<td><input type="text" id="accno" value="<%=bean.getAccNum()%>"
					name="accno" readonly="readonly"></td>
			</tr>
		
		<tr><td style="color:darkorange;font-size: x-large;">Recipient Details</td></tr>
		
			<tr>
				<td>Name</td>
				<td><input type="text" name="rname" required></td>
			</tr>
			<tr>
				<td>Account Number</td>
				<td><input type="text" id="raccno" name="raccno" onchange="accountValidate()" required></td>
			</tr>
			<tr>
				<td>Enter Amount</td>
				<td><input type="text" name="tamount" required> </td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="Submit" > </td>
			</tr>
		</table>
	</form><div>
	<p id="err"></p></div>
	<%
	String res = (String)request.getAttribute("res");
	if(res!=null ){
		%>
<div style="opacity:1.0; margin-top:-420px;text-align:center;opacity:none;  "><strong><p style="color:red;font-size:xx-large"><%=res%></p></strong></div>
		<% 
	}
	
	%>
</div></div>
</body>
</html>