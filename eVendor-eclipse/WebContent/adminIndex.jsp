
<%  
	String status = request.getParameter("status");
	String msg = "";
	if (status != null) {
	     msg = "<p align=\"center\">" + status +"</p><br>";
	}
	
	// Check if admin logged in 
    String username = (String) session.getAttribute("admin_username");     //username 
    int adminId = 0;
    if(session.getAttribute("adminId") != null)
    	adminId = (Integer) session.getAttribute("adminId");   //the account id
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

		String sql = "select post_id, title, first_name, last_name, COUNT(*) AS flags " +
				"from ((select post_id, title, first_name, last_name from (postings join post on postings.id = post_id join user on user.id = seller_id))A natural join flag) " +
				"GROUP BY post_id " +
				"ORDER BY flags DESC";
		
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = conn.prepareStatement(sql);
			
			rs = ps.executeQuery();
			int i = 0;
	        while (rs.next()) {
	            i++;
	            int post_id = rs.getInt(1);
	            String title = rs.getString(2);
	            String firstName = rs.getString(3);
	            String lastName = rs.getString(4);
	            int flags = rs.getInt(5);
	            String removePosting = "admin?post-id=" + post_id + "&action=admin-delete-posting";
	            
	           
	            flaggedResult.append("<tr>");
	            flaggedResult.append("<td>" + title + "</td>");
	            flaggedResult.append("<td>" + firstName + " " + lastName + "</td>");
	            flaggedResult.append("<td>" + flags + "</td>");
	            flaggedResult.append("<td><a href=\"").append(removePosting).append("\">").append("Remove</a></td>");
	            flaggedResult.append("</tr>");
	        }
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
		sql = "SELECT id, username, first_name, last_name, email FROM user WHERE id NOT IN (SELECT id FROM seller)";
		
		//refresh
	    ps = null;
		rs = null;
		try {
			ps = conn.prepareStatement(sql);
			
			rs = ps.executeQuery();
			int i = 0;
	        while (rs.next()) {
	            i++;
	            int user_id = rs.getInt(1);
	            String uname = rs.getString(2);
	            String firstName = rs.getString(3);
	            String lastName = rs.getString(4);
	            String email = rs.getString(5);
	            String removeUser = "admin?user-id=" + user_id + "&action=admin-delete-user";
	            
	           
	            userListResult.append("<tr>");
	            userListResult.append("<td>" + firstName + " " + lastName + "</td>");
	            userListResult.append("<td>" + uname + "</td>");
	            userListResult.append("<td>" + email + "</td>");
	            userListResult.append("<td><a href=\"").append(removeUser).append("\">").append("Remove</a></td>");
	            userListResult.append("</tr>");
	        }
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
		sql = "SELECT id, username, first_name, last_name, email FROM user WHERE id IN (SELECT id FROM seller)";
		
		//refresh
	    ps = null;
		rs = null;
		try {
			ps = conn.prepareStatement(sql);
			
			rs = ps.executeQuery();
			int i = 0;
	        while (rs.next()) {
	            i++;
	            int seller_id = rs.getInt(1);
	            String uname = rs.getString(2);
	            String firstName = rs.getString(3);
	            String lastName = rs.getString(4);
	            String email = rs.getString(5);
	            String removeUser = "admin?seller-id=" + seller_id + "&action=admin-delete-seller";
	            
	           
	            sellerListResult.append("<tr>");
	            sellerListResult.append("<td>" + firstName + " " + lastName + "</td>");
	            sellerListResult.append("<td>" + uname + "</td>");
	            sellerListResult.append("<td>" + email + "</td>");
	            sellerListResult.append("<td><a href=\"").append(removeUser).append("\">").append("Remove</a></td>");
	            sellerListResult.append("</tr>");
	        }
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
				<li><a href='adminLogoutProcessing.jsp'>Logout</a></li>	
			</ul>
		</nav>
	</div></div></div>

	<div class="adminIndex-wrapper">
		<!--  Admin basic info -->
		<div class="adminIndex-infobox">
            <h2>Admin: <%=adminFirstName + " " + adminLastName %></h2>
        </div>
	
		<!-- Display table to manage flagged postings -->
		<div class="adminIndex-table">
            <h3>Flagged Postings</h3>
            <table class="search-result-table">
                <thead>
                    <tr>
                        <th>Title</th>
                        <th>Seller</th>
                        <th>Number of Flags</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                	<%=flaggedResult.toString() %>
                </tbody>
            </table>
        </div>
        
		<!-- Display table to manage users-->
		<div class="adminIndex-table">
            <h3>Users</h3>
            <table class="search-result-table">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Username</th>
                        <th>Email</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                	<%=userListResult.toString() %>
                </tbody>
            </table>
        </div>
        
		<!-- Display table to manage sellers -->
		<div class="adminIndex-table">
            <h3>Sellers</h3>
            <table class="search-result-table">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Username</th>
                        <th>Email</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                	<%=sellerListResult.toString() %>
                </tbody>
            </table>
        </div>
	
	</div>
</body>
</html>