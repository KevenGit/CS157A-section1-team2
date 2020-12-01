
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.cs157a.evendor.model.*"%>

<% Posting posting = (Posting) request.getAttribute("posting"); %>
<% Seller seller = (Seller) request.getAttribute("seller"); %>


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

<!DOCTYPE html>
<html>
<head>
<title>purchase page</title>
<link rel="stylesheet" href="css/purchaseStyle.css">
</head>


<body class="posting-form">

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


	<!--The form -->
	<div class="posting-form">
		<h3>Order details</h3>

		<ul>
			<li id="seller-detail">Seller information</li>
			<li><%= seller.getFirstName() + " " + seller.getLastName() %></li>
			<li><%= seller.getEmail() %></li>
			<li><%= seller.getPhone() %></li>
			<li><%= posting.getPrice() %></li>
		</ul>

	</div>

	<div class="buyer-form">
		<h3>Buyer Information</h3>
		<form id="purchasing-form" action="#" method="post">
			<!-- need to configure the action href -->
			<input type="text" placeholder="address"> <br> Quantity
			<select name="quantity" id="quantity">
				<option value="Any">select number</option>
				<option value="1"></option>
				<option value="2"></option>
				<option value="3"></option>
				<option value="4"></option>
				<option value="5"></option>
			</select>
		</form>
		<button type="submit" name="submit" value="purchase">Purchase</button>
	</div>



</body>
</html>
<jsp:include page="footer.html" />