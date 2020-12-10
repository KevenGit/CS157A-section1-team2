<%
    // Clear the session:
	session.removeAttribute("admin_username");
    session.removeAttribute("adminId");
    session.removeAttribute("admin_first_name");
    session.removeAttribute("admin_last_name");
    String msg = "Logged out successfully";
    response.sendRedirect("adminLogin.jsp?status=" + msg);
%>