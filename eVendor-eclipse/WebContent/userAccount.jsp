
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


<% Posting posting = (Posting) request.getAttribute("posting"); %>
<% User user = (User) request.getAttribute("user"); %>
<% Favorite fav = (Favorite) request.getAttribute("fav"); %>

	
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/style.css">
<meta charset="UTF-8">
<title>User Account</title>
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
		<%

	//connect to retrieve info
	Connection conn = DbUtils.getConnection();

	String sql = "SELECT id, title, category, price, region FROM postings WHERE id IN (SELECT post_id FROM post WHERE seller_id = ?)";
	//String sql = "SELECT id, title, category, price, region FROM postings WHERE id IN ";
	
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
            String detailPage = "page?post-id=" + id;
            String editPage = "page?post-id=" + id + "&action=edit-suite";
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
	
	<!-- We can assume that the user is logged in, first display a table of their basic info-->
	<table width="100%">
		<tr><td align="left"><b>Home of <%=userFirstName%> <%=userLastName%></b></td>
			<td align="left">Email: <%=userEmail%></td>
			<td align="right"><a href ='becomeSeller.jsp'>Become Seller</a></td>
			<td align="right"><a href = 'manageBalance.jsp'>Balance</a></td>
			<td align="right"><a href ='editProfile.jsp'>Edit Profile</a></td>
		</tr>
	</table>
	<hr>
	<%=msg%> 
	<%=result.toString()%>
	
		<div class="btn-cont">
		<button class="fav-post" type="submit" onclick="document.location='userAccountFavoritePosting.jsp'">My favorite postings</button>
		<br>
		<br>
		<button class="order-history" type="submit" onclick="document.location='userAccountOrderHistory.jsp'">My favorite postings</button>
		</div>
</body>
</html>