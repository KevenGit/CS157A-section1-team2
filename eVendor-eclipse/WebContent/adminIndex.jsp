
<%  
	String status = request.getParameter("status");
	String msg = "";
	if (status != null) {
	     msg = "<p align=\"center\">" + status +"</p><br>";
	}
	
	// Check if admin logged in 
    String username = (String) session.getAttribute("admin_username");     //username 
    long adminId = 0;
    if(session.getAttribute("adminId") != null)
    	adminId = (Long) session.getAttribute("adminId");   //the account id
    String adminFirstName = (String) session.getAttribute("admin_first_name");
    String adminLastName = (String) session.getAttribute("admin_last_name");
    
    //if not logged in, redirect back to where they should log in
    if (username == null) {
    	response.sendRedirect("adminLogin.jsp");
    }      
%>

<%
//generate table for post flagged with action 
	StringBuffer flaggedResult = new StringBuffer();
		//connect to retrieve info
		Connection conn = DbUtils.getConnection();

		String sql = "SELECT id, title, category, price, region FROM postings WHERE id IN (SELECT post_id FROM post WHERE seller_id = ?)";
		//String sql = "SELECT id, title, category, price, region FROM postings WHERE id IN ";
		
		flaggedResult.append("<h3 align=\"left\">Flagged Postings</h3>");
		flaggedResult.append("<table width=\"100%\" border=\"0\" align=\"center\">");
	    //column header
	    flaggedResult.append("<tr bgcolor=\"aabbcc\"><td>Post Title</td><td>Seller</td><td># Flags</td><td>Action</td></tr>");
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, Math.toIntExact(adminId));
			
			rs = ps.executeQuery();
			int i = 0;
	        while (rs.next()) {
	            i++;
	            int id = rs.getInt(1);
	            String title = rs.getString(2);
	            String category = rs.getString(3);
	            double price = rs.getDouble(4);
	            String region = rs.getString(5);
	            String detailPage = "page?post-id=" + id;
	            String removePage = "removePosting.jsp?postId=" + id;
	            
	           
	            if (i % 2 == 0)
	            	flaggedResult.append("<tr bgcolor=\"eeeeee\">");
	            else
	            	flaggedResult.append("<tr bgcolor=\"f0f8ff\">");
	            flaggedResult.append("<td><a href=\"").append(detailPage).append("\">").append(title).append("</a></td>");
	            flaggedResult.append("<td>$").append(price).append("</td>");
	            flaggedResult.append("&nbsp;|&nbsp;<a href=\"").append(removePage).append("\">Remove</a></td>");
	            flaggedResult.append("</tr>");
	        }
	        flaggedResult.append("</table><br>");
	    } catch (Exception e) {
	         e.printStackTrace();
	         flaggedResult.append("Exception: " + e.getMessage() + "<br>");
		} finally {
			DbUtils.close(rs);
			DbUtils.close(ps);
			DbUtils.close(conn);
		}
%>

<%
//generate table of users with action 
	StringBuffer userListResult = new StringBuffer();
		//connect to retrieve info
		conn = DbUtils.getConnection();
		
		//refresh sql statement
		sql = "SELECT id, title, category, price, region FROM postings WHERE id IN (SELECT post_id FROM post WHERE seller_id = ?)";
		//String sql = "SELECT id, title, category, price, region FROM postings WHERE id IN ";
		
		userListResult.append("<h3 align=\"left\">List of Users</h3>");
		userListResult.append("<table width=\"100%\" border=\"0\" align=\"center\">");
	    //column header
	    userListResult.append("<tr bgcolor=\"aabbcc\"><td>Post Title</td><td>Seller</td><td># Flags</td><td>Action</td></tr>");
		//refresh
	    ps = null;
		rs = null;
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, Math.toIntExact(adminId));
			
			rs = ps.executeQuery();
			int i = 0;
	        while (rs.next()) {
	            i++;
	            int id = rs.getInt(1);
	            String title = rs.getString(2);
	            String category = rs.getString(3);
	            double price = rs.getDouble(4);
	            String region = rs.getString(5);
	            String removePage = "removePosting.jsp?postId=" + id;
	            
	           
	            if (i % 2 == 0)
	            	userListResult.append("<tr bgcolor=\"eeeeee\">");
	            else
	            	userListResult.append("<tr bgcolor=\"f0f8ff\">");
	            userListResult.append("<td>$").append(price).append("</td>");
	            userListResult.append("&nbsp;|&nbsp;<a href=\"").append(removePage).append("\">Remove</a></td>");
	            userListResult.append("</tr>");
	        }
	        flaggedResult.append("</table><br>");
	    } catch (Exception e) {
	         e.printStackTrace();
	         userListResult.append("Exception: " + e.getMessage() + "<br>");
		} finally {
			DbUtils.close(rs);
			DbUtils.close(ps);
			DbUtils.close(conn);
		}
%>

<%
//generate table of seller with action 
	StringBuffer sellerListResult = new StringBuffer();
		//connect to retrieve info
		conn = DbUtils.getConnection();
		
		//refresh sql statement
		sql = "SELECT id, title, category, price, region FROM postings WHERE id IN (SELECT post_id FROM post WHERE seller_id = ?)";
		//String sql = "SELECT id, title, category, price, region FROM postings WHERE id IN ";
		
		sellerListResult.append("<h3 align=\"left\">List of Users</h3>");
		sellerListResult.append("<table width=\"100%\" border=\"0\" align=\"center\">");
	    //column header
	    sellerListResult.append("<tr bgcolor=\"aabbcc\"><td>Post Title</td><td>Seller</td><td># Flags</td><td>Action</td></tr>");
		//refresh
	    ps = null;
		rs = null;
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, Math.toIntExact(adminId));
			
			rs = ps.executeQuery();
			int i = 0;
	        while (rs.next()) {
	            i++;
	            int id = rs.getInt(1);
	            String title = rs.getString(2);
	            String category = rs.getString(3);
	            double price = rs.getDouble(4);
	            String region = rs.getString(5);
	            String removePage = "removePosting.jsp?postId=" + id;
	            
	           
	            if (i % 2 == 0)
	            	userListResult.append("<tr bgcolor=\"eeeeee\">");
	            else
	            	sellerListResult.append("<tr bgcolor=\"f0f8ff\">");
	            sellerListResult.append("<td>$").append(price).append("</td>");
	            sellerListResult.append("&nbsp;|&nbsp;<a href=\"").append(removePage).append("\">Remove</a></td>");
	            sellerListResult.append("</tr>");
	        }
	        flaggedResult.append("</table><br>");
	    } catch (Exception e) {
	         e.printStackTrace();
	         userListResult.append("Exception: " + e.getMessage() + "<br>");
		} finally {
			DbUtils.close(rs);
			DbUtils.close(ps);
			DbUtils.close(conn);
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
<meta charset="UTF-8">
<title>Homepage of Admin</title>
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
				<li><a href='adminLogoutProcessing.jsp'>Logout</a></li>	
			</ul>
		</nav>
	</div></div></div>

<!--  Admin basic info -->
<table width="100%">
		<tr><td align="left"><b>Home of <%=adminFirstName%> <%=adminLastName%></b></td>
		</tr>
	</table>
	<hr>
	
	<!-- Display table to manage flagged postings -->
	<%=flaggedResult%>
	<br>
	<!-- Display table to manage users-->
	<%=userListResult%>
	<br>
	<!-- Display table to manage sellers -->
	<%=sellerListResult%>
	
	
</body>
</html>