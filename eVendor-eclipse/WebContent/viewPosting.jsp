<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.cs157a.evendor.model.*" %>

<% Posting posting = (Posting) request.getAttribute("posting"); %>
<% Seller seller = (Seller) request.getAttribute("seller"); %>
<% List<Suite> suites = (List<Suite>) request.getAttribute("suites"); %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title><%= posting.getTitle() %></title>
	<link rel="stylesheet" href="css/editPost-style.css">
</head>

<body>
	<div class="viewPosting-wrapper">
		<div class="viewPosting-header">
            <ul>
                <li id="contact">Contact:</li>
                <li><%= seller.getFirstName() + " " + seller.getLastName() %></li>
                <li><%= seller.getEmail() %></li>
                <li><%= seller.getPhone() %></li>
            </ul>

            <div class="buttons">
                <form action="#" method="GET">
                    <input type="hidden" name="post-id" value=<%= posting.getId() %>>
                    <input type="hidden" name="user-id" value=2>
                    <input type="submit" name="submit" value="flag">
                    <input type="submit" name="submit" value="favorite">
                </form>
            </div>
        </div>
	<%
		for (Suite s : suites) {
			out.println("<div class=\"viewPosting-suite\">");
			out.println("<h1>" + s.getHeading() + "</h1>");
			out.println("<img src=\"" + s.getImgPath() + "\">");
			out.println("<p>" + s.getParagraph() + "</p>");
			out.println("</div>");
		}
	%>
	</div>	
</body>
</html>