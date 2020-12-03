<%  
	String status = request.getParameter("status");
	String msg = "";
	if (status != null) {
	     msg = "<p align=\"center\">" + status +"</p><br>";
	}
	
	// Check if user logged in (username and userId should be set after logging in.
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
    
    
    //if hit submit
    if(request.getParameter("submit") != null){
    	//process submitted input
    	String phoneNum = request.getParameter("addedPhoneNum");
        List parameters;
        String exeSql = "";
        
        //if filled out 
        if(phoneNum != null && !phoneNum.isEmpty() && phone == null){
        	//user will become a new seller
        	exeSql += "INSERT INTO seller(id, phone) VALUES(?,?)";
        	parameters = Arrays.asList(userId, phoneNum);
        }
        else if (phoneNum != null & !phoneNum.isEmpty() && phone != null){
        	//seller already exists and have an old phone number --> update the seller's phone number
        	exeSql += "UPDATE seller SET phone = ? WHERE id = ?";
        	parameters = Arrays.asList(phoneNum, userId);
        }
        else {
        	//user did not put anything in form
        	msg = "No phone number input detected from the form";
        	parameters = null;
        	response.sendRedirect("becomeSeller.jsp?status="+ msg);
        }
        
        
        Connection conn = DbUtils.getConnection();
        try {
        	DbUtils.update(conn, exeSql, parameters);
            //update session with new seller info
            session.setAttribute("phone", phoneNum);
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
<%@ page import="com.cs157a.evendor.util.*"%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Seller Promotion Form</title>
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
	</div>
	</div>
	</div>
	
	<p align="center"><%=msg%></p>
	
	<div style="white-space: pre-wrap;">
		<form id="becomeSellerForm" action="becomeSeller.jsp" method="post">
			<table align="center" width="80%">
				<tr><td align="right">Username &nbsp;&nbsp;</td><td><%=username%></td></tr>
				<tr><td align="right">Phone Number &nbsp;&nbsp;</td><td><input type="text" placeholder = "4081234567" value = "" name = "addedPhoneNum"></td></tr>
				<tr><td></td><td><button type="submit" name="submit" value="submit">Update changes</button></td></tr>
			</table>
			
		</form>
	</div>

</body>
</html>