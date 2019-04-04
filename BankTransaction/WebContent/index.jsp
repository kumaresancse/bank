<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>bank</title>
<style>
body {
	background-image: url('home.png' );
	background-size: cover;
	background-repeat: no-repeat;
	background-position: top;
}

.par {
	background: inherit;
	width: 100%;
}

.menu {
	width: 100%;
	height: 200px;
	margin-top: 150px;
}

.menu ul {
	list-style: none;
	margin-left: 10%;
}

.menu ul li {
	width: 25%;
	height: 200px;
	float: left;
	text-align: center;
	line-height: 200px;
	margin-left: 20px;
	font-size: x-large;
	color: white;
}

a {
	text-decoration: none;
	color: inherit;
}

.menu ul li:hover {
	border: 1px solid;
	color: darkorange;
	background-color: white;
	opacity: .7;
	border-radius: 20px;
}

.image {
	width: 70%;
	height: 300px;
	margin-left: 190px;
	border-radius: 20px;
}
</style>
</head>
<body>
	<div class="par">
		<div class="menu">
			<ul>
				<li><a href="index.jsp">Home</a></li>
				<li><a href="transaction.jsp">Transaction</a></li>
				<li><a href="login.jsp">Admin</a></li>
			</ul>
		</div>
	</div>
</body>
</html>