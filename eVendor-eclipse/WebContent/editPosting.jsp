<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.cs157a.evendor.model.*" %>
<%@ page import="com.cs157a.evendor.util.*" %>

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
<% List<Suite> suites = (List<Suite>) request.getAttribute("suites"); %>
<%! int index = 0; %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title><%= posting.getTitle() %></title>
	<link rel="stylesheet" href="css/style.css">
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
	<div class="viewPosting-wrapper">
		<div class="viewPosting-header">
			<div class="contacts">
	            <ul>
	                <li id="contact">Contact:</li>
	                <li><%= seller.getFirstName() + " " + seller.getLastName() %></li>
	                <li><%= seller.getEmail() %></li>
	                <li><%= seller.getPhone() %></li>
	            </ul>
            </div>
        </div>
	<%
		for (Suite s : suites) {
			out.println("<div class=\"viewPosting-suite\">");
            out.println(
            	"<form action=\"page\" method=\"POST\">\n" +
           			"<input type=\"hidden\" name=\"suite-id\" value=" + s.getId() + ">\n" +
           			"<input type=\"hidden\" name=\"post-id\" value=" + posting.getId() + ">\n" +
            		"<button type=\"submit\" name=\"action\" value=\"delete-suite\">Delete</button>\n" +
        		"</form>");
			out.println("<h1>" + s.getHeading() + "</h1>");
			out.println("<img src=\"" + Utils.getImageDir() + s.getImgPath() + "\">");
			out.println("<p>" + s.getParagraph() + "</p>");
			out.println("</div>");
			index = s.getIndex();
		}
	%>
	
		<div class="form">
            <h3>Create a New Suite</h3>
            <form id="suite-form" action="upload" method="POST" enctype="multipart/form-data">
                Heading <br>
                <input type="text" name="heading" placeholder="New Heading...">
    
                <br> Img <br>
                <input type="file" name="file">

                <br> Desc. <br>
                <textarea name="desc" form="suite-form"></textarea>

                <input type="hidden" name="index" value=<%= index + 1 %>>
                <input type="hidden" name="post-id" value=<%= posting.getId() %>>
                <button type="submit" name="action" value="create-suite">Create</button>
            </form>
        </div>
	</div>	
</body>
</html>