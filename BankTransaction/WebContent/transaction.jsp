<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>transaction</title>
<script type="text/javascript">
	var request;

	function sendInfo(id) {

		var url = "UserProfile?id=" + id;

		if (window.XMLHttpRequest) {
			request = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			request = new ActiveXObject("Microsoft.XMLHTTP");
		}
		try {

			request.onreadystatechange = getInfo;
			request.open("GET", url, true);
			request.send();

		} catch (e) {
			alert(e);
		}

	}

	function getInfo() {
		if (request.readyState == 4) {
			var v = request.responseText;
			if (v != 'Invalid Card Number') {
				document.getElementById("card").disabled=true;     //disable
				document.getElementById("user").innerHTML = "Welcome " + v;
				document.getElementById("otpdiv").style.display = "block";
			} else {
				document.getElementById("user").innerHTML = v;
				document.getElementById("otpdiv").style.display = "none";
			}
		}

	}
	function checkLenth(id) {
		var val = document.getElementById(id).value;
		var stat = document.getElementById('status');
		if (val.length != 10) {
			stat.innerHTML = val + 'Enter valid Number' + val.length;
			document.getElementById("otpdiv").style.display = "none";
			document.getElementById("user").innerHTML = "";
		} else {
			var validNumber = document.getElementById(id).value;
			document.getElementById('cno').value = validNumber;
			stat.innerHTML = '';
			sendInfo(val);
		}
	}
</script>

<style>
body{
background-image:url('card.jpg' ); 
background-size:cover;
background-repeat:no-repeat;
background-position:top; 

}
.tot{
width:30%;
height:350px;
color:white;
background-color:black; 
margin-left:35%;
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
  margin-left:50px;  
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
 margin-left:120px;  
 	
}
input[type=number]{
height:30px;
width:240px;
border-radius:10px;  
text-align:center;
  margin-left:0px;  
  background-color:black;
  opacity:.7;  
  font-family:cursive; 
  color:white; 
}
#user1{
color: red;
font-size: 20px;
opacity: 1.0;
z-index: -1;

}
#user{
z-index: 1;
}
	
</style>

</head>
<body><div class=tot>
<p style="text-align: center;">Enter Your Card Here...</p>
	<div class="head">
		 &nbsp;&nbsp;Enter Card Number: <input type="number" autocomplete="off"  name="card"
			onkeyup="checkLenth('card')" id="card" />
		<div id="status"></div>
	</div>
	<div>
		<p style="display: inline-block;color: red;" id="user"></p>
		<div id="otpdiv" style="display: none;">
			<form action="ValidateServlet" method="post" >
				<input type="hidden" value="" name="cno" id="cno"  > Enter
				OTP: <input type="text" name="otp" id="otp" autocomplete="off" required><br /><br>
				<input type="submit" value="Submit">
			</form>
		</div>
	</div></div>
</body>
</html>