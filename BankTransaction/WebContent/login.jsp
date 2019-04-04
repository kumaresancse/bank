<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
body{
background-image:url("mmm.png" );  
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
opacity:.5;
border:2px solid ;
border-color:darkorange;    }

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





</style>
</head>

<body>
<div class="tot"><center>
<img src="ico.png" width="120px" height="120px" style="margin-top:-50px;">
<h2 style="color:white">ADMIN LOGIN</h2>
<br>
<form onsubmit="" action="LoginServlet" method="post">
<input type="text" name="un" placeholder="UserName" ><br><br>
<input type="text" name="pass" placeholder="Password" ><br><br>
<input type="submit" name="submit" value="SUBMIT">
</form></center>
</div>
</body>
</html>