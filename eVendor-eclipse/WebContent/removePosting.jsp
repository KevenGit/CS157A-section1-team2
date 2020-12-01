<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.cs157a.evendor.util.*"%> 

<%  // Check if user logged in (username and userId should be set after logging in.
    String username = (String) session.getAttribute("username");     //username
    long userId = 0;
    if(session.getAttribute("userId") != null)
    	userId = (Long) session.getAttribute("userId");   //the user id
    String userFirstName = (String) session.getAttribute("first_name");
    String userLastName = (String) session.getAttribute("last_name");
    String userEmail = (String) session.getAttribute("email");
    String loginLink = "<a href=\"logout.jsp\">Logout</a>";
    if (username == null) {
    	response.sendRedirect("account.jsp");
    }
    
    //get postId
    String postId = request.getParameter("postId");
	String msg = "";
    if (postId != null && !postId.isEmpty()) {
        Connection conn = DbUtils.getConnection();
        try {
        	if(DbUtils.removePosting(conn, Integer.parseInt(postId), Math.toIntExact(userId)))
            	msg = "Post removed successfully";
        	else
        		msg = "Post removal failed";
        } catch (Exception e) {
            msg = e.getMessage();
        }
        DbUtils.close(conn);   
    }
    else{
    	msg = "Post Id is required";
    }
	response.sendRedirect("userAccount.jsp?status=" + msg);
%>
