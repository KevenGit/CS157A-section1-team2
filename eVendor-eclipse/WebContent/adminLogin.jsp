<%
	String status = request.getParameter("status");
	String msg = "";
	if (status != null) {
	     msg = "<p align=\"center\">" + status +"</p><br>";
	}
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>eVendor</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>

	<!-- Header -->
	<div class="header">	
	<div class="container">
	<div class = "navbar"> 
		<div class = "logo">
		<img src="images/logo.png" width="125px">		
		</div>
		<nav>
			<ul><p>Admin Only</p></ul>
		</nav>
	</div></div></div>
	
	<!-- account page -->
<%=msg%>
	<div class="account-page">
		<div class="form-container">
			<div class="form-btn">
				<span onclick="login()">Login</span>
				<span onclick="register()">Register</span>
				<hr id="formIndicator">
			</div>
			
			<form id="LoginForm" action = "adminLoginProcessing.jsp" method = "post">
				<input type="text" placeholder="Username" name = "admin_login_username">
				<input type="password" placeholder="Password" name = "admin_login_password">
				<button type="submit" class="btn">Login</button>
			</form>
						
			<form id="RegForm" action = "adminRegisterProcessing.jsp" method = "post">
				<input type="text" placeholder="Username" name = "admin_regis_username">
				<input type="text" placeholder="First Name" name = "admin_regis_first_name"> 
				<input type="text" placeholder="Last Name" name = "admin_regis_last_name"> 
				<input type="password" placeholder="Password" name = "admin_regis_password">
				<button type="submit" class="btn">Register</button>
				
			</form>
		</div>					
	</div>
	
	
	<!-- for account login/register -->
	<script>
	var loginForm = document.getElementById("LoginForm");
	var regForm = document.getElementById("RegForm");
	var indicator = document.getElementById("formIndicator");
	
		function register(){
			regForm.style.transform="translateX(0px)";
			loginForm.style.transform="translateX(0px)";
			indicator.style.transform="translateX(100px)";
		}
		
		function login(){
			regForm.style.transform="translateX(300px)";
			loginForm.style.transform="translateX(300px)";
			indicator.style.transform="translateX(0px)";
		}
	</script>

</body>
</html>