

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
<title>User order history</title>
<link rel="stylesheet" href="css/purchaseStyle.css">
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

	
	<!-- display the order history-->
	<%
		Connection conn = DbUtils.getConnection();
		
		String sql = "select * from (select order_id, post_id, title, date, price, quantity from orders join isfrom on orders.id = order_id join postings on postings.id = post_id)A natural join buys where user_id = ?;";
					
	    StringBuffer result = new StringBuffer();
	    result.append("<h3 align=\"center\">My Order History</h3>");
	    result.append("<br><table width=\"50%\" border=\"0\" align=\"center\">");
	    //column header
	    result.append("<tr bgcolor=\"aabbcc\"><td>Posting Title</td><td>Date of Order</td><td>Amount Spent</td></tr>");
		PreparedStatement ps1 = null;
		PreparedStatement ps2 = null;
		ResultSet rs1 = null;
		ResultSet rs2 = null;
		try {
			ps1 = conn.prepareStatement(sql);			
			ps1.setInt(1, Math.toIntExact(userId));			
			rs1 = ps1.executeQuery();
					
			//int i = 0;
	        while (rs1.next()) {
	  			
	  			int postId = rs1.getInt("post_id");
	  			String date = rs1.getString("date");
	  			int quantity = rs1.getInt("quantity");
	  			String title = rs1.getString("title");
	  			double price = rs1.getDouble("price");
	  			double subtotal = quantity * price;
	  			
	  			result.append("<tr><br>");
	  			
	          	result.append("<td>").append("<a href=\"page?").append("post-id=" + postId + "\">").append(title + "</a></td>");
	          	result.append("<td>").append(date).append("</td>");
	          	result.append("<td>$").append(subtotal).append("</td>");

	         	result.append("</tr>");
	        }
	        result.append("</table><br>");
	    } catch (Exception e) {
	         e.printStackTrace();
	         result.append("Exception: " + e.getMessage() + "<br>");
		} finally {
			DbUtils.close(rs1);
			DbUtils.close(ps1);
			DbUtils.close(rs2);
			DbUtils.close(ps2);
			DbUtils.close(conn);
		}
		
		%>
		
		<%=result.toString() %>


</body>
</html>