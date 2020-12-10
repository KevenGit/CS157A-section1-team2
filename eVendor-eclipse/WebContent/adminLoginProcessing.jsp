<%@ page import="org.apache.shiro.crypto.hash.Sha256Hash" %>
<%@ page import="org.apache.shiro.crypto.RandomNumberGenerator" %>
<%@ page import="org.apache.shiro.crypto.SecureRandomNumberGenerator" %>
<%@ page import="org.apache.shiro.util.*" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.cs157a.evendor.model.*"%>
<%@ page import="com.cs157a.evendor.util.*"%>
<%@ page import="com.cs157a.evendor.dao.SellerDao"%>
<%!

//method that checks to see if the username password matches with any admin from the db
public boolean validate(String username, String password, Admin admin) {
	if(admin != null){
		ByteSource salt = ByteSource.Util.bytes(Base64.getDecoder().decode(admin.getPWSalt()));
    	String hashedPasswordBase64 = new Sha256Hash(password, salt, 1024).toBase64();
    	return hashedPasswordBase64.equals(admin.gethashedPW());
	}
	else{
		return false;
	}
}
%>

<%
String msg = "";
String username = request.getParameter("admin_login_username");
String password = request.getParameter("admin_login_password");
//Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DbUtils.getConnection();
//Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/e_vendor_data_test?serverTimezone=EST5EDT","root", "Yumi2Shoyu");
Admin admin = DbUtils.getAdmin(conn, username);
DbUtils.close(conn);
if (validate(username, password, admin)) {
    // Set attributes:
    session.setAttribute("adminId", admin.getId());
    session.setAttribute("admin_username", username);
    session.setAttribute("admin_first_name", admin.getFirstName());
    session.setAttribute("admin_last_name", admin.getLastName());
    
    // Redirect to the previous page: TBD
    msg = "Logged in successful";
    response.sendRedirect("adminIndex.jsp");
} else {
    // Clear the session:
    session.removeAttribute("admin_username");
    session.removeAttribute("adminId");
    // Redirect to error page: TBD
    msg = "Invalid username/password";
    response.sendRedirect("adminLogin.jsp?status=" + msg);
}

%>
<!DOCTYPE html>
<html>
<body>
 <h3><%=msg%></h3>
</body>
</html>