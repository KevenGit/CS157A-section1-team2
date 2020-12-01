<%  // Check if user logged in (username and accountId should be set after logging in).
	// If user is Seller, phone is set
    String username = (String) session.getAttribute("username");     //username is in fact the account email
    long userId = (Long) session.getAttribute("userId");   //the account id
    String phone = (String) session.getAttribute("phone");
    String loginLink = "<a href=\"logout.jsp\">Logout</a>";
    String postLink = "<a href=\"createPosting.jsp\">Post</a>";
    if (username == null) {
        loginLink = "<a href=\"account.jsp\">Login</a>";
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