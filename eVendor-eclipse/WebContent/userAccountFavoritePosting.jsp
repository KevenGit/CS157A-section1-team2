

<%  
	String status = request.getParameter("status");
	String msg = "";
	if (status != null) {
	     msg = "<p align=\"center\">" + status +"</p><br>";
	}
	
	// Check if user logged in (username and accountId should be set after logging in.
    String username = (String) session.getAttribute("username");     //username 
    long userId = 0;
    if(session.getAttribute("userId") != null)
    	userId = (Long) session.getAttribute("userId");   //the account id
    String userFirstName = (String) session.getAttribute("first_name");
    String userLastName = (String) session.getAttribute("last_name");
    String userEmail = (String) session.getAttribute("email");
    String phone = (String) session.getAttribute("phone");
    
    String loginLink = "<a href=\"logout.jsp\">Logout</a>";
    String postLink = "<a href=\"createPosting.jsp\">Post</a>";
    if (username == null) {
    	response.sendRedirect("account.jsp");
    }
    
    if (phone == null) {
    	postLink = "<a href=\"account.jsp\">Post</a>";
    }
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.cs157a.evendor.model.*"%>
<%@ page import="com.cs157a.evendor.util.*"%>
<%@ page import="com.cs157a.evendor.dao.*"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>user's favorite posting page</title>
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
	
		<!-- We can assume that the user is logged in, first display a table of their basic info-->
	<table width="100%">
		<tr><td align="left"><b>Home of <%=userFirstName%> <%=userLastName%></b></td>
			<td align="left">Email: <%=userEmail%></td>
			<td align="right"><a href ='editProfile.jsp'>Edit Profile</a></td>
		</tr>
	</table>
	<hr>
	
	
		<%
		Connection conn = DbUtils.getConnection();

		String sql = "SELECT id, title, price FROM postings WHERE id IN (SELECT post_id FROM favorites WHERE favorites.user_id = ?)";

	    StringBuffer result = new StringBuffer();
	    result.append("<h3 align=\"center\">My Favorite Postings</h3>");
	    result.append("<br><table width=\"50%\" border=\"0\" align=\"center\">");
	    //column header
	    result.append("<tr bgcolor=\"aabbcc\"><td align=\"center\">Title</td><td>Price</td></tr>");
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, Math.toIntExact(userId));
			
			rs = ps.executeQuery();
			int i = 0;
	        while (rs.next()) {
	  			
	  			int postId = rs.getInt("id");
	  			String title = rs.getString("title");
	  			double price = rs.getDouble("price");
	  			
	  			result.append("<tr><br>");
	  			
	          	result.append("<td>").append("<a href=\"page?").append("post-id=" + postId + "\">").append(title + "</a></td>");
	          	result.append("<td>$").append(price).append("</td>");

	         	result.append("</tr>");
	        }
	        result.append("</table><br>");
	    } catch (Exception e) {
	         e.printStackTrace();
	         //result.append("Exception: " + e.getMessage() + "<br>");
		} finally {
			DbUtils.close(rs);
			DbUtils.close(ps);
			DbUtils.close(conn);
		}
		
		%>
		
		<%=result.toString() %>



</body>
</html>