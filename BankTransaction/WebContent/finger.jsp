<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>finger</title>
<style>
body{
background-image:url('Fingerprint.jpg' ); 
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
   
 	
}






</style>
<script type="text/javascript">
	var request;
	function nameVal() {
		alert("hello");
	}
	function sendInfo(card,fn) {
	try{
		var cardValue = document.getElementById(card).value;
		var fingerValue = document.getElementById(fn).value;
		var url = "FingerControl?card="+cardValue+"&finger="+fingerValue;
		
		if (window.XMLHttpRequest) {
			request = new XMLHttpRequest;
		} else if (window.ActiveXObject) {
			request = new ActiveXObject("Microsoft.XMLHTTP");
		}
		try {

			request.onreadystatechange = getInfo;
			request.open("GET",url,true);
			request.send();

		} catch (e) {
			alert(e);
		}
	}catch (e) {
		alert(e);
	}
	}
	function getInfo() {
		if (request.readyState === 4) {
				var res = request.responseText;
				if(res!="not"){
					
					document.getElementById("button").disabled=false;
				}else{
					document.getElementById("button").disabled=true;
				}
		}
	}
</script>
</head>
<body>
	<%
		String card = (String) request.getAttribute("cardNumber");
	%>
	<div class=tot><center>
		<form action="ValidFinger" method="post" autocomplete="off">
			<br><br><br>
			<H2 style="color:darkorange ">SCAN FINGERPRINT</H2>
			<br>
			<input type="hidden" value="<%=card%>" id="card" name="card">
			<input type="text" value="" name="finger" id="finger" onkeyup ="sendInfo('card','finger')" /><br>
		<br>	<input type="submit" value="Submit" id="button" disabled>
		</form></center>
	</div>
</body>
</html>





