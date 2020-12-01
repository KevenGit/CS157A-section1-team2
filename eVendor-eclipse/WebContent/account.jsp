<%
	String status = request.getParameter("status");
	String msg = "";
	if (status != null) {
	     msg = "<p align=\"center\">" + status +"</p><br>";
	}
%>

<%  // Check if user logged in (username and accountId should be set after logging in.
    // If user is Seller, phone is set
    String username = (String) session.getAttribute("username");
    long userId = (Long) session.getAttribute("userId");   //the account id
    String phone = (String) session.getAttribute("phone");
    String loginLink = "<a href=\"logout.jsp\">Logout</a>";
    String postLink = "<a href=\"createPosting.jsp\">Post</a>";
    if (username == null) {
        loginLink = "<a href=\"account.jsp\">Login</a>";
    } else {
        response.sendRedirect("index.jsp");
    }
    
    if (phone == null) {
    	postLink = "<a href=\"account.jsp\">Post</a>";
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
			<ul>
				<li><a href="index.jsp">Home</a></li>
				<li><a href="search-form.jsp">Search</a></li>
				<li><%=postLink %></li>
				<li><a href="userAccount.jsp">Account</a></li>
				<li><%=loginLink%></li>	
			</ul>
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
			
			<form id="LoginForm" action = "login.jsp" method = "post">
				<input type="text" placeholder="Username" name = "login_username">
				<input type="password" placeholder="Password" name = "login_password">
				<button type="submit" class="btn" >Login</button>
				<a href="">Forget password</a>
			</form>
						
			<form id="RegForm" action = "register.jsp" method = "post">
				<input type="text" placeholder="Username" name = "regis_username">
				<input type="text" placeholder="First Name" name = "regis_first_name"> 
				<input type="text" placeholder="Last Name" name = "regis_last_name"> 
				<input type="email" placeholder="Email" name = "regis_email">
				<input type="password" placeholder="Password" name = "regis_password">
				<button type="submit" class="btn">Register</button>
				
			</form>
		</div>					
	</div>
	
	
	<!-- js for account login/register -->
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