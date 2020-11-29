
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
    String loginLink = "<a href=\"logout.jsp\">Logout</a>";
    if (username == null) {
    	response.sendRedirect("account.jsp");
    }
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.cs157a.evendor.model.*"%>
<%@ page import="com.cs157a.evendor.util.*"%>

	<%

	//connect to retrieve info
	Connection conn = DbUtils.getConnection();

	String sql = "SELECT id, title, category, price, region FROM postings WHERE id IN (SELECT post_id FROM post WHERE seller_id = ?)";

    StringBuffer result = new StringBuffer();
    result.append("<br><table width=\"100%\" border=\"0\" align=\"center\">");
    //column header
    result.append("<tr bgcolor=\"aabbcc\"><td>Title</td><td>Price</td><td>Action</td></tr>");
	PreparedStatement ps = null;
	ResultSet rs = null;
	try {
		ps = conn.prepareStatement(sql);
		ps.setInt(1, Math.toIntExact(userId));
		
		rs = ps.executeQuery();
		int i = 0;
        while (rs.next()) {
            i++;
            int id = rs.getInt(1);
            String title = rs.getString(2);
            String category = rs.getString(3);
            double price = rs.getDouble(4);
            String region = rs.getString(5);
            String detailPage = "viewPosting.jsp?postId=" + id;
            String editPage = "editPosting.jsp?postId=" + id;
            String removePage = "removePosting.jsp?postId=" + id;
            
           
            if (i % 2 == 0)
                result.append("<tr bgcolor=\"eeeeee\">");
            else
                result.append("<tr bgcolor=\"ddeedd\">");
            result.append("<td><a href=\"").append(detailPage).append("\">").append(title).append("</a></td>");
            result.append("<td>$").append(price).append("</td>");
            result.append("<td><a href=\"").append(editPage).append("\">Edit</a>");
            result.append("&nbsp;|&nbsp;<a href=\"").append(removePage).append("\">Remove</a></td>");
            result.append("</tr>");
        }
        result.append("</table><br>");
    } catch (Exception e) {
         e.printStackTrace();
         result.append("Exception: " + e.getMessage() + "<br>");
	} finally {
		DbUtils.close(rs);
		DbUtils.close(ps);
		DbUtils.close(conn);
	}
	
	%>
	

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/style.css">
<meta charset="UTF-8">
<title>User Account</title>
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
				<li><a href="index.jsp">Home</a></li>
				<li><a href="category.html">Category</a></li>
				<li><a href="posting.jsp">Post</a></li>
				<li><a href="userAccount.jsp">Account</a></li>
				<li><%=loginLink%></li>
				
			</ul>
		</nav>
	</div>

	</div>
	</div>
	
	
	
	<!-- We can assume that the user is logged in, first display a table of their basic info-->
	<table width="100%">
		<tr><td align="left"><b>Home of <%=userFirstName%> <%=userLastName%></b></td>
			<td align="left">Email: <%=userEmail%></td>
			<td align="right"><a href ='editProfile.jsp'>Edit Profile</a></td>
		</tr>
	</table>
	<hr>
	<%=msg%>
	<%=result.toString()%>
</body>
</html>


