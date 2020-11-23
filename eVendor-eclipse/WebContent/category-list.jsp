<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.cs157a.evendor.model.*" %>
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
		out.println("<h1>" + category.toUpperCase() + "</h1>");
		
		out.println("<table class=\"cat-list-table\">");
		
		List<Posting> postings = (List<Posting>) request.getAttribute("result");
		
    	out.println("<thead>\n<tr>");
    	out.println("<th>Title</th>");
    	out.println("<th>Price</th>");
    	out.println("<th>Region</th>");
    	out.println("</tr>\n</thead>");
		
    	out.println("<tbody>");
        for (Posting p : postings) {
        	out.println("<tr>");
        	out.println("<td><a href=\"SuiteServlet?id=" + p.getId() + "\">" + p.getTitle() + "</a></td>");
        	out.println("<td>" + p.getPrice() + "</td>");
        	out.println("<td>" + p.getRegion() + "</td>");
        	out.println("</tr>");
        }
        
        out.println("</tbody>");
		out.println("</table>");
	%>
</body>
</html>