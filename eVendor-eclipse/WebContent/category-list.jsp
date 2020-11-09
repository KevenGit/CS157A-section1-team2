<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
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
				<li><a href="index.html">Home</a></li>
				<li><a href="category.html">Category</a></li>
				<li><a href="">About</a></li>
				<li><a href="posting.jsp">Post</a></li>
				<li><a href="account.html">Login</a></li>
				
			</ul>
		</nav>
	</div>

	</div>
	</div> 
	<%
		String category = (String) request.getAttribute("category");
		out.println("<h3>" + category.toUpperCase() + "</h3>");
		
		out.println("<table style=\"width:100%\">");
		
		List<Map<String, Object>> result = (List) request.getAttribute("result");
		
    	out.println("<tr>");
    	out.println("<th>Title</th>");
    	out.println("<th>Price</th>");
    	out.println("<th>Region</th>");
    	out.println("</tr>");
		
        for (Map<String, Object> t : result) {
        	out.println("<tr>");
        	out.println("<td>" + t.get("title") + "</td>");
        	out.println("<td>" + t.get("price") + "</td>");
        	out.println("<td>" + t.get("region") + "</td>");
        	out.println("</tr>");
        }
        
		out.println("</table>");
	%>
</body>
</html>