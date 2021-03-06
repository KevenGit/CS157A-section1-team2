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
//method that checks to see if the username password matches with any user from the db
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
    //Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DbUtils.getConnection();
    //Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/e_vendor_data_test?serverTimezone=EST5EDT","root", "Yumi2Shoyu");
    User user = DbUtils.getUser(conn, username);
    DbUtils.close(conn);
    if (validate(username, password, user)) {
        // Set attributes:
        session.setAttribute("username", username);
        session.setAttribute("userId", user.getId());
        session.setAttribute("first_name", user.getFirstName());
        session.setAttribute("last_name", user.getLastName());
        session.setAttribute("email", user.getEmail());
        session.setAttribute("balance", user.getBalance());
        
        // Set phone to see if Seller
        String phone = SellerDao.getSellerPhone(user);
        if (phone != null)
        	session.setAttribute("phone", phone);
        
        // Redirect to the previous page: TBD
        msg = "Logged in successful";
        response.sendRedirect("index.jsp");
    } else {
        // Clear the session:
        session.removeAttribute("username");
        session.removeAttribute("userId");
        // Redirect to error page: TBD
        msg = "Invalid username/password";
        response.sendRedirect("account.jsp?status=" + msg);
    }
%>
<!DOCTYPE html>
<html>
<body>
 <h3><%=msg%></h3>
</body>
</html>