<%@ page import="org.apache.shiro.crypto.hash.Sha256Hash" %>
<%@ page import="org.apache.shiro.crypto.RandomNumberGenerator" %>
<%@ page import="org.apache.shiro.crypto.SecureRandomNumberGenerator" %>
<%@ page import="org.apache.shiro.util.*" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.cs157a.evendor.model.*"%>
<%@ page import="com.cs157a.evendor.util.*"%>
<%!
    public boolean validate(String email, String password) {
        // Temporary checking for now:
        if (email == null || password == null || email.length() < 10 || password.length() < 6)
            return false;
        return true;
    }
%>

<%
    String email = request.getParameter("regis_email");
    String password = request.getParameter("regis_password");
    String username = request.getParameter("regis_username");
    String msg = "";

    int numRowsUpdated;
    if (validate(email, password)) {
        RandomNumberGenerator rng = new SecureRandomNumberGenerator();
        //Object salt = rng.nextBytes();
        ByteSource salt = rng.nextBytes();
		
        String hashedPasswordBase64 = new Sha256Hash(password, salt, 1024).toBase64();
        String saltBase64 = salt.toBase64();
        // Add account:
       Class.forName("com.mysql.cj.jdbc.Driver");
       Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/e_vendor_data_test?serverTimezone=EST5EDT","root", "root");
	
        String sqlInsert = "INSERT INTO user(username, hash_pw, pw_salt, first_name, last_name, email, balance) VALUES (?, ?, ?, ?, ?, ?, ?)";
        List parameters = Arrays.asList(username, hashedPasswordBase64, saltBase64, "Hello", "World", email, 0);
        try {
            numRowsUpdated = DbUtils.update(conn, sqlInsert, parameters);
            msg = "User added successfully!";
        } catch (Exception e) {
            msg = e.getMessage();
        }
        DbUtils.close(conn);
        response.sendRedirect("account.html");
    } else {
        msg = "Invalid input";
        response.sendRedirect("account.jsp?status=" + msg);
    }
%>
<!DOCTYPE html>
<html>
<body>
 <h3><%=msg%></h3>
</body>
</html>