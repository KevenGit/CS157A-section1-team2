

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
	
	
		<%
		Connection conn = DbUtils.getConnection();

	String sql = "SELECT id, title, price FROM postings WHERE id IN(SELECT post_id FROM favorites NATURAL JOIN user WHERE favorites.user_id = user.id)";

    StringBuffer result = new StringBuffer();
    //result.append("<br><table width=\"100%\" border=\"0\" align=\"center\">");
    //column header
   // result.append("<tr bgcolor=\"aabbcc\"><td>Title</td><td>Price</td></tr>");
    
	PreparedStatement stmt = null;
	ResultSet rs = null;
	try {
		//String sql = "SELECT * FROM " + table;
		stmt = conn.prepareStatement(sql);
		rs = stmt.executeQuery(sql);
        ResultSetMetaData rsmd = rs.getMetaData();
        int columnCount = rsmd.getColumnCount();
       // result.append("<h3>Table: " + table + "</h3>");
        result.append("<table border=1><tr>");
        // Print the column header: column count starts from 1
        for (int j = 1; j <= columnCount; j++ ) {
          String colName = rsmd.getColumnName(j);
          result.append("<td><b>" + colName + "</b></td>");
        }
        // Print row content:
        while (rs.next()) {
        	result.append("</tr><tr>");
            for (int j = 1; j <= columnCount; j++ ) {
            	result.append("<td>" + rs.getString(j) + "</td>");
            	//System.out.println(rs.getString(j));
            }
        }
        result.append("</tr></table><br>");
        DbUtils.close(rs);
        DbUtils.close(stmt);
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	%>



</body>
</html>