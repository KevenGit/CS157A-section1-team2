<%  // Check if user logged in (username and accountId should be set after logging in.
    String username = (String) session.getAttribute("username");     //username is in fact the account email
    long userId = (Long) session.getAttribute("userId");   //the account id
    String loginLink = "<a href=\"logout.jsp\">Logout</a>";
    if (username == null) {
        loginLink = "<a href=\"account.jsp\">Login</a>";
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
	<div class="header">	
	<div class="container">
	<div class = "navbar"> 
		<div class = "logo">
		<img src="images/logo.png" width="125px">		
		</div>
		<nav>
			<ul>
				<li><a href="index.jsp">Home</a></li>
				<li><a href="category.html">Category</a></li>
				<li><a href="posting.jsp">Post</a></li>
				<li><a href="userAccount.jsp">Account</a></li>
				<li><%=loginLink%></li>
				
			</ul>
		</nav>
	</div>
	<div class="row">
		<div class="col-2">
			<h1>Give Your Life <br>A New Style!</h1>
			<p>eVendor, your choice. </p>			
		</div>		
	</div>
	</div>
	</div> 
	
	

</body>
</html>