<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.cs157a.evendor.model.*"%>

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

<% Posting posting = (Posting) request.getAttribute("posting"); %>
<% Seller seller = (Seller) request.getAttribute("seller"); %>

<!DOCTYPE html>
<html>
<head>
<title>purchase page</title>
<link rel="stylesheet" href="css/style.css">
</head>


<body>

	<!-- Header -->
	<div class="header">
		<div class="container">
			<div class="navbar">
				<div class="logo">
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
		</div>
	</div>

	<div class="purchase-wrapper">
	<!--The form -->
		<div class="purchase-formbox">
			<h3>Order Details</h3>
	
			<h4>Seller</h4>
			<ul>
				<li><%= seller.getFirstName() + " " + seller.getLastName() %></li>
				<li><%= seller.getEmail() %></li>
				<li><%= seller.getPhone() %></li>
			</ul>
			
			<h4>Posting</h4>
            <ul>
                <li><%= posting.getTitle() %></li>
                <li><%= posting.getPrice() %></li>
            </ul>
	
			<h3>Enter Information</h3>
			<form id="purchasing-form" action="order" method="post">
				<!-- need to configure the action href -->
				<h4>Address</h4>
				<input type="text" name="addr" placeholder="address"> <br>
				<h4>Quantity</h4>
				<select name="quantity" id="quantity">
					<option value=1>1</option>
					<option value=2>2</option>
					<option value=3>3</option>
					<option value=4>4</option>
					<option value=5>5</option>
				</select>
				
				<input type="hidden" name="post-id" value=<%= posting.getId() %>>
				<input type="hidden" name="seller-id" value=<%= seller.getId() %>>
				<input type="hidden" name="user-id" value=<%= Math.toIntExact(userId) %>>
				<input type="hidden" name="price" value=<%= posting.getPrice() %>>
				<button type="submit" name="action" value="purchase">Purchase</button>
			</form>
		</div>
	</div>


</body>
</html>