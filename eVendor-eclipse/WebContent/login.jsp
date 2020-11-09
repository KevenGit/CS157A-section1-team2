<%@ page import="org.apache.shiro.crypto.hash.Sha256Hash" %>
<%@ page import="org.apache.shiro.crypto.RandomNumberGenerator" %>
<%@ page import="org.apache.shiro.crypto.SecureRandomNumberGenerator" %>
<%@ page import="org.apache.shiro.util.*" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.cs157a.evendor.model.*"%>
<%@ page import="com.cs157a.evendor.util.*"%>
<%!
    public boolean validate(String username, String password, User user) {
		if(user != null){
			ByteSource salt = ByteSource.Util.bytes(Base64.getDecoder().decode(user.getPwSalt()));
        	String hashedPasswordBase64 = new Sha256Hash(password, salt, 1024).toBase64();
        	return hashedPasswordBase64.equals(user.getHashedPassword());
		}
		else{
			return false;
		}
    }
%>

<%
    String msg = "";
    String username = request.getParameter("login_username");
    String password = request.getParameter("login_password");
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/e_vendor_data_test?serverTimezone=EST5EDT","root", "root");
    User user = DbUtils.getUser(conn, username);
    DbUtils.close(conn);
    if (validate(username, password, user)) {
        // Set attributes:
        session.setAttribute("username", username);
        session.setAttribute("userId", user.getId()+"");
        // Redirect to the previous page: TBD
        msg = "Logged in successful";
        response.sendRedirect("index.html");
    } else {
        // Clear the session:
        session.removeAttribute("username");
        session.removeAttribute("userId");
        // Redirect to error page: TBD
        msg = "Invalid username/password";
        response.sendRedirect("account.html?status=" + msg);
    }
%>
<!DOCTYPE html>
<html>
<body>
 <h3><%=msg%></h3>
</body>
</html>