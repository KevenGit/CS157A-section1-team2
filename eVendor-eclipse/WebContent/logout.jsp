<%
    // Clear the session:
	session.removeAttribute("username");
    session.removeAttribute("userId");
    session.removeAttribute("first_name");
    session.removeAttribute("last_name");
    session.removeAttribute("email");
    session.removeAttribute("phone");
    String msg = "Logged out successfully";
    response.sendRedirect("account.jsp?status=" + msg);
%>