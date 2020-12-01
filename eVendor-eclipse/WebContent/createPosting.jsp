<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%  // Check if user logged in (username and accountId should be set after logging in.
    // If user is Seller, phone is set
    String username = (String) session.getAttribute("username");
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

<% request.setAttribute("sumbit", "create"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>eVendor Post</title>
<link rel="stylesheet" href="css/style.css">
<script src="js/selector.js"></script>
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
	
	<!-- Page -->
	<div class="createPosting-wrapper">
		<form id="createPosting-form" action="postings" method="GET">
			<div>
				<label for="title">Title</label><br> <input type="text"
					name="title" id="title" placeholder="Enter Title ..." required>
			</div>

			<div>
				<label for="category">Category</label><br> <select
					name="category" id="category" required>
					<option value="Other">Select a Category</option>
				</select>
			</div>

			<div>
				<label for="region">Region</label><br> <select name="region"
					id="region" required>
					<option value="None">Select a Region</option>
				</select>
			</div>

			<div>
				<label for="price">Price</label><br> <input type="number"
					name="price" id="price" min=0 step=0.01 required>
			</div>
			
			<input type="hidden" name="seller-id" value=<%= Math.toIntExact(userId) %>>
			<button type="submit" name="submit" value="create-posting">Create</button>
		</form>
	</div>
</body>
</html>