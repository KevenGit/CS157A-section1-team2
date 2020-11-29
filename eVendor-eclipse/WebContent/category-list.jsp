<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<%  // Check if user logged in (username and accountId should be set after logging in.
    String username = (String) session.getAttribute("username");     //username is in fact the account email
    String accountId = (String) session.getAttribute("userId");   //the account id
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
				<li><a href ="userAccount.jsp">Account</a></li>
				<li><a href="posting.jsp">Post</a></li>
				<li><%=loginLink%></li>
				
			</ul>
		</nav>
	</div>

	</div>
	</div> 
	<%
		String category = (String) request.getAttribute("category");
		out.println("<h1>" + category.toUpperCase() + "</h1>");
		
		out.println("<table class=\"cat-list-table\">");
		
		List<Map<String, Object>> result = (List) request.getAttribute("result");
		
    	out.println("<thead>\n<tr>");
    	out.println("<th>Title</th>");
    	out.println("<th>Price</th>");
    	out.println("<th>Region</th>");
    	out.println("</tr>\n</thead>");
		
    	out.println("<tbody>");
        for (Map<String, Object> t : result) {
        	out.println("<tr>");
        	out.println("<td>" + t.get("title") + "</td>");
        	out.println("<td>" + t.get("price") + "</td>");
        	out.println("<td>" + t.get("region") + "</td>");
        	out.println("</tr>");
        }
        
        out.println("</tbody>");
		out.println("</table>");
	%>
</body>
</html>