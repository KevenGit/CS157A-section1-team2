<%  
	String msg = "";
	
	// Check if user logged in (username and userId should be set after logging in.
    String username = (String) session.getAttribute("username");     //username is in fact the account email
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
    
    if(request.getParameter("submit") != null){
    	//process submitted inputs
    	userFirstName = request.getParameter("changedFirstName");
        userLastName = request.getParameter("changedLastName");
        userEmail = request.getParameter("changedEmail");
        List parameters;
        String updateSql = "UPDATE user SET first_name = ?, last_name = ?, email = ?";
        
        String hashedPasswordBase64 = "";
        String saltBase64 ="";
        String password = request.getParameter("changedPassword");
        if(password != null && !password.isEmpty()){
        	RandomNumberGenerator rng = new SecureRandomNumberGenerator();
            //Object salt = rng.nextBytes();
            ByteSource salt = rng.nextBytes();
    		
            hashedPasswordBase64 = new Sha256Hash(password, salt, 1024).toBase64();
            saltBase64 = salt.toBase64();
            updateSql += ", hash_pw = ?, pw_salt = ?";
            parameters = Arrays.asList(userFirstName, userLastName, userEmail, hashedPasswordBase64, saltBase64, userId);
        } else {
        	parameters = Arrays.asList(userFirstName, userLastName, userEmail, userId);
        }
        
        updateSql += " WHERE id = ?";
        
        Connection conn = DbUtils.getConnection();
        try {
            DbUtils.update(conn, updateSql, parameters);
            //update session with new user info
            session.setAttribute("first_name", userFirstName);
            session.setAttribute("last_name", userLastName);
            session.setAttribute("email", userEmail);
            msg = "Update successfully";
        } catch (Exception e) {
            msg = e.getMessage();
        }
        DbUtils.close(conn);

    	
    }
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.apache.shiro.crypto.hash.Sha256Hash" %>
<%@ page import="org.apache.shiro.crypto.RandomNumberGenerator" %>
<%@ page import="org.apache.shiro.crypto.SecureRandomNumberGenerator" %>
<%@ page import="org.apache.shiro.util.*" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.cs157a.evendor.model.*"%>
<%@ page import="com.cs157a.evendor.util.*"%> 
    
    

    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Profile</title>
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
	
	<!-- Form for user to edit -->
	<p align="center"><%=msg%></p>
	<div style="white-space: pre-wrap;">
		<form id="editProfileForm" action="editProfile.jsp" method="post">
			<table align="center" width="80%">
				<tr><td align="right">Username &nbsp;&nbsp;</td><td><%=username%></td></tr>
				<tr><td align="right">First Name &nbsp;&nbsp;</td><td><input type = "text" placeholder = "First Name" value = <%=userFirstName%> name = "changedFirstName"></td></tr>
				<tr><td align="right">Last Name &nbsp;&nbsp;</td><td><input type = "text" placeholder = "Last Name"value = <%=userLastName%> name = "changedLastName"></td></tr>
				<tr><td align="right">Email &nbsp;&nbsp;</td><td><input type = "text" placeholder = "Email" value = <%=userEmail%> name = "changedEmail"></td></tr>
				<tr><td align="right">Password &nbsp;&nbsp;</td><td><input type = "password" placeholder = "******" value = "" name = "changedPassword"></td></tr>
				<tr><td></td><td><button type="submit" name="submit" value="submit">Save Changes</button></td></tr>
			</table>
			
		</form>
	</div>

</body>
</html>

