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
<link rel="stylesheet" href="style.css">
</head>
<body>
	<div class="search-form-wrapper">
		<h1>Search For Postings</h1>
		<form id="search-form" action="/postings/search" method="POST">
			<input type="text" name="search" placeholder="Search ...">
			<button type="submit" name="submit">Search</button>

			<br>

			<div class="selector-wrapper">
				Category <select name="category" id="category">
					<option value="None">Select a Category</option>
				</select> Region <select name="region" id="region">
					<option value="None">Select a Region</option>
				</select> Price <select name="price" id="price">
					<option value="Any">Price Range</option>
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
		        	out.println("<td><a href=\"SuiteServlet?id=" + p.getId() + "\">" + p.getTitle() + "</a></td>");
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