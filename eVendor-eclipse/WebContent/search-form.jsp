<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.cs157a.evendor.model.*" %>

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
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>eVendor Search</title>
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
	<div class="search-form-wrapper">
		<div class="search-form-box">
			<h1>Search For Postings</h1>
			<form id="search-form" action="postings" method="POST">
				<input type="text" name="search" placeholder="Search ...">
				<button type="submit" name="submit" value="search-posting">Search</button>
	
				<br>
	
				<label for="category">Category</label> 
				<select name="category" id="category">
					<option value="None">Select a Category</option>
				</select>
					
				<label for="region">Region</label>
				<select name="region" id="region">
					<option value="None">Select a Region</option>
				</select>
					
				<label for="price">Price</label>
				<select name="price" id="price">
					<option value="Any">Price Range</option>
					<option value="0.0-9.99">$0 - $10</option>
					<option value="10.0-29.99">$10 - $30</option>
					<option value="30.0-59.99">$30 - $60</option>
					<option value="60.0-99.99">$60 - $100</option>
					<option value="100.0-10000.00">$100 and over</option>
				</select>
			</form>
		</div>
		
		<table class="search-result-table">
			<%
			List<Posting> postings = (List<Posting>) request.getAttribute("result");
						
			if (postings != null) {
				out.println("<thead>\n" +
							"<tr>\n" +
							"<th>Title</th>\n" +
							"<th>Region</th>\n" +
							"<th>Category</th>\n" +
							"<th>Price</th>\n" +
							"</tr>\n" +
							"</thead>");
				
		    	out.println("<tbody>");
		        for (Posting p : postings) {
		        	out.println("<tr>");
		        	out.println("<td><a href=\"page?post-id=" + p.getId() + "\">" + p.getTitle() + "</a></td>");
		        	out.println("<td>" + p.getRegion() + "</td>");
		        	out.println("<td>" + p.getCategory() + "</td>");
		        	out.println("<td>" + p.getPrice() + "</td>");
		        	out.println("</tr>");
		        }
		        
		        out.println("</tbody>");
			}
			%>
		</table>
	</div>
</body>
</html>