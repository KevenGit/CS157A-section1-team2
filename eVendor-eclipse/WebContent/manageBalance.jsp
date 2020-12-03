<%  

	String status = request.getParameter("status");
	String msg = "";
	if (status != null) {
	     msg = "<p align=\"center\">" + status +"</p><br>";
	}
	
	// Check if user logged in (username and userId should be set after logging in.
    String username = (String) session.getAttribute("username");     //username is in fact the account email
    long userId = 0;
    if(session.getAttribute("userId") != null)
    	userId = (Long) session.getAttribute("userId");   //the user id
    String userFirstName = (String) session.getAttribute("first_name");
    String userLastName = (String) session.getAttribute("last_name");
    String userEmail = (String) session.getAttribute("email");
    String phone = (String) session.getAttribute("phone");
    Double balance = (Double) session.getAttribute("balance");
    
    String postLink = "<a href=\"createPosting.jsp\">Post</a>";
    String loginLink = "<a href=\"logout.jsp\">Logout</a>";
    if (username == null) {
    	response.sendRedirect("account.jsp");
    }
    
    if (phone == null) {
    	postLink = "<a href=\"account.jsp\">Post</a>";
    }
 
    
    if(request.getParameter("submit") != null){
    	//process submitted inputs
        List parameters;
        String updateSql = "UPDATE user SET balance = ? WHERE id = ?";
        String amountAdded = request.getParameter("addedAmount");
        Double amount = 0.0;
        if(amountAdded != null && !amountAdded.isEmpty()){
            amount = Double.parseDouble(amountAdded);
        	//if amount is > 0
        	if(amount > 0.0){
        		balance += amount;
        	}
            parameters = Arrays.asList(balance, userId);
            
        } else {
        	parameters = null;
        	msg = "Update failed";
        	response.sendRedirect("manageBalance.jsp?status=" + msg);
        }
        
        Connection conn = DbUtils.getConnection();
        try {
            DbUtils.update(conn, updateSql, parameters);
            //update session with new user info
            session.setAttribute("balance", balance);
            msg = "Update successfully";
        } catch (Exception e) {
            msg = e.getMessage();
        }
        DbUtils.close(conn);

    	
    }
%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.cs157a.evendor.model.*"%>
<%@ page import="com.cs157a.evendor.util.*"%> 



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Balance</title>
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
	</div>
	</div>
	</div>
	
		<p align="center"><%=msg%></p>
	
	<!-- Form to manage balance -->
	<div style="white-space: pre-wrap;">
		<form id="manageBalanceForm" action="manageBalance.jsp" method="post">
			<table align="center" width="80%">
				<tr><td align="right">Username &nbsp;&nbsp;</td><td><%=username%></td></tr>
				<tr><td align="right">Current Balance &nbsp;&nbsp;</td><td><%=balance%></tr>
				<tr><td align="right">Amount to Add &nbsp;&nbsp;</td><td><input type="number" name ="addedAmount" placeholder="0.00" step="0.01" min="0.00"></td></tr>
				<tr><td></td><td><button type="submit" name="submit" value="submit">Add to Balance</button></td></tr>
			</table>
		</form>
	</div>
</body>
</html>