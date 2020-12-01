<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.cs157a.evendor.model.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>eVendor Search</title>
<link rel="stylesheet" href="css/search-style.css">
<script src="js/selector.js"></script>
</head>
<body>
	<div class="search-form-wrapper">
		<h1>Search For Postings</h1>
		<form id="search-form" action="postings" method="POST">
			<input type="text" name="search" placeholder="Search ...">
			<button type="submit" name="submit" value="search">Search</button>

			<br>

			<div class="selector-wrapper">
				Category <select name="category" id="category">
					<option value="None">Select a Category</option>
				</select> Region <select name="region" id="region">
					<option value="None">Select a Region</option>
				</select> Price <select name="price" id="price">
					<option value="Any">Price Range</option>
					<option value="0.0-9.99">$0 - $10</option>
					<option value="10.0-29.99">$10 - $30</option>
					<option value="30.0-59.99">$30 - $60</option>
					<option value="60.0-99.99">$60 - $100</option>
					<option value="100.0-10000.00">$100 and over</option>
				</select>
			</div>
		</form>

		<table class="search-result-table">
			<%
			List<Posting> postings = (List<Posting>) request.getAttribute("result");
						
			if (postings != null) {
				out.println("<thead>\n" +
							"<tr>\n" +
							"<th>Thumbnail</th>\n" +
							"<th>Title</th>\n" +
							"<th>Price</th>\n" +
							"</tr>\n" +
							"</thead>");
				
		    	out.println("<tbody>");
		        for (Posting p : postings) {
		        	out.println("<tr>");
		        	out.println("<td>" + p.getRegion() + "</td>");
		        	out.println("<td><a href=\"page?post-id=" + p.getId() + "\">" + p.getTitle() + "</a></td>");
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