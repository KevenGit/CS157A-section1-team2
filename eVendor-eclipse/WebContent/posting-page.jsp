<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.cs157a.evendor.model.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title><%= ((Posting)request.getAttribute("posting")).getTitle() %></title>
	<link rel="stylesheet" href="css/style.css">
</head>

<body>
	<%
		List<Suite> suites = (List<Suite>) request.getAttribute("suites");
		
		for (Suite s : suites) {
			out.println("<h1>" + s.getHeading() + "</h1>");
			out.println("<img src=\"" + s.getImgPath() + "\">");
			out.println("<p>" + s.getParagraph() + "</p>");
		}
	%>
	
	<footer>
		<%
			Seller seller = (Seller) request.getAttribute("seller");
			out.println(seller.getFirstName() + " " + seller.getLastName() + "<br>" +
						seller.getEmail() + "<br>" +
						seller.getPhone());
		%>
	</footer>
	
</body>
</html>