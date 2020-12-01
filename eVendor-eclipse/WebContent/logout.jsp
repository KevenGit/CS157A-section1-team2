<%
    // Clear the session:
	session.removeAttribute("username");
    session.removeAttribute("userId");
    String msg = "Logged out successfully";
    response.sendRedirect("account.jsp?status=" + msg);
%>