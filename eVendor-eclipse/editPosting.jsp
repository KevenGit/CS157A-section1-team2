<%  
	//retrieve the post id
	String status = request.getParameter("status");
	String msg = "";
	int postId = 0;
	if (status != null) {
	     //msg = "<center><p>" + status +"</p></center><br>";
	     
	}

	// Check if user logged in (username and accountId should be set after logging in.
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
%>












<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Post</title>
</head>
<body>

</body>
</html>